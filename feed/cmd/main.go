package main

import (
	"context"
	"flag"
	"fmt"
	"path/filepath"

	"github.com/brevis-network/brevis-sdk/sdk"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/ethclient"
)

var mode = flag.String("mode", "", "compile or prove")
var outDir = flag.String("out", "$HOME/circuitOut/myBrevisApp", "compilation output dir")
var srsDir = flag.String("srs", "$HOME/kzgsrs", "where to cache kzg srs")
var txHash = flag.String("tx", "", "tx hash to prove")

func main() {
	flag.Parse()
	switch *mode {
	case "compile":
		compile()
	case "prove":
		prove()
	default:
		panic(fmt.Errorf("unsupported mode %s", *mode))
	}
}

func compile() {
	// This first part is copied from app/circuit_test.go. We added the source data, then we generated the circuit input.
	app, err := sdk.NewBrevisApp()
	check(err)
	txHash := common.HexToHash(
		"0x6dc75e61220cc775aafa17796c20e49ac08030020fce710e3e546aa4e003454c")

	ec, err := ethclient.Dial("<your-eth-rpc>")
	check(err)
	tx, _, err := ec.TransactionByHash(context.Background(), txHash)
	check(err)
	receipt, err := ec.TransactionReceipt(context.Background(), txHash)
	check(err)
	from, err := types.Sender(types.NewLondonSigner(tx.ChainId()), tx)
	check(err)

	app.AddTransaction(sdk.TransactionData{
		Hash:                txHash,
		ChainId:             tx.ChainId(),
		BlockNum:            receipt.BlockNumber,
		Nonce:               tx.Nonce(),
		GasTipCapOrGasPrice: tx.GasTipCap(),
		GasFeeCap:           tx.GasFeeCap(),
		GasLimit:            tx.Gas(),
		From:                from,
		To:                  *tx.To(),
		Value:               tx.Value(),
	})
	appCircuit := &feed_proof.AppCircuit{}

	circuitInput, err := app.BuildCircuitInput(appCircuit)
	check(err)

	// The compilation output is the description of the circuit's constraint system.
	// You should use sdk.WriteTo to serialize and save your circuit so that it can
	// be used in the proving step later.
	compiledCircuit, err := sdk.Compile(appCircuit, circuitInput)
	check(err)
	err = sdk.WriteTo(compiledCircuit, filepath.Join(*outDir, "compiledCircuit"))
	check(err)

	// Setup is a one-time effort per circuit. A cache dir can be provided to output
	// external dependencies. Once you have the verifying key you should also save
	// its hash in your contract so that when a proof via Brevis is submitted
	// on-chain you can verify that Brevis indeed used your verifying key to verify
	// your circuit computations
	pk, vk, err := sdk.Setup(compiledCircuit, *srsDir)
	check(err)
	err = sdk.WriteTo(pk, filepath.Join(*outDir, "pk"))
	check(err)
	err = sdk.WriteTo(vk, filepath.Join(*outDir, "vk"))
	check(err)

	fmt.Println("compilation/setup complete")
}

func prove() {
	if len(*txHash) == 0 {
		panic("-tx is required")
	}

	// Loading the previous compile result into memory
	fmt.Println(">> Reading circuit, pk, and vk from disk")
	compiledCircuit, err := sdk.ReadCircuitFrom(filepath.Join(*outDir, "compiledCircuit"))
	check(err)
	pk, err := sdk.ReadPkFrom(filepath.Join(*outDir, "pk"))
	check(err)
	vk, err := sdk.ReadVkFrom(filepath.Join(*outDir, "vk"))
	check(err)

	// Query the user specified tx
	app, err := sdk.NewBrevisApp()
	check(err)
	ec, err := ethclient.Dial("<your-eth-rpc>")
	check(err)
	tx, _, err := ec.TransactionByHash(context.Background(), common.HexToHash(*txHash))
	check(err)
	receipt, err := ec.TransactionReceipt(context.Background(), common.HexToHash(*txHash))
	check(err)
	from, err := types.Sender(types.NewLondonSigner(tx.ChainId()), tx)
	check(err)

	app.AddTransaction(sdk.TransactionData{
		Hash:                common.HexToHash(*txHash),
		ChainId:             tx.ChainId(),
		BlockNum:            receipt.BlockNumber,
		Nonce:               tx.Nonce(),
		GasTipCapOrGasPrice: tx.GasTipCap(),
		GasFeeCap:           tx.GasFeeCap(),
		GasLimit:            tx.Gas(),
		From:                from,
		To:                  *tx.To(),
		Value:               tx.Value(),
	})

	appCircuit := &feed_proof.AppCircuit{}
	appCircuitAssignment := &feed_proof.AppCircuit{}

	// Prove
	fmt.Println(">> Proving the transaction using my circuit")
	circuitInput, err := app.BuildCircuitInput(appCircuit)
	check(err)
	witness, publicWitness, err := sdk.NewFullWitness(appCircuitAssignment, circuitInput)
	check(err)
	proof, err := sdk.Prove(compiledCircuit, pk, witness)
	check(err)
	err = sdk.WriteTo(proof, filepath.Join(*outDir, "proof-"+*txHash))
	check(err)

	// Test verifying the proof we just generated
	err = sdk.Verify(vk, publicWitness, proof)
	check(err)

	fmt.Println(">> Initiating Brevis request")
	appContract := common.HexToAddress("0x73090023b8D731c4e87B3Ce9Ac4A9F4837b4C1bd")
	refundee := common.HexToAddress("0x164Ef8f77e1C88Fb2C724D3755488bE4a3ba4342")

	calldata, requestId, feeValue, err := app.PrepareRequest(vk, 1, 11155111, refundee, appContract)
	check(err)
	fmt.Printf("calldata %x\n", calldata)
	fmt.Printf("feeValue %d\n", feeValue)
	fmt.Printf("requestId %s\n", requestId)

	// Submit proof to Brevis
	fmt.Println(">> Submitting my proof to Brevis")
	err = app.SubmitProof(proof)
	check(err)

	// Poll Brevis gateway for query status till the final proof is submitted
	// on-chain by Brevis and your contract is called
	fmt.Println(">> Waiting for final proof generation and submission")
	submitTx, err := app.WaitFinalProofSubmitted(context.Background())
	check(err)
	fmt.Printf(">> Final proof submitted: tx hash %s\n", submitTx)

	// [Don't forget to make the transaction that pays the fee by calling Brevis.sendRequest]
}

func check(err error) {
	if err != nil {
		panic(err)
	}
}

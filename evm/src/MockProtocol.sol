// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "forge-std/Test.sol";
import "./Verifier.sol";

contract MockProtocol {
    Halo2Verifier public verifier;

    constructor() {
        verifier = new Halo2Verifier();
    }

    function liquidate(bytes calldata proof, uint256[] calldata instances) public returns (bool) {
        // Check the input before spending the gas to verify the proof
        // if (1==2) {
        //     // revert("Not delinquent!");
        //     console.log("Not delinquent!");
        // } else {
        //     // Perform liquidation here
        //     console.log("Liquidating...");
        // }
        bool success = verifier.verifyProof(proof, instances);

        return success;
        // console.log("Proof verified: %s", success);
    }
}

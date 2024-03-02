# ZKML Options Liquidator

![ZKML Options Liquidator Logo](zkml-liquidator-title.png)

For installation and usage instructions, see [here](HOWTO.md).

## Introduction

The ZKML Options Liquidator is a permissionless system designed to secure DeFi protocols by enabling the liquidation of delinquent options contracts through the use of Zero Knowledge Machine Learning (ZKML). It leverages advanced cryptographic techniques to allow anyone to profit from liquidating at-risk positions while maintaining the protocol's integrity.

## Abstract

This system addresses the challenge of calculating liquidation levels for complex financial instruments such as derivatives, options, and structured products. By employing ZKML, it enables permissionless, trustless operations that safeguard honest participants and the protocol itself.

## Tagline

A Permissionless Options Liquidation system utilizing ZKML for validating complex off-chain calculations, enabling anyone to liquidate delinquent actors and protect the protocol.

## Problem Statement

Options trading on DeFi platforms requires intricate calculations for determining liquidation thresholds, a task complicated further by the need for reverse-engineering "Implied Volatility" from market trades. Traditional methods rely heavily on the Black-Scholes formula, posing trust and transparency issues when executed off-chain. Our approach overcomes these challenges by integrating AI/Machine Learning with Zero Knowledge Proofs (ZKP) to ensure accuracy and verifiability of liquidation operations.

## Solution Overview

1. **AI Model Freezing**: We train an AI model for liquidation level calculations, freeze its state, and generate a hash of its configuration and weights.
2. **Validity Proofs with ZKML**: For each calculation, we produce a ZK proof using the EZKL system to validate the computation without revealing the underlying data.
3. **Input Data Verification**: Utilizing the Aztec Barretenberg proof system, we verify the authenticity of input data sourced from ChainLink price feeds through ECDSA signature proofs.
4. **Cross-Verifier Compatibility**: To reconcile differences between ZK systems, we employ a Poseidon hash as a shared input, allowing independent on-chain verification within a single Solidity function.

## Implementation Details

![ZKML Liquidator Diagram](zkml-liquidator-diagram.png)

## Challenges Encountered

- **Proving System Limitations**: Initial attempts at step-by-step AI inference emulation proved prohibitively expensive. Adoption of the [EZKL](https://ezkl.xyz/) system, optimized for matrix multiplication in ML, presented a viable alternative.
- **Data Input Validation**: The absence of ZK-friendly oracles necessitated a novel approach to validating input data. We achieved this by verifying blockchain transaction signatures and generating ECDSA proofs with [Brevis](https://brevis.network/).
- **Proof System Incompatibility**: Integrating disparate proving systems posed a significant challenge, addressed by employing a common Poseidon hash to ensure consistency across proofs.

## Impact

This project paves the way for innovative DeFi options protocols by enabling efficient, partially collateralized option writing. It addresses a critical gap in the current ecosystem, offering a solution that enhances liquidity pool stability and facilitates the emergence of new financial instruments.

For further details on how to install, configure, and utilize the ZKML Options Liquidator, please refer to our [installation guide](HOWTO.md).

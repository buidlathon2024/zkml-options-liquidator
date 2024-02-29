# Permissionless liquidation system

Anybody can calculate the liquidation levels, prove the calculation, submit the proof with liquidation request and execute.

For protocols with complicated calculations of liquidation levels (not lending). Derivatives, options, structured products.

## UX
1. List of options to liquidate
2. User clicks "Liquidate" button.
3. Liquidation Contract automates:
   1. Get prices from oracle
   2. Creates hashed tx signature
   3. Passes prices + signature + model weights to EZKL
   4. EZKL verifies
   5. Liquidation Function liquidates or not

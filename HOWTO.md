## UX
1. List of options to liquidate
2. User clicks "Liquidate" button.
3. Liquidation Contract automates:
   1. Get prices from oracle
   2. Creates hashed tx signature
   3. Passes prices + signature + model weights to EZKL
   4. EZKL verifies
   5. Liquidation Function liquidates or not

## Setup
```
python3.10 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r train/requirements.txt
```

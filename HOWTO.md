## Installation
```
python3.10 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r train/requirements.txt
```

## Train the model
- Run the notebook at `train/src/train.ipynb`
- Copy the `pubInputs` and `proof` values from EZKL verifier into `evm/test/MockProtocol.sol`

## Test it yourself
Run `evm/test.sh`

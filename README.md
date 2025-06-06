# Middleware SDK

## Example Env

```
ETH_RPC_URL=
ETH_RPC_URL_HOLESKY=
ETH_RPC_URL_SEPOLIA=
ETHERSCAN_API_KEY=
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
ETH_RPC_URL_MASTER=http://127.0.0.1:8545
ETH_RPC_URL_SECONDARY=http://127.0.0.1:8546
MASTER_CONTRACT=0xE82319C323a3e20dE10e83C6a107C852A5D75408
EPOCH_DURATION=300
COMMIT_DURATION=120
PROLONG_DURATION=350
DEPLOYMENT_BUFFER=600
SLASHING_WINDOW=1200
BLOCK_TIME=0.1
RANDOM=false
OPERATORS=3
SIG_VERIFIER=0
```

## Local Environment

```
yarn install
```

```
yarn deploy
```

You'll get `http://127.0.0.1:8545` and `http://127.0.0.1:8546` RPC URLs
Also, you can go to [this folder](./script/deploy/data/) to get all the available data

## Docker

```
make build-docker
```

```
make up
```

To kill the container:

```
make down
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

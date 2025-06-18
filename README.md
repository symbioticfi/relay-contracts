# Symbiotic Relay (on-chain)

## Overview

Symbiotic Relay is a peer-to-peer side-network designed to collect and aggregate signatures from validators, maintain validator sets (valsets) on settlement contract.

To achieve that, Symbiotic provides a set of predefined smart contracts, in general, representing the following modules:

-

## Repo init

Clone the repo:

```bash
git clone --recurse-submodules https://github.com/symbioticfi/middleware-sdk-mirror.git
```

## Create env configuration

```bash
cp .env.example .env
```

Key parameters:

- `OPERATORS` - num of operators in network
- `VERIFICATION_TYPE` - signatures aggregation type, (0 for ZK, 1 for simple)

## On-chain setup

Before running off-chain nodes need to setup on-chain contract.

To simplify local development we've prepared docker image with anvil node and deployed Symbiotic contracts.

### Build docker image

```bash
docker build -t symbiotic-anvil .
```

### Run anvil node

```bash
docker run --rm -d -p 8545:8545 --env-file .env --name symbiotic-node symbiotic-anvil
```

### Configure network

```bash
docker run --rm -it --env-file .env --network host symbiotic-anvil yarn deploy:network
```

This command will execute list of transactions to setup network contracts.

In execution logs you can see deployed configuration and contract addresses.

## Tests

```
forge test
```

## Coverage

```
forge coverage
```

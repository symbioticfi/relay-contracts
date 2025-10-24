# Relay Deployment Scripts

This directory contains a small toolkit for deploying relay contracts with Foundry. The `deploy.sh` helper wraps `forge script` to run the `runDeploy*` entry points implemented by concrete scripts that inherit from `RelayDeploy.sol`.

## Prerequisites

- Foundry toolchain with `forge` and `cast` available in `PATH`.
- `python3` (3.11+ includes `tomllib`; for older versions install `tomli`) for parsing deployment TOML files.
- JSON-RPC endpoints for every chain you plan to deploy to.

## Directory layout

- `deploy.sh` – orchestrates per-contract deployments by calling the `runDeploy*` functions with the right chain id, RPC URL, and forwarded `forge script` flags.
- `RelayDeploy.sol` – abstract base that wires common Symbiotic core helpers and exposes the four deployment hooks: key registry, voting power provider, settlement, and valset driver.
- `examples/` – end-to-end sample script (`MyRelayDeploy.sol`) plus a minimal TOML config that you can copy and adapt.

## Configuration file

`deploy.sh` expects a TOML file that specifies:

1. RPC endpoints keyed by chain id.
2. The set of chains each relay component should be deployed to.

An easy starting point is the example at `script/deploy/examples/my-relay-deploy.toml`. 
The file should follow Foundry's [deployment configuration format](https://getfoundry.sh/guides/scripting-with-config#1-create-a-configuration-file)


When `deploy.sh` processes a contract block, it will:

1. Resolve the chain ids declared for that contract.
2. Look up an `endpoint_url` for each chain id.
3. Optionally bootstrap CreateX (Anvil only) before invoking `forge script`.

## Running deployments

Invoke the helper with the concrete script path, the config file, and any extra flags you want to pass to `forge script`:

```bash
./script/deploy/deploy.sh ./script/deploy/examples/MyRelayDeploy.sol ./script/deploy/examples/my-relay-deploy.toml --ledger --broadcast 
```

All additional arguments (for example `--legacy`, `--slow`, `--sig runDeployVotingPowerProvider()`, `--etherscan-api-key XXX`) are forwarded as-is to each `forge script` call.

The helper iterates over the four deployment hooks in the following order:

1. `runDeployKeyRegistry()`
2. `runDeployVotingPowerProvider()`
3. `runDeploySettlement()`
4. `runDeployValSetDriver()`

For every chain id declared in the config it logs the contract name, chain id, and RPC endpoint before running the corresponding script function.

## Tips

- Run `forge build` first to ensure your contracts compile before broadcasting transactions.
- On non-Anvil networks make sure CreateX is already deployed at `0xba5Ed099633D3B313e4D5F7bdc1305d3c28ba5Ed`, or remove the bootstrap logic in `deploy.sh`.
- Store sensitive RPC URLs or private keys in environment variables and reference them via Foundry `--rpc-url` templates or `.env` files consumed by your scripts.


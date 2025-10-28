> [!WARNING]
> The SDK is a work in progress and is currently under audits. Breaking changes may occur in SDK updates as well as backward compatibility is not guaranteed. Use with caution.

# Symbiotic Relay Smart Contracts

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/symbioticfi/relay-contracts)
[![codecov](https://codecov.io/github/symbioticfi/relay-contracts/graph/badge.svg?token=9F5PUM6HB0)](https://codecov.io/github/symbioticfi/relay-contracts)

## Overview

Symbiotic Relay is a peer-to-peer side-network designed to collect and aggregate signatures from validators, maintain validator sets on the settlement contract.

To achieve that, Symbiotic provides a set of predefined smart contracts, in general, representing the following modules:

- [VotingPowerProvider](./src/modules/voting-power/) - provides the basic data regarding operators, vaults and their voting power, it allows constructing various onboarding schemes such as:

  - [OperatorsWhitelist](./src/modules/voting-power/extensions/OperatorsWhitelist.sol) - only whitelisted operators can register
  - [OperatorsBlacklist](./src/modules/voting-power/extensions/OperatorsBlacklist.sol) - blacklisted operators are unregistered and are forbidden to return back
  - [OperatorsJail](./src/modules/voting-power/extensions/OperatorsJail.sol) - operators can be jailed for some amount of time and register back after that
  - [SharedVaults](./src/modules/voting-power/extensions/SharedVaults.sol) - shared (with other networks) vaults (like the ones with NetworkRestakeDelegator) can be added
  - [OperatorVaults](./src/modules/voting-power/extensions/OperatorVaults.sol) - vaults that are attached to a single operator can be added
  - [MultiToken](./src/modules/voting-power/extensions/MultiToken.sol) - possible to add new supported tokens on the go
  - [OpNetVaultAutoDeploy](./src/modules/voting-power/extensions/OpNetVaultAutoDeploy.sol) - enable auto-creation of the configured by you vault on each operator registration
  - [VotingPowerCalculators](./src/modules/voting-power/common/voting-power-calc/) - there are several stake-to-votingPower conversion mechanisms you can use separately or combine:

    - [EqualStakeVPCalc](./src/modules/voting-power/common/voting-power-calc/EqualStakeVPCalc.sol) - voting power is equal to stake
    - [NormalizedTokenDecimalsVPCalc](./src/modules/voting-power/common/voting-power-calc/NormalizedTokenDecimalsVPCalc.sol) - all tokens' decimals are normalized to 18
    - [PricedTokensChainlinkVPCalc](./src/modules/voting-power/common/voting-power-calc/PricedTokensChainlinkVPCalc.sol) - voting power is calculated using Chainlink price feeds
    - [WeightedTokensVPCalc](./src/modules/voting-power/common/voting-power-calc/WeightedTokensVPCalc.sol) - voting power is affected by configured weights for tokens
    - [WeightedVaultsVPCalc](./src/modules/voting-power/common/voting-power-calc/WeightedVaultsVPCalc.sol) - voting power is affected by configured weights for vaults

  - Also, there are ready bindings for [slashing](./src/modules/voting-power/extensions/BaseSlashing.sol) and [rewards](./src/modules/voting-power/extensions/BaseRewards.sol)

- [KeyRegistry](./src/modules/key-registry/) - verifies and manages operators' keys; currently, these key types are supported:
  - [BlsBn254](./src/libraries/keys/KeyBlsBn254.sol) ([signature verification](./src/libraries/sigs/SigBlsBn254.sol))
  - [EcdsaSecp256k1](./src/libraries/keys/KeyEcdsaSecp256k1.sol) ([signature verification](./src/libraries/sigs/SigEcdsaSecp256k1.sol))
- [ValSetDriver](./src/modules/valset-driver/) - is used by the off-chain part of the Symbiotic Relay for validator set deriving and maintenance
- [Settlement](./src/modules/settlement/) - requires a compressed validator set (header) to be committed each epoch, but allows verifying signatures made by the validator set; currently, it supports the following verification mechanics:
  - [SimpleVerifier](./src/modules/settlement/sig-verifiers/SigVerifierBlsBn254Simple.sol) - requires the whole validator set to be inputted on the verification, but in a compressed and efficient way, so that it is the best choice to use up to around 125 validators
  - [ZKVerifier](./src/modules/settlement/sig-verifiers/SigVerifierBlsBn254ZK.sol) - uses ZK verification made with [gnark](https://github.com/Consensys/gnark), allowing larger validator sets with an almost constant verification gas cost

## Examples

Can be found [here](./examples/).

## Usage

### Dependencies

- Git ([installation](https://git-scm.com/downloads))
- Foundry ([installation](https://getfoundry.sh/introduction/installation/))

### Prerequisites

**Clone the repository**

```
git clone --recurse-submodules https://github.com/symbioticfi/relay-contracts.git
```

### Deploy Your Relay

The deployment tooling can be found at [`script/`](./script/) folder. It consists of [`RelayDeploy.sol`](./script/RelayDeploy.sol) Foundry script template [`relay-deploy.sh`](./script/relay-deploy.sh) bash script (the Relay smart contracts use external libraries for their implementations, so that it's not currently possible to use solely Foundry script for multi-chain deployment).

- [`RelayDeploy.sol`](./script/RelayDeploy.sol) - abstract base that wires common Symbiotic core helpers and exposes the four deployment hooks: KeyRegistry, VotingPowerProvider, Settlement, and ValVetDriver
- [`relay-deploy.sh`](./script/relay-deploy.sh) - orchestrates per-contract multi-chain deployments (uses Python inside to parse `toml` file)

The script deploys Relay modules under [OZ's TransparentUpgradeableProxy](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/proxy/transparent/TransparentUpgradeableProxy.sol) using [CreateX](https://github.com/pcaversaccio/createx) (it provides better control for production deployments and more simplified approaches for development).

#### Dependencies

- Python ([installation](https://www.python.org/downloads/))

#### Deployment

1. Implement your `MyRelayDeploy.sol` ([see example](./script/examples/MyRelayDeploy.sol)) - this Foundry script should include the deployment configuration of your Relay modules

   - you need to implement all virtual functions of `RelayDeploy.sol`
   - in constructor, need to input the path of the `toml` file
   - you are provided with additional helpers such as `getCore()`, `getKeyRegistry()`, `getVotingPowerProvider()`, etc. (see full list in [`RelayDeploy.sol`](./script/RelayDeploy.sol))

2. Implement your `my-relay-deploy.toml` ([see example](./script/examples/my-relay-deploy.toml)) - this configuration file should include RPC URLs that will be needed for the deployment, and which modules should be deployed on which chains

   - **do not replace [1234567890] placeholder with endpoint_url = ""**
   - the contracts are deployed in such order:
     1. KeyRegistry
     2. VotingPowerProvider
     3. Settlement
     4. ValSetDriver

3. Execute the deployment script, e.g.:

   ```bash
   ./script/relay-deploy.sh ./script/examples/MyRelayDeploy.sol ./script/examples/my-relay-deploy.toml --broadcast --ledger
   ```

   _Basic form is `./script/relay-deploy.sh <FoundryScript> <TomlConfig> <Any Foundry Flags>`_

At the end, your `toml` file will contain the addresses of the deployed Relay modules.

### Build, Test, and Format

```
forge build
forge test
forge fmt
```

**Configure environment**

Create `.env` based on the template:

```
ETH_RPC_URL=
ETHERSCAN_API_KEY=
```

## Security

Security audits can be found [here](./audits).

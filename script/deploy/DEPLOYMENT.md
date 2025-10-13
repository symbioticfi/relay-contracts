# Relay Contracts Deployment Guide

This guide explains how to use the automated deployment script for relay contracts.

## Overview

The deployment script (`deploy.sh`) automates the deployment of relay contracts to multiple chains based on a YAML configuration file. It ensures contracts are deployed in the correct order and handles dependencies between contracts.

## Files

- `deploy.sh` - Main deployment script
- `deploy-config.yaml` - Your deployment configuration

## Prerequisites

1. **Foundry**: Install [Foundry](https://book.getfoundry.sh/getting-started/installation) with `forge` command
2. **yq**: Install `yq` for YAML parsing:
   - macOS: `brew install yq`
   - Ubuntu/Debian: `apt-get install yq`
   - Or download from [GitHub releases](https://github.com/mikefarah/yq/releases)

## Configuration

Edit `deploy-config.yaml` to specify:
- **Chains**: RPC URLs for each chain you want to deploy to
- **Contracts**: Which contracts to deploy to which chains

**Important**: The deployment script dynamically reads the contract list from the config file. Contracts are deployed **in the order they appear** in the configuration file, so ensure dependencies are ordered correctly.

Example configuration:
```yaml
chains:
  1: # Ethereum Mainnet
    rpc_url: "https://mainnet.infura.io/v3/YOUR_PROJECT_ID"
    name: "ethereum"
    needCoreDeploy: false
  5: # Goerli Testnet
    rpc_url: "https://goerli.infura.io/v3/YOUR_PROJECT_ID"
    name: "goerli"
    needCoreDeploy: false

contracts:
  # Contracts are deployed in the order listed below
  settlement:
    chains: [1, 5]
    function_name: "runDeploySettlement()"
    description: "Settlement contract for cross-chain validation"
  
  keyRegistry:
    chains: [1]
    function_name: "runDeployKeyRegistry()"
    description: "Key registry contract for validator keys"
  
  votingPowerProvider:
    chains: [1]
    function_name: "runDeployVotingPowerProvider()"
    description: "Voting power provider contract (optional)"
  
  valSetDriver:
    chains: [1]
    function_name: "runDeployValSetDriver((uint64,address),(uint64,address)[],(uint64,address)[])"
    params: "keyRegistry,settlement[],votingPowerProvider[]"
    description: "Validator set driver contract (deployed last)"
```

### Configuration Fields

#### Chain Configuration

For each chain in the `chains` section, you can specify:
- **`rpc_url`**: RPC endpoint URL for the chain (required)
- **`name`**: Human-readable name for the chain (optional)
- **`needCoreDeploy`**: Boolean flag indicating whether Symbiotic Core contracts should be deployed to this chain 

#### Contract Configuration

For each contract in the `contracts` section, you can specify:
- **`chains`**: Array of chain IDs where this contract should be deployed
- **`function_name`**: The Solidity function signature to call in your deployment script
- **`params`** (optional): Parameters to pass to the function, can be only tuples (uint64,address) representing previously deployed contracts
  - Use contract name for single address parameters
  - Use `contractName[]` for array parameters (collects addresses from all chains)
- **`description`** (optional): Human-readable description of the contract

## Usage

### Basic Usage

Open the script directory
```bash
cd <PATH TO SCRIPT>
```

Deploy with default configuration:
```bash
./deploy.sh --script <script path>/MyRelayDeploy.s.sol
```

### With Custom Configuration

Specify a custom configuration file:
```bash
./deploy.sh --script <script path>/MyRelayDeploy.s.sol --config my-config.yaml
```

### With Forge Parameters

The script supports all standard `forge script` parameters:

**Using private key:**
```bash
./deploy.sh --script <script path>/MyRelayDeploy.s.sol --private-key 0x123... --broadcast
```

**Using hardware wallet:**
```bash
./deploy.sh --script <script path>/MyRelayDeploy.s.sol --ledger --broadcast
```


## Deployment Order

The script deploys contracts **in the order they appear in the configuration file**. This allows you to control the deployment sequence and ensure dependencies are met.

### Pre-Deployment Phase

Before deploying any relay contracts, the script automatically:

1. **Deploys CreateX** factory contract to all configured chains (if not already deployed)
2. **Deploys Symbiotic Core** contracts to chains where `needCoreDeploy: true` is set
   - This includes core infrastructure contracts required by the relay system
   - Typically needed for local development chains (anvil) or new networks
   - Skip this step (set to `false`) for chains where Core is already deployed

### Main Deployment Phase

**Recommended order** for standard relay contracts:

1. **Settlement** contracts (can be deployed to multiple chains)
2. **KeyRegistry** contracts
3. **VotingPowerProvider** contracts (optional)
4. **ValSetDriver** contracts (requires addresses from previous deployments)

**Important**: If you add custom contracts or reorder the list, ensure that any contract with dependencies (specified via `params`) appears **after** the contracts it depends on in the configuration file.

## Contract Types

### Settlement
- Deployed to multiple chains for cross-chain validation
- Each chain gets its own instance

### KeyRegistry
- Typically deployed to a single chain
- Manages validator keys

### VotingPowerProvider
- Optional contract
- Can be deployed to multiple chains
- Provides voting power data

### ValSetDriver
- Deployed last as it depends on other contracts
- Requires addresses from settlements, keyRegistry, and votingPowerProvider
- Typically deployed to a single chain

## Adding Custom Contracts

You can add custom contracts to the deployment configuration. Simply add a new entry in the `contracts` section:

```yaml
contracts:
  settlement:
    chains: [1, 5]
    function_name: "runDeploySettlement()"
  
  myCustomContract:
    chains: [1]
    function_name: "runDeployMyCustomContract()"
  
  keyRegistry:
    chains: [1]
    function_name: "runDeployKeyRegistry()"
```

The script will automatically:
- Read all contract names from the config file
- Deploy them in the order specified
- Skip any contracts with empty `chains` arrays
- Pass parameters to contracts that require them

## Output

The script provides:
- **Colored output** for easy reading
- **Deployment log** saved to `deployment-log.json`
- **Error handling** with clear messages
- **Progress tracking** for each deployment

## Troubleshooting

### Common Issues

1. **Invalid configuration**:
   - Check YAML syntax
   - Ensure all chains have RPC URLs
   - Verify chain IDs are correct
   - Ensure contracts with dependencies appear after their dependencies in the config file

2. **Deployment failures**:
   - Check RPC URL accessibility
   - Verify private key has sufficient funds
   - Check gas settings for the target network
   - Verify function names match your deployment script exactly

3. **Missing dependencies**:
   - If a contract fails due to missing parameters, check that the required contracts are listed earlier in the config
   - Ensure the `params` field correctly references other contract names

4. **Permission errors**:
   ```bash
   chmod +x deploy.sh
   ```

### Getting Help

Show usage information:
```bash
./deploy.sh --help
```


### Custom Script File

Use a different deployment script:
```bash
./deploy.sh --script path/to/your/script.s.sol --private-key 0x123... --broadcast
```

### Environment Variables

Use environment variables for sensitive data:
```bash
export PRIVATE_KEY="0x123..."
./deploy.sh --private-key $PRIVATE_KEY --broadcast
```


# Relay Contracts Deployment Guide

This guide explains how to use the automated deployment script for relay contracts.

## Overview

The deployment script (`deploy.sh`) automates the deployment of relay contracts to multiple chains based on a YAML configuration file. It ensures contracts are deployed in the correct order and handles dependencies between contracts.

## Files

- `script/deploy/deploy.sh` - Main deployment script
- `script/deploy/deploy-config.yaml` - Your deployment configuration
- `script/deploy/examples/MyRelayDeploy.s.sol` - Solidity deployment script

## Prerequisites

1. **Foundry**: Install [Foundry](https://book.getfoundry.sh/getting-started/installation) with `forge` command
2. **yq**: Install `yq` for YAML parsing:
   - macOS: `brew install yq`
   - Ubuntu/Debian: `apt-get install yq`
   - Or download from [GitHub releases](https://github.com/mikefarah/yq/releases)

## Configuration

### 1. Create Configuration File

Copy the example configuration:
```bash
cp script/deploy/deploy-config.example.yaml script/deploy/deploy-config.yaml
```

### 2. Edit Configuration

Edit `script/deploy/deploy-config.yaml` to specify:
- **Chains**: RPC URLs for each chain you want to deploy to
- **Contracts**: Which contracts to deploy to which chains

Example configuration:
```yaml
chains:
  1: # Ethereum Mainnet
    rpc_url: "https://mainnet.infura.io/v3/YOUR_PROJECT_ID"
    name: "ethereum"
  5: # Goerli Testnet
    rpc_url: "https://goerli.infura.io/v3/YOUR_PROJECT_ID"
    name: "goerli"

contracts:
  settlement:
    chains: [1, 5, 100]
  keyRegistry:
    chains: [1]
  votingPowerProvider:
    chains: []
  valSetDriver:
    chains: [1]
```

## Usage

### Basic Usage

Deploy with default configuration:
```bash
cd script/deploy
./deploy.sh
```

### With Custom Configuration

Specify a custom configuration file:
```bash
cd script/deploy
./deploy.sh --config my-config.yaml
```

### With Forge Parameters

The script supports all standard `forge script` parameters:

**Using private key:**
```bash
cd script/deploy
./deploy.sh --private-key 0x123... --broadcast
```

**Using hardware wallet:**
```bash
cd script/deploy
./deploy.sh --ledger --broadcast
```

**With verification:**
```bash
cd script/deploy
./deploy.sh --private-key 0x123... --broadcast --verify
```

**With custom gas settings:**
```bash
cd script/deploy
./deploy.sh --private-key 0x123... --broadcast --gas-limit 10000000 --gas-price 20000000000
```

**Slow mode (for congested networks):**
```bash
cd script/deploy
./deploy.sh --private-key 0x123... --broadcast --slow
```

## Deployment Order

The script automatically deploys contracts in the correct order:

1. **Settlement** contracts (can be deployed to multiple chains)
2. **KeyRegistry** contracts
3. **VotingPowerProvider** contracts (optional)
4. **ValSetDriver** contracts (requires addresses from previous deployments)

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

## Output

The script provides:
- **Colored output** for easy reading
- **Deployment log** saved to `deployment-log.json`
- **Error handling** with clear messages
- **Progress tracking** for each deployment

## Troubleshooting

### Common Issues

1. **Missing dependencies**:
   ```bash
   # Install yq if missing
   brew install yq  # macOS
   apt-get install yq  # Ubuntu/Debian
   ```

2. **Invalid configuration**:
   - Check YAML syntax
   - Ensure all chains have RPC URLs
   - Verify chain IDs are correct

3. **Deployment failures**:
   - Check RPC URL accessibility
   - Verify private key has sufficient funds
   - Check gas settings for the target network

4. **Permission errors**:
   ```bash
   chmod +x deploy.sh
   ```

### Getting Help

Show usage information:
```bash
cd script/deploy
./deploy.sh --help
```

## Security Considerations

- **Never commit private keys** to version control
- **Use environment variables** for sensitive data
- **Test on testnets** before mainnet deployment
- **Verify contracts** after deployment
- **Use hardware wallets** for mainnet deployments

## Example Workflow

1. **Setup**:
   ```bash
   cd script/deploy
   cp deploy-config.example.yaml deploy-config.yaml
   # Edit deploy-config.yaml with your settings
   ```

2. **Test deployment** (testnet):
   ```bash
   cd script/deploy
   ./deploy.sh --config deploy-config.yaml --private-key $TESTNET_PRIVATE_KEY --broadcast
   ```

3. **Verify contracts**:
   ```bash
   cd script/deploy
   ./deploy.sh --config deploy-config.yaml --private-key $TESTNET_PRIVATE_KEY --verify
   ```

4. **Mainnet deployment** (with hardware wallet):
   ```bash
   cd script/deploy
   ./deploy.sh --config deploy-config.yaml --ledger --broadcast --verify
   ```

## Advanced Usage

### Custom Script File

Use a different deployment script:
```bash
cd script/deploy
./deploy.sh --script path/to/your/script.s.sol --private-key 0x123... --broadcast
```

### Environment Variables

Use environment variables for sensitive data:
```bash
export PRIVATE_KEY="0x123..."
cd script/deploy
./deploy.sh --private-key $PRIVATE_KEY --broadcast
```

### Batch Deployment

Deploy to multiple configurations:
```bash
# Testnet deployment
cd script/deploy
./deploy.sh --config testnet-config.yaml --private-key $TESTNET_KEY --broadcast

# Mainnet deployment
./deploy.sh --config mainnet-config.yaml --ledger --broadcast --verify
```

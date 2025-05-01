# Offchain Middleware

## Overview

Offchain Middleware is a peer-to-peer service designed to collect and aggregate BLS signatures from validators, form validator sets (valsets), and post the aggregated signatures to on-chain middleware contracts. This service facilitates efficient signature collection and aggregation in a decentralized manner.

## Commands

The application supports two commands:

1. **generate-config**: Generates a default configuration file with all available options
   ```
   offchain-middleware generate-config
   ```

2. **start**: Starts the offchain middleware service
   ```
   offchain-middleware start [flags]
   ```
   
   Flags:
   - `--listen`: Address to listen on (e.g., `/ip4/127.0.0.1/tcp/8000`)
   - `--test`: Boolean flag that enables test mode with a mock Ethereum client

## Configuration

You need to configure the following parameters in your `config.yaml` file:

- `contract`: The Ethereum address of the middleware contract
- `eth`: Ethereum RPC URL (e.g., `http://localhost:8545`)
- `bls-private-key`: Your BLS private key for signing (byte array)
- `eth-private-key`: Your Ethereum private key for transactions (byte array)
- `peers`: List of initial peer addresses to connect to
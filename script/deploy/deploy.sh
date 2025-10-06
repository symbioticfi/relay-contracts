#!/bin/bash

# Relay Contracts Deployment Script
# This script deploys relay contracts to specified chains based on a YAML configuration file
# This script requires a deployed CreateX instance.

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
CONFIG_FILE="deploy-config.yaml"
SCRIPT_FILE="examples/MyRelayDeploy.s.sol"
FORGE_ARGS=""
DEPLOYMENT_LOG="deployment-log.json"

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -c, --config FILE     Path to deployment configuration file (default: deploy-config.yaml)"
    echo "  -s, --script FILE     Path to deployment script (default: script/deploy/examples/MyRelayDeploy.s.sol)"
    echo "  --private-key KEY     Private key for deployment"
    echo "  --broadcast           Broadcast transactions"
    echo "  --ledger              Use hardware wallet"
    echo "  --verify              Verify contracts on block explorer"
    echo "  --slow                Use slower gas settings"
    echo "  --gas-limit LIMIT     Set gas limit"
    echo "  --gas-price PRICE     Set gas price"
    echo "  --rpc-url URL         Override RPC URL for a specific chain"
    echo "  -h, --help            Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --config my-config.yaml --private-key 0x123... --broadcast"
    echo "  $0 --ledger --verify --slow"
    echo ""
    echo "The script will automatically deploy contracts in the correct order:"
    echo "  1. Settlement contracts"
    echo "  2. KeyRegistry contracts"
    echo "  3. VotingPowerProvider contracts"
    echo "  4. ValSetDriver contracts (requires addresses from previous deployments)"
}

# Function to check dependencies
check_dependencies() {
    print_info "Checking dependencies..."
    
    if ! command -v forge &> /dev/null; then
        print_error "forge is not installed. Please install Foundry first."
        exit 1
    fi
    
    if ! command -v yq &> /dev/null; then
        print_error "yq is not installed. Please install yq first:"
        echo "  brew install yq  # macOS"
        echo "  apt-get install yq  # Ubuntu/Debian"
        exit 1
    fi
    
    print_success "All dependencies are installed"
}

# Function to validate config file
validate_config() {
    local config_file="$1"
    
    print_info "Validating configuration file: $config_file"
    
    if [[ ! -f "$config_file" ]]; then
        print_error "Configuration file not found: $config_file"
        exit 1
    fi
    
    # Check if required sections exist
    if ! yq eval '.chains' "$config_file" > /dev/null 2>&1; then
        print_error "Missing 'chains' section in config file"
        exit 1
    fi
    
    if ! yq eval '.contracts' "$config_file" > /dev/null 2>&1; then
        print_error "Missing 'contracts' section in config file"
        exit 1
    fi
    
    # Validate chain configurations
    local chains=$(yq eval '.chains | keys | .[]' "$config_file")
    for chain_id in $chains; do
        local rpc_url=$(yq eval ".chains.$chain_id.rpc_url" "$config_file")
        if [[ "$rpc_url" == "null" || -z "$rpc_url" ]]; then
            print_error "Missing RPC URL for chain $chain_id"
            exit 1
        fi
    done
    
    print_success "Configuration file is valid"
}

# Function to get chain RPC URL
get_chain_rpc() {
    local config_file="$1"
    local chain_id="$2"
    
    yq eval ".chains.$chain_id.rpc_url" "$config_file"
}

# Function to get contract chains
get_contract_chains() {
    local config_file="$1"
    local contract="$2"
    
    yq eval ".contracts.$contract.chains[]" "$config_file" 2>/dev/null || echo ""
}

# Function to get deployed address for a contract on a specific chain
get_deployed_address() {
    local contract="$1"
    local chain_id="$2"
    
    if [[ -f ".deployments.tmp" ]]; then
        grep "^$contract:$chain_id:" ".deployments.tmp" | cut -d':' -f3
    fi
}

# Function to get all deployed addresses for a contract type across all chains
get_all_deployed_addresses() {
    local contract="$1"
    
    if [[ -f ".deployments.tmp" ]]; then
        grep "^$contract:" ".deployments.tmp" | while IFS=':' read -r contract_type chain_id address; do
            echo "($chain_id,$address)"
        done
    fi
}

# Function to deploy contract to specific chain
deploy_contract_to_chain() {
    local config_file="$1"
    local contract="$2"
    local chain_id="$3"
    local forge_args="$4"
    
    local rpc_url=$(get_chain_rpc "$config_file" "$chain_id")
    local chain_name=$(yq eval ".chains.$chain_id.name" "$config_file")
    
    print_info "Deploying $contract to chain $chain_id ($chain_name)"
    print_info "RPC URL: $rpc_url"
    
    # Determine the function to call based on contract type
    local function_name=""
    case "$contract" in
        "settlement")
            function_name="runDeploySettlement"
            ;;
        "keyRegistry")
            function_name="runDeployKeyRegistry"
            ;;
        "votingPowerProvider")
            function_name="runDeployVotingPowerProvider"
            ;;
        "valSetDriver")
            function_name="runDeployValSetDriver"
            ;;
        *)
            print_error "Unknown contract type: $contract"
            return 1
            ;;
    esac
    
    # Get project root directory
    local project_root=$(git rev-parse --show-toplevel 2>/dev/null || echo "$(dirname $(dirname $(dirname $(realpath $0))))")
    
    print_info "Project root: $project_root"
    print_info "Current directory: $(pwd)"
    
    # Change to project root for forge commands
    # cd "$project_root" || { print_error "Failed to change to project root: $project_root"; return 1; }
    
    print_info "Changed to: $(pwd)"
    
    # Build forge command
    local cmd=""
    
    if [[ "$contract" == "valSetDriver" ]]; then
        # For valSetDriver, we need to pass deployment parameters
        local keyRegistry_addr=$(get_deployed_address "keyRegistry" "$chain_id")
        
        # Get all deployed addresses for settlement and votingPowerProvider
        print_info "Collecting all deployed addresses..."
        
        # Debug: Show what's in the deployments file
        if [[ -f ".deployments.tmp" ]]; then
            print_info "Current deployments:"
            cat ".deployments.tmp" | while read line; do
                print_info "  $line"
            done
        fi
        
        local settlements_array=$(get_all_deployed_addresses "settlement" | tr '\n' ' ' | sed 's/ $//' | sed 's/ /,/g')
        local voting_power_array=$(get_all_deployed_addresses "votingPowerProvider" | tr '\n' ' ' | sed 's/ $//' | sed 's/ /,/g')
        
        print_info "Collected addresses:"
        print_info "  Settlements: $settlements_array"
        print_info "  VotingPowerProviders: $voting_power_array"
        
        if [[ -z "$keyRegistry_addr" || -z "$settlements_array" ]]; then
            print_error "Missing required addresses for valSetDriver deployment"
            print_error "KeyRegistry: $keyRegistry_addr, Settlements: $settlements_array"
            return 1
        fi
        
        # Build parameter string for valSetDriver
        # Format: keyRegistry as single address, settlements and votingPowerProviders as arrays
        local params="'($chain_id,$keyRegistry_addr)' '[$settlements_array]'"
        if [[ -n "$voting_power_array" ]]; then
            params="${params} '[$voting_power_array]'"
        else
            params="${params} '[]'"
        fi
        
        print_info "ValSetDriver parameters:"
        print_info "  KeyRegistry: ($chain_id,$keyRegistry_addr)"
        print_info "  Settlements: [$settlements_array]"
        print_info "  VotingPowerProviders: [$voting_power_array]"
        
        cmd="forge script $SCRIPT_FILE:MyRelayDeploy --sig \"$function_name((uint64,address),(uint64,address)[],(uint64,address)[])\" $params --rpc-url $rpc_url $forge_args"
    else
        cmd="forge script $SCRIPT_FILE:MyRelayDeploy --sig \"$function_name()\" --rpc-url $rpc_url $forge_args"
    fi
    
    print_info "Executing: $cmd"
    
    # Execute deployment and capture output
    local output
    if output=$(eval "$cmd" 2>&1); then
        # Extract deployed address from output
        local deployed_address=$(echo "$output" | grep -oE "deployed at: 0x[a-fA-F0-9]{40}" | tail -1 | cut -d' ' -f3)
        
        if [[ -n "$deployed_address" ]]; then
            print_success "$contract deployed at: $deployed_address on chain $chain_id"
            
            # Log deployment
            echo "$(date): $contract deployed at $deployed_address on chain $chain_id" >> "$DEPLOYMENT_LOG"
            
            # Store deployment info for valSetDriver
            if [[ "$contract" != "valSetDriver" ]]; then
                echo "$contract:$chain_id:$deployed_address" >> ".deployments.tmp"
            fi
        else
            print_warning "Could not extract deployed address for $contract on chain $chain_id"
        fi
    else
        print_error "Failed to deploy $contract to chain $chain_id"
        print_error "Output: $output"
        return 1
    fi
}

# Function to deploy all contracts
deploy_contracts() {
    local config_file="$1"
    local forge_args="$2"
    
    # Clean up previous deployment logs
    > "$DEPLOYMENT_LOG"
    > ".deployments.tmp"
    
    # Deployment order: settlement -> keyRegistry -> votingPowerProvider -> valSetDriver
    local contracts=("settlement" "keyRegistry" "votingPowerProvider" "valSetDriver")
    
    for contract in "${contracts[@]}"; do
        local chains=$(get_contract_chains "$config_file" "$contract")
        
        if [[ -z "$chains" ]]; then
            print_info "Skipping $contract (no chains specified)"
            continue
        fi
        
        print_info "Deploying $contract contracts..."
        
        for chain_id in $chains; do
            if ! deploy_contract_to_chain "$config_file" "$contract" "$chain_id" "$forge_args"; then
                print_error "Failed to deploy $contract to chain $chain_id. Aborting."
                exit 1
            fi
        done
        
        print_success "Completed deployment of $contract contracts"
    done
    
    # Clean up temp file
    rm -f ".deployments.tmp"
}

# Function to parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -c|--config)
                CONFIG_FILE="$2"
                shift 2
                ;;
            -s|--script)
                SCRIPT_FILE="$2"
                shift 2
                ;;
            --private-key)
                FORGE_ARGS="$FORGE_ARGS --private-key $2"
                shift 2
                ;;
            --broadcast)
                FORGE_ARGS="$FORGE_ARGS --broadcast"
                shift
                ;;
            --ledger)
                FORGE_ARGS="$FORGE_ARGS --ledger"
                shift
                ;;
            --verify)
                FORGE_ARGS="$FORGE_ARGS --verify"
                shift
                ;;
            --slow)
                FORGE_ARGS="$FORGE_ARGS --slow"
                shift
                ;;
            --gas-limit)
                FORGE_ARGS="$FORGE_ARGS --gas-limit $2"
                shift 2
                ;;
            --gas-price)
                FORGE_ARGS="$FORGE_ARGS --gas-price $2"
                shift 2
                ;;
            --rpc-url)
                FORGE_ARGS="$FORGE_ARGS --rpc-url $2"
                shift 2
                ;;
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
}

# Main function
main() {
    print_info "Starting Relay Contracts Deployment"
    print_info "Configuration file: $CONFIG_FILE"
    print_info "Script file: $SCRIPT_FILE"
    
    if [[ -n "$FORGE_ARGS" ]]; then
        print_info "Forge arguments: $FORGE_ARGS"
    fi
    
    # Check dependencies
    check_dependencies
    
    # Validate configuration
    validate_config "$CONFIG_FILE"
    
    # Check if script file exists
    if [[ ! -f "$SCRIPT_FILE" ]]; then
        print_error "Script file not found: $SCRIPT_FILE"
        exit 1
    fi
    
    # Deploy contracts
    deploy_contracts "$CONFIG_FILE" "$FORGE_ARGS"
    
    print_success "Deployment completed successfully!"
    print_info "Deployment log saved to: $DEPLOYMENT_LOG"
}

# Parse command line arguments
parse_args "$@"

# Run main function
main

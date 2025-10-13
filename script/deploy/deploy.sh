#!/usr/bin/env bash

# Relay Contracts Deployment Script
# This script deploys relay contracts to specified chains based on a YAML configuration file

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
CONFIG_FILE="deploy-config.yaml"
SCRIPT_FILE=""
FORGE_ARGS=""
DEPLOYMENT_LOG="deployment-log.json"
DEPLOYMENTS=""
SCRIPT_DIR=""
CALL_DIR="$(pwd -P)"

# Constants
CREATEX_FACTORY_ADDRESS="0xba5Ed099633D3B313e4D5F7bdc1305d3c28ba5Ed"

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
    echo "Usage: $0 --script <script path> [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -s, --script FILE     Path to deployment script"
    echo "  -c, --config FILE     Path to deployment configuration file"
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

# Check if CreateX is deployed on a given chain (by RPC URL)
check_createx_deployed() {
    local rpc_url="$1"

    print_info "Deploying CreateX to $rpc_url"
    cd "$SCRIPT_DIR"
    ./deploy-createx.sh --rpc-url $rpc_url --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
    cd "$CALL_DIR"
}

deploy_core() {
    local rpc_url="$1"
    local chain_id="$2"

    print_info "Deploying Core to $rpc_url"
    cd "$SCRIPT_DIR"
    cd ../../lib/core/script/deploy
    forge script CoreCreate3.s.sol --sig "run(address)" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --rpc-url $rpc_url --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
    cd "$CALL_DIR"
 
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

# Function to get contract function name
get_contract_function_name() {
    local config_file="$1"
    local contract="$2"
    
    yq eval ".contracts.$contract.function_name" "$config_file" 2>/dev/null
}

# Function to get contract params field
get_contract_params() {
    local config_file="$1"
    local contract="$2"
    
    yq eval ".contracts.$contract.params" "$config_file" 2>/dev/null
}

# Function to get deployed address for a contract on a specific chain
get_deployed_address() {
    local contract="$1"
    local chain_id="$2"
    
    if [[ -n "$DEPLOYMENTS" ]]; then
        printf '%s\n' "$DEPLOYMENTS" | grep "^$contract:$chain_id:" | cut -d':' -f3
    fi
}

# Function to get all deployed addresses for a contract type across all chains
get_all_deployed_addresses() {
    local contract="$1"
    
    if [[ -n "$DEPLOYMENTS" ]]; then
        printf '%s\n' "$DEPLOYMENTS" | grep "^$contract:" | while IFS=':' read -r contract_type chain_id address; do
            echo "($chain_id,$address)"
        done
    fi
}

# Function to store deployment in memory
append_deployment() {
    local contract="$1"
    local chain_id="$2"
    local address="$3"
    if [[ -z "$DEPLOYMENTS" ]]; then
        DEPLOYMENTS="$contract:$chain_id:$address"
    else
        DEPLOYMENTS="$DEPLOYMENTS"$'\n'"$contract:$chain_id:$address"
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
    
    # Get the function name from the config file
    local function_name=$(get_contract_function_name "$config_file" "$contract")
    
    if [[ -z "$function_name" || "$function_name" == "null" ]]; then
        print_error "Missing function_name for contract type: $contract"
        return 1
    fi
    
    # Get params configuration
    local params_spec=$(get_contract_params "$config_file" "$contract")
    
    # Build forge command
    local cmd=""
    
    if [[ -n "$params_spec" && "$params_spec" != "null" ]]; then
        # Contract requires parameters - build them dynamically
        print_info "Building parameters from spec: $params_spec"
        
        # Debug: Show what's in the in-memory deployments
        if [[ -n "$DEPLOYMENTS" ]]; then
            print_info "Current deployments:"
            printf '%s\n' "$DEPLOYMENTS" | while read line; do
                print_info "  $line"
            done
        fi
        
        # Parse params spec (comma-separated list)
        IFS=',' read -ra param_specs <<< "$params_spec"
        local params_string=""
        
        for param_spec in "${param_specs[@]}"; do
            # Trim whitespace
            param_spec=$(echo "$param_spec" | xargs)
            
            # Check if this is an array parameter (ends with [])
            if [[ "$param_spec" =~ \[\]$ ]]; then
                # Array parameter - get all deployments across all chains
                local contract_type="${param_spec%[]}"
                local addresses=$(get_all_deployed_addresses "$contract_type" | tr '\n' ' ' | sed 's/ $//' | sed 's/ /,/g')
                
                local param_value
                if [[ -n "$addresses" ]]; then
                    param_value="[$addresses]"
                else
                    param_value="[]"
                fi
                
                print_info "  Parameter $param_spec => $param_value"
                
                if [[ -z "$params_string" ]]; then
                    params_string="'$param_value'"
                else
                    params_string="$params_string '$param_value'"
                fi
            else
                # Single parameter - get deployment for current chain
                local contract_type="$param_spec"
                local address=$(get_deployed_address "$contract_type" "$chain_id")
                
                if [[ -z "$address" ]]; then
                    print_error "Missing deployed address for $contract_type on chain $chain_id"
                    return 1
                fi
                
                local param_value="($chain_id,$address)"
                print_info "  Parameter $param_spec => $param_value"
                
                if [[ -z "$params_string" ]]; then
                    params_string="'$param_value'"
                else
                    params_string="$params_string '$param_value'"
                fi
            fi
        done
        
        cmd="forge script $SCRIPT_FILE --sig \"$function_name\" $params_string --rpc-url $rpc_url $forge_args"
    else
        # No parameters needed
        cmd="forge script $SCRIPT_FILE --sig \"$function_name\" --rpc-url $rpc_url $forge_args"
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
            append_deployment "$contract" "$chain_id" "$deployed_address"
        else
            print_warning "Could not extract deployed address for $contract on chain $chain_id"
        fi
    else
        print_error "Failed to deploy $contract to chain $chain_id"
        print_error "Output: $output"
        return 1
    fi
}

check_deployments() {
    local config_file="$1"
    # Check CreateX deployment for all chains first
    print_info "Checking CreateX deployment for all chains..."
    local chains=$(yq eval '.chains | keys | .[]' "$config_file")
    for chain_id in $chains; do
        local rpc_url=$(get_chain_rpc "$config_file" "$chain_id")
        local chain_name=$(yq eval ".chains.$chain_id.name" "$config_file")
        print_info "Checking CreateX for chain $chain_id ($chain_name)"
        check_createx_deployed "$rpc_url"
        # Check Core deployment for main chains
        local need_core_deploy=$(yq eval ".chains.$chain_id.needCoreDeploy" "$config_file")
        if [[ "$need_core_deploy" == "true" ]]; then
            deploy_core "$rpc_url" "$chain_id"
        fi
    done
}

# Function to deploy all contracts
deploy_contracts() {
    local config_file="$1"
    local forge_args="$2"
    
    # Clean up previous deployment logs and in-memory deployments
    > "$DEPLOYMENT_LOG"
    DEPLOYMENTS=""
    
    # Get contracts dynamically from config file in order
    local contracts=()
    while IFS= read -r contract; do
        contracts+=("$contract")
    done < <(yq eval '.contracts | keys | .[]' "$config_file")
    
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
    
    # No temp file to clean up
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
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                # Any other argument is passed through to forge
                FORGE_ARGS="$FORGE_ARGS $1"
                shift
                ;;
        esac
    done
}

# Main function
main() {
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

    check_deployments "$CONFIG_FILE"
    # Deploy contracts
    deploy_contracts "$CONFIG_FILE" "$FORGE_ARGS"
    
    print_success "Deployment completed successfully!"
    print_info "Deployment log saved to: $DEPLOYMENT_LOG"
}

# Parse command line arguments
parse_args "$@"

# Run main function
main

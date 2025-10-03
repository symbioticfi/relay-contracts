// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {stdJson} from "forge-std/Script.sol";
import {Vm} from "forge-std/Vm.sol";

/**
 * @title RelayContractsJson
 * @notice Library for managing relay contracts addresses in JSON format
 * @dev Provides functions to save, load, and clear relay contracts addresses
 */
library RelayContractsJson {
    using stdJson for string;

    Vm private constant vm = Vm(address(bytes20(uint160(uint256(keccak256("hevm cheat code"))))));

    struct RelayContractsAddresses {
        CrossChainAddress keyRegistry;
        CrossChainAddress[] settlements;
        CrossChainAddress[] votingPowerProviders;
    }

    struct CrossChainAddress {
        address addr;
        uint64 chainId;
    }

    string public constant RELAY_CONTRACTS_PATH = "script/deploy/examples/relay_contracts.json";

    /**
     * @notice Save a single settlement address to the JSON file
     * @param settlement The deployed settlement contract address
     */
    function saveSettlementAddress(
        address settlement
    ) internal {
        // Initialize empty file if it doesn't exist
        // initializeContractsFileIfNeeded();

        RelayContractsAddresses memory contracts = loadDeployedAddressesSafe();

        // Append new settlement to the array
        CrossChainAddress[] memory newSettlements = new CrossChainAddress[](contracts.settlements.length + 1);
        for (uint256 i = 0; i < contracts.settlements.length; i++) {
            newSettlements[i] = contracts.settlements[i];
        }
        newSettlements[contracts.settlements.length] =
            CrossChainAddress({addr: settlement, chainId: uint64(block.chainid)});
        contracts.settlements = newSettlements;

        writeContractsToFile(contracts);
    }

    /**
     * @notice Save a single voting power provider address to the JSON file
     * @param votingPower The deployed voting power provider address
     */
    function saveVotingPowerAddress(
        address votingPower
    ) internal {
        // Initialize empty file if it doesn't exist
        // initializeContractsFileIfNeeded();

        RelayContractsAddresses memory contracts = loadDeployedAddressesSafe();

        // Append new voting power provider to the array
        CrossChainAddress[] memory newVotingPowerProviders =
            new CrossChainAddress[](contracts.votingPowerProviders.length + 1);
        for (uint256 i = 0; i < contracts.votingPowerProviders.length; i++) {
            newVotingPowerProviders[i] = contracts.votingPowerProviders[i];
        }
        newVotingPowerProviders[contracts.votingPowerProviders.length] =
            CrossChainAddress({addr: votingPower, chainId: uint64(block.chainid)});
        contracts.votingPowerProviders = newVotingPowerProviders;

        writeContractsToFile(contracts);
    }

    /**
     * @notice Save a single key registry address to the JSON file
     * @param keyRegistry The deployed key registry address
     */
    function saveKeyRegistryAddress(
        address keyRegistry
    ) internal {
        // Initialize empty file if it doesn't exist
        // initializeContractsFileIfNeeded();

        RelayContractsAddresses memory contracts = loadDeployedAddressesSafe();

        // Update key registry (only one per deployment)
        contracts.keyRegistry = CrossChainAddress({addr: keyRegistry, chainId: uint64(block.chainid)});

        writeContractsToFile(contracts);
    }

    /**
     * @notice Write contracts data to JSON file
     * @param contracts The contracts data to write
     */
    function writeContractsToFile(
        RelayContractsAddresses memory contracts
    ) internal {
        // Create JSON manually to avoid forge's automatic serialization issues
        string memory json = "{";

        // Add key registry
        json = string.concat(json, '"keyRegistry":{');
        json = string.concat(json, '"addr":"', vm.toString(contracts.keyRegistry.addr), '",');
        json = string.concat(json, '"chainId":', vm.toString(uint256(contracts.keyRegistry.chainId)));
        json = string.concat(json, "},");

        // Add settlements array
        json = string.concat(json, '"settlements":[');
        for (uint256 i = 0; i < contracts.settlements.length; i++) {
            if (i > 0) json = string.concat(json, ",");
            json = string.concat(json, "{");
            json = string.concat(json, '"addr":"', vm.toString(contracts.settlements[i].addr), '",');
            json = string.concat(json, '"chainId":', vm.toString(uint256(contracts.settlements[i].chainId)));
            json = string.concat(json, "}");
        }
        json = string.concat(json, "],");

        // Add voting power providers array
        json = string.concat(json, '"votingPowerProviders":[');
        for (uint256 i = 0; i < contracts.votingPowerProviders.length; i++) {
            if (i > 0) json = string.concat(json, ",");
            json = string.concat(json, "{");
            json = string.concat(json, '"addr":"', vm.toString(contracts.votingPowerProviders[i].addr), '",');
            json = string.concat(json, '"chainId":', vm.toString(uint256(contracts.votingPowerProviders[i].chainId)));
            json = string.concat(json, "}");
        }
        json = string.concat(json, "]");

        json = string.concat(json, "}");

        // bytes memory encodedData = abi.encode(contracts);
        // string memory json = vm.serializeJsonType("RelayContractsAddresses", encodedData);
        // json.write(RELAY_CONTRACTS_PATH);

        // Write final JSON
        vm.writeJson(json, RELAY_CONTRACTS_PATH);
    }

    /**
     * @notice Load deployed contracts addresses from JSON file
     * @return contracts The loaded relay contracts addresses (empty if file doesn't exist or is invalid)
     */
    function loadDeployedAddresses() internal view returns (RelayContractsAddresses memory contracts) {
        string memory config = vm.readFile(RELAY_CONTRACTS_PATH);

        // Return empty struct if file is empty
        if (bytes(config).length == 0) {
            return contracts;
        }

        bytes memory encodedData = config.parseRaw(".");
        contracts = abi.decode(encodedData, (RelayContractsAddresses));
    }

    /**
     * @notice Clear the relay contracts JSON file
     */
    function clearRelayContractsFile() internal {
        vm.writeFile(RELAY_CONTRACTS_PATH, "");
    }

    /**
     * @notice Safe load deployed addresses with error handling
     * @return contracts The loaded relay contracts addresses
     */
    function loadDeployedAddressesSafe() internal view returns (RelayContractsAddresses memory contracts) {
        string memory config = vm.readFile(RELAY_CONTRACTS_PATH);

        // Return empty struct if file is empty
        if (bytes(config).length == 0) {
            return contracts;
        }

        // Parse JSON and decode
        bytes memory configRaw = config.parseRaw(".");
        contracts = abi.decode(configRaw, (RelayContractsAddresses));
    }
}

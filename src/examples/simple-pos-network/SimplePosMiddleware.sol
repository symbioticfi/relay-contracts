// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {SharedVaults} from "../../middleware/extensions/SharedVaults.sol";
import {Operators} from "../../middleware/extensions/Operators.sol";

import {KeyStorage256} from "../../key-storage/KeyStorage256.sol";

contract SimplePosMiddleware is SharedVaults, Operators, KeyStorage256 {
    using Subnetwork for address;

    error InactiveKeySlash(); // Error thrown when trying to slash an inactive key
    error InactiveOperatorSlash(); // Error thrown when trying to slash an inactive operator
    error NotExistKeySlash(); // Error thrown when the key does not exist for slashing
    error InvalidHints(); // Error thrown for invalid hints provided

    struct ValidatorData {
        uint256 power; // Power of the validator
        bytes32 key; // Key associated with the validator
    }

    uint48 public immutable EPOCH_DURATION; // Duration of each epoch
    uint48 public immutable START_TIMESTAMP; // Start timestamp of the network

    struct SlashParams {
        uint48 epochStart;
        address operator;
        uint256 totalStake;
        address[] vaults;
        uint160[] subnetworks;
    }

    /* 
     * @notice Constructor for initializing the SimpleMiddleware contract.
     * @param network The address of the network.
     * @param operatorRegistry The address of the operator registry.
     * @param vaultRegistry The address of the vault registry.
     * @param operatorNetOptin The address of the operator network opt-in service.
     * @param owner The address of the contract owner.
     * @param epochDuration The duration of each epoch.
     * @param slashingWindow The duration of the slashing window
     */
    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address owner,
        uint48 epochDuration,
        uint48 slashingWindow
    ) BaseMiddleware(network, operatorRegistry, vaultRegistry, operatorNetOptin, slashingWindow, owner) {
        EPOCH_DURATION = epochDuration;
        START_TIMESTAMP = Time.timestamp();
    }

    /* 
     * @notice Returns the start timestamp for a given epoch.
     * @param epoch The epoch number.
     * @return The start timestamp.
     */
    function getEpochStart(uint48 epoch) public view returns (uint48) {
        return START_TIMESTAMP + epoch * EPOCH_DURATION;
    }

    /* 
     * @notice Returns the current epoch.
     * @return The current epoch.
     */
    function getCurrentEpoch() public view returns (uint48) {
        return (Time.timestamp() - START_TIMESTAMP) / EPOCH_DURATION;
    }

    /* 
     * @notice Returns the capture timestamp for the current epoch.
     * @return The capture timestamp.
     */
    function getCaptureTimestamp() public view virtual override returns (uint48 timestamp) {
        return getEpochStart(getCurrentEpoch());
    }

    /* 
     * @notice Returns the total stake for the active operators in the current epoch.
     * @return The total stake amount.
     */
    function getTotalStake() public view returns (uint256) {
        address[] memory operators = activeOperators(); // Get the list of active operators
        return _totalStake(operators); // Return the total stake for the current epoch
    }

    /* 
     * @notice Returns the total power for the active operators in the current epoch.
     * @return The total power amount.
     */
    function getTotalPower() public view returns (uint256) {
        address[] memory operators = activeOperators(); // Get the list of active operators
        return _totalPower(operators); // Return the total power for the current epoch
    }

    /* 
     * @notice Returns the current validator set as an array of ValidatorData.
     * @return An array of ValidatorData containing the power and key of each validator.
     */
    function getValidatorSet() public view returns (ValidatorData[] memory validatorSet) {
        address[] memory operators = activeOperators(); // Get the list of active operators
        validatorSet = new ValidatorData[](operators.length); // Initialize the validator set
        uint256 len = 0; // Length counter

        for (uint256 i; i < operators.length; ++i) {
            address operator = operators[i]; // Get the operator address

            bytes32 key = abi.decode(operatorKey(operator), (bytes32)); // Get the key for the operator
            if (key == bytes32(0) || !keyWasActiveAt(getCaptureTimestamp(), key)) {
                continue; // Skip if the key is inactive
            }

            uint256 power = getOperatorPower(operator); // Get the operator's power
            validatorSet[len++] = ValidatorData(power, key); // Store the validator data
        }

        assembly ("memory-safe") {
            mstore(validatorSet, len) // Update the length of the array
        }
    }

    /* 
     * @notice Slashes a validator based on the provided parameters.
     * Here are the hints getter
     * https://github.com/symbioticfi/core/blob/main/src/contracts/hints/SlasherHints.sol
     * https://github.com/symbioticfi/core/blob/main/src/contracts/hints/DelegatorHints.sol
     * @param epoch The epoch for which the slashing occurs.
     * @param key The key of the operator to slash.
     * @param amount The amount to slash.
     * @param stakeHints Hints for determining stakes.
     * @param slashHints Hints for the slashing process.
     */
    function slash(uint48 epoch, bytes32 key, uint256 amount, bytes[][] memory stakeHints, bytes[] memory slashHints)
        public
        onlyOwner
    {
        SlashParams memory params;
        params.epochStart = getEpochStart(epoch);
        params.operator = operatorByKey(abi.encode(key));

        _checkCanSlash(epoch, key);

        params.totalStake = getOperatorStakeAt(params.operator, params.epochStart);
        params.vaults = activeVaultsAt(params.epochStart, params.operator);
        params.subnetworks = activeSubnetworksAt(params.epochStart);

        // Validate hints lengths upfront
        if (stakeHints.length != slashHints.length || stakeHints.length != params.vaults.length) {
            revert InvalidHints();
        }

        for (uint256 i; i < params.vaults.length; ++i) {
            if (stakeHints[i].length != params.subnetworks.length) {
                revert InvalidHints();
            }

            address vault = params.vaults[i];
            for (uint256 j; j < params.subnetworks.length; ++j) {
                bytes32 subnetwork = NETWORK.subnetwork(uint96(params.subnetworks[j]));
                uint256 stake = IBaseDelegator(IVault(vault).delegator()).stakeAt(
                    subnetwork, params.operator, params.epochStart, stakeHints[i][j]
                );

                uint256 slashAmount = Math.mulDiv(amount, stake, params.totalStake);
                if (slashAmount == 0) {
                    continue;
                }

                _slashVault(params.epochStart, vault, subnetwork, params.operator, slashAmount, slashHints[i]);
            }
        }
    }

    function _checkCanSlash(uint48 epoch, bytes32 key) internal view {
        address operator = operatorByKey(abi.encode(key)); // Get the operator associated with the key
        uint48 epochStart = getEpochStart(epoch); // Get the start timestamp for the epoch

        if (operator == address(0)) {
            revert NotExistKeySlash(); // Revert if the operator does not exist
        }

        if (!keyWasActiveAt(epochStart, key)) {
            revert InactiveKeySlash(); // Revert if the key is inactive
        }

        if (!operatorWasActiveAt(epochStart, operator)) {
            revert InactiveOperatorSlash(); // Revert if the operator wasn't active
        }
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {VaultManager} from "../../VaultManager.sol";
import {OperatorManager} from "../../OperatorManager.sol";
import {KeyManager} from "../../KeyManager.sol";
import {BaseMiddleware} from "../..//BaseMiddleware.sol";

contract SimpleMiddleware is VaultManager, OperatorManager, KeyManager {
    using Subnetwork for address;

    error InactiveKeySlash(); // Error thrown when trying to slash an inactive key
    error NotExistKeySlash(); // Error thrown when the key does not exist for slashing
    error InvalidHints(); // Error thrown for invalid hints provided

    struct ValidatorData {
        uint256 power; // Power of the validator
        bytes32 key; // Key associated with the validator
    }

    /* 
     * Constructor for initializing the SimpleMiddleware contract.
     * @param network The address of the network.
     * @param operatorRegistry The address of the operator registry.
     * @param vaultRegistry The address of the vault registry.
     * @param operatorNetOptin The address of the operator network opt-in service.
     * @param owner The address of the contract owner.
     * @param epochDuration The duration of each epoch.
     * @param slashingWindow The duration of the slashing window. It's an epochDuration multuplier
     * slashingWindowDuration = slashingWindow * epochDuration
     */
    constructor(
        address network,
        address operatorRegistry,
        address vaultRegistry,
        address operatorNetOptin,
        address owner,
        uint48 epochDuration,
        uint48 slashingWindow
    )
        BaseMiddleware(owner, network, epochDuration, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin)
    {}

    /* 
     * Returns the total stake for the active operators in the current epoch.
     * @return The total stake amount.
     */
    function getTotalStake() public view returns (uint256) {
        address[] memory operators = activeOperators(); // Get the list of active operators
        return _totalStake(getCurrentEpoch(), operators); // Return the total stake for the current epoch
    }

    /* 
     * Returns the current validator set as an array of ValidatorData.
     * @return An array of ValidatorData containing the power and key of each validator.
     */
    function getValidatorSet() public view returns (ValidatorData[] memory validatorSet) {
        uint48 epoch = getCurrentEpoch(); // Get the current epoch
        address[] memory operators = activeOperators(); // Get the list of active operators
        validatorSet = new ValidatorData[](operators.length); // Initialize the validator set
        uint256 len = 0; // Length counter

        for (uint256 i; i < operators.length; ++i) {
            address operator = operators[i]; // Get the operator address

            bytes32 key = operatorKey(operator); // Get the key for the operator
            if (key == bytes32(0) || !keyWasActiveAt(epoch, key)) {
                continue; // Skip if the key is inactive
            }

            uint256 power = getOperatorPower(epoch, operator); // Get the operator's power
            validatorSet[len++] = ValidatorData(power, key); // Store the validator data
        }

        assembly ("memory-safe") {
            mstore(validatorSet, len) // Update the length of the array
        }
    }

    /* 
     * Slashes a validator based on the provided parameters.
     * Here are the hints getter
     * https://github.com/symbioticfi/core/blob/main/src/contracts/hints/SlasherHints.sol
     * https://github.com/symbioticfi/core/blob/main/src/contracts/hints/DelegatorHints.sol
     * @param epoch The epoch for which the slashing occurs.
     * @param key The key of the operator to slash.
     * @param amount The amount to slash.
     * @param stakeHints Hints for determining stakes.
     * @param slashHints Hints for the slashing process.
     * @return An array of SlashResponse indicating the results of the slashing.
     */
    function slash(
        uint48 epoch,
        bytes32 key,
        uint256 amount,
        bytes[][] calldata stakeHints,
        bytes[] calldata slashHints
    ) public onlyOwner returns (SlashResponse[] memory slashResponses) {
        uint48 epochStart = getEpochStart(epoch); // Get the start timestamp for the epoch
        address operator = operatorByKey(key); // Get the operator associated with the key

        if (operator == address(0)) {
            revert NotExistKeySlash(); // Revert if the operator does not exist
        }

        if (!keyWasActiveAt(epoch, key)) {
            revert InactiveKeySlash(); // Revert if the key is inactive
        }

        uint256 totalStake = getOperatorStake(epoch, operator); // Get the total stake for the operator
        address[] memory vaults = activeVaults(operator); // Get active vaults for the operator
        uint160[] memory _subnetworks = activeSubnetworks(); // Get active subnetworks

        slashResponses = new SlashResponse[](vaults.length * _subnetworks.length); // Initialize the array for slash responses
        uint256 len = 0; // Length counter

        if (stakeHints.length != slashHints.length || stakeHints.length != vaults.length) {
            revert InvalidHints(); // Revert if the hints do not match in length
        }

        for (uint256 i; i < vaults.length; ++i) {
            if (stakeHints[i].length != _subnetworks.length) {
                revert InvalidHints(); // Revert if the stake hints do not match the subnetworks
            }

            address vault = vaults[i]; // Get the vault address
            for (uint256 j = 0; j < _subnetworks.length; ++j) {
                bytes32 subnetwork = NETWORK.subnetwork(uint96(_subnetworks[j])); // Get the subnetwork
                uint256 stake = IBaseDelegator(IVault(vault).delegator()).stakeAt(
                    subnetwork,
                    operator,
                    epochStart,
                    stakeHints[i][j] // Get the stake at the specified subnetwork
                );

                uint256 slashAmount = Math.mulDiv(amount, stake, totalStake); // Calculate the slashing amount
                if (slashAmount == 0) {
                    continue; // Skip if the slashing amount is zero
                }

                slashResponses[len++] = _slashVault(epochStart, vault, subnetwork, operator, slashAmount, slashHints[i]); // Execute the slashing
            }
        }

        assembly ("memory-safe") {
            mstore(slashResponses, len) // Update the length of the slash responses
        }
    }
}

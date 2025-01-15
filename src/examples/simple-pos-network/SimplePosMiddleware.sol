// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {VaultManager} from "../../managers/VaultManager.sol";
import {SharedVaults} from "../../extensions/SharedVaults.sol";
import {Operators} from "../../extensions/operators/Operators.sol";

import {OwnableAccessManager} from "../../extensions/managers/access/OwnableAccessManager.sol";
import {EpochCapture} from "../../extensions/managers/capture-timestamps/EpochCapture.sol";
import {KeyManager256} from "../../extensions/managers/keys/KeyManager256.sol";
import {EqualStakePower} from "../../extensions/managers/stake-powers/EqualStakePower.sol";

contract SimplePosMiddleware is
    SharedVaults,
    Operators,
    KeyManager256,
    OwnableAccessManager,
    EpochCapture,
    EqualStakePower
{
    using Subnetwork for address;

    error InactiveKeySlash(); // Error thrown when trying to slash an inactive key
    error InactiveOperatorSlash(); // Error thrown when trying to slash an inactive operator
    error NotExistKeySlash(); // Error thrown when the key does not exist for slashing
    error InvalidHints(); // Error thrown for invalid hints provided

    struct ValidatorData {
        uint256 power; // Power of the validator
        bytes32 key; // Key associated with the validator
    }

    struct SlashParams {
        uint48 epochStart;
        address operator;
        uint256 totalPower;
        address[] vaults;
        uint160[] subnetworks;
    }

    /**
     * @notice Constructor for initializing the SimplePosMiddleware contract
     * @param network The address of the network
     * @param slashingWindow The duration of the slashing window
     * @param vaultRegistry The address of the vault registry
     * @param operatorRegistry The address of the operator registry
     * @param operatorNetOptin The address of the operator network opt-in service
     * @param reader The address of the reader contract used for delegatecall
     * @param owner The address of the contract owner
     * @param epochDuration The duration of each epoch
     */
    constructor(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address reader,
        address owner,
        uint48 epochDuration
    ) {
        initialize(
            network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, reader, owner, epochDuration
        );
    }

    function initialize(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address reader,
        address owner,
        uint48 epochDuration
    ) internal initializer {
        __BaseMiddleware_init(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, reader);
        __OwnableAccessManager_init(owner);
        __EpochCapture_init(epochDuration);
    }

    /* 
     * @notice Returns the total power for the active operators in the current epoch.
     * @return The total power amount.
     */
    function getTotalPower() public view returns (uint256) {
        address[] memory operators = _activeOperators(); // Get the list of active operators
        return _totalPower(operators); // Return the total power for the current epoch
    }

    /* 
     * @notice Returns the current validator set as an array of ValidatorData.
     * @return An array of ValidatorData containing the power and key of each validator.
     */
    function getValidatorSet() public view returns (ValidatorData[] memory validatorSet) {
        address[] memory operators = _activeOperators(); // Get the list of active operators
        validatorSet = new ValidatorData[](operators.length); // Initialize the validator set
        uint256 len = 0; // Length counter

        for (uint256 i; i < operators.length; ++i) {
            address operator = operators[i]; // Get the operator address

            bytes32 key = abi.decode(operatorKey(operator), (bytes32)); // Get the key for the operator
            if (key == bytes32(0) || !keyWasActiveAt(getCaptureTimestamp(), abi.encode(key))) {
                continue; // Skip if the key is inactive
            }

            uint256 power = _getOperatorPower(operator); // Get the operator's power
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
    function slash(
        uint48 epoch,
        bytes32 key,
        uint256 amount,
        bytes[][] memory stakeHints,
        bytes[] memory slashHints
    ) public checkAccess {
        SlashParams memory params;
        params.epochStart = getEpochStart(epoch);
        params.operator = operatorByKey(abi.encode(key));

        _checkCanSlash(params.epochStart, key, params.operator);

        params.vaults = _activeVaultsAt(params.epochStart, params.operator);
        params.subnetworks = _activeSubnetworksAt(params.epochStart);
        params.totalPower = _getOperatorPowerAt(params.epochStart, params.operator, params.vaults, params.subnetworks);
        uint256 vaultsLength = params.vaults.length;
        uint256 subnetworksLength = params.subnetworks.length;

        // Validate hints lengths upfront
        if (stakeHints.length != slashHints.length || stakeHints.length != vaultsLength) {
            revert InvalidHints();
        }

        for (uint256 i; i < vaultsLength; ++i) {
            if (stakeHints[i].length != subnetworksLength) {
                revert InvalidHints();
            }

            address vault = params.vaults[i];
            for (uint256 j; j < subnetworksLength; ++j) {
                bytes32 subnetwork = _NETWORK().subnetwork(uint96(params.subnetworks[j]));
                uint256 stake = IBaseDelegator(IVault(vault).delegator()).stakeAt(
                    subnetwork, params.operator, params.epochStart, stakeHints[i][j]
                );

                uint256 slashAmount = Math.mulDiv(amount, stakeToPower(vault, stake), params.totalPower);
                if (slashAmount == 0) {
                    continue;
                }

                _slashVault(params.epochStart, vault, subnetwork, params.operator, slashAmount, slashHints[i]);
            }
        }
    }

    function executeSlash(address vault, uint256 slashIndex, bytes memory hints) external checkAccess {
        _executeSlash(vault, slashIndex, hints);
    }

    function _checkCanSlash(uint48 epochStart, bytes32 key, address operator) internal view {
        if (operator == address(0)) {
            revert NotExistKeySlash(); // Revert if the operator does not exist
        }

        if (!keyWasActiveAt(epochStart, abi.encode(key))) {
            revert InactiveKeySlash(); // Revert if the key is inactive
        }

        if (!_operatorWasActiveAt(epochStart, operator)) {
            revert InactiveOperatorSlash(); // Revert if the operator wasn't active
        }
    }
}

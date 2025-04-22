// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
// import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
// import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

// import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

// import {BaseStakeProvider} from "../../middleware/BaseStakeProvider.sol";
// import {VaultManager} from "../../base/VaultManager.sol";
// import {SharedVaults} from "../../extensions/SharedVaults.sol";
// import {Operators} from "../../extensions/operators/Operators.sol";

// import {OzOwnable} from "../../extensions/managers/permissions/OzOwnable.sol";
// import {EpochManager} from "../../extensions/managers/capture-timestamps/EpochManager.sol";
// import {EqualStakePower} from "../../extensions/managers/stake-powers/EqualStakePower.sol";

// contract SimplePosStakeProvider is
//     SharedVaults,
//     Operators,
//     OzOwnable,
//     EpochManager,
//     EqualStakePower
// {
//     using Subnetwork for address;

//     error InvalidHints(); // Error thrown for invalid hints provided
//     error SlashFailed(); // Error thrown when the slash fails
//     error InvalidVault(); // Error thrown when the vault is invalid

//     struct ValidatorData {
//         uint256 power; // Power of the validator
//         bytes32 key; // Key associated with the validator
//     }

//     struct SlashParams {
//         uint48 epochStart;
//         address operator;
//         uint256 totalPower;
//         address[] vaults;
//     }

//     /**
//      * @notice Constructor for initializing the SimplePosStakeProvider contract
//      * @param network The address of the network
//      * @param subnetworkID The subnetwork ID
//      * @param slashingWindow The duration of the slashing window
//      * @param vaultFactory The address of the vault factory
//      * @param operatorRegistry The address of the operator registry
//      * @param operatorNetworkOptInService The address of the operator network opt-in service
//      * @param reader The address of the reader contract used for delegatecall
//      * @param owner The address of the contract owner
//      * @param epochDuration The duration of each epoch
//      */
//     constructor(
//         address network,
//         uint96 subnetworkID,
//         uint48 slashingWindow,
//         address vaultFactory,
//         address operatorRegistry,
//         address operatorNetworkOptInService,
//         address reader,
//         address owner,
//         uint48 epochDuration
//     ) {
//         initialize(
//             network,
//             subnetworkID,
//             slashingWindow,
//             vaultFactory,
//             operatorRegistry,
//             operatorNetworkOptInService,
//             reader,
//             owner,
//             epochDuration
//         );
//     }

//     function initialize(
//         address network,
//         uint96 subnetworkID,
//         uint48 slashingWindow,
//         address vaultFactory,
//         address operatorRegistry,
//         address operatorNetworkOptInService,
//         address reader,
//         address owner,
//         uint48 epochDuration
//     ) internal initializer {
//         __BaseStakeProvider_init(
//             network, subnetworkID, slashingWindow, vaultFactory, operatorRegistry, operatorNetworkOptInService, reader
//         );
//         __OzOwnable_init(owner);
//         __EpochManager_init(epochDuration);
//     }

//     /*
//      * @notice Returns the total power for the active operators in the current epoch.
//      * @return The total power amount.
//      */
//     function getTotalPower() public view returns (uint256) {
//         address[] memory operators = _activeOperators(); // Get the list of active operators
//         return _totalPower(operators); // Return the total power for the current epoch
//     }

//     /*
//      * @notice Returns the current validator set as an array of ValidatorData.
//      * @return An array of ValidatorData containing the power and key of each validator.
//      */
//     function getValSet() public view returns (ValidatorData[] memory validatorSet) {
//         address[] memory operators = _activeOperators(); // Get the list of active operators
//         validatorSet = new ValidatorData[](operators.length); // Initialize the validator set
//         uint256 len = 0; // Length counter

//         for (uint256 i; i < operators.length; ++i) {
//             address operator = operators[i]; // Get the operator address

//             bytes32 key = abi.decode(operatorKey(operator), (bytes32)); // Get the key for the operator
//             if (key == bytes32(0) || !keyWasActiveAt(getCaptureTimestamp(), abi.encode(key))) {
//                 continue; // Skip if the key is inactive
//             }

//             uint256 power = _getOperatorPower(operator); // Get the operator's power
//             validatorSet[len++] = ValidatorData(power, key); // Store the validator data
//         }

//         assembly ("memory-safe") {
//             mstore(validatorSet, len) // Update the length of the array
//         }
//     }

//     /*
//      * @notice Slashes a validator based on the provided parameters.
//      * Here are the hints getter
//      * https://github.com/symbioticfi/core/blob/main/src/contracts/hints/SlasherHints.sol
//      * https://github.com/symbioticfi/core/blob/main/src/contracts/hints/DelegatorHints.sol
//      * @param epoch The epoch for which the slashing occurs.
//      * @param key The key of the operator to slash.
//      * @param amount The amount to slash.
//      * @param stakeHints Hints for determining stakes.
//      * @param slashHints Hints for the slashing process.
//      */
//     function slash(
//         uint48 epoch,
//         bytes32 key,
//         uint256 amount,
//         bytes[] memory stakeHints,
//         bytes[] memory slashHints
//     ) public checkPermission {
//         SlashParams memory params;
//         params.epochStart = getEpochStart(epoch);
//         params.operator = operatorByKey(abi.encode(key));

//         _checkCanSlash(params.epochStart, key, params.operator);

//         params.vaults = _activeVaultsAt(params.epochStart, params.operator);
//         params.totalPower = _getOperatorPowerAt(params.epochStart, params.operator, params.vaults);
//         uint256 vaultsLength = params.vaults.length;

//         // Validate hints lengths upfront
//         if (slashHints.length != vaultsLength || stakeHints.length != vaultsLength) {
//             revert InvalidHints();
//         }

//         for (uint256 i; i < vaultsLength; ++i) {
//             address vault = params.vaults[i];
//             bytes32 subnetwork = SUBNETWORK();
//             uint256 stake = IBaseDelegator(IVault(vault).delegator()).stakeAt(
//                 subnetwork, params.operator, params.epochStart, stakeHints[i]
//             );

//             uint256 slashAmount = Math.mulDiv(amount, _stakeToVotingPower(vault, stake), params.totalPower);
//             if (slashAmount == 0) {
//                 continue;
//             }

//             _slashVault(params.epochStart, vault, params.operator, slashAmount, slashHints[i]);
//         }
//     }

//     function executeSlash(
//         address vault,
//         uint256 slashIndex,
//         bytes memory hints
//     ) external checkPermission returns (uint256) {
//         (bool success, uint256 slashedAmount) = _executeSlash(vault, slashIndex, hints);
//         if (!success) {
//             revert SlashFailed();
//         }
//         return slashedAmount;
//     }

//     function _checkCanSlash(uint48 epochStart, bytes32 key, address operator) internal view {
//         if (operator == address(0)) {
//             revert NotExistKeySlash(); // Revert if the operator does not exist
//         }

//         if (!keyWasActiveAt(epochStart, abi.encode(key))) {
//             revert InactiveKeySlash(); // Revert if the key is inactive
//         }
//     }

//     function _validateVault(
//         address vault
//     ) internal view override {
//         if (IVault(vault).slasher() == address(0)) {
//             revert InvalidVault();
//         }
//         super._validateVault(vault);
//     }
// }

// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
// import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
// import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";

// import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

// import {SharedVaults} from "../../../features/registration/vaults/SharedVaults.sol";
// import {Operators} from "../../../features/registration/operators/Operators.sol";
// import {Tokens} from "../../../features/registration/tokens/Tokens.sol";

// import {OzOwnable} from "../../../features/permissions/OzOwnable.sol";
// import {EpochManager} from "../../../base/EpochManager.sol";
// import {EqualStakeToVP} from "../../../features/stakeToVotingPower/EqualStakeToVP.sol";
// import {KeyManager} from "../../../base/KeyManager.sol";

// contract SimplePosStakeProvider is
//     SharedVaults,
//     Operators,
//     Tokens,
//     OzOwnable,
//     EpochManager,
//     KeyManager,
//     EqualStakeToVP
// {
//     using Subnetwork for address;

//     error InvalidHints(); // Error thrown for invalid hints provided
//     error SlashFailed(); // Error thrown when the slash fails
//     error InvalidVault(); // Error thrown when the vault is invalid

//     struct Validator {
//         address operator;
//         Key[] keys;
//         VaultVotingPower[] vaults;
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
//         __NetworkManager_init(network, subnetworkID);
//         __OperatorManager_init();
//         __VaultManager_init(slashingWindow);
//         __OzOwnable_init(owner);
//         __EpochManager_init(epochDuration);
//     }

//     function getValSet() public view returns (Validator[] memory validatorSet) {
//         OperatorVotingPower[] memory operatorVotingPowers = getVotingPowers();
//         validatorSet = new Validator[](operatorVotingPowers.length);
//         for (uint256 i; i < operatorVotingPowers.length; ++i) {
//             validatorSet[i].operator = operatorVotingPowers[i].operator;
//             validatorSet[i].keys = getRequiredKeys(operatorVotingPowers[i].operator);
//             validatorSet[i].vaults = operatorVotingPowers[i].vaults;
//         }
//     }

//     function slash(
//         uint48 epoch,
//         bytes memory key,
//         uint256 amount,
//         bytes[] memory stakeHints,
//         bytes[] memory slashHints
//     ) public checkPermission {
//         uint48 captureTimestamp = getEpochStart(epoch);
//         address operator = getOperator(key);

//         SlashParams memory params;
//         params.epochStart = getEpochStart(epoch);
//         params.operator = getOperator(key);

//         _checkCanSlash(params.epochStart, key, operator);

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

//     function _checkCanSlash(uint48 epochStart, bytes memory key, address operator) internal view {
//         if (operator == address(0)) {
//             revert NotExistKeySlash(); // Revert if the operator does not exist
//         }

//         if (!isKeyActiveAt(epochStart, abi.encode(key))) {
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

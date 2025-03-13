// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.25;

// import {VaultManager} from "../../VaultManager.sol";
// import {NetworkConfig} from "../../NetworkConfig.sol";
// import {NetworkConfigLogic} from "./NetworkConfigLogic.sol";
// import {OperatorManager} from "../../OperatorManager.sol";
// import {OperatorManagerLogic} from "./OperatorManagerLogic.sol";
// import {Updatable} from "../utils/Updatable.sol";

// import {IHookReceiver} from "../../../interfaces/IHookReceiver.sol";

// import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
// import {IEntity} from "@symbioticfi/core/src/interfaces/common/IEntity.sol";
// import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
// import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
// import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";

// import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

// library VaultManagerLogic {
//     using Updatable for Updatable.Uint208Value;
//     using Updatable for Updatable.Bytes32Value;
//     using EnumerableSet for EnumerableSet.AddressSet;

//     enum SlasherType {
//         INSTANT,
//         VETO
//     }

//     function getVotingPower(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address operator
//     ) public view returns (uint256) {}

//     function getTokenPrice(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address token
//     ) public view returns (uint208) {
//         return self._tokenPrice[token].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
//     }

//     function getVaultWeight(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address vault
//     ) public view returns (uint208) {
//         return self._vaultWeight[vault].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
//     }

//     function getSharedVaults(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage
//     ) public view returns (address[] memory) {
//         return self._sharedVaults.values(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
//     }

//     function getOperatorVaults(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address operator
//     ) public view returns (address[] memory) {
//         return self._operatorVaults[operator].values(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
//     }

//     function initialize(
//         VaultManager.VaultManagerStorage storage self,
//         VaultManager.VaultManagerInitParams memory initParams
//     ) public {
//         self._subnetID = initParams.subnetID;
//     }

//     function addToken(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address token,
//         uint208 price
//     ) public {
//         if (token == address(0)) {
//             revert("Token cannot be the zero address");
//         }
//         if (price == 0) {
//             revert("Price cannot be zero");
//         }
//         if (!self._tokens.add(currentEpoch, currentEpoch + 1, token)) {
//             revert("Failed to add token");
//         }
//         if (!self._tokenPrice[token].set(currentEpoch, currentEpoch + 1, price)) {
//             revert("Failed to set token price");
//         }
//     }

//     function updateTokenPrice(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address token,
//         uint208 price
//     ) public {
//         uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
//         if (!self._tokens.isIncluded(currentEpoch + 1, token)) {
//             revert("Token is not included");
//         }
//         if (!self._tokenPrice[token].set(currentEpoch, currentEpoch + 1, price)) {
//             revert("Failed to set token price");
//         }
//     }

//     function removeToken(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address token
//     ) public {
//         uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
//         if (!self._tokens.remove(currentEpoch, currentEpoch + 1, token)) {
//             revert("Failed to remove token");
//         }
//         if (!self._tokenPrice[token].set(currentEpoch, currentEpoch + 1, 0)) {
//             revert("Failed to set token price");
//         }
//     }

//     function addSharedVault(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address vaultFactory,
//         address vault,
//         uint208 weight
//     ) public {
//         _validateVault(self, operatorManagerStorage, networkConfigStorage, vaultFactory, vault);
//     }

//     function addOperatorVault(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address vaultFactory,
//         address operator,
//         address vault,
//         uint208 weight
//     ) public {}

//     function updateVaultWeight(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address vault,
//         uint208 weight
//     ) public {}

//     function removeVault(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address vault
//     ) public {}

//     function requestSlash(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address operator,
//         address vault,
//         uint256 amount,
//         uint48 captureTimestamp,
//         bytes memory hints
//     ) public returns (bytes memory response) {
//         address slasher = IVault(vault).slasher();
//         if (slasher == address(0)) {
//             revert("Vault is not slashing enabled");
//         }

//         uint64 slasherType = IEntity(slasher).TYPE();
//         if (slasherType == uint64(SlasherType.INSTANT)) {
//             response = abi.encode(
//                 ISlasher(slasher).slash(
//                     NetworkConfigLogic.getSubnetwork(networkConfigStorage), operator, amount, captureTimestamp, hints
//                 )
//             );
//         } else if (slasherType == uint64(SlasherType.VETO)) {
//             response = abi.encode(
//                 IVetoSlasher(slasher).requestSlash(
//                     NetworkConfigLogic.getSubnetwork(networkConfigStorage), operator, amount, captureTimestamp, hints
//                 )
//             );
//         }
//     }

//     function executeSlash(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address vault,
//         uint256 slashIndex,
//         bytes memory hints
//     ) public returns (bytes memory response) {
//         address slasher = IVault(vault).slasher();
//         if (slasher == address(0)) {
//             revert("Vault is not slashing enabled");
//         }

//         uint64 slasherType = IEntity(slasher).TYPE();
//         if (slasherType == uint64(SlasherType.VETO)) {
//             response = abi.encode(IVetoSlasher(slasher).executeSlash(slashIndex, hints));
//         } else {
//             revert("Invalid slasher type");
//         }
//     }

//     function _validateVault(
//         VaultManager.VaultManagerStorage storage self,
//         OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
//         NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
//         address vaultFactory,
//         address vault
//     ) internal view {
//         if (!IRegistry(vaultFactory).isEntity(vault)) {
//             revert("Vault is not a valid vault");
//         }

//         if (!IVault(vault).isInitialized()) {
//             revert("Vault is not initialized");
//         }

//         uint256 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
//         if (
//             self._allOperatorVaults.isIncluded(currentEpoch + 1, vault)
//                 || self._sharedVaults.isIncluded(currentEpoch + 1, vault)
//         ) {
//             revert("Vault is already registered");
//         }

//         uint48 vaultEpochDuration = IVault(vault).epochDuration();

//         address slasher = IVault(vault).slasher();
//         if (slasher != address(0)) {
//             uint64 slasherType = IEntity(slasher).TYPE();
//             if (slasherType == uint64(SlasherType.VETO)) {
//                 vaultEpochDuration -= IVetoSlasher(slasher).vetoDuration();
//             } else if (slasherType > uint64(SlasherType.VETO)) {
//                 revert("Unknown slasher type");
//             }
//         }

//         if (vaultEpochDuration < NetworkConfigLogic.getEpochDuration(networkConfigStorage)) {
//             revert("Vault epoch duration is too short");
//         }
//     }
// }

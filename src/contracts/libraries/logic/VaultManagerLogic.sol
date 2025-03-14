// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../VaultManager.sol";
import {OperatorManager} from "../../OperatorManager.sol";
import {NetworkConfig} from "../../NetworkConfig.sol";
import {NetworkConfigLogic} from "./NetworkConfigLogic.sol";
import {OperatorManagerLogic} from "./OperatorManagerLogic.sol";
import {Updatable} from "../utils/Updatable.sol";
import {QuickSorts} from "../utils/QuickSorts.sol";
import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbioticfi/core/src/interfaces/common/IEntity.sol";
import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";
import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

library VaultManagerLogic {
    using Updatable for Updatable.Uint208Value;
    using Updatable for Updatable.Bytes32Value;
    using EnumerableSet for EnumerableSet.AddressSet;

    enum SlasherType {
        INSTANT,
        VETO
    }

    function getVotingPower(
        VaultManager.VaultManagerStorage storage self,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) public view returns (uint256 votingPower) {
        if (!OperatorManagerLogic.isUnpaused(operatorManagerStorage, networkConfigStorage, operator)) {
            return 0;
        }
        uint48 currentEpochStartTs = NetworkConfigLogic.getCurrentEpochStartTs(networkConfigStorage);
        address[] memory sharedVaults = getSharedVaults(self);
        for (uint256 j; j < sharedVaults.length; ++j) {
            votingPower += _getVotingPower(self, networkConfigStorage, sharedVaults[j], operator, currentEpochStartTs);
        }
        address[] memory operatorVaults = getOperatorVaults(self, operator);
        for (uint256 j; j < operatorVaults.length; ++j) {
            votingPower += _getVotingPower(self, networkConfigStorage, operatorVaults[j], operator, currentEpochStartTs);
        }
        return votingPower;
    }

    function getVotingPowerWithVaults(
        VaultManager.VaultManagerStorage storage self,
        OperatorManager.OperatorManagerStorage storage operatorManagerStorage,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator
    ) public view returns (uint256 votingPower, address[] memory vaults, uint256[] memory votingPowers) {
        if (!OperatorManagerLogic.isUnpaused(operatorManagerStorage, networkConfigStorage, operator)) {
            return (0, new address[](0), new uint256[](0));
        }
        uint48 currentEpochStartTs = NetworkConfigLogic.getCurrentEpochStartTs(networkConfigStorage);
        uint256 length;
        address[] memory sharedVaults = getSharedVaults(self);
        address[] memory operatorVaults = getOperatorVaults(self, operator);
        vaults = new address[](sharedVaults.length + operatorVaults.length);
        votingPowers = new uint256[](sharedVaults.length + operatorVaults.length);
        for (uint256 j; j < sharedVaults.length; ++j) {
            uint256 votingPower_ =
                _getVotingPower(self, networkConfigStorage, sharedVaults[j], operator, currentEpochStartTs);
            if (votingPower_ > 0) {
                vaults[length] = sharedVaults[j];
                votingPowers[length++] = votingPower_;
                votingPower += votingPower_;
            }
        }
        for (uint256 j; j < operatorVaults.length; ++j) {
            uint256 votingPower_ =
                _getVotingPower(self, networkConfigStorage, operatorVaults[j], operator, currentEpochStartTs);
            if (votingPower_ > 0) {
                vaults[length] = operatorVaults[j];
                votingPowers[length++] = votingPower_;
                votingPower += votingPower_;
            }
        }

        assembly ("memory-safe") {
            mstore(vaults, length)
            mstore(votingPowers, length)
        }

        QuickSorts.sortVaultsWithVotingPowersAsc(vaults, votingPowers);
    }

    function getTokenPrice(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address token
    ) public view returns (uint208) {
        return self._tokenPrice[token].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getVaultWeight(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vault
    ) public view returns (uint208) {
        return self._vaultWeight[vault].get(NetworkConfigLogic.getCurrentEpoch(networkConfigStorage));
    }

    function getSharedVaults(
        VaultManager.VaultManagerStorage storage self
    ) public view returns (address[] memory) {
        return self._sharedVaults.values();
    }

    function getOperatorVaults(
        VaultManager.VaultManagerStorage storage self,
        address operator
    ) public view returns (address[] memory) {
        return self._operatorVaults[operator].values();
    }

    function initialize(
        VaultManager.VaultManagerStorage storage self,
        VaultManager.VaultManagerInitParams memory initParams
    ) public {}

    function addToken(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address token,
        uint208 price
    ) public {
        if (token == address(0)) {
            revert("Token cannot be the zero address");
        }
        if (price == 0) {
            revert("Price cannot be zero");
        }
        if (!self._tokens.add(token)) {
            revert("Failed to add token");
        }
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._tokenPrice[token].set(currentEpoch, currentEpoch + 1, price)) {
            revert("Failed to set token price");
        }
    }

    function updateTokenPrice(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address token,
        uint208 price
    ) public {
        if (!self._tokens.contains(token)) {
            revert("Token is not included");
        }
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._tokenPrice[token].set(currentEpoch, currentEpoch + 1, price)) {
            revert("Failed to set token price");
        }
    }

    function removeToken(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address token
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (self._tokenPrice[token].get(currentEpoch) != 0 || self._tokenPrice[token].get(currentEpoch + 1) != 0) {
            revert("Token price is not zero");
        }
        if (!self._tokens.remove(token)) {
            revert("Failed to remove token");
        }
        self._tokenPrice[token].clear();
    }

    function addSharedVault(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vaultFactory,
        address vault,
        uint208 weight
    ) public {
        _validateVault(self, networkConfigStorage, vaultFactory, vault);
        if (weight == 0) {
            revert("Weight cannot be zero");
        }
        if (!self._sharedVaults.add(vault)) {
            revert("Failed to add shared vault");
        }
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._vaultWeight[vault].set(currentEpoch, currentEpoch + 1, weight)) {
            revert("Failed to set vault weight");
        }
    }

    function addOperatorVault(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vaultFactory,
        address operator,
        address vault,
        uint208 weight
    ) public {
        _validateVault(self, networkConfigStorage, vaultFactory, vault);
        if (weight == 0) {
            revert("Weight cannot be zero");
        }
        if (!self._allOperatorVaults.add(vault)) {
            revert("Failed to add all operator vaults");
        }
        if (!self._operatorVaults[operator].add(vault)) {
            revert("Failed to add operator vault");
        }
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._vaultWeight[vault].set(currentEpoch, currentEpoch + 1, weight)) {
            revert("Failed to set vault weight");
        }
    }

    function updateVaultWeight(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vault,
        uint208 weight
    ) public {
        if (!self._sharedVaults.contains(vault) && !self._allOperatorVaults.contains(vault)) {
            revert("Vault is not registered");
        }
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (!self._vaultWeight[vault].set(currentEpoch, currentEpoch + 1, weight)) {
            revert("Failed to set vault weight");
        }
    }

    function removeSharedVault(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vault
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (self._vaultWeight[vault].get(currentEpoch) != 0 || self._vaultWeight[vault].get(currentEpoch + 1) != 0) {
            revert("Vault weight is not zero");
        }
        if (!self._sharedVaults.remove(vault)) {
            revert("Failed to remove shared vault");
        }
        self._vaultWeight[vault].clear();
    }

    function removeOperatorVault(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        address vault
    ) public {
        uint48 currentEpoch = NetworkConfigLogic.getCurrentEpoch(networkConfigStorage);
        if (self._vaultWeight[vault].get(currentEpoch) != 0 || self._vaultWeight[vault].get(currentEpoch + 1) != 0) {
            revert("Vault weight is not zero");
        }
        if (!self._operatorVaults[operator].remove(vault)) {
            revert("Failed to remove operator vault");
        }
        self._vaultWeight[vault].clear();
    }

    function requestSlash(
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address operator,
        address vault,
        uint256 amount,
        uint48 captureTimestamp,
        bytes memory hints
    ) public returns (bytes memory response) {
        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert("Vault is not slashing enabled");
        }

        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(SlasherType.INSTANT)) {
            response = abi.encode(
                ISlasher(slasher).slash(
                    NetworkConfigLogic.getSubnetwork(networkConfigStorage), operator, amount, captureTimestamp, hints
                )
            );
        } else if (slasherType == uint64(SlasherType.VETO)) {
            response = abi.encode(
                IVetoSlasher(slasher).requestSlash(
                    NetworkConfigLogic.getSubnetwork(networkConfigStorage), operator, amount, captureTimestamp, hints
                )
            );
        }
    }

    function executeSlash(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) public returns (bytes memory response) {
        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert("Vault is not slashing enabled");
        }

        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(SlasherType.VETO)) {
            response = abi.encode(IVetoSlasher(slasher).executeSlash(slashIndex, hints));
        } else {
            revert("Invalid slasher type");
        }
    }

    function _validateVault(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vaultFactory,
        address vault
    ) internal view {
        if (!IRegistry(vaultFactory).isEntity(vault)) {
            revert("Vault is not a valid vault");
        }

        if (!IVault(vault).isInitialized()) {
            revert("Vault is not initialized");
        }

        if (self._allOperatorVaults.contains(vault) || self._sharedVaults.contains(vault)) {
            revert("Vault is already registered");
        }

        uint48 vaultEpochDuration = IVault(vault).epochDuration();

        address slasher = IVault(vault).slasher();
        if (slasher != address(0)) {
            uint64 slasherType = IEntity(slasher).TYPE();
            if (slasherType == uint64(SlasherType.VETO)) {
                vaultEpochDuration -= IVetoSlasher(slasher).vetoDuration();
            } else if (slasherType > uint64(SlasherType.VETO)) {
                revert("Unknown slasher type");
            }
        }

        if (vaultEpochDuration <= NetworkConfigLogic.getEpochDuration(networkConfigStorage)) {
            revert("Vault epoch duration is too short");
        }
    }

    function _getVotingPower(
        VaultManager.VaultManagerStorage storage self,
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vault,
        address operator,
        uint48 captureTimestamp
    ) internal view returns (uint256) {
        return _getStake(networkConfigStorage, vault, operator, captureTimestamp)
            * getVaultWeight(self, networkConfigStorage, vault)
            * getTokenPrice(self, networkConfigStorage, IVault(vault).collateral());
    }

    function _getStake(
        NetworkConfig.NetworkConfigStorage storage networkConfigStorage,
        address vault,
        address operator,
        uint48 captureTimestamp
    ) internal view returns (uint256) {
        return IBaseDelegator(IVault(vault).delegator()).stakeAt(
            NetworkConfigLogic.getSubnetwork(networkConfigStorage), operator, captureTimestamp, new bytes(0)
        );
    }
}

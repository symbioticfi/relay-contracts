// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbioticfi/core/src/interfaces/common/IEntity.sol";
import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";
import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";
import {ISlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IOperatorSpecificDelegator} from "@symbioticfi/core/src/interfaces/delegator/IOperatorSpecificDelegator.sol";
import {IOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";

import {IStakerRewards} from "@symbioticfi/rewards/src/interfaces/stakerRewards/IStakerRewards.sol";
import {IDefaultOperatorRewards} from
    "@symbioticfi/rewards/src/interfaces/defaultOperatorRewards/IDefaultOperatorRewards.sol";

import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";
import {InputNormalizer} from "../../libraries/utils/InputNormalizer.sol";

import {NetworkManagerLogic} from "./NetworkManagerLogic.sol";
import {OperatorManagerLogic} from "./OperatorManagerLogic.sol";

import {IVaultManager} from "../../../interfaces/base/IVaultManager.sol";

library VaultManagerLogic {
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    using EnumerableMap for EnumerableMap.AddressToAddressMap;
    using EnumerableSet for EnumerableSet.AddressSet;
    using Subnetwork for address;
    using Subnetwork for bytes32;
    using Checkpoints for Checkpoints.Trace208;
    using PersistentSet for PersistentSet.AddressSet;
    using InputNormalizer for bytes[];

    uint64 internal constant VaultManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.VaultManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant VaultManagerStorageLocation =
        0x485f0695561726d087d0cb5cf546efed37ef61dfced21455f1ba7eb5e5b3db00;

    function _getVaultManagerStorage() internal pure returns (IVaultManager.VaultManagerStorage storage $) {
        assembly {
            $.slot := VaultManagerStorageLocation
        }
    }

    function initialize(
        IVaultManager.VaultManagerInitParams memory initParams
    ) public {
        _getVaultManagerStorage()._slashingWindow = initParams.slashingWindow;

        emit IVaultManager.InitSlashingWindow(initParams.slashingWindow);
    }

    function getSlashingWindow() public view returns (uint48) {
        return _getVaultManagerStorage()._slashingWindow;
    }

    function isTokenRegisteredAt(address token, uint48 timestamp, bytes memory hint) public view returns (bool) {
        return _getVaultManagerStorage()._tokens.containsAt(timestamp, token, hint);
    }

    function isTokenRegistered(
        address token
    ) public view returns (bool) {
        return _getVaultManagerStorage()._tokens.contains(token);
    }

    function getTokensAt(uint48 timestamp, bytes[] memory hints) public view returns (address[] memory) {
        return _getVaultManagerStorage()._tokens.valuesAt(timestamp, hints);
    }

    function getTokens() public view returns (address[] memory) {
        return _getVaultManagerStorage()._tokens.values();
    }

    function getTokensLength() public view returns (uint256) {
        return _getVaultManagerStorage()._tokens.length();
    }

    function isSharedVaultRegisteredAt(address vault, uint48 timestamp, bytes memory hint) public view returns (bool) {
        return _getVaultManagerStorage()._sharedVaults.containsAt(timestamp, vault, hint);
    }

    function isSharedVaultRegistered(
        address vault
    ) public view returns (bool) {
        return _getVaultManagerStorage()._sharedVaults.contains(vault);
    }

    function getSharedVaultsAt(uint48 timestamp, bytes[] memory hints) public view returns (address[] memory) {
        return _getVaultManagerStorage()._sharedVaults.valuesAt(timestamp, hints);
    }

    function getSharedVaults() public view returns (address[] memory) {
        return _getVaultManagerStorage()._sharedVaults.values();
    }

    function getSharedVaultsLength() public view returns (uint256) {
        return _getVaultManagerStorage()._sharedVaults.length();
    }

    function isOperatorVaultRegisteredAt(
        address operator,
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getVaultManagerStorage()._operatorVaults[operator].containsAt(timestamp, vault, hint);
    }

    function isOperatorVaultRegistered(address operator, address vault) public view returns (bool) {
        return _getVaultManagerStorage()._operatorVaults[operator].contains(vault);
    }

    function getOperatorVaultsAt(
        address operator,
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory) {
        return _getVaultManagerStorage()._operatorVaults[operator].valuesAt(timestamp, hints);
    }

    function getOperatorVaults(
        address operator
    ) public view returns (address[] memory) {
        return _getVaultManagerStorage()._operatorVaults[operator].values();
    }

    function getOperatorVaultsLength(
        address operator
    ) public view returns (uint256) {
        return _getVaultManagerStorage()._operatorVaults[operator].length();
    }

    function getOperatorStakeAt(
        address vault,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (uint256) {
        return IBaseDelegator(IVault(vault).delegator()).stakeAt(
            NetworkManagerLogic.SUBNETWORK(), operator, timestamp, hints
        );
    }

    function getOperatorStake(address vault, address operator) public view returns (uint256) {
        return IBaseDelegator(IVault(vault).delegator()).stake(NetworkManagerLogic.SUBNETWORK(), operator);
    }

    function getOperatorVotingPowerAt(
        function (address, uint256, bytes memory, uint48) external view returns (uint256) stakeToVotingPowerAt,
        address operator,
        address vault,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (uint256) {
        IVaultManager.OperatorVaultVotingPowerHints memory operatorVaultVotingPowerHints;
        if (hints.length > 0) {
            operatorVaultVotingPowerHints = abi.decode(hints, (IVaultManager.OperatorVaultVotingPowerHints));
        }

        if (
            !isTokenRegisteredAt(
                IVault(vault).collateral(), timestamp, operatorVaultVotingPowerHints.isTokenRegisteredHint
            )
        ) {
            return 0;
        }
        return stakeToVotingPowerAt(
            vault,
            getOperatorStakeAt(vault, operator, timestamp, operatorVaultVotingPowerHints.stakeHints),
            extraData,
            timestamp
        );
    }

    function getOperatorVotingPower(
        function (address, uint256, bytes memory) external view returns (uint256) stakeToVotingPower,
        address operator,
        address vault,
        bytes memory extraData
    ) public view returns (uint256) {
        if (!isTokenRegistered(IVault(vault).collateral())) {
            return 0;
        }
        return stakeToVotingPower(vault, getOperatorStake(vault, operator), extraData);
    }

    function getOperatorVotingPowerAt(
        function (address, uint256, bytes memory, uint48) external view returns (uint256) stakeToVotingPowerAt,
        address operator,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (uint256 votingPower) {
        IVaultManager.OperatorVotingPowersHints memory operatorVotingPowersHints;
        if (hints.length > 0) {
            operatorVotingPowersHints = abi.decode(hints, (IVaultManager.OperatorVotingPowersHints));
        }
        IVaultManager.OperatorVotingPowersExtraData memory operatorVotingPowersExtraData;
        if (extraData.length > 0) {
            operatorVotingPowersExtraData = abi.decode(extraData, (IVaultManager.OperatorVotingPowersExtraData));
        }

        address[] memory sharedVaults = getSharedVaultsAt(timestamp, operatorVotingPowersHints.sharedVaultsHints);
        operatorVotingPowersHints.sharedVaultsVotingPowerHints =
            operatorVotingPowersHints.sharedVaultsVotingPowerHints.normalize(sharedVaults.length);
        operatorVotingPowersExtraData.sharedVaultsExtraData =
            operatorVotingPowersExtraData.sharedVaultsExtraData.normalize(sharedVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            votingPower += getOperatorVotingPowerAt(
                stakeToVotingPowerAt,
                operator,
                sharedVaults[i],
                operatorVotingPowersExtraData.sharedVaultsExtraData[i],
                timestamp,
                operatorVotingPowersHints.sharedVaultsVotingPowerHints[i]
            );
        }
        address[] memory operatorVaults =
            getOperatorVaultsAt(operator, timestamp, operatorVotingPowersHints.operatorVaultsHints);
        operatorVotingPowersHints.operatorVaultsVotingPowerHints =
            operatorVotingPowersHints.operatorVaultsVotingPowerHints.normalize(operatorVaults.length);
        operatorVotingPowersExtraData.operatorVaultsExtraData =
            operatorVotingPowersExtraData.operatorVaultsExtraData.normalize(operatorVaults.length);
        for (uint256 i; i < operatorVaults.length; ++i) {
            votingPower += getOperatorVotingPowerAt(
                stakeToVotingPowerAt,
                operator,
                operatorVaults[i],
                operatorVotingPowersExtraData.operatorVaultsExtraData[i],
                timestamp,
                operatorVotingPowersHints.operatorVaultsVotingPowerHints[i]
            );
        }
    }

    function getOperatorVotingPower(
        function (address, uint256, bytes memory) external view returns (uint256) stakeToVotingPower,
        address operator,
        bytes memory extraData
    ) public view returns (uint256 votingPower) {
        IVaultManager.OperatorVotingPowersExtraData memory operatorVotingPowersExtraData;
        if (extraData.length > 0) {
            operatorVotingPowersExtraData = abi.decode(extraData, (IVaultManager.OperatorVotingPowersExtraData));
        }

        address[] memory sharedVaults = getSharedVaults();
        operatorVotingPowersExtraData.sharedVaultsExtraData =
            operatorVotingPowersExtraData.sharedVaultsExtraData.normalize(sharedVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            votingPower += getOperatorVotingPower(
                stakeToVotingPower, operator, sharedVaults[i], operatorVotingPowersExtraData.sharedVaultsExtraData[i]
            );
        }
        address[] memory operatorVaults = getOperatorVaults(operator);
        operatorVotingPowersExtraData.operatorVaultsExtraData =
            operatorVotingPowersExtraData.operatorVaultsExtraData.normalize(operatorVaults.length);
        for (uint256 i; i < operatorVaults.length; ++i) {
            votingPower += getOperatorVotingPower(
                stakeToVotingPower,
                operator,
                operatorVaults[i],
                operatorVotingPowersExtraData.operatorVaultsExtraData[i]
            );
        }
    }

    function getOperatorVotingPowersAt(
        function (address, uint256, bytes memory, uint48) external view returns (uint256) stakeToVotingPowerAt,
        address operator,
        bytes memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IVaultManager.VaultVotingPower[] memory vaultVotingPowers) {
        IVaultManager.OperatorVotingPowersHints memory operatorVotingPowersHints;
        if (hints.length > 0) {
            operatorVotingPowersHints = abi.decode(hints, (IVaultManager.OperatorVotingPowersHints));
        }
        IVaultManager.OperatorVotingPowersExtraData memory operatorVotingPowersExtraData;
        if (extraData.length > 0) {
            operatorVotingPowersExtraData = abi.decode(extraData, (IVaultManager.OperatorVotingPowersExtraData));
        }

        uint256 length;
        address[] memory sharedVaults = getSharedVaultsAt(timestamp, operatorVotingPowersHints.sharedVaultsHints);
        address[] memory operatorVaults =
            getOperatorVaultsAt(operator, timestamp, operatorVotingPowersHints.operatorVaultsHints);
        vaultVotingPowers = new IVaultManager.VaultVotingPower[](sharedVaults.length + operatorVaults.length);
        operatorVotingPowersHints.sharedVaultsVotingPowerHints =
            operatorVotingPowersHints.sharedVaultsVotingPowerHints.normalize(sharedVaults.length);
        operatorVotingPowersExtraData.sharedVaultsExtraData =
            operatorVotingPowersExtraData.sharedVaultsExtraData.normalize(sharedVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPowerAt(
                stakeToVotingPowerAt,
                operator,
                sharedVaults[i],
                operatorVotingPowersExtraData.sharedVaultsExtraData[i],
                timestamp,
                operatorVotingPowersHints.sharedVaultsVotingPowerHints[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: sharedVaults[i], votingPower: votingPower_});
            }
        }
        operatorVotingPowersHints.operatorVaultsVotingPowerHints =
            operatorVotingPowersHints.operatorVaultsVotingPowerHints.normalize(operatorVaults.length);
        operatorVotingPowersExtraData.operatorVaultsExtraData =
            operatorVotingPowersExtraData.operatorVaultsExtraData.normalize(operatorVaults.length);
        for (uint256 i; i < operatorVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPowerAt(
                stakeToVotingPowerAt,
                operator,
                operatorVaults[i],
                operatorVotingPowersExtraData.operatorVaultsExtraData[i],
                timestamp,
                operatorVotingPowersHints.operatorVaultsVotingPowerHints[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: operatorVaults[i], votingPower: votingPower_});
            }
        }

        assembly ("memory-safe") {
            mstore(vaultVotingPowers, length)
        }
    }

    function getOperatorVotingPowers(
        function (address, uint256, bytes memory) external view returns (uint256) stakeToVotingPower,
        address operator,
        bytes memory extraData
    ) public view returns (IVaultManager.VaultVotingPower[] memory vaultVotingPowers) {
        IVaultManager.OperatorVotingPowersExtraData memory operatorVotingPowersExtraData;
        if (extraData.length > 0) {
            operatorVotingPowersExtraData = abi.decode(extraData, (IVaultManager.OperatorVotingPowersExtraData));
        }

        uint256 length;
        address[] memory sharedVaults = getSharedVaults();
        address[] memory operatorVaults = getOperatorVaults(operator);
        vaultVotingPowers = new IVaultManager.VaultVotingPower[](sharedVaults.length + operatorVaults.length);
        operatorVotingPowersExtraData.sharedVaultsExtraData =
            operatorVotingPowersExtraData.sharedVaultsExtraData.normalize(sharedVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPower(
                stakeToVotingPower, operator, sharedVaults[i], operatorVotingPowersExtraData.sharedVaultsExtraData[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: sharedVaults[i], votingPower: votingPower_});
            }
        }
        operatorVotingPowersExtraData.operatorVaultsExtraData =
            operatorVotingPowersExtraData.operatorVaultsExtraData.normalize(operatorVaults.length);
        for (uint256 i; i < operatorVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPower(
                stakeToVotingPower,
                operator,
                operatorVaults[i],
                operatorVotingPowersExtraData.operatorVaultsExtraData[i]
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: operatorVaults[i], votingPower: votingPower_});
            }
        }

        assembly ("memory-safe") {
            mstore(vaultVotingPowers, length)
        }
    }

    function getTotalVotingPowerAt(
        function (address, uint256, bytes memory, uint48) external view returns (uint256) stakeToVotingPowerAt,
        bytes[] memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (uint256 votingPower) {
        IVaultManager.VotingPowersHints memory votingPowersHints;
        if (hints.length > 0) {
            votingPowersHints = abi.decode(hints, (IVaultManager.VotingPowersHints));
        }

        address[] memory operators = OperatorManagerLogic.getOperatorsAt(timestamp, votingPowersHints.operatorsHints);
        votingPowersHints.operatorVotingPowersHints =
            votingPowersHints.operatorVotingPowersHints.normalize(operators.length);
        extraData = extraData.normalize(operators.length);
        for (uint256 i; i < operators.length; ++i) {
            votingPower += getOperatorVotingPowerAt(
                stakeToVotingPowerAt,
                operators[i],
                extraData[i],
                timestamp,
                votingPowersHints.operatorVotingPowersHints[i]
            );
        }
    }

    function getTotalVotingPower(
        function (address, uint256, bytes memory) external view returns (uint256) stakeToVotingPower,
        bytes[] memory extraData
    ) public view returns (uint256 votingPower) {
        address[] memory operators = OperatorManagerLogic.getOperators();
        extraData = extraData.normalize(operators.length);
        for (uint256 i; i < operators.length; ++i) {
            votingPower += getOperatorVotingPower(stakeToVotingPower, operators[i], extraData[i]);
        }
    }

    function getVotingPowersAt(
        function (address, uint256, bytes memory, uint48) external view returns (uint256) stakeToVotingPowerAt,
        bytes[] memory extraData,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IVaultManager.OperatorVotingPower[] memory operatorVotingPowers) {
        IVaultManager.VotingPowersHints memory votingPowersHints;
        if (hints.length > 0) {
            votingPowersHints = abi.decode(hints, (IVaultManager.VotingPowersHints));
        }

        uint256 length;
        address[] memory operators = OperatorManagerLogic.getOperatorsAt(timestamp, votingPowersHints.operatorsHints);
        operatorVotingPowers = new IVaultManager.OperatorVotingPower[](operators.length);
        votingPowersHints.operatorVotingPowersHints =
            votingPowersHints.operatorVotingPowersHints.normalize(operators.length);
        extraData = extraData.normalize(operators.length);
        for (uint256 i; i < operators.length; ++i) {
            IVaultManager.VaultVotingPower[] memory votingPowers = getOperatorVotingPowersAt(
                stakeToVotingPowerAt,
                operators[i],
                extraData[i],
                timestamp,
                votingPowersHints.operatorVotingPowersHints[i]
            );
            if (votingPowers.length > 0) {
                operatorVotingPowers[length++] =
                    IVaultManager.OperatorVotingPower({operator: operators[i], vaults: votingPowers});
            }
        }
        assembly ("memory-safe") {
            mstore(operatorVotingPowers, length)
        }
    }

    function getVotingPowers(
        function (address, uint256, bytes memory) external view returns (uint256) stakeToVotingPower,
        bytes[] memory extraData
    ) public view returns (IVaultManager.OperatorVotingPower[] memory operatorVotingPowers) {
        uint256 length;
        address[] memory operators = OperatorManagerLogic.getOperators();
        operatorVotingPowers = new IVaultManager.OperatorVotingPower[](operators.length);
        extraData = extraData.normalize(operators.length);
        for (uint256 i; i < operators.length; ++i) {
            IVaultManager.VaultVotingPower[] memory votingPowers =
                getOperatorVotingPowers(stakeToVotingPower, operators[i], extraData[i]);
            if (votingPowers.length > 0) {
                operatorVotingPowers[length++] =
                    IVaultManager.OperatorVotingPower({operator: operators[i], vaults: votingPowers});
            }
        }
        assembly ("memory-safe") {
            mstore(operatorVotingPowers, length)
        }
    }

    function setSlashingWindow(
        uint48 slashingWindow
    ) public {
        if (slashingWindow >= getSlashingWindow()) {
            revert IVaultManager.VaultManager_SlashingWindowTooLarge();
        }
        _getVaultManagerStorage()._slashingWindow = slashingWindow;

        emit IVaultManager.SetSlashingWindow(slashingWindow);
    }

    function registerToken(
        address token
    ) public {
        if (token == address(0)) {
            revert IVaultManager.VaultManager_InvalidToken();
        }
        if (!_getVaultManagerStorage()._tokens.add(Time.timestamp(), token)) {
            revert IVaultManager.VaultManager_TokenAlreadyIsRegistered();
        }

        emit IVaultManager.RegisterToken(token);
    }

    function unregisterToken(
        address token
    ) public {
        if (!_getVaultManagerStorage()._tokens.remove(Time.timestamp(), token)) {
            revert IVaultManager.VaultManager_TokenNotRegistered();
        }

        emit IVaultManager.UnregisterToken(token);
    }

    function registerSharedVault(address VAULT_FACTORY, address vault) public {
        IVaultManager.VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(VAULT_FACTORY, vault)) {
            revert IVaultManager.VaultManager_InvalidVault();
        }
        if (!_validateSharedVault(vault)) {
            revert IVaultManager.VaultManager_InvalidSharedVault();
        }
        if ($._allOperatorVaults.contains(vault)) {
            revert IVaultManager.VaultManager_OperatorVaultAlreadyIsRegistered();
        }
        if (!$._sharedVaults.add(Time.timestamp(), vault)) {
            revert IVaultManager.VaultManager_SharedVaultAlreadyIsRegistered();
        }

        emit IVaultManager.RegisterSharedVault(vault);
    }

    function registerOperatorVault(address VAULT_FACTORY, address operator, address vault) public {
        IVaultManager.VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(VAULT_FACTORY, vault)) {
            revert IVaultManager.VaultManager_InvalidVault();
        }
        if (!_validateOperatorVault(operator, vault)) {
            revert IVaultManager.VaultManager_InvalidOperatorVault();
        }
        if (!OperatorManagerLogic.isOperatorRegistered(operator)) {
            revert IVaultManager.VaultManager_OperatorNotRegistered();
        }
        if ($._sharedVaults.contains(vault)) {
            revert IVaultManager.VaultManager_SharedVaultAlreadyIsRegistered();
        }
        if (!$._allOperatorVaults.add(Time.timestamp(), vault)) {
            revert IVaultManager.VaultManager_OperatorVaultAlreadyIsRegistered();
        }
        $._operatorVaults[operator].add(Time.timestamp(), vault);

        emit IVaultManager.RegisterOperatorVault(operator, vault);
    }

    function unregisterSharedVault(
        address vault
    ) public {
        if (!_getVaultManagerStorage()._sharedVaults.remove(Time.timestamp(), vault)) {
            revert IVaultManager.VaultManager_SharedVaultNotRegistered();
        }

        emit IVaultManager.UnregisterSharedVault(vault);
    }

    function unregisterOperatorVault(address operator, address vault) public {
        IVaultManager.VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!$._operatorVaults[operator].remove(Time.timestamp(), vault)) {
            revert IVaultManager.VaultManager_OperatorVaultNotRegistered();
        }
        $._allOperatorVaults.remove(Time.timestamp(), vault);

        emit IVaultManager.UnregisterOperatorVault(operator, vault);
    }

    function slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) public returns (bool success, bytes memory response) {
        IVaultManager.SlashVaultHints memory slashVaultHints;
        if (hints.length > 0) {
            slashVaultHints = abi.decode(hints, (IVaultManager.SlashVaultHints));
        }

        if (!OperatorManagerLogic.isOperatorRegisteredAt(operator, timestamp, slashVaultHints.operatorRegisteredHint)) {
            revert IVaultManager.VaultManager_UnregisteredOperatorSlash();
        }

        if (
            !isOperatorVaultRegisteredAt(operator, vault, timestamp, slashVaultHints.operatorVaultRegisteredHint)
                && !isSharedVaultRegisteredAt(vault, timestamp, slashVaultHints.sharedVaultRegisteredHint)
        ) {
            revert IVaultManager.VaultManager_UnregisteredVaultSlash();
        }

        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert IVaultManager.VaultManager_NoSlasher();
        }

        return slash(timestamp, slasher, operator, amount, slashVaultHints.slashHints);
    }

    function slash(
        uint48 timestamp,
        address slasher,
        address operator,
        uint256 amount,
        bytes memory hints
    ) public returns (bool success, bytes memory response) {
        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(IVaultManager.SlasherType.INSTANT)) {
            (success, response) = slasher.call(
                abi.encodeCall(ISlasher.slash, (NetworkManagerLogic.SUBNETWORK(), operator, amount, timestamp, hints))
            );
            emit IVaultManager.InstantSlash(slasher, operator, success, success ? abi.decode(response, (uint256)) : 0);
        } else if (slasherType == uint64(IVaultManager.SlasherType.VETO)) {
            (success, response) = slasher.call(
                abi.encodeCall(
                    IVetoSlasher.requestSlash, (NetworkManagerLogic.SUBNETWORK(), operator, amount, timestamp, hints)
                )
            );
            emit IVaultManager.VetoSlash(slasher, operator, success, success ? abi.decode(response, (uint256)) : 0);
        } else {
            revert IVaultManager.VaultManager_UnknownSlasherType();
        }
    }

    function executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) public returns (bool success, uint256 slashedAmount) {
        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert IVaultManager.VaultManager_NoSlasher();
        }

        return executeSlash(slasher, slashIndex, hints);
    }

    function executeSlash(
        address slasher,
        uint256 slashIndex,
        bytes memory hints
    ) public returns (bool success, uint256 slashedAmount) {
        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(IVaultManager.SlasherType.VETO)) {
            bytes memory response;
            (success, response) = slasher.call(abi.encodeCall(IVetoSlasher.executeSlash, (slashIndex, hints)));
            slashedAmount = success ? abi.decode(response, (uint256)) : 0;
            emit IVaultManager.ExecuteSlash(slasher, slashIndex, success, slashedAmount);
        } else {
            revert IVaultManager.VaultManager_NonVetoSlasher();
        }
    }

    function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes memory data) public {
        IStakerRewards(stakerRewards).distributeRewards(NetworkManagerLogic.NETWORK(), token, amount, data);
        emit IVaultManager.DistributeStakerRewards(stakerRewards, token, amount, data);
    }

    function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) public {
        IDefaultOperatorRewards(operatorRewards).distributeRewards(NetworkManagerLogic.NETWORK(), token, amount, root);
        emit IVaultManager.DistributeOperatorRewards(operatorRewards, token, amount, root);
    }

    function _validateVault(address VAULT_FACTORY, address vault) public view returns (bool) {
        if (!IRegistry(VAULT_FACTORY).isEntity(vault)) {
            return false;
        }

        if (!IVault(vault).isInitialized()) {
            return false;
        }

        if (!_validateVaultEpochDuration(vault)) {
            return false;
        }

        if (!isTokenRegistered(IVault(vault).collateral())) {
            return false;
        }

        return true;
    }

    function _validateSharedVault(
        address vault
    ) public view returns (bool) {
        address delegator = IVault(vault).delegator();
        uint64 delegatorType = IEntity(delegator).TYPE();
        if (
            (
                delegatorType != uint64(IVaultManager.DelegatorType.FULL_RESTAKE)
                    && delegatorType != uint64(IVaultManager.DelegatorType.NETWORK_RESTAKE)
            )
        ) {
            return false;
        }

        return true;
    }

    function _validateOperatorVault(address operator, address vault) public view returns (bool) {
        address delegator = IVault(vault).delegator();
        uint64 delegatorType = IEntity(delegator).TYPE();
        if (
            (
                delegatorType != uint64(IVaultManager.DelegatorType.OPERATOR_SPECIFIC)
                    && delegatorType != uint64(IVaultManager.DelegatorType.OPERATOR_NETWORK_SPECIFIC)
            ) || IOperatorSpecificDelegator(delegator).operator() != operator
        ) {
            return false;
        }

        if (
            delegatorType == uint64(IVaultManager.DelegatorType.OPERATOR_NETWORK_SPECIFIC)
                && IOperatorNetworkSpecificDelegator(delegator).network() != NetworkManagerLogic.NETWORK()
        ) {
            return false;
        }

        return true;
    }

    function _validateVaultEpochDuration(
        address vault
    ) public view returns (bool) {
        uint48 vaultEpochDuration = IVault(vault).epochDuration();
        uint48 slashingWindow = getSlashingWindow();
        address slasher = IVault(vault).slasher();

        if (slasher != address(0)) {
            uint64 slasherType = IEntity(slasher).TYPE();
            if (slasherType == uint64(IVaultManager.SlasherType.VETO)) {
                vaultEpochDuration -= IVetoSlasher(slasher).vetoDuration();
            } else if (slasherType > uint64(IVaultManager.SlasherType.VETO)) {
                return false;
            }

            return slashingWindow <= vaultEpochDuration;
        } else if (slashingWindow > 0) {
            return false;
        }

        return true;
    }
}

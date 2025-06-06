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

import {IVaultManager} from "../../../interfaces/base/IVaultManager.sol";
import {IVotingPowerCalcManager} from "../../../interfaces/base/IVotingPowerCalcManager.sol";
import {INetworkManager} from "../../../interfaces/base/INetworkManager.sol";

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
        emit IVaultManager.SetSlashingWindow(initParams.slashingWindow);
        if (initParams.token != address(0)) {
            registerToken(initParams.token);
        }
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

    function getTokensAt(
        uint48 timestamp
    ) public view returns (address[] memory) {
        return _getVaultManagerStorage()._tokens.valuesAt(timestamp);
    }

    function getTokens() public view returns (address[] memory) {
        return _getVaultManagerStorage()._tokens.values();
    }

    function getTokensLength() public view returns (uint256) {
        return _getVaultManagerStorage()._tokens.length();
    }

    function isOperatorRegisteredAt(address operator, uint48 timestamp, bytes memory hint) public view returns (bool) {
        return _getVaultManagerStorage()._operators.containsAt(timestamp, operator, hint);
    }

    function isOperatorRegistered(
        address operator
    ) public view returns (bool) {
        return _getVaultManagerStorage()._operators.contains(operator);
    }

    function getOperatorsAt(
        uint48 timestamp
    ) public view returns (address[] memory) {
        return _getVaultManagerStorage()._operators.valuesAt(timestamp);
    }

    function getOperators() public view returns (address[] memory) {
        return _getVaultManagerStorage()._operators.values();
    }

    function getOperatorsLength() public view returns (uint256) {
        return _getVaultManagerStorage()._operators.length();
    }

    function isSharedVaultRegisteredAt(address vault, uint48 timestamp, bytes memory hint) public view returns (bool) {
        return _getVaultManagerStorage()._sharedVaults.containsAt(timestamp, vault, hint);
    }

    function isSharedVaultRegistered(
        address vault
    ) public view returns (bool) {
        return _getVaultManagerStorage()._sharedVaults.contains(vault);
    }

    function getSharedVaultsAt(
        uint48 timestamp
    ) public view returns (address[] memory) {
        return _getVaultManagerStorage()._sharedVaults.valuesAt(timestamp);
    }

    function getSharedVaults() public view returns (address[] memory) {
        return _getVaultManagerStorage()._sharedVaults.values();
    }

    function getSharedVaultsLength() public view returns (uint256) {
        return _getVaultManagerStorage()._sharedVaults.length();
    }

    function isOperatorVaultRegisteredAt(
        address vault,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bool) {
        return _getVaultManagerStorage()._allOperatorVaults.containsAt(timestamp, vault, hint);
    }

    function isOperatorVaultRegistered(
        address vault
    ) public view returns (bool) {
        return _getVaultManagerStorage()._allOperatorVaults.contains(vault);
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

    function getOperatorVaultsAt(address operator, uint48 timestamp) public view returns (address[] memory) {
        return _getVaultManagerStorage()._operatorVaults[operator].valuesAt(timestamp);
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
            INetworkManager(address(this)).SUBNETWORK(), operator, timestamp, hints
        );
    }

    function getOperatorStake(address vault, address operator) public view returns (uint256) {
        return IBaseDelegator(IVault(vault).delegator()).stake(INetworkManager(address(this)).SUBNETWORK(), operator);
    }

    function getOperatorVotingPowerAt(
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
        return IVotingPowerCalcManager(address(this)).stakeToVotingPowerAt(
            vault,
            getOperatorStakeAt(vault, operator, timestamp, operatorVaultVotingPowerHints.stakeHints),
            extraData,
            timestamp
        );
    }

    function getOperatorVotingPower(
        address operator,
        address vault,
        bytes memory extraData
    ) public view returns (uint256) {
        if (!isTokenRegistered(IVault(vault).collateral())) {
            return 0;
        }
        return IVotingPowerCalcManager(address(this)).stakeToVotingPower(
            vault, getOperatorStake(vault, operator), extraData
        );
    }

    function getOperatorVotingPowersAt(
        address operator,
        bytes memory extraData,
        uint48 timestamp
    ) public view returns (IVaultManager.VaultVotingPower[] memory vaultVotingPowers) {
        IVaultManager.OperatorVotingPowersExtraData memory operatorVotingPowersExtraData;
        if (extraData.length > 0) {
            operatorVotingPowersExtraData = abi.decode(extraData, (IVaultManager.OperatorVotingPowersExtraData));
        }

        uint256 length;
        address[] memory sharedVaults = getSharedVaultsAt(timestamp);
        address[] memory operatorVaults = getOperatorVaultsAt(operator, timestamp);
        vaultVotingPowers = new IVaultManager.VaultVotingPower[](sharedVaults.length + operatorVaults.length);
        operatorVotingPowersExtraData.sharedVaultsExtraData =
            operatorVotingPowersExtraData.sharedVaultsExtraData.normalize(sharedVaults.length);
        for (uint256 i; i < sharedVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPowerAt(
                operator,
                sharedVaults[i],
                operatorVotingPowersExtraData.sharedVaultsExtraData[i],
                timestamp,
                new bytes(0)
            );
            if (votingPower_ > 0) {
                vaultVotingPowers[length++] =
                    IVaultManager.VaultVotingPower({vault: sharedVaults[i], votingPower: votingPower_});
            }
        }
        operatorVotingPowersExtraData.operatorVaultsExtraData =
            operatorVotingPowersExtraData.operatorVaultsExtraData.normalize(operatorVaults.length);
        for (uint256 i; i < operatorVaults.length; ++i) {
            uint256 votingPower_ = getOperatorVotingPowerAt(
                operator,
                operatorVaults[i],
                operatorVotingPowersExtraData.operatorVaultsExtraData[i],
                timestamp,
                new bytes(0)
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
                operator, sharedVaults[i], operatorVotingPowersExtraData.sharedVaultsExtraData[i]
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
                operator, operatorVaults[i], operatorVotingPowersExtraData.operatorVaultsExtraData[i]
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

    function getVotingPowersAt(
        bytes[] memory extraData,
        uint48 timestamp
    ) public view returns (IVaultManager.OperatorVotingPower[] memory operatorVotingPowers) {
        uint256 length;
        address[] memory operators = getOperatorsAt(timestamp);
        operatorVotingPowers = new IVaultManager.OperatorVotingPower[](operators.length);
        extraData = extraData.normalize(operators.length);
        for (uint256 i; i < operators.length; ++i) {
            IVaultManager.VaultVotingPower[] memory votingPowers =
                getOperatorVotingPowersAt(operators[i], extraData[i], timestamp);
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
        bytes[] memory extraData
    ) public view returns (IVaultManager.OperatorVotingPower[] memory operatorVotingPowers) {
        uint256 length;
        address[] memory operators = getOperators();
        operatorVotingPowers = new IVaultManager.OperatorVotingPower[](operators.length);
        extraData = extraData.normalize(operators.length);
        for (uint256 i; i < operators.length; ++i) {
            IVaultManager.VaultVotingPower[] memory votingPowers = getOperatorVotingPowers(operators[i], extraData[i]);
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

    function registerOperator(
        address operator
    ) public {
        if (!_validateOperator(operator)) {
            revert IVaultManager.VaultManager_InvalidOperator();
        }

        if (!_getVaultManagerStorage()._operators.add(Time.timestamp(), operator)) {
            revert IVaultManager.VaultManager_OperatorAlreadyRegistered();
        }

        emit IVaultManager.RegisterOperator(operator);
    }

    function unregisterOperator(
        address operator
    ) public {
        if (!_getVaultManagerStorage()._operators.remove(Time.timestamp(), operator)) {
            revert IVaultManager.VaultManager_OperatorNotRegistered();
        }

        emit IVaultManager.UnregisterOperator(operator);
    }

    function registerSharedVault(
        address vault
    ) public {
        IVaultManager.VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(vault)) {
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

    function registerOperatorVault(address operator, address vault) public {
        IVaultManager.VaultManagerStorage storage $ = _getVaultManagerStorage();
        if (!_validateVault(vault)) {
            revert IVaultManager.VaultManager_InvalidVault();
        }
        if (!_validateOperatorVault(operator, vault)) {
            revert IVaultManager.VaultManager_InvalidOperatorVault();
        }
        if (!isOperatorRegistered(operator)) {
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

    function _validateOperator(
        address operator
    ) public view returns (bool) {
        if (!IRegistry(IVaultManager(address(this)).OPERATOR_REGISTRY()).isEntity(operator)) {
            return false;
        }
        return true;
    }

    function _validateVault(
        address vault
    ) public view returns (bool) {
        if (!IRegistry(IVaultManager(address(this)).VAULT_FACTORY()).isEntity(vault)) {
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
                && IOperatorNetworkSpecificDelegator(delegator).network() != INetworkManager(address(this)).NETWORK()
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

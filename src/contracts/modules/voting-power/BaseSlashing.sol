// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IVault} from "@symbioticfi/core/src/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbioticfi/core/src/interfaces/delegator/IBaseDelegator.sol";
import {IRegistry} from "@symbioticfi/core/src/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbioticfi/core/src/interfaces/common/IEntity.sol";
import {IVetoSlasher} from "@symbioticfi/core/src/interfaces/slasher/IVetoSlasher.sol";
import {Subnetwork} from "@symbioticfi/core/src/contracts/libraries/Subnetwork.sol";
import {ISlasher as IInstantSlasher} from "@symbioticfi/core/src/interfaces/slasher/ISlasher.sol";
import {IOperatorSpecificDelegator} from "@symbioticfi/core/src/interfaces/delegator/IOperatorSpecificDelegator.sol";
import {IOperatorNetworkSpecificDelegator} from
    "@symbioticfi/core/src/interfaces/delegator/IOperatorNetworkSpecificDelegator.sol";

import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";

import {IBaseSlashing} from "../../../interfaces/modules/voting-power/IBaseSlashing.sol";
import {VotingPowerProvider} from "./VotingPowerProvider.sol";

abstract contract BaseSlashing is VotingPowerProvider, IBaseSlashing {
    /**
     * @inheritdoc IBaseSlashing
     */
    uint64 public constant BaseSlashing_VERSION = 1;

    modifier onlySlasher() {
        if (msg.sender != getSlasher()) {
            revert BaseSlashing_NotSlasher();
        }
        _;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.BaseSlashing")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BaseSlashingStorageLocation =
        0xcd08f9337bf45f7ebac10e65ed25c2483d3efb012be3dbf2b4de227af3bf9400;

    function _getBaseSlashingStorage() internal pure returns (IBaseSlashing.BaseSlashingStorage storage $) {
        bytes32 location = BaseSlashingStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __BaseSlashing_init(
        BaseSlashingInitParams memory initParams
    ) internal virtual onlyInitializing {
        _setSlasher(initParams.slasher);
    }

    /**
     * @inheritdoc IBaseSlashing
     */
    function getSlasher() public view virtual returns (address) {
        return _getBaseSlashingStorage()._slasher;
    }

    /**
     * @inheritdoc IBaseSlashing
     */
    function setSlasher(
        address slasher
    ) public virtual checkPermission {
        _setSlasher(slasher);
    }

    function slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) public virtual onlySlasher returns (bool success, bytes memory response) {
        return _slashVault(timestamp, vault, operator, amount, hints);
    }

    function executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) public virtual onlySlasher returns (bool success, uint256 slashedAmount) {
        return _executeSlashVault(vault, slashIndex, hints);
    }

    function _setSlasher(
        address slasher
    ) internal virtual {
        _getBaseSlashingStorage()._slasher = slasher;
        emit SetSlasher(slasher);
    }

    function _slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal virtual returns (bool success, bytes memory response) {
        SlashVaultHints memory slashVaultHints;
        if (hints.length > 0) {
            slashVaultHints = abi.decode(hints, (SlashVaultHints));
        }

        if (!isOperatorRegisteredAt(operator, timestamp, slashVaultHints.operatorRegisteredHint)) {
            revert BaseSlashing_UnregisteredOperatorSlash();
        }

        if (
            !isOperatorVaultRegisteredAt(operator, vault, timestamp, slashVaultHints.operatorVaultRegisteredHint)
                && !isSharedVaultRegisteredAt(vault, timestamp, slashVaultHints.sharedVaultRegisteredHint)
        ) {
            revert BaseSlashing_UnregisteredVaultSlash();
        }

        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert BaseSlashing_NoSlasher();
        }

        return _slash(timestamp, slasher, operator, amount, slashVaultHints.slashHints);
    }

    function _slash(
        uint48 timestamp,
        address slasher,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal virtual returns (bool success, bytes memory response) {
        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(SlasherType.INSTANT)) {
            (success, response) =
                slasher.call(abi.encodeCall(IInstantSlasher.slash, (SUBNETWORK(), operator, amount, timestamp, hints)));
            emit InstantSlash(slasher, operator, success, success ? abi.decode(response, (uint256)) : 0);
        } else if (slasherType == uint64(SlasherType.VETO)) {
            (success, response) = slasher.call(
                abi.encodeCall(IVetoSlasher.requestSlash, (SUBNETWORK(), operator, amount, timestamp, hints))
            );
            emit VetoSlash(slasher, operator, success, success ? abi.decode(response, (uint256)) : 0);
        } else {
            revert BaseSlashing_UnknownSlasherType();
        }
    }

    function _executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) internal virtual returns (bool success, uint256 slashedAmount) {
        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert BaseSlashing_NoSlasher();
        }

        return _executeSlash(slasher, slashIndex, hints);
    }

    function _executeSlash(
        address slasher,
        uint256 slashIndex,
        bytes memory hints
    ) internal virtual returns (bool success, uint256 slashedAmount) {
        uint64 slasherType = IEntity(slasher).TYPE();
        if (slasherType == uint64(SlasherType.VETO)) {
            bytes memory response;
            (success, response) = slasher.call(abi.encodeCall(IVetoSlasher.executeSlash, (slashIndex, hints)));
            slashedAmount = success ? abi.decode(response, (uint256)) : 0;
            emit ExecuteSlash(slasher, slashIndex, success, slashedAmount);
        } else {
            revert BaseSlashing_NonVetoSlasher();
        }
    }
}

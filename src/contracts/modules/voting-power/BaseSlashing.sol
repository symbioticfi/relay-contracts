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
import {BaseSlashingLogic} from "./logic/BaseSlashingLogic.sol";

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
        return BaseSlashingLogic.slashVault(timestamp, vault, operator, amount, hints);
    }

    function executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) public virtual onlySlasher returns (bool success, uint256 slashedAmount) {
        return BaseSlashingLogic.executeSlashVault(vault, slashIndex, hints);
    }

    function _setSlasher(
        address slasher
    ) internal virtual {
        if (slasher == address(0)) {
            revert BaseSlashing_InvalidSlasher();
        }
        _getBaseSlashingStorage()._slasher = slasher;
        emit SetSlasher(slasher);
    }
}

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

import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {VotingPowerCalcManager} from "./VotingPowerCalcManager.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {MiddlewareBindingsLogic} from "./logic/MiddlewareBindingsLogic.sol";

import {IMiddlewareBindings} from "../../interfaces/base/IMiddlewareBindings.sol";
import {VaultManager} from "./VaultManager.sol";

abstract contract MiddlewareBindings is VaultManager, IMiddlewareBindings {
    /**
     * @inheritdoc IMiddlewareBindings
     */
    function MiddlewareBindings_VERSION() public pure returns (uint64) {
        return MiddlewareBindingsLogic.MiddlewareBindings_VERSION;
    }

    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function __MiddlewareBindings_init() internal virtual onlyInitializing {}

    function _slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal virtual returns (bool success, bytes memory response) {
        return MiddlewareBindingsLogic.slashVault(timestamp, vault, operator, amount, hints);
    }

    function _slash(
        uint48 timestamp,
        address slasher,
        address operator,
        uint256 amount,
        bytes memory hints
    ) internal virtual returns (bool success, bytes memory response) {
        return MiddlewareBindingsLogic.slash(timestamp, slasher, operator, amount, hints);
    }

    function _executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) internal virtual returns (bool success, uint256 slashedAmount) {
        return MiddlewareBindingsLogic.executeSlashVault(vault, slashIndex, hints);
    }

    function _executeSlash(
        address slasher,
        uint256 slashIndex,
        bytes memory hints
    ) internal virtual returns (bool success, uint256 slashedAmount) {
        return MiddlewareBindingsLogic.executeSlash(slasher, slashIndex, hints);
    }

    function _distributeStakerRewards(
        address stakerRewards,
        address token,
        uint256 amount,
        bytes memory data
    ) internal virtual {
        MiddlewareBindingsLogic.distributeStakerRewards(stakerRewards, token, amount, data);
    }

    function _distributeOperatorRewards(
        address operatorRewards,
        address token,
        uint256 amount,
        bytes32 root
    ) internal virtual {
        MiddlewareBindingsLogic.distributeOperatorRewards(operatorRewards, token, amount, root);
    }
}

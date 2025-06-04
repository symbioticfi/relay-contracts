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
import {VaultManagerLogic} from "./VaultManagerLogic.sol";

import {IVaultManager} from "../../../interfaces/base/IVaultManager.sol";
import {IMiddlewareBindings} from "../../../interfaces/base/IMiddlewareBindings.sol";

library MiddlewareBindingsLogic {
    uint64 internal constant MiddlewareBindings_VERSION = 1;

    function initialize() public {}

    function slashVault(
        uint48 timestamp,
        address vault,
        address operator,
        uint256 amount,
        bytes memory hints
    ) public returns (bool success, bytes memory response) {
        IMiddlewareBindings.SlashVaultHints memory slashVaultHints;
        if (hints.length > 0) {
            slashVaultHints = abi.decode(hints, (IMiddlewareBindings.SlashVaultHints));
        }

        if (!VaultManagerLogic.isOperatorRegisteredAt(operator, timestamp, slashVaultHints.operatorRegisteredHint)) {
            revert IMiddlewareBindings.MiddlewareBindings_UnregisteredOperatorSlash();
        }

        if (
            !VaultManagerLogic.isOperatorVaultRegisteredAt(
                operator, vault, timestamp, slashVaultHints.operatorVaultRegisteredHint
            )
                && !VaultManagerLogic.isSharedVaultRegisteredAt(vault, timestamp, slashVaultHints.sharedVaultRegisteredHint)
        ) {
            revert IMiddlewareBindings.MiddlewareBindings_UnregisteredVaultSlash();
        }

        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert IMiddlewareBindings.MiddlewareBindings_NoSlasher();
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
            emit IMiddlewareBindings.InstantSlash(
                slasher, operator, success, success ? abi.decode(response, (uint256)) : 0
            );
        } else if (slasherType == uint64(IVaultManager.SlasherType.VETO)) {
            (success, response) = slasher.call(
                abi.encodeCall(
                    IVetoSlasher.requestSlash, (NetworkManagerLogic.SUBNETWORK(), operator, amount, timestamp, hints)
                )
            );
            emit IMiddlewareBindings.VetoSlash(
                slasher, operator, success, success ? abi.decode(response, (uint256)) : 0
            );
        } else {
            revert IMiddlewareBindings.MiddlewareBindings_UnknownSlasherType();
        }
    }

    function executeSlashVault(
        address vault,
        uint256 slashIndex,
        bytes memory hints
    ) public returns (bool success, uint256 slashedAmount) {
        address slasher = IVault(vault).slasher();
        if (slasher == address(0)) {
            revert IMiddlewareBindings.MiddlewareBindings_NoSlasher();
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
            emit IMiddlewareBindings.ExecuteSlash(slasher, slashIndex, success, slashedAmount);
        } else {
            revert IMiddlewareBindings.MiddlewareBindings_NonVetoSlasher();
        }
    }

    function distributeStakerRewards(address stakerRewards, address token, uint256 amount, bytes memory data) public {
        IStakerRewards(stakerRewards).distributeRewards(NetworkManagerLogic.NETWORK(), token, amount, data);
        emit IMiddlewareBindings.DistributeStakerRewards(stakerRewards, token, amount, data);
    }

    function distributeOperatorRewards(address operatorRewards, address token, uint256 amount, bytes32 root) public {
        IDefaultOperatorRewards(operatorRewards).distributeRewards(NetworkManagerLogic.NETWORK(), token, amount, root);
        emit IMiddlewareBindings.DistributeOperatorRewards(operatorRewards, token, amount, root);
    }
}

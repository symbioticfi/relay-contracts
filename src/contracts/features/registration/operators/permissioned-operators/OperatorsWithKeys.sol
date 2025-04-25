// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../../base/KeyManager.sol";
import {BaseOperators} from "./BaseOperators.sol";

import {IOperatorsWithKeys} from
    "../../../../../interfaces/features/registration/operators/permissioned-operators/IOperatorsWithKeys.sol";

abstract contract OperatorsWithKeys is BaseOperators, KeyManager, IOperatorsWithKeys {
    /**
     * @inheritdoc IOperatorsWithKeys
     */
    uint64 public constant OperatorsWithKeys_VERSION = 1;

    function __OperatorsWithKeys_init() internal virtual onlyInitializing {
        __BaseOperators_init();
    }

    /**
     * @inheritdoc IOperatorsWithKeys
     */
    function registerOperatorWithPermission(
        address operator,
        address vault,
        KeyWithSignature[] memory keysWithSignatures
    ) public virtual checkPermission {
        _registerOperator(operator);
        _registerKeys(operator, keysWithSignatures);
        if (vault != address(0)) {
            _registerOperatorVault(operator, vault);
        }
    }

    /**
     * @inheritdoc IOperatorsWithKeys
     */
    function updateKeyWithPermission(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) public virtual checkPermission {
        _setKey(operator, tag, key, signature, extraData);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseOperators} from "./BaseOperators.sol";
import {AccessManager} from "../../managers/extendable/AccessManager.sol";

import {IOperators} from "../../../../interfaces/SDK/extensions/operators/IOperators.sol";

/**
 * @title Operators
 * @notice Base contract for managing operator registration, and vault relationships
 * @dev Provides core operator management functionality with hooks for customization
 */
abstract contract Operators is BaseOperators, AccessManager, IOperators {
    uint64 public constant Operators_VERSION = 1;

    function registerOperator(address operator, address vault) external checkAccess {
        _registerOperatorImpl(operator, vault);
    }

    function unregisterOperator(
        address operator
    ) external checkAccess {
        _unregisterOperatorImpl(operator);
    }

    function pauseOperator(
        address operator
    ) external virtual checkAccess {
        _pauseOperatorImpl(operator);
    }

    function unpauseOperator(
        address operator
    ) external virtual checkAccess {
        _unpauseOperatorImpl(operator);
    }

    function registerOperatorVault(address operator, address vault) external virtual checkAccess {
        _registerOperatorVaultImpl(operator, vault);
    }

    function unregisterOperatorVault(address operator, address vault) external virtual checkAccess {
        _unregisterOperatorVaultImpl(operator, vault);
    }

    function pauseOperatorVault(address operator, address vault) external virtual checkAccess {
        _pauseOperatorVaultImpl(operator, vault);
    }

    function unpauseOperatorVault(address operator, address vault) external virtual checkAccess {
        _unpauseOperatorVaultImpl(operator, vault);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";
import {IForcePauseSelfRegisterOperators} from
    "../../../../interfaces/SDK/extensions/operators/IForcePauseSelfRegisterOperators.sol";
import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

/**
 * @title ForcePauseSelfRegisterOperators
 * @notice Extension of SelfRegisterOperators that allows authorized addresses to forcefully pause operators
 * @dev Implements force pause functionality and prevents unpausing of force-paused operators
 */
abstract contract ForcePauseSelfRegisterOperators is SelfRegisterOperators, IForcePauseSelfRegisterOperators {
    using EnumerableMap for EnumerableMap.AddressToAddressMap;

    uint64 public constant ForcePauseSelfRegisterOperators_VERSION = 1;

    struct ForcePauseSelfRegisterOperatorsStorage {
        mapping(address => bool) forcePaused;
        mapping(address => mapping(address => bool)) forcePausedVault;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ForcePauseSelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ForcePauseSelfRegisterOperatorsStorageLocation =
        0xf3871d05fd4da42686c3c56dfd4be98b1d278da4bf1fd61b1d6e7a6e37722600;

    function _getForcePauseStorage() internal pure returns (ForcePauseSelfRegisterOperatorsStorage storage $) {
        bytes32 location = ForcePauseSelfRegisterOperatorsStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function isOperatorForcePaused(
        address operator
    ) public view returns (bool) {
        return _getForcePauseStorage().forcePaused[operator];
    }

    function isOperatorVaultForcePaused(address operator, address vault) public view returns (bool) {
        return _getForcePauseStorage().forcePausedVault[operator][vault];
    }

    function forceUnpauseOperator(
        address operator
    ) external virtual checkAccess {
        if (!isOperatorForcePaused(operator)) {
            revert OperatorNotForcePaused();
        }
        _getForcePauseStorage().forcePaused[operator] = false;
    }

    function forcePauseOperator(
        address operator
    ) external virtual checkAccess {
        if (isOperatorForcePaused(operator)) {
            revert OperatorForcePaused();
        }
        _getForcePauseStorage().forcePaused[operator] = true;
        if (_isOperatorActive(operator)) {
            _unregisterOperator(operator);
        }
    }

    function forceUnpauseOperatorVault(address operator, address vault) external virtual checkAccess {
        if (!isOperatorVaultForcePaused(operator, vault)) {
            revert OperatorVaultNotForcePaused();
        }
        _getForcePauseStorage().forcePausedVault[operator][vault] = false;
    }

    function forcePauseOperatorVault(address operator, address vault) external virtual checkAccess {
        if (isOperatorVaultForcePaused(operator, vault)) {
            revert OperatorVaultForcePaused();
        }
        _getForcePauseStorage().forcePausedVault[operator][vault] = true;
        if (_isOperatorVaultActive(operator, vault)) {
            _unregisterOperatorVault(operator, vault);
        }
    }

    function _registerOperatorImpl(address operator, address vault) internal virtual override {
        if (isOperatorForcePaused(operator)) revert OperatorForcePaused();
        super._registerOperatorImpl(operator, vault);
    }

    function _registerOperatorVaultImpl(address operator, address vault) internal virtual override {
        if (isOperatorVaultForcePaused(operator, vault)) revert OperatorVaultForcePaused();
        super._registerOperatorVaultImpl(operator, vault);
    }
}

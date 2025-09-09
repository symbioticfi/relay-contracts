// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../VotingPowerProvider.sol";

import {IOperatorsJail} from "../../../interfaces/modules/voting-power/extensions/IOperatorsJail.sol";

/**
 * @title OperatorsJail
 * @notice Contract for jailing (unregistering and not allowing to register) operators for a given duration.
 */
abstract contract OperatorsJail is VotingPowerProvider, IOperatorsJail {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorsJail")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorsJailStorageLocation =
        0xcf19420dad377ef849f2ba5fafa7311a71756e09aee8adb231516efd3d2b7b00;

    function _getOperatorsJailStorage() internal pure returns (OperatorsJailStorage storage $) {
        bytes32 location = OperatorsJailStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __OperatorsJail_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc IOperatorsJail
     */
    function isOperatorJailed(
        address operator
    ) public view virtual returns (bool) {
        return getOperatorJailedUntil(operator) > block.timestamp;
    }

    /**
     * @inheritdoc IOperatorsJail
     */
    function getOperatorJailedUntil(
        address operator
    ) public view virtual returns (uint48) {
        return _getOperatorsJailStorage()._jailedUntil[operator];
    }

    /**
     * @inheritdoc IOperatorsJail
     */
    function jailOperator(address operator, uint48 duration) public virtual checkPermission {
        if (duration == 0) {
            revert OperatorsJail_InvalidDuration();
        }
        uint48 jailedUntil = uint48(block.timestamp) + duration;
        if (jailedUntil <= getOperatorJailedUntil(operator)) {
            revert OperatorsJail_AlreadyJailed();
        }
        _getOperatorsJailStorage()._jailedUntil[operator] = jailedUntil;
        if (isOperatorRegistered(operator)) {
            _unregisterOperator(operator);
        }

        emit JailOperator(operator);
    }

    /**
     * @inheritdoc IOperatorsJail
     */
    function unjailOperator(
        address operator
    ) public virtual checkPermission {
        if (!isOperatorJailed(operator)) {
            revert OperatorsJail_OperatorNotJailed();
        }
        _getOperatorsJailStorage()._jailedUntil[operator] = 0;

        emit UnjailOperator(operator);
    }

    function _registerOperatorImpl(
        address operator
    ) internal virtual override {
        if (isOperatorJailed(operator)) {
            revert OperatorsJail_OperatorJailed();
        }
        super._registerOperatorImpl(operator);
    }
}

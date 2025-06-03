// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VotingPowerProvider} from "../VotingPowerProvider.sol";

import {IOperatorsWhitelist} from "../../../../interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol";

abstract contract OperatorsWhitelist is VotingPowerProvider, IOperatorsWhitelist {
    /**
     * @inheritdoc IOperatorsWhitelist
     */
    uint64 public constant OperatorsWhitelist_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorsWhitelist")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorsWhitelistStorageLocation =
        0x3fa7d7e58a4c604e915cc85c236f89892f2e36ec13dff506efa6b5ea5fafeb00;

    function _getOperatorsWhitelistStorage() internal pure returns (OperatorsWhitelistStorage storage $) {
        bytes32 location = OperatorsWhitelistStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __OperatorsWhitelist_init(
        OperatorsWhitelistInitParams memory initParams
    ) internal virtual onlyInitializing {
        OperatorsWhitelistStorage storage $ = _getOperatorsWhitelistStorage();
        $._isWhitelistEnabled = initParams.isWhitelistEnabled;
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function isWhitelistEnabled() public view virtual returns (bool) {
        return _getOperatorsWhitelistStorage()._isWhitelistEnabled;
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function isOperatorWhitelisted(
        address operator
    ) public view virtual returns (bool) {
        return _getOperatorsWhitelistStorage()._whitelisted[operator];
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function isOperatorVaultWhitelisted(address operator, address vault) public view virtual returns (bool) {
        return _getOperatorsWhitelistStorage()._whitelistedVault[operator][vault];
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function setWhitelistStatus(
        bool status
    ) public virtual checkPermission {
        _getOperatorsWhitelistStorage()._isWhitelistEnabled = status;

        emit SetWhitelistStatus(status);
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function whitelistOperator(
        address operator
    ) public virtual checkPermission {
        if (isOperatorWhitelisted(operator)) {
            revert OperatorsWhitelist_OperatorAlreadyWhitelisted();
        }
        _getOperatorsWhitelistStorage()._whitelisted[operator] = true;

        emit WhitelistOperator(operator);
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function unwhitelistOperator(
        address operator
    ) public virtual checkPermission {
        if (!isOperatorWhitelisted(operator)) {
            revert OperatorsWhitelist_OperatorNotWhitelisted();
        }
        _getOperatorsWhitelistStorage()._whitelisted[operator] = false;
        if (isWhitelistEnabled() && isOperatorRegistered(operator)) {
            _unregisterOperator(operator);
        }

        emit UnwhitelistOperator(operator);
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function whitelistOperatorVault(address operator, address vault) public virtual checkPermission {
        if (isOperatorVaultWhitelisted(operator, vault)) {
            revert OperatorsWhitelist_OperatorVaultAlreadyWhitelisted();
        }
        _getOperatorsWhitelistStorage()._whitelistedVault[operator][vault] = true;

        emit WhitelistOperatorVault(operator, vault);
    }

    /**
     * @inheritdoc IOperatorsWhitelist
     */
    function unwhitelistOperatorVault(address operator, address vault) public virtual checkPermission {
        if (!isOperatorVaultWhitelisted(operator, vault)) {
            revert OperatorsWhitelist_OperatorVaultNotWhitelisted();
        }
        _getOperatorsWhitelistStorage()._whitelistedVault[operator][vault] = false;
        if (isWhitelistEnabled() && isOperatorVaultRegistered(operator, vault)) {
            _unregisterOperatorVault(operator, vault);
        }

        emit UnwhitelistOperatorVault(operator, vault);
    }

    function _registerOperatorImpl(address operator, address vault) internal virtual override {
        if (isWhitelistEnabled() && !isOperatorWhitelisted(operator)) {
            revert OperatorsWhitelist_OperatorNotWhitelisted();
        }
        super._registerOperatorImpl(operator, vault);
    }

    function _registerOperatorVaultImpl(address operator, address vault) internal virtual override {
        if (isWhitelistEnabled() && !isOperatorVaultWhitelisted(operator, vault)) {
            revert OperatorsWhitelist_OperatorVaultNotWhitelisted();
        }
        super._registerOperatorVaultImpl(operator, vault);
    }
}

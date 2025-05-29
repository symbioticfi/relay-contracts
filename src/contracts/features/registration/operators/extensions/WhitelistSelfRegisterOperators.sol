// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "../SelfRegisterOperators.sol";

import {IWhitelistSelfRegisterOperators} from
    "../../../../../interfaces/features/registration/operators/extensions/IWhitelistSelfRegisterOperators.sol";

abstract contract WhitelistSelfRegisterOperators is SelfRegisterOperators, IWhitelistSelfRegisterOperators {
    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    uint64 public constant WhitelistSelfRegisterOperators_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.WhitelistSelfRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant WhitelistSelfRegisterOperatorsStorageLocation =
        0x25b93ff8b4a329091c8d52079f1be19dcd6e61195383d70f54f5235ddae87400;

    function _getWhitelistStorage() internal pure returns (WhitelistSelfRegisterOperatorsStorage storage $) {
        bytes32 location = WhitelistSelfRegisterOperatorsStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __WhitelistSelfRegisterOperators_init(
        WhitelistSelfRegisterOperatorsInitParams memory initParams
    ) internal virtual onlyInitializing {
        WhitelistSelfRegisterOperatorsStorage storage $ = _getWhitelistStorage();
        $._isWhitelistEnabled = initParams.isWhitelistEnabled;
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function isWhitelistEnabled() public view virtual returns (bool) {
        return _getWhitelistStorage()._isWhitelistEnabled;
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function isOperatorWhitelisted(
        address operator
    ) public view virtual returns (bool) {
        return _getWhitelistStorage()._whitelisted[operator];
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function isOperatorVaultWhitelisted(address operator, address vault) public view virtual returns (bool) {
        return _getWhitelistStorage()._whitelistedVault[operator][vault];
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function setWhitelistStatus(
        bool status
    ) public virtual checkPermission {
        _getWhitelistStorage()._isWhitelistEnabled = status;
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function whitelistOperator(
        address operator
    ) public virtual checkPermission {
        if (isOperatorWhitelisted(operator)) {
            revert WhitelistSelfRegisterOperators_OperatorAlreadyWhitelisted();
        }
        _getWhitelistStorage()._whitelisted[operator] = true;
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function unwhitelistOperator(
        address operator
    ) public virtual checkPermission {
        if (!isOperatorWhitelisted(operator)) {
            revert WhitelistSelfRegisterOperators_OperatorNotWhitelisted();
        }
        _getWhitelistStorage()._whitelisted[operator] = false;
        if (isWhitelistEnabled() && isOperatorRegistered(operator)) {
            _unregisterOperator(operator);
        }
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function whitelistOperatorVault(address operator, address vault) public virtual checkPermission {
        if (isOperatorVaultWhitelisted(operator, vault)) {
            revert WhitelistSelfRegisterOperators_OperatorVaultAlreadyWhitelisted();
        }
        _getWhitelistStorage()._whitelistedVault[operator][vault] = true;
    }

    /**
     * @inheritdoc IWhitelistSelfRegisterOperators
     */
    function unwhitelistOperatorVault(address operator, address vault) public virtual checkPermission {
        if (!isOperatorVaultWhitelisted(operator, vault)) {
            revert WhitelistSelfRegisterOperators_OperatorVaultNotWhitelisted();
        }
        _getWhitelistStorage()._whitelistedVault[operator][vault] = false;
        if (isWhitelistEnabled() && isOperatorVaultRegistered(operator, vault)) {
            _unregisterOperatorVault(operator, vault);
        }
    }

    function _registerOperatorImpl(address operator, address vault) internal virtual override {
        if (isWhitelistEnabled() && !isOperatorWhitelisted(operator)) {
            revert WhitelistSelfRegisterOperators_OperatorNotWhitelisted();
        }
        super._registerOperatorImpl(operator, vault);
    }

    function _registerOperatorVaultImpl(address operator, address vault) internal virtual override {
        if (isWhitelistEnabled() && !isOperatorVaultWhitelisted(operator, vault)) {
            revert WhitelistSelfRegisterOperators_OperatorVaultNotWhitelisted();
        }
        super._registerOperatorVaultImpl(operator, vault);
    }
}

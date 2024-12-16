// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseMiddleware} from "../../middleware/BaseMiddleware.sol";
import {SharedVaults} from "../../extensions/SharedVaults.sol";
import {SelfRegisterOperators} from "../../extensions/operators/SelfRegisterOperators.sol";

import {ECDSASig} from "../../extensions/managers/sigs/ECDSASig.sol";
import {OwnableAccessManager} from "../../extensions/managers/access/OwnableAccessManager.sol";
import {TimestampCapture} from "../../extensions/managers/capture-timestamps/TimestampCapture.sol";
import {EqualStakePower} from "../../extensions/managers/stake-powers/EqualStakePower.sol";
import {KeyManager256} from "../../extensions/managers/keys/KeyManager256.sol";

contract SelfRegisterMiddleware is
    SharedVaults,
    SelfRegisterOperators,
    KeyManager256,
    ECDSASig,
    OwnableAccessManager,
    TimestampCapture,
    EqualStakePower
{
    error TooManyOperators();
    error TooManyOperatorVaults();

    uint256 public constant MAX_OPERATORS = 100;
    uint256 public constant MAX_OPERATOR_VAULTS = 40;

    /**
     * @notice Constructor for initializing the SelfRegisterMiddleware contract
     * @param network The address of the network
     * @param slashingWindow The duration of the slashing window
     * @param vaultRegistry The address of the vault registry
     * @param operatorRegistry The address of the operator registry
     * @param operatorNetOptin The address of the operator network opt-in service
     * @param reader The address of the reader contract used for delegatecall
     * @param owner The address of the owner
     */
    constructor(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptin,
        address reader,
        address owner
    ) {
        initialize(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptin, reader, owner);
    }

    function initialize(
        address network,
        uint48 slashingWindow,
        address vaultRegistry,
        address operatorRegistry,
        address operatorNetOptIn,
        address reader,
        address owner
    ) internal initializer {
        __BaseMiddleware_init(network, slashingWindow, vaultRegistry, operatorRegistry, operatorNetOptIn, reader);
        __SelfRegisterOperators_init("SelfRegisterMiddleware");
        __OwnableAccessManager_init(owner);
    }

    function _beforeRegisterOperator(address operator, bytes memory key, address vault) internal virtual override {
        super._beforeRegisterOperator(operator, key, vault);
        if (_operatorsLength() >= MAX_OPERATORS) {
            revert TooManyOperators();
        }
    }

    function _beforeRegisterOperatorVault(address operator, address vault) internal virtual override {
        super._beforeRegisterOperatorVault(operator, vault);
        if (_operatorVaultsLength(operator) >= MAX_OPERATOR_VAULTS) {
            revert TooManyOperatorVaults();
        }
    }
}

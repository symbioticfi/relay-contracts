// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {BaseSelfRegisterOperators} from "./BaseSelfRegisterOperators.sol";

import {ISelfRegisterOperators} from
    "../../../../../interfaces/features/registration/operators/self-register-operators/ISelfRegisterOperators.sol";

abstract contract SelfRegisterOperators is BaseSelfRegisterOperators, ISelfRegisterOperators {
    /**
     * @inheritdoc ISelfRegisterOperators
     */
    uint64 public constant SelfRegisterOperators_VERSION = 1;

    bytes32 private constant REGISTER_OPERATOR_TYPEHASH =
        keccak256("RegisterOperator(address operator,address vault,uint256 nonce)");

    function __SelfRegisterOperators_init(
        SelfRegisterOperatorsInitParams memory initParams
    ) internal virtual onlyInitializing {
        __BaseSelfRegisterOperators_init(initParams.minVotingPowerThreshold);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperator(address vault, bytes memory extraData) public virtual {
        _registerOperatorImpl(msg.sender, vault, extraData);
    }

    /**
     * @inheritdoc ISelfRegisterOperators
     */
    function registerOperatorWithSignature(
        address operator,
        address vault,
        bytes memory signature,
        bytes memory extraData
    ) public virtual {
        _verifyEIP712(
            operator, keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, vault, _useNonce(operator))), signature
        );
        _registerOperatorImpl(operator, vault, extraData);
    }
}

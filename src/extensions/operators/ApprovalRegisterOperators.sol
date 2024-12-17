// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SelfRegisterOperators} from "./SelfRegisterOperators.sol";
import {IApprovalRegisterOperators} from "../../interfaces/extensions/operators/IApprovalRegisterOperators.sol";
/**
 * @title ApprovalRegisterOperators
 * @notice Extends SelfRegisterOperators to add approval-based registration
 */

abstract contract ApprovalRegisterOperators is SelfRegisterOperators, IApprovalRegisterOperators {
    uint64 public constant ApprovalRegisterOperators_VERSION = 1;

    struct ApprovalRegisterOperatorsStorage {
        RegistrationRequest[] requests;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ApprovalRegisterOperators")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ApprovalRegisterOperators_STORAGE_LOCATION =
        0x8d3c0d900c3fcfbc53470fac03a90d5cf6aa7b77c3f1ed10e6c6bd4d192eaf00;

    function _getApprovalRegisterOperatorsStorage() private pure returns (ApprovalRegisterOperatorsStorage storage $) {
        bytes32 location = ApprovalRegisterOperators_STORAGE_LOCATION;
        assembly {
            $.slot := location
        }
    }

    /**
     * @inheritdoc IApprovalRegisterOperators
     */
    function getRegistrationRequestCount() public view returns (uint256) {
        return _getApprovalRegisterOperatorsStorage().requests.length;
    }

    /**
     * @inheritdoc IApprovalRegisterOperators
     */
    function getRegistrationRequest(
        uint256 index
    ) public view returns (RegistrationRequest memory) {
        return _getApprovalRegisterOperatorsStorage().requests[index];
    }

    /**
     * @inheritdoc IApprovalRegisterOperators
     */
    function registerOperator(
        uint256 requestIndex
    ) external checkAccess {
        RegistrationRequest memory request = getRegistrationRequest(requestIndex);
        _registerOperatorImpl(request.operator, request.key, request.vault);
        ApprovalRegisterOperatorsStorage storage $ = _getApprovalRegisterOperatorsStorage();
        uint256 lastIndex = $.requests.length - 1;
        if (requestIndex != lastIndex) {
            $.requests[requestIndex] = $.requests[lastIndex];
        }
        $.requests.pop();
    }

    /**
     * @notice Override to prevent direct registration
     */
    function registerOperator(bytes memory key, address vault, bytes memory signature) external virtual override {
        revert DirectRegistrationNotAllowed();
    }

    /**
     * @notice Override to prevent direct registration
     */
    function registerOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) public virtual override {
        revert DirectRegistrationNotAllowed();
    }

    /**
     * @inheritdoc IApprovalRegisterOperators
     */
    function requestRegisterOperator(bytes memory key, address vault, bytes memory signature) external {
        _verifyKey(msg.sender, key, signature);
        ApprovalRegisterOperatorsStorage storage $ = _getApprovalRegisterOperatorsStorage();
        $.requests.push(RegistrationRequest({operator: msg.sender, vault: vault, key: key}));
    }

    /**
     * @inheritdoc IApprovalRegisterOperators
     */
    function requestRegisterOperator(
        address operator,
        bytes memory key,
        address vault,
        bytes memory signature,
        bytes memory keySignature
    ) public {
        SelfRegisterOperatorsStorage storage s = _getSelfRegisterOperatorsStorage();
        _verifyEIP712(
            operator,
            keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, keccak256(key), vault, s.nonces[operator]++)),
            signature
        );
        _verifyKey(operator, key, keySignature);
        ApprovalRegisterOperatorsStorage storage $ = _getApprovalRegisterOperatorsStorage();
        $.requests.push(RegistrationRequest({operator: operator, vault: vault, key: key}));
    }
}

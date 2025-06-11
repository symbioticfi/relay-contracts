// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {VaultManager} from "../../base/VaultManager.sol";
import {PermissionManager} from "../../base/PermissionManager.sol";
import {OzEIP712} from "../../base/common/OzEIP712.sol";

import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

import {IVotingPowerProvider} from "../../../interfaces/modules/voting-power/IVotingPowerProvider.sol";

import {NoncesUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/NoncesUpgradeable.sol";
import {VaultManager} from "../../base/VaultManager.sol";

abstract contract VotingPowerProvider is
    VaultManager,
    OzEIP712,
    PermissionManager,
    NoncesUpgradeable,
    IVotingPowerProvider
{
    bytes32 private constant REGISTER_OPERATOR_TYPEHASH = keccak256("RegisterOperator(address operator,uint256 nonce)");
    bytes32 private constant UNREGISTER_OPERATOR_TYPEHASH =
        keccak256("UnregisterOperator(address operator,uint256 nonce)");

    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function __VotingPowerProvider_init(
        VotingPowerProviderInitParams memory votingPowerProviderInitParams
    ) internal virtual onlyInitializing {
        __NetworkManager_init(votingPowerProviderInitParams.networkManagerInitParams);
        __VaultManager_init(votingPowerProviderInitParams.vaultManagerInitParams);
        __OzEIP712_init(votingPowerProviderInitParams.ozEip712InitParams);
    }

    /**
     * @inheritdoc IVotingPowerProvider
     */
    function registerOperator() public virtual {
        _registerOperatorImpl(msg.sender);
    }

    /**
     * @inheritdoc IVotingPowerProvider
     */
    function registerOperatorWithSignature(address operator, bytes memory signature) public virtual {
        _verifyEIP712(
            operator, keccak256(abi.encode(REGISTER_OPERATOR_TYPEHASH, operator, _useNonce(operator))), signature
        );
        _registerOperatorImpl(operator);
    }

    /**
     * @inheritdoc IVotingPowerProvider
     */
    function unregisterOperator() public virtual {
        _unregisterOperator(msg.sender);
    }

    /**
     * @inheritdoc IVotingPowerProvider
     */
    function unregisterOperatorWithSignature(address operator, bytes memory signature) public virtual {
        _verifyEIP712(
            operator, keccak256(abi.encode(UNREGISTER_OPERATOR_TYPEHASH, operator, _useNonce(operator))), signature
        );
        _unregisterOperator(operator);
    }

    /**
     * @inheritdoc IVotingPowerProvider
     */
    function invalidateOldSignatures() public virtual {
        _useNonce(msg.sender);
        emit InvalidateOldSignatures(msg.sender);
    }

    function _registerOperatorImpl(
        address operator
    ) internal virtual {
        _registerOperator(operator);
    }

    function _verifyEIP712(address operator, bytes32 structHash, bytes memory signature) internal view {
        if (!SignatureChecker.isValidSignatureNow(operator, hashTypedDataV4(structHash), signature)) {
            revert VotingPowerProvider_InvalidSignature();
        }
    }
}

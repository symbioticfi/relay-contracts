// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";

import {ISelfRegisterOperatorsWithKeys} from
    "../../../../../interfaces/features/registration/operators/self-register-operators/ISelfRegisterOperatorsWithKeys.sol";

import {BaseSelfRegisterOperators} from "./BaseSelfRegisterOperators.sol";
import {KeyManager} from "../../../../base/KeyManager.sol";

abstract contract SelfRegisterOperatorsWithKeys is
    BaseSelfRegisterOperators,
    KeyManager,
    ISelfRegisterOperatorsWithKeys
{
    /**
     * @inheritdoc ISelfRegisterOperatorsWithKeys
     */
    uint64 public constant SelfRegisterOperatorsWithKeys_VERSION = 1;

    bytes32 private constant KEY_TYPEHASH = keccak256("Key(uint8 tag,bytes key)");
    bytes32 private constant REGISTER_OPERATOR_TYPEHASH = keccak256(
        "RegisterOperator(address operator,address vault,Key[] keysWithSignatures,uint256 nonce)Key(uint8 tag,bytes key)"
    );
    bytes32 private constant UPDATE_KEY_TYPEHASH =
        keccak256("UpdateKey(address operator,uint8 tag,bytes key,uint256 nonce)");

    function __SelfRegisterOperatorsWithKeys_init(
        SelfRegisterOperatorsWithKeysInitParams memory initParams
    ) internal virtual onlyInitializing {
        __BaseSelfRegisterOperators_init(initParams.minVotingPowerThreshold);
    }

    /**
     * @inheritdoc ISelfRegisterOperatorsWithKeys
     */
    function registerOperator(
        address vault,
        KeyWithSignature[] memory keysWithSignatures,
        bytes memory extraData
    ) public virtual {
        _registerOperatorImpl(msg.sender, vault, extraData);
        _registerKeys(msg.sender, keysWithSignatures);
    }

    /**
     * @inheritdoc ISelfRegisterOperatorsWithKeys
     */
    function registerOperatorWithSignature(
        address operator,
        address vault,
        KeyWithSignature[] memory keysWithSignatures,
        bytes memory signature,
        bytes memory extraData
    ) public virtual {
        bytes32[] memory keyHashes = new bytes32[](keysWithSignatures.length);
        for (uint256 i; i < keysWithSignatures.length; ++i) {
            keyHashes[i] = keccak256(abi.encode(KEY_TYPEHASH, keysWithSignatures[i].tag, keysWithSignatures[i].key));
        }
        _verifyEIP712(
            operator,
            keccak256(
                abi.encode(
                    REGISTER_OPERATOR_TYPEHASH,
                    operator,
                    vault,
                    keccak256(abi.encodePacked(keyHashes)),
                    _useNonce(operator)
                )
            ),
            signature
        );
        _registerOperatorImpl(operator, vault, extraData);
        _registerKeys(operator, keysWithSignatures);
    }

    /**
     * @inheritdoc ISelfRegisterOperatorsWithKeys
     */
    function updateKey(
        uint8 tag,
        bytes memory key,
        bytes memory keySignature,
        bytes memory extraData
    ) public virtual checkPermission {
        _setKey(msg.sender, tag, key, keySignature, extraData);
    }

    /**
     * @inheritdoc ISelfRegisterOperatorsWithKeys
     */
    function updateKeyWithSignature(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory keySignature,
        bytes memory extraData,
        bytes memory signature
    ) public virtual checkPermission {
        _verifyEIP712(
            operator, keccak256(abi.encode(UPDATE_KEY_TYPEHASH, operator, tag, key, _useNonce(operator))), signature
        );
        _setKey(operator, tag, key, keySignature, extraData);
    }
}

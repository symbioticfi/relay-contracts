// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {InputNormalizer} from "../../libraries/utils/InputNormalizer.sol";
import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";

import {KeyTag} from "../../libraries/utils/KeyTag.sol";
import {KeyBlsBn254} from "../../libraries/keys/KeyBlsBn254.sol";
import {KeyEcdsaSecp256k1} from "../../libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyEddsaCurve25519} from "../../libraries/keys/KeyEddsaCurve25519.sol";
import {SigBlsBn254} from "../../libraries/sigs/SigBlsBn254.sol";
import {SigEcdsaSecp256k1} from "../../libraries/sigs/SigEcdsaSecp256k1.sol";
import {SigEddsaCurve25519} from "../../libraries/sigs/SigEddsaCurve25519.sol";

import {IKeyManager} from "../../../interfaces/base/IKeyManager.sol";
import {IBaseKeyManager} from "../../../interfaces/base/IBaseKeyManager.sol";

library KeyManagerLogic {
    using KeyTag for uint8;
    using Checkpoints for Checkpoints.Trace208;
    using Checkpoints for Checkpoints.Trace256;
    using Checkpoints for Checkpoints.Trace512;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using KeyEddsaCurve25519 for KeyEddsaCurve25519.KEY_EDDSA_CURVE25519;
    using InputNormalizer for bytes[];
    using InputNormalizer for bytes[][];
    using PersistentSet for PersistentSet.AddressSet;

    uint64 public constant KeyManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerLocation = 0x6521690ca2d70b23823c69a92a4a0089d4c270c9c885205eafdf0ae297a8bf00;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    function _getKeyManagerStorage() internal pure returns (IKeyManager.KeyManagerStorage storage $) {
        assembly {
            $.slot := KeyManagerLocation
        }
    }

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bytes memory) {
        IKeyManager.KeyType keyType = IKeyManager.KeyType(tag.getType());
        if (keyType == IKeyManager.KeyType.BLS_BN254) {
            return KeyBlsBn254.deserialize(getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        if (keyType == IKeyManager.KeyType.ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        if (keyType == IKeyManager.KeyType.EDDSA_CURVE25519) {
            return KeyEddsaCurve25519.deserialize(getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        revert IKeyManager.KeyManager_InvalidKeyType();
    }

    function getKey(address operator, uint8 tag) public view returns (bytes memory) {
        IKeyManager.KeyType keyType = IKeyManager.KeyType(tag.getType());
        if (keyType == IKeyManager.KeyType.BLS_BN254) {
            return KeyBlsBn254.deserialize(getKey32(operator, tag)).toBytes();
        }
        if (keyType == IKeyManager.KeyType.ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(getKey32(operator, tag)).toBytes();
        }
        if (keyType == IKeyManager.KeyType.EDDSA_CURVE25519) {
            return KeyEddsaCurve25519.deserialize(getKey32(operator, tag)).toBytes();
        }
        revert IKeyManager.KeyManager_InvalidKeyType();
    }

    function getOperator(
        bytes memory key
    ) public view returns (address) {
        return _getKeyManagerStorage()._operatorByKeyHash[keccak256(key)];
    }

    function getKeyTagsAt(address operator, uint48 timestamp, bytes memory hint) public view returns (uint8[] memory) {
        return deserializeKeyTags(_getKeyManagerStorage()._operatorKeyTags[operator].upperLookupRecent(timestamp, hint));
    }

    function getKeyTags(
        address operator
    ) public view returns (uint8[] memory) {
        return deserializeKeyTags(_getKeyManagerStorage()._operatorKeyTags[operator].latest());
    }

    function getKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IBaseKeyManager.Key[] memory keys) {
        IKeyManager.OperatorKeysHints memory operatorKeysHints;
        if (hints.length > 0) {
            operatorKeysHints = abi.decode(hints, (IKeyManager.OperatorKeysHints));
        }

        uint8[] memory keyTags = getKeyTagsAt(operator, timestamp, operatorKeysHints.keyTagsHint);
        keys = new IBaseKeyManager.Key[](keyTags.length);
        operatorKeysHints.keyHints = operatorKeysHints.keyHints.normalize(keyTags.length);
        for (uint256 i; i < keyTags.length; ++i) {
            keys[i] = IBaseKeyManager.Key({
                tag: keyTags[i],
                payload: getKeyAt(operator, keyTags[i], timestamp, operatorKeysHints.keyHints[i])
            });
        }
    }

    function getKeys(
        address operator
    ) public view returns (IBaseKeyManager.Key[] memory keys) {
        uint8[] memory keyTags = getKeyTags(operator);
        keys = new IBaseKeyManager.Key[](keyTags.length);
        for (uint256 i; i < keyTags.length; ++i) {
            keys[i] = IBaseKeyManager.Key({tag: keyTags[i], payload: getKey(operator, keyTags[i])});
        }
    }

    function getKeysAt(
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IBaseKeyManager.OperatorWithKeys[] memory operatorsKeys) {
        IKeyManager.OperatorsKeysHints memory operatorsKeysHints;
        if (hints.length > 0) {
            operatorsKeysHints = abi.decode(hints, (IKeyManager.OperatorsKeysHints));
        }

        address[] memory operators = getKeysOperatorsAt(timestamp, operatorsKeysHints.operatorsHints);
        operatorsKeysHints.operatorKeysHints = operatorsKeysHints.operatorKeysHints.normalize(operators.length);
        operatorsKeys = new IBaseKeyManager.OperatorWithKeys[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            operatorsKeys[i].operator = operators[i];
            operatorsKeys[i].keys = getKeysAt(operators[i], timestamp, operatorsKeysHints.operatorKeysHints[i]);
        }
    }

    function getKeys() public view returns (IBaseKeyManager.OperatorWithKeys[] memory operatorsKeys) {
        address[] memory operators = getKeysOperators();
        operatorsKeys = new IBaseKeyManager.OperatorWithKeys[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            operatorsKeys[i].operator = operators[i];
            operatorsKeys[i].keys = getKeys(operators[i]);
        }
    }

    function getKeysOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory operators) {
        return _getKeyManagerStorage()._operators.valuesAt(timestamp, hints);
    }

    function getKeysOperators() public view returns (address[] memory operators) {
        return _getKeyManagerStorage()._operators.values();
    }

    function getKeysOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getKeyManagerStorage()._operators.lengthAt(timestamp, hint);
    }

    function getKeysOperatorsLength() public view returns (uint256) {
        return _getKeyManagerStorage()._operators.length();
    }

    function setKey(
        function (bytes32) external returns (bytes32) hashTypedDataV4,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) public {
        setKey(hashTypedDataV4, msg.sender, tag, key, signature, extraData);
    }

    function setKey(
        function (bytes32) external returns (bytes32) hashTypedDataV4,
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) public {
        IKeyManager.KeyManagerStorage storage $ = _getKeyManagerStorage();

        bytes32 keyHash = keccak256(key);
        verifyKey(
            tag,
            key,
            signature,
            extraData,
            abi.encode(hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, operator, keyHash))))
        );

        // Disallow usage between different operators
        // Disallow usage of the same key on the same type on different tags
        // Allow usage of the old key on the same type and tag
        IKeyManager.KeyType type_ = IKeyManager.KeyType(tag.getType());
        address operatorByCompressedKey = $._operatorByKeyHash[keyHash];
        if (operatorByCompressedKey != address(0)) {
            if (operatorByCompressedKey != operator) {
                revert IKeyManager.KeyManager_AlreadyUsed();
            }
            if (
                $._operatorByTypeAndKeyHash[type_][keyHash] != address(0)
                    && $._operatorByTagAndKeyHash[tag][keyHash] == address(0)
            ) {
                revert IKeyManager.KeyManager_AlreadyUsed();
            }
        }

        $._operatorByKeyHash[keyHash] = operator;
        $._operatorByTypeAndKeyHash[type_][keyHash] = operator;
        $._operatorByTagAndKeyHash[tag][keyHash] = operator;
        
        $._operators.add(Time.timestamp(), operator);
        $._operatorKeyTags[operator].push(Time.timestamp(), $._operatorKeyTags[operator].latest() | uint208(1 << tag));
        setKey(operator, tag, key);
    }

    function verifyKey(
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData,
        bytes memory message
    ) public {
        IKeyManager.KeyType type_ = IKeyManager.KeyType(tag.getType());
        if (type_ == IKeyManager.KeyType.BLS_BN254) {
            if (!SigBlsBn254.verify(key, message, signature, extraData)) {
                revert IKeyManager.KeyManager_InvalidBLSKeySignature();
            }
            return;
        }
        if (type_ == IKeyManager.KeyType.ECDSA_SECP256K1) {
            if (!SigEcdsaSecp256k1.verify(key, message, signature, extraData)) {
                revert IKeyManager.KeyManager_InvalidECDSAKeySignature();
            }
            return;
        }
        if (type_ == IKeyManager.KeyType.EDDSA_CURVE25519) {
            if (!SigEddsaCurve25519.verify(key, message, signature, extraData)) {
                revert IKeyManager.KeyManager_InvalidEdDSAKeySignature();
            }
            return;
        }
        revert IKeyManager.KeyManager_InvalidKeyType();
    }

    function setKey(address operator, uint8 tag, bytes memory key) public {
        IKeyManager.KeyType type_ = IKeyManager.KeyType(tag.getType());
        if (type_ == IKeyManager.KeyType.BLS_BN254) {
            setKey32(operator, tag, KeyBlsBn254.fromBytes(key).serialize());
            return;
        }
        if (type_ == IKeyManager.KeyType.ECDSA_SECP256K1) {
            setKey32(operator, tag, KeyEcdsaSecp256k1.fromBytes(key).serialize());
            return;
        }
        if (type_ == IKeyManager.KeyType.EDDSA_CURVE25519) {
            setKey32(operator, tag, KeyEddsaCurve25519.fromBytes(key).serialize());
            return;
        }
        revert IKeyManager.KeyManager_InvalidKeyType();
    }

    function setKey32(address operator, uint8 tag, bytes memory key) public {
        bytes32 compressedKey = abi.decode(key, (bytes32));
        _getKeyManagerStorage()._keys32[operator][tag].push(Time.timestamp(), uint256(compressedKey));
    }

    function setKey64(address operator, uint8 tag, bytes memory key) public {
        (bytes32 compressedKey1, bytes32 compressedKey2) = abi.decode(key, (bytes32, bytes32));
        _getKeyManagerStorage()._keys64[operator][tag].push(
            Time.timestamp(), [uint256(compressedKey1), uint256(compressedKey2)]
        );
    }

    function getKey32At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bytes memory) {
        uint256 compressedKey = _getKeyManagerStorage()._keys32[operator][tag].upperLookupRecent(timestamp, hint);
        return abi.encode(compressedKey);
    }

    function getKey32(address operator, uint8 tag) public view returns (bytes memory) {
        uint256 compressedKey = _getKeyManagerStorage()._keys32[operator][tag].latest();
        return abi.encode(compressedKey);
    }

    function getKey64At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bytes memory) {
        uint256[2] memory compressedKeys =
            _getKeyManagerStorage()._keys64[operator][tag].upperLookupRecent(timestamp, hint);
        return abi.encode(compressedKeys[0], compressedKeys[1]);
    }

    function getKey64(address operator, uint8 tag) public view returns (bytes memory) {
        uint256[2] memory compressedKeys = _getKeyManagerStorage()._keys64[operator][tag].latest();
        return abi.encode(compressedKeys[0], compressedKeys[1]);
    }

    function serializeKeyTags(
        uint8[] memory keyTags
    ) public pure returns (uint208 keyTagsData) {
        for (uint256 i; i < keyTags.length; ++i) {
            if (keyTags[i].getType() > uint8(type(IKeyManager.KeyType).max)) {
                revert IKeyManager.KeyManager_OnlyPredeterminedKeyTagsAllowed();
            }
            if ((keyTagsData >> keyTags[i]) & 1 == 1) {
                revert IKeyManager.KeyManager_Duplicate();
            }
            keyTagsData |= uint208(1 << keyTags[i]);
        }
    }

    function deserializeKeyTags(
        uint208 keyTagsData
    ) public pure returns (uint8[] memory keyTags) {
        uint8 length;
        keyTags = new uint8[](KeyTag.TOTAL_KEY_TAGS);
        for (uint8 i; i < KeyTag.TOTAL_KEY_TAGS; ++i) {
            if ((keyTagsData >> i) & 1 == 1) {
                keyTags[length++] = i;
            }
        }
        assembly ("memory-safe") {
            mstore(keyTags, length)
        }
    }
}

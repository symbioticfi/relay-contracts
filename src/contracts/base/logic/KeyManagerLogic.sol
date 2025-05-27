// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Checkpoints} from "../../libraries/structs/Checkpoints.sol";
import {InputNormalizer} from "../../libraries/utils/InputNormalizer.sol";
import {PersistentSet} from "../../libraries/structs/PersistentSet.sol";

import {KeyTags} from "../../libraries/utils/KeyTags.sol";
import {KeyBlsBn254} from "../../libraries/keys/KeyBlsBn254.sol";
import {KeyEcdsaSecp256k1} from "../../libraries/keys/KeyEcdsaSecp256k1.sol";

import {SigBlsBn254} from "../../libraries/sigs/SigBlsBn254.sol";
import {SigEcdsaSecp256k1} from "../../libraries/sigs/SigEcdsaSecp256k1.sol";

import {IKeyManager} from "../../../interfaces/base/IKeyManager.sol";
import {IBaseKeyManager} from "../../../interfaces/base/IBaseKeyManager.sol";

library KeyManagerLogic {
    using KeyTags for uint8;
    using KeyTags for uint128;
    using Checkpoints for Checkpoints.Trace208;
    using Checkpoints for Checkpoints.Trace256;
    using Checkpoints for Checkpoints.Trace512;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using InputNormalizer for bytes[];
    using InputNormalizer for bytes[][];
    using PersistentSet for PersistentSet.AddressSet;

    uint64 internal constant KeyManager_VERSION = 1;

    uint8 internal constant KEY_TYPE_BLS_BN254 = 0;
    uint8 internal constant KEY_TYPE_ECDSA_SECP256K1 = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerLocation = 0x6521690ca2d70b23823c69a92a4a0089d4c270c9c885205eafdf0ae297a8bf00;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    function _getKeyManagerStorage() internal pure returns (IKeyManager.KeyManagerStorage storage $) {
        assembly {
            $.slot := KeyManagerLocation
        }
    }

    function TOTAL_KEY_TYPES() public pure returns (uint8) {
        return 2;
    }

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view returns (bytes memory) {
        uint8 keyType = tag.getType();
        if (keyType == KEY_TYPE_BLS_BN254) {
            return KeyBlsBn254.deserialize(getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        if (keyType == KEY_TYPE_ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        revert IKeyManager.KeyManager_InvalidKeyType();
    }

    function getKey(address operator, uint8 tag) public view returns (bytes memory) {
        uint8 keyType = tag.getType();
        if (keyType == KEY_TYPE_BLS_BN254) {
            return KeyBlsBn254.deserialize(getKey32(operator, tag)).toBytes();
        }
        if (keyType == KEY_TYPE_ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(getKey32(operator, tag)).toBytes();
        }
        revert IKeyManager.KeyManager_InvalidKeyType();
    }

    function getOperator(
        bytes memory key
    ) public view returns (address) {
        return _getKeyManagerStorage()._operatorByKeyHash[keccak256(key)];
    }

    function getKeyTagsAt(address operator, uint48 timestamp, bytes memory hint) public view returns (uint8[] memory) {
        return
            uint128(_getKeyManagerStorage()._operatorKeyTags[operator].upperLookupRecent(timestamp, hint)).deserialize();
    }

    function getKeyTags(
        address operator
    ) public view returns (uint8[] memory) {
        return uint128(_getKeyManagerStorage()._operatorKeyTags[operator].latest()).deserialize();
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
        uint8 keyTag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) public {
        IKeyManager.KeyManagerStorage storage $ = _getKeyManagerStorage();

        bytes32 keyHash = keccak256(key);
        if (
            !verifyKey(
                keyTag,
                key,
                signature,
                extraData,
                abi.encode(hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, operator, keyHash))))
            )
        ) {
            revert IKeyManager.KeyManager_InvalidKeySignature();
        }

        // Disallow usage between different operators
        // Disallow usage of the same key on the same type on different tags
        // Allow usage of the old key on the same type and tag
        uint8 type_ = keyTag.getType();
        address operatorByCompressedKey = $._operatorByKeyHash[keyHash];
        if (operatorByCompressedKey != address(0)) {
            if (operatorByCompressedKey != operator) {
                revert IKeyManager.KeyManager_AlreadyUsed();
            }
            if (
                $._operatorByTypeAndKeyHash[type_][keyHash] != address(0)
                    && $._operatorByTagAndKeyHash[keyTag][keyHash] == address(0)
            ) {
                revert IKeyManager.KeyManager_AlreadyUsed();
            }
        }

        $._operatorByKeyHash[keyHash] = operator;
        $._operatorByTypeAndKeyHash[type_][keyHash] = operator;
        $._operatorByTagAndKeyHash[keyTag][keyHash] = operator;

        $._operators.add(Time.timestamp(), operator);
        $._operatorKeyTags[operator].push(Time.timestamp(), uint128($._operatorKeyTags[operator].latest()).add(keyTag));
        setKey(operator, keyTag, key);
    }

    function setKey(address operator, uint8 keyTag, bytes memory key) public {
        uint8 type_ = keyTag.getType();
        if (type_ == KEY_TYPE_BLS_BN254) {
            setKey32(operator, keyTag, KeyBlsBn254.fromBytes(key).serialize());
            return;
        }
        if (type_ == KEY_TYPE_ECDSA_SECP256K1) {
            setKey32(operator, keyTag, KeyEcdsaSecp256k1.fromBytes(key).serialize());
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

    function verifyKey(
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData,
        bytes memory message
    ) public view returns (bool) {
        uint8 type_ = tag.getType();
        if (type_ == KEY_TYPE_BLS_BN254) {
            return SigBlsBn254.verify(key, message, signature, extraData);
        }
        if (type_ == KEY_TYPE_ECDSA_SECP256K1) {
            return SigEcdsaSecp256k1.verify(key, message, signature, extraData);
        }
        return false;
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
}

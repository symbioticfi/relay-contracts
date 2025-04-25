// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {InputNormalizer} from "../libraries/utils/InputNormalizer.sol";
import {PersistentSet} from "../libraries/structs/PersistentSet.sol";

import {KeyTag} from "../libraries/utils/KeyTag.sol";
import {KeyBlsBn254} from "../libraries/keys/KeyBlsBn254.sol";
import {KeyEcdsaSecp256k1} from "../libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyEddsaCurve25519} from "../libraries/keys/KeyEddsaCurve25519.sol";
import {SigBlsBn254} from "../libraries/sigs/SigBlsBn254.sol";
import {SigEcdsaSecp256k1} from "../libraries/sigs/SigEcdsaSecp256k1.sol";
import {SigEddsaCurve25519} from "../libraries/sigs/SigEddsaCurve25519.sol";

import {IBaseKeyManager} from "../../interfaces/base/IBaseKeyManager.sol";

abstract contract KeyManager is EIP712Upgradeable, IBaseKeyManager {
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

    error KeyManager_InvalidKeyType();
    error KeyManager_Duplicate();
    error KeyManager_MissingRequiredKeyTag();
    error KeyManager_InvalidBLSKeySignature();
    error KeyManager_InvalidECDSAKeySignature();
    error KeyManager_InvalidEdDSAKeySignature();
    error KeyManager_AlreadyUsed();
    error KeyManager_OnlyPredeterminedKeyTagsAllowed();

    enum KeyType {
        BLS_BN254,
        ECDSA_SECP256K1,
        EDDSA_CURVE25519
    }

    struct KeyWithSignature {
        uint8 tag;
        bytes key;
        bytes signature;
        bytes extraData;
    }

    struct OperatorRequiredKeysHints {
        bytes requiredKeyTagsHint;
        bytes[] requiredKeysHints;
    }

    struct RequiredKeysHints {
        bytes[] operatorsHints;
        bytes[] operatorRequiredKeysHints;
    }

    struct KeyManagerInitParams {
        string name;
        string version;
        uint8[] requiredKeyTags;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.KeyManager
    struct KeyManagerStorage {
        Checkpoints.Trace208 _requiredKeyTags;
        mapping(address => mapping(uint8 => Checkpoints.Trace256)) _keys32;
        mapping(address => mapping(uint8 => Checkpoints.Trace512)) _keys64;
        mapping(bytes32 => address) _operatorByKeyHash;
        mapping(KeyType => mapping(bytes32 => address)) _operatorByTypeAndKeyHash;
        mapping(uint8 => mapping(bytes32 => address)) _operatorByTagAndKeyHash;
        PersistentSet.AddressSet _operators;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerLocation = 0x933223a21808ea6583da836861e2265bfa3c7e3b9070740cd75dc9ff6fb41700;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    /**
     * @notice Internal helper to access the VaultManager storage struct
     * @dev Uses assembly to load storage location from a constant slot
     * @return $ Config pointer to the VaultManagerConfig struct
     */
    function _getKeyManagerStorage() internal pure returns (KeyManagerStorage storage $) {
        assembly {
            $.slot := KeyManagerLocation
        }
    }

    function __KeyManager_init(
        KeyManagerInitParams memory initParams
    ) internal virtual onlyInitializing {
        KeyManagerStorage storage $ = _getKeyManagerStorage();
        $._requiredKeyTags.push(Time.timestamp(), _serializeRequiredKeyTags(initParams.requiredKeyTags));
    }

    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (uint8[] memory requiredKeyTags) {
        return _deserializeRequiredKeyTags(_getKeyManagerStorage()._requiredKeyTags.upperLookupRecent(timestamp, hint));
    }

    function getRequiredKeyTags() public view virtual returns (uint8[] memory requiredKeyTags) {
        return _deserializeRequiredKeyTags(_getKeyManagerStorage()._requiredKeyTags.latest());
    }

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bytes memory) {
        KeyType keyType = KeyType(tag.getType());
        if (keyType == KeyType.BLS_BN254) {
            return KeyBlsBn254.deserialize(_getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        if (keyType == KeyType.ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(_getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        if (keyType == KeyType.EDDSA_CURVE25519) {
            return KeyEddsaCurve25519.deserialize(_getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        revert KeyManager_InvalidKeyType();
    }

    function getKey(address operator, uint8 tag) public view virtual returns (bytes memory) {
        KeyType keyType = KeyType(tag.getType());
        if (keyType == KeyType.BLS_BN254) {
            return KeyBlsBn254.deserialize(_getKey32(operator, tag)).toBytes();
        }
        if (keyType == KeyType.ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(_getKey32(operator, tag)).toBytes();
        }
        if (keyType == KeyType.EDDSA_CURVE25519) {
            return KeyEddsaCurve25519.deserialize(_getKey32(operator, tag)).toBytes();
        }
        revert KeyManager_InvalidKeyType();
    }

    function getOperator(
        bytes memory key
    ) public view virtual returns (address) {
        return _getKeyManagerStorage()._operatorByKeyHash[keccak256(key)];
    }

    function getRequiredKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (Key[] memory requiredKeys) {
        OperatorRequiredKeysHints memory operatorRequiredKeysHints;
        if (hints.length > 0) {
            operatorRequiredKeysHints = abi.decode(hints, (OperatorRequiredKeysHints));
        }

        uint8[] memory requiredKeyTags = getRequiredKeyTagsAt(timestamp, operatorRequiredKeysHints.requiredKeyTagsHint);
        requiredKeys = new Key[](requiredKeyTags.length);
        operatorRequiredKeysHints.requiredKeysHints =
            operatorRequiredKeysHints.requiredKeysHints.normalize(requiredKeyTags.length);
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            requiredKeys[i] = Key({
                tag: requiredKeyTags[i],
                payload: getKeyAt(operator, requiredKeyTags[i], timestamp, operatorRequiredKeysHints.requiredKeysHints[i])
            });
        }
    }

    function getRequiredKeys(
        address operator
    ) public view virtual returns (Key[] memory requiredKeys) {
        uint8[] memory requiredKeyTags = getRequiredKeyTags();
        requiredKeys = new Key[](requiredKeyTags.length);
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            requiredKeys[i] = Key({tag: requiredKeyTags[i], payload: getKey(operator, requiredKeyTags[i])});
        }
    }

    function getRequiredKeysAt(
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (OperatorWithKeys[] memory requiredKeys) {
        RequiredKeysHints memory requiredKeysHints;
        if (hints.length > 0) {
            requiredKeysHints = abi.decode(hints, (RequiredKeysHints));
        }

        address[] memory operators = _getKeysOperatorsAt(timestamp, requiredKeysHints.operatorsHints);
        requiredKeysHints.operatorRequiredKeysHints =
            requiredKeysHints.operatorRequiredKeysHints.normalize(operators.length);
        requiredKeys = new OperatorWithKeys[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            requiredKeys[i].operator = operators[i];
            requiredKeys[i].keys =
                getRequiredKeysAt(operators[i], timestamp, requiredKeysHints.operatorRequiredKeysHints[i]);
        }
    }

    function getRequiredKeys() public view virtual returns (OperatorWithKeys[] memory requiredKeys) {
        address[] memory operators = _getKeysOperators();
        requiredKeys = new OperatorWithKeys[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            requiredKeys[i].operator = operators[i];
            requiredKeys[i].keys = getRequiredKeys(operators[i]);
        }
    }

    function _getKeysOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (address[] memory operators) {
        return _getKeyManagerStorage()._operators.values(timestamp, hints);
    }

    function _getKeysOperators() internal view virtual returns (address[] memory operators) {
        return _getKeyManagerStorage()._operators.values();
    }

    function _getKeysOperatorsLengthAt(uint48 timestamp, bytes memory hint) internal view virtual returns (uint256) {
        return _getKeyManagerStorage()._operators.length(timestamp, hint);
    }

    function _getKeysOperatorsLength() internal view virtual returns (uint256) {
        return _getKeyManagerStorage()._operators.length();
    }

    function _setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal virtual {
        _getKeyManagerStorage()._requiredKeyTags.push(Time.timestamp(), _serializeRequiredKeyTags(requiredKeyTags));
    }

    function _registerKeys(address operator, KeyWithSignature[] memory keysWithSignatures) internal virtual {
        uint128 inputtedTags;
        uint8[] memory requiredKeyTags = getRequiredKeyTags();
        for (uint256 i; i < keysWithSignatures.length; ++i) {
            KeyWithSignature memory keyWithSignature = keysWithSignatures[i];

            if ((inputtedTags >> keyWithSignature.tag) & 1 == 1) {
                revert KeyManager_Duplicate();
            }

            _setKey(
                operator,
                keyWithSignature.tag,
                keyWithSignature.key,
                keyWithSignature.signature,
                keyWithSignature.extraData
            );

            inputtedTags |= uint128(1 << keyWithSignature.tag);
        }

        for (uint256 i; i < requiredKeyTags.length; ++i) {
            if ((inputtedTags >> requiredKeyTags[i]) & 1 == 0) {
                revert KeyManager_MissingRequiredKeyTag();
            }
        }

        _getKeyManagerStorage()._operators.add(Time.timestamp(), operator);
    }

    function _setKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) internal virtual {
        KeyManagerStorage storage $ = _getKeyManagerStorage();

        bytes32 keyHash = keccak256(key);
        _setKey(
            operator,
            tag,
            key,
            signature,
            extraData,
            abi.encode(_hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, operator, keyHash))))
        );

        // Disallow usage between different operators
        // Disallow usage of the same key on the same type on different tags
        // Allow usage of the old key on the same type and tag
        KeyType type_ = KeyType(tag.getType());
        address operatorByCompressedKey = $._operatorByKeyHash[keyHash];
        if (operatorByCompressedKey != address(0)) {
            if (operatorByCompressedKey != operator) {
                revert KeyManager_AlreadyUsed();
            }
            if (
                $._operatorByTypeAndKeyHash[type_][keyHash] != address(0)
                    && $._operatorByTagAndKeyHash[tag][keyHash] == address(0)
            ) {
                revert KeyManager_AlreadyUsed();
            }
        }

        $._operatorByKeyHash[keyHash] = operator;
        $._operatorByTypeAndKeyHash[type_][keyHash] = operator;
        $._operatorByTagAndKeyHash[tag][keyHash] = operator;
    }

    function _setKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData,
        bytes memory keyOwnershipMessage
    ) internal virtual {
        KeyType type_ = KeyType(tag.getType());
        if (type_ == KeyType.BLS_BN254) {
            if (!SigBlsBn254.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert KeyManager_InvalidBLSKeySignature();
            }
            _setKey32(operator, tag, KeyBlsBn254.fromBytes(key).serialize());
            return;
        }
        if (type_ == KeyType.ECDSA_SECP256K1) {
            if (!SigEcdsaSecp256k1.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert KeyManager_InvalidECDSAKeySignature();
            }
            _setKey32(operator, tag, KeyEcdsaSecp256k1.fromBytes(key).serialize());
            return;
        }
        if (type_ == KeyType.EDDSA_CURVE25519) {
            if (!SigEddsaCurve25519.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert KeyManager_InvalidEdDSAKeySignature();
            }
            _setKey32(operator, tag, KeyEddsaCurve25519.fromBytes(key).serialize());
            return;
        }
        revert KeyManager_InvalidKeyType();
    }

    function _setKey32(address operator, uint8 tag, bytes memory key) internal {
        bytes32 compressedKey = abi.decode(key, (bytes32));
        _getKeyManagerStorage()._keys32[operator][tag].push(Time.timestamp(), uint256(compressedKey));
    }

    function _setKey64(address operator, uint8 tag, bytes memory key) internal {
        (bytes32 compressedKey1, bytes32 compressedKey2) = abi.decode(key, (bytes32, bytes32));
        _getKeyManagerStorage()._keys64[operator][tag].push(
            Time.timestamp(), [uint256(compressedKey1), uint256(compressedKey2)]
        );
    }

    function _getKey32At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (bytes memory) {
        uint256 compressedKey = _getKeyManagerStorage()._keys32[operator][tag].upperLookupRecent(timestamp, hint);
        return abi.encode(compressedKey);
    }

    function _getKey32(address operator, uint8 tag) internal view returns (bytes memory) {
        uint256 compressedKey = _getKeyManagerStorage()._keys32[operator][tag].latest();
        return abi.encode(compressedKey);
    }

    function _getKey64At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (bytes memory) {
        uint256[2] memory compressedKeys =
            _getKeyManagerStorage()._keys64[operator][tag].upperLookupRecent(timestamp, hint);
        return abi.encode(compressedKeys[0], compressedKeys[1]);
    }

    function _getKey64(address operator, uint8 tag) internal view returns (bytes memory) {
        uint256[2] memory compressedKeys = _getKeyManagerStorage()._keys64[operator][tag].latest();
        return abi.encode(compressedKeys[0], compressedKeys[1]);
    }

    function _serializeRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal pure returns (uint208 requiredKeyTagsData) {
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            if (requiredKeyTags[i].getType() > uint8(type(KeyType).max)) {
                revert KeyManager_OnlyPredeterminedKeyTagsAllowed();
            }
            if ((requiredKeyTagsData >> requiredKeyTags[i]) & 1 == 1) {
                revert KeyManager_Duplicate();
            }
            requiredKeyTagsData |= uint208(1 << requiredKeyTags[i]);
        }
    }

    function _deserializeRequiredKeyTags(
        uint208 requiredKeyTagsData
    ) internal pure returns (uint8[] memory requiredKeyTags) {
        uint8 length;
        requiredKeyTags = new uint8[](KeyTag.TOTAL_KEY_TAGS);
        for (uint8 i; i < KeyTag.TOTAL_KEY_TAGS; ++i) {
            if ((requiredKeyTagsData >> i) & 1 == 1) {
                requiredKeyTags[length++] = i;
            }
        }
        assembly ("memory-safe") {
            mstore(requiredKeyTags, length)
        }
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";

import {KeyTag} from "../libraries/utils/KeyTag.sol";
import {KeyBlsBn254} from "../libraries/keys/KeyBlsBn254.sol";
import {KeyEcdsaSecp256k1} from "../libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyEddsaCurve25519} from "../libraries/keys/KeyEddsaCurve25519.sol";
import {SigBlsBn254} from "../libraries/sigs/SigBlsBn254.sol";
import {SigEcdsaSecp256k1} from "../libraries/sigs/SigEcdsaSecp256k1.sol";
import {SigEddsaCurve25519} from "../libraries/sigs/SigEddsaCurve25519.sol";

abstract contract KeyManager is EIP712Upgradeable {
    using KeyTag for uint8;
    using Checkpoints for Checkpoints.Trace208;
    using Checkpoints for Checkpoints.Trace256;
    using Checkpoints for Checkpoints.Trace512;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using KeyEddsaCurve25519 for KeyEddsaCurve25519.KEY_EDDSA_CURVE25519;

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

    struct RequiredKeysHints {
        bytes requiredKeyTagsHint;
        bytes[][] requiredKeysHints;
    }

    struct Key {
        uint8 tag;
        bytes payload;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.VaultManager
    struct KeyManagerConfig {
        Checkpoints.Trace208 _requiredKeyTags;
        mapping(address => mapping(uint8 => Checkpoints.Trace256)) _keys32;
        mapping(address => mapping(uint8 => Checkpoints.Trace512)) _keys64;
        mapping(bytes32 => address) _operatorByKeyHash;
        mapping(KeyType => mapping(bytes32 => address)) _operatorByTypeAndKeyHash;
        mapping(uint8 => mapping(bytes32 => address)) _operatorByTagAndKeyHash;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerLocation = 0x933223a21808ea6583da836861e2265bfa3c7e3b9070740cd75dc9ff6fb41700;

    bytes32 private constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    /**
     * @notice Internal helper to access the VaultManager storage struct
     * @dev Uses assembly to load storage location from a constant slot
     * @return $ Config pointer to the VaultManagerConfig struct
     */
    function _getKeyManagerConfig() internal pure returns (KeyManagerConfig storage $) {
        assembly {
            $.slot := KeyManagerLocation
        }
    }

    function __KeyManager_init(
        string memory name,
        string memory version,
        uint8[] memory requiredKeyTags
    ) internal virtual onlyInitializing {
        __EIP712_init(name, version);
        KeyManagerConfig storage $ = _getKeyManagerConfig();
        $._requiredKeyTags.push(Time.timestamp(), _compressedRequiredKeyTags(requiredKeyTags));
    }

    function _getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (uint8[] memory requiredKeyTags) {
        uint128 compressedRequiredKeyTags =
            uint128(_getKeyManagerConfig()._requiredKeyTags.upperLookupRecent(timestamp, hint));
        uint8 length;
        requiredKeyTags = new uint8[](KeyTag.TOTAL_KEY_TAGS);
        for (uint8 i; i < KeyTag.TOTAL_KEY_TAGS; ++i) {
            if ((compressedRequiredKeyTags >> i) & 1 == 1) {
                requiredKeyTags[length++] = i;
            }
        }
        assembly ("memory-safe") {
            mstore(requiredKeyTags, length)
        }
    }

    function _getRequiredKeyTags() internal view returns (uint8[] memory requiredKeyTags) {
        uint128 compressedRequiredKeyTags = uint128(_getKeyManagerConfig()._requiredKeyTags.latest());

        uint8 length;
        requiredKeyTags = new uint8[](KeyTag.TOTAL_KEY_TAGS);
        for (uint8 i; i < KeyTag.TOTAL_KEY_TAGS; ++i) {
            if ((compressedRequiredKeyTags >> i) & 1 == 1) {
                requiredKeyTags[length++] = i;
            }
        }
        assembly ("memory-safe") {
            mstore(requiredKeyTags, length)
        }
    }

    function _getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (bytes memory) {
        KeyType type_ = KeyType(tag.getType());
        if (type_ == KeyType.BLS_BN254) {
            return KeyBlsBn254.deserialize(_getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        if (type_ == KeyType.ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(_getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        if (type_ == KeyType.EDDSA_CURVE25519) {
            return KeyEddsaCurve25519.deserialize(_getKey32At(operator, tag, timestamp, hint)).toBytes();
        }
        revert("Invalid key type");
    }

    function _getKey(address operator, uint8 tag) internal view returns (bytes memory) {
        KeyType type_ = KeyType(tag.getType());
        if (type_ == KeyType.BLS_BN254) {
            return KeyBlsBn254.deserialize(_getKey32(operator, tag)).toBytes();
        }
        if (type_ == KeyType.ECDSA_SECP256K1) {
            return KeyEcdsaSecp256k1.deserialize(_getKey32(operator, tag)).toBytes();
        }
        if (type_ == KeyType.EDDSA_CURVE25519) {
            return KeyEddsaCurve25519.deserialize(_getKey32(operator, tag)).toBytes();
        }
        revert("Invalid key type");
    }

    function _getOperator(
        bytes memory key
    ) internal view returns (address) {
        return _getKeyManagerConfig()._operatorByKeyHash[keccak256(key)];
    }

    function _getRequiredKeysAt(
        address[] memory operators,
        uint48 timestamp,
        bytes memory hints
    ) internal view returns (Key[] memory requiredKeys) {
        RequiredKeysHints memory requiredKeysHints;
        if (hints.length > 0) {
            requiredKeysHints = abi.decode(hints, (RequiredKeysHints));
        }

        uint8[] memory requiredKeyTags = _getRequiredKeyTagsAt(timestamp, requiredKeysHints.requiredKeyTagsHint);
        requiredKeys = new Key[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            for (uint8 j; j < requiredKeyTags.length; ++j) {
                requiredKeys[i] = Key({
                    tag: requiredKeyTags[j],
                    payload: _getKeyAt(
                        operators[i], requiredKeyTags[j], timestamp, requiredKeysHints.requiredKeysHints[i][j]
                    )
                });
            }
        }
    }

    function _getRequiredKeys(
        address[] memory operators
    ) internal view returns (Key[] memory requiredKeys) {
        uint8[] memory requiredKeyTags = _getRequiredKeyTags();
        requiredKeys = new Key[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            for (uint8 j; j < requiredKeyTags.length; ++j) {
                requiredKeys[i] = Key({tag: requiredKeyTags[j], payload: _getKey(operators[i], requiredKeyTags[j])});
            }
        }
    }

    function _setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public {
        _getKeyManagerConfig()._requiredKeyTags.push(Time.timestamp(), _compressedRequiredKeyTags(requiredKeyTags));
    }

    function _registerKeys(address operator, KeyWithSignature[] memory keysWithSignatures) public {
        uint128 inputtedTags;
        uint8[] memory requiredKeyTags = _getRequiredKeyTags();
        for (uint256 i; i < keysWithSignatures.length; ++i) {
            KeyWithSignature memory keyWithSignature = keysWithSignatures[i];

            if ((inputtedTags >> keyWithSignature.tag) & 1 == 1) {
                revert("Duplicate");
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
                revert("Missing required key tag");
            }
        }
    }

    function _setKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) internal virtual {
        KeyManagerConfig storage self = _getKeyManagerConfig();

        KeyType type_ = KeyType(tag.getType());

        bytes32 keyHash = keccak256(key);
        bytes memory keyOwnershipMessage =
            abi.encode(_hashTypedDataV4(keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, operator, keyHash))));
        if (type_ == KeyType.BLS_BN254) {
            if (!SigBlsBn254.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert("Invalid BLS pubkey signature");
            }
            _setKey32(operator, tag, KeyBlsBn254.fromBytes(key).serialize());
        } else if (type_ == KeyType.ECDSA_SECP256K1) {
            if (!SigEcdsaSecp256k1.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert("Invalid ECDSA pubkey signature");
            }
            _setKey32(operator, tag, KeyEcdsaSecp256k1.fromBytes(key).serialize());
        } else if (type_ == KeyType.EDDSA_CURVE25519) {
            if (!SigEddsaCurve25519.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert("Invalid EdDSA pubkey signature");
            }
            _setKey32(operator, tag, KeyEddsaCurve25519.fromBytes(key).serialize());
        } else {
            revert("Invalid key type");
        }

        // Disallow usage between different operators
        // Disallow usage of the same key on the same type on different tags
        // Allow usage of the old key on the same type and tag
        address operatorByCompressedKey = self._operatorByKeyHash[keyHash];
        if (operatorByCompressedKey != address(0)) {
            if (operatorByCompressedKey != operator) {
                revert("Already used");
            }
            if (
                self._operatorByTypeAndKeyHash[type_][keyHash] != address(0)
                    && self._operatorByTagAndKeyHash[tag][keyHash] == address(0)
            ) {
                revert("Already used");
            }
        }

        self._operatorByKeyHash[keyHash] = operator;
        self._operatorByTypeAndKeyHash[type_][keyHash] = operator;
        self._operatorByTagAndKeyHash[tag][keyHash] = operator;
    }

    function _setKey32(address operator, uint8 tag, bytes memory key) internal {
        bytes32 compressedKey = abi.decode(key, (bytes32));
        _getKeyManagerConfig()._keys32[operator][tag].push(Time.timestamp(), uint256(compressedKey));
    }

    function _setKey64(address operator, uint8 tag, bytes memory key) internal {
        (bytes32 compressedKey1, bytes32 compressedKey2) = abi.decode(key, (bytes32, bytes32));
        _getKeyManagerConfig()._keys64[operator][tag].push(
            Time.timestamp(), [uint256(compressedKey1), uint256(compressedKey2)]
        );
    }

    function _getKey32At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (bytes memory) {
        uint256 compressedKey = _getKeyManagerConfig()._keys32[operator][tag].upperLookupRecent(timestamp, hint);
        return abi.encode(compressedKey);
    }

    function _getKey32(address operator, uint8 tag) internal view returns (bytes memory) {
        uint256 compressedKey = _getKeyManagerConfig()._keys32[operator][tag].latest();
        return abi.encode(compressedKey);
    }

    function _getKey64At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (bytes memory) {
        uint256[2] memory compressedKeys =
            _getKeyManagerConfig()._keys64[operator][tag].upperLookupRecent(timestamp, hint);
        return abi.encode(compressedKeys[0], compressedKeys[1]);
    }

    function _getKey64(address operator, uint8 tag) internal view returns (bytes memory) {
        uint256[2] memory compressedKeys = _getKeyManagerConfig()._keys64[operator][tag].latest();
        return abi.encode(compressedKeys[0], compressedKeys[1]);
    }

    function _compressedRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal pure returns (uint128 compressedRequiredKeyTags) {
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            if (requiredKeyTags[i].getType() > uint8(type(KeyType).max)) {
                revert("Only predetermined key tags are allowed");
            }
            if ((compressedRequiredKeyTags >> requiredKeyTags[i]) & 1 == 1) {
                revert("Duplicate");
            }
            compressedRequiredKeyTags |= uint128(1 << requiredKeyTags[i]);
        }
    }
}

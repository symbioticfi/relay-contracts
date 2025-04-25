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
    bytes32 private constant KeyManagerLocation = 0x933223a21808ea6583da836861e2265bfa3c7e3b9070740cd75dc9ff6fb41700;

    bytes32 public constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    function _getKeyManagerStorage() internal pure returns (IKeyManager.KeyManagerStorage storage $) {
        assembly {
            $.slot := KeyManagerLocation
        }
    }

    function initialize(
        IKeyManager.KeyManagerInitParams memory initParams
    ) public {
        IKeyManager.KeyManagerStorage storage $ = _getKeyManagerStorage();
        $._requiredKeyTags.push(Time.timestamp(), serializeRequiredKeyTags(initParams.requiredKeyTags));
    }

    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view returns (uint8[] memory requiredKeyTags) {
        return deserializeRequiredKeyTags(_getKeyManagerStorage()._requiredKeyTags.upperLookupRecent(timestamp, hint));
    }

    function getRequiredKeyTags() public view returns (uint8[] memory requiredKeyTags) {
        return deserializeRequiredKeyTags(_getKeyManagerStorage()._requiredKeyTags.latest());
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

    function getRequiredKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IBaseKeyManager.Key[] memory requiredKeys) {
        IKeyManager.OperatorRequiredKeysHints memory operatorRequiredKeysHints;
        if (hints.length > 0) {
            operatorRequiredKeysHints = abi.decode(hints, (IKeyManager.OperatorRequiredKeysHints));
        }

        uint8[] memory requiredKeyTags = getRequiredKeyTagsAt(timestamp, operatorRequiredKeysHints.requiredKeyTagsHint);
        requiredKeys = new IBaseKeyManager.Key[](requiredKeyTags.length);
        operatorRequiredKeysHints.requiredKeysHints =
            operatorRequiredKeysHints.requiredKeysHints.normalize(requiredKeyTags.length);
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            requiredKeys[i] = IBaseKeyManager.Key({
                tag: requiredKeyTags[i],
                payload: getKeyAt(operator, requiredKeyTags[i], timestamp, operatorRequiredKeysHints.requiredKeysHints[i])
            });
        }
    }

    function getRequiredKeys(
        address operator
    ) public view returns (IBaseKeyManager.Key[] memory requiredKeys) {
        uint8[] memory requiredKeyTags = getRequiredKeyTags();
        requiredKeys = new IBaseKeyManager.Key[](requiredKeyTags.length);
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            requiredKeys[i] =
                IBaseKeyManager.Key({tag: requiredKeyTags[i], payload: getKey(operator, requiredKeyTags[i])});
        }
    }

    function getRequiredKeysAt(
        uint48 timestamp,
        bytes memory hints
    ) public view returns (IBaseKeyManager.OperatorWithKeys[] memory requiredKeys) {
        IKeyManager.RequiredKeysHints memory requiredKeysHints;
        if (hints.length > 0) {
            requiredKeysHints = abi.decode(hints, (IKeyManager.RequiredKeysHints));
        }

        address[] memory operators = getKeysOperatorsAt(timestamp, requiredKeysHints.operatorsHints);
        requiredKeysHints.operatorRequiredKeysHints =
            requiredKeysHints.operatorRequiredKeysHints.normalize(operators.length);
        requiredKeys = new IBaseKeyManager.OperatorWithKeys[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            requiredKeys[i].operator = operators[i];
            requiredKeys[i].keys =
                getRequiredKeysAt(operators[i], timestamp, requiredKeysHints.operatorRequiredKeysHints[i]);
        }
    }

    function getRequiredKeys() public view returns (IBaseKeyManager.OperatorWithKeys[] memory requiredKeys) {
        address[] memory operators = getKeysOperators();
        requiredKeys = new IBaseKeyManager.OperatorWithKeys[](operators.length);
        for (uint256 i; i < operators.length; ++i) {
            requiredKeys[i].operator = operators[i];
            requiredKeys[i].keys = getRequiredKeys(operators[i]);
        }
    }

    function getKeysOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) public view returns (address[] memory operators) {
        return _getKeyManagerStorage()._operators.values(timestamp, hints);
    }

    function getKeysOperators() public view returns (address[] memory operators) {
        return _getKeyManagerStorage()._operators.values();
    }

    function getKeysOperatorsLengthAt(uint48 timestamp, bytes memory hint) public view returns (uint256) {
        return _getKeyManagerStorage()._operators.length(timestamp, hint);
    }

    function getKeysOperatorsLength() public view returns (uint256) {
        return _getKeyManagerStorage()._operators.length();
    }

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public {
        _getKeyManagerStorage()._requiredKeyTags.push(Time.timestamp(), serializeRequiredKeyTags(requiredKeyTags));
    }

    function registerKeys(
        function (bytes32) external returns (bytes32) hashTypedDataV4,
        address operator,
        IKeyManager.KeyWithSignature[] memory keysWithSignatures
    ) public {
        uint128 inputtedTags;
        uint8[] memory requiredKeyTags = getRequiredKeyTags();
        for (uint256 i; i < keysWithSignatures.length; ++i) {
            IKeyManager.KeyWithSignature memory keyWithSignature = keysWithSignatures[i];

            if ((inputtedTags >> keyWithSignature.tag) & 1 == 1) {
                revert IKeyManager.KeyManager_Duplicate();
            }

            setKey(
                hashTypedDataV4,
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
                revert IKeyManager.KeyManager_MissingRequiredKeyTag();
            }
        }

        _getKeyManagerStorage()._operators.add(Time.timestamp(), operator);
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
        setKey(
            operator,
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
    }

    function setKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData,
        bytes memory keyOwnershipMessage
    ) public {
        IKeyManager.KeyType type_ = IKeyManager.KeyType(tag.getType());
        if (type_ == IKeyManager.KeyType.BLS_BN254) {
            if (!SigBlsBn254.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert IKeyManager.KeyManager_InvalidBLSKeySignature();
            }
            setKey32(operator, tag, KeyBlsBn254.fromBytes(key).serialize());
            return;
        }
        if (type_ == IKeyManager.KeyType.ECDSA_SECP256K1) {
            if (!SigEcdsaSecp256k1.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert IKeyManager.KeyManager_InvalidECDSAKeySignature();
            }
            setKey32(operator, tag, KeyEcdsaSecp256k1.fromBytes(key).serialize());
            return;
        }
        if (type_ == IKeyManager.KeyType.EDDSA_CURVE25519) {
            if (!SigEddsaCurve25519.verify(key, keyOwnershipMessage, signature, extraData)) {
                revert IKeyManager.KeyManager_InvalidEdDSAKeySignature();
            }
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

    function serializeRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public pure returns (uint208 requiredKeyTagsData) {
        for (uint256 i; i < requiredKeyTags.length; ++i) {
            if (requiredKeyTags[i].getType() > uint8(type(IKeyManager.KeyType).max)) {
                revert IKeyManager.KeyManager_OnlyPredeterminedKeyTagsAllowed();
            }
            if ((requiredKeyTagsData >> requiredKeyTags[i]) & 1 == 1) {
                revert IKeyManager.KeyManager_Duplicate();
            }
            requiredKeyTagsData |= uint208(1 << requiredKeyTags[i]);
        }
    }

    function deserializeRequiredKeyTags(
        uint208 requiredKeyTagsData
    ) public pure returns (uint8[] memory requiredKeyTags) {
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

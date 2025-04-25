// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBaseKeyManager} from "./IBaseKeyManager.sol";

import {Checkpoints} from "../../contracts/libraries/structs/Checkpoints.sol";
import {PersistentSet} from "../../contracts/libraries/structs/PersistentSet.sol";

interface IKeyManager is IBaseKeyManager {
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

    struct KeyManagerInitParams {
        string name;
        string version;
        uint8[] requiredKeyTags;
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

    function KeyManager_VERSION() external view returns (uint64);

    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) external view returns (uint8[] memory requiredKeyTags);

    function getRequiredKeyTags() external view returns (uint8[] memory requiredKeyTags);

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bytes memory key);

    function getKey(address operator, uint8 tag) external view returns (bytes memory key);

    function getOperator(
        bytes memory key
    ) external view returns (address operator);

    function getRequiredKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (Key[] memory requiredKeys);

    function getRequiredKeys(
        address operator
    ) external view returns (Key[] memory requiredKeys);

    function getRequiredKeysAt(
        uint48 timestamp,
        bytes memory hints
    ) external view returns (OperatorWithKeys[] memory requiredKeys);

    function getRequiredKeys() external view returns (OperatorWithKeys[] memory requiredKeys);
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBaseKeyManager} from "./IBaseKeyManager.sol";

import {Checkpoints} from "../../contracts/libraries/structs/Checkpoints.sol";
import {PersistentSet} from "../../contracts/libraries/structs/PersistentSet.sol";

interface IKeyManager is IBaseKeyManager {
    error KeyManager_InvalidKeyType();
    error KeyManager_Duplicate();
    error KeyManager_InvalidKeySignature();
    error KeyManager_AlreadyUsed();
    error KeyManager_OnlyPredeterminedKeyTagsAllowed();

    /// @custom:storage-location erc7201:symbiotic.storage.KeyManager
    struct KeyManagerStorage {
        mapping(address => mapping(uint8 => Checkpoints.Trace256)) _keys32;
        mapping(address => mapping(uint8 => Checkpoints.Trace512)) _keys64;
        mapping(bytes32 => address) _operatorByKeyHash;
        mapping(uint8 => mapping(bytes32 => address)) _operatorByTypeAndKeyHash;
        mapping(uint8 => mapping(bytes32 => address)) _operatorByTagAndKeyHash;
        PersistentSet.AddressSet _operators;
        mapping(address => Checkpoints.Trace208) _operatorKeyTags;
    }

    struct KeyWithSignature {
        uint8 tag;
        bytes key;
        bytes signature;
        bytes extraData;
    }

    struct OperatorKeysHints {
        bytes keyTagsHint;
        bytes[] keyHints;
    }

    struct OperatorsKeysHints {
        bytes[] operatorsHints;
        bytes[] operatorKeysHints;
    }

    function KeyManager_VERSION() external view returns (uint64);

    function KEY_TYPE_BLS_BN254() external view returns (uint8);

    function KEY_TYPE_ECDSA_SECP256K1() external view returns (uint8);

    function TOTAL_KEY_TYPES() external view returns (uint8);

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

    function getKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (Key[] memory keys);

    function getKeys(
        address operator
    ) external view returns (Key[] memory keys);

    function getKeysAt(
        uint48 timestamp,
        bytes memory hints
    ) external view returns (OperatorWithKeys[] memory operatorsKeys);

    function getKeys() external view returns (OperatorWithKeys[] memory operatorsKeys);

    function setKey(uint8 tag, bytes memory key, bytes memory signature, bytes memory extraData) external;
}

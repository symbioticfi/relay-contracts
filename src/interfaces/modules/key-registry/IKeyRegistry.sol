// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Checkpoints} from "../../../contracts/libraries/structs/Checkpoints.sol";
import {PersistentSet} from "../../../contracts/libraries/structs/PersistentSet.sol";

import {IOzEIP712} from "../../modules/base/IOzEIP712.sol";

interface IKeyRegistry {
    error KeyRegistry_InvalidKeyType();
    error KeyRegistry_Duplicate();
    error KeyRegistry_InvalidKeySignature();
    error KeyRegistry_AlreadyUsed();
    error KeyRegistry_OnlyPredeterminedKeyTagsAllowed();

    /// @custom:storage-location erc7201:symbiotic.storage.KeyRegistry
    struct KeyRegistryStorage {
        mapping(address => mapping(uint8 => Checkpoints.Trace256)) _keys32;
        mapping(address => mapping(uint8 => Checkpoints.Trace512)) _keys64;
        mapping(bytes32 => address) _operatorByKeyHash;
        mapping(uint8 => mapping(bytes32 => address)) _operatorByTypeAndKeyHash;
        mapping(uint8 => mapping(bytes32 => address)) _operatorByTagAndKeyHash;
        PersistentSet.AddressSet _operators;
        mapping(address => Checkpoints.Trace208) _operatorKeyTags;
    }

    struct KeyRegistryInitParams {
        IOzEIP712.OzEIP712InitParams ozEip712InitParams;
    }

    struct Key {
        uint8 tag;
        bytes payload;
    }

    struct OperatorWithKeys {
        address operator;
        Key[] keys;
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

    event SetKey(address indexed operator, uint8 indexed tag, bytes indexed key, bytes extraData);

    function getKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (Key[] memory keys);

    function getKeys(
        address operator
    ) external view returns (Key[] memory keys);

    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) external view returns (bytes memory);

    function getKey(address operator, uint8 tag) external view returns (bytes memory);

    function getOperator(
        bytes memory key
    ) external view returns (address);

    function getKeysAt(
        uint48 timestamp
    ) external view returns (OperatorWithKeys[] memory);

    function getKeys() external view returns (OperatorWithKeys[] memory);

    function getKeysOperatorsLength() external view returns (uint256);

    function getKeysOperatorsAt(
        uint48 timestamp
    ) external view returns (address[] memory);

    function getKeysOperators() external view returns (address[] memory);

    function setKey(uint8 tag, bytes memory key, bytes memory signature, bytes memory extraData) external;
}

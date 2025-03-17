// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {INetworkConfig} from "./INetworkConfig.sol";
import {Updatable} from "../contracts/libraries/utils/Updatable.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

interface IOperatorManager {
    struct OperatorManagerInitParams {
        INetworkConfig.NetworkConfigInitParams baseParams;
        uint128 requiredKeyTags;
    }

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        Updatable.Uint208Value _requiredKeyTags;
        mapping(address => mapping(uint8 => Updatable.Bytes32Value)) _keys32;
        mapping(address => mapping(uint8 => Updatable.Bytes64Value)) _keys64;
        mapping(bytes32 => address) _operatorByKeyHash;
        mapping(KeyType => mapping(bytes32 => address)) _operatorByTypeAndKeyHash;
        mapping(uint8 => mapping(bytes32 => address)) _operatorByTagAndKeyHash;
        EnumerableSet.AddressSet _operators;
        mapping(address => Updatable.Uint104Value) _operatorUnpaused;
    }

    enum KeyType {
        BLS_BN254,
        ECDSA_SECP256K1,
        EDDSA_ED25519
    }
    // BLS_BLS12381

    struct KeyWithTag {
        uint8 tag;
        bytes key;
    }
}

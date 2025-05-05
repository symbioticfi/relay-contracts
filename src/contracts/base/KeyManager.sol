// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {MulticallUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/MulticallUpgradeable.sol";

import {Checkpoints} from "../libraries/structs/Checkpoints.sol";
import {InputNormalizer} from "../libraries/utils/InputNormalizer.sol";
import {PersistentSet} from "../libraries/structs/PersistentSet.sol";
import {KeyManagerLogic} from "./logic/KeyManagerLogic.sol";
import {OzEIP712} from "./common/OzEIP712.sol";

import {KeyTag} from "../libraries/utils/KeyTag.sol";
import {KeyBlsBn254} from "../libraries/keys/KeyBlsBn254.sol";
import {KeyEcdsaSecp256k1} from "../libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyEddsaCurve25519} from "../libraries/keys/KeyEddsaCurve25519.sol";

import {IKeyManager} from "../../interfaces/base/IKeyManager.sol";

abstract contract KeyManager is MulticallUpgradeable, OzEIP712, IKeyManager {
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

    /**
     * @inheritdoc IKeyManager
     */
    function KeyManager_VERSION() public pure returns (uint64) {
        return KeyManagerLogic.KeyManager_VERSION;
    }

    function __KeyManager_init() internal virtual onlyInitializing {}

    /**
     * @inheritdoc IKeyManager
     */
    function getKeyAt(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (bytes memory) {
        return KeyManagerLogic.getKeyAt(operator, tag, timestamp, hint);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getKey(address operator, uint8 tag) public view virtual returns (bytes memory) {
        return KeyManagerLogic.getKey(operator, tag);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getOperator(
        bytes memory key
    ) public view virtual returns (address) {
        return KeyManagerLogic.getOperator(key);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (Key[] memory) {
        return KeyManagerLogic.getKeysAt(operator, timestamp, hints);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getKeys(
        address operator
    ) public view virtual returns (Key[] memory) {
        return KeyManagerLogic.getKeys(operator);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getKeysAt(uint48 timestamp, bytes memory hints) public view virtual returns (OperatorWithKeys[] memory) {
        return KeyManagerLogic.getKeysAt(timestamp, hints);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getKeys() public view virtual returns (OperatorWithKeys[] memory) {
        return KeyManagerLogic.getKeys();
    }

    function _getKeysOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (address[] memory) {
        return KeyManagerLogic.getKeysOperatorsAt(timestamp, hints);
    }

    function _getKeysOperators() internal view virtual returns (address[] memory) {
        return KeyManagerLogic.getKeysOperators();
    }

    function _getKeysOperatorsLengthAt(uint48 timestamp, bytes memory hint) internal view virtual returns (uint256) {
        return KeyManagerLogic.getKeysOperatorsLengthAt(timestamp, hint);
    }

    function _getKeysOperatorsLength() internal view virtual returns (uint256) {
        return KeyManagerLogic.getKeysOperatorsLength();
    }

    /**
     * @inheritdoc IKeyManager
     */
    function setKey(uint8 tag, bytes memory key, bytes memory signature, bytes memory extraData) public virtual {
        KeyManagerLogic.setKey(this.hashTypedDataV4, tag, key, signature, extraData);
    }

    function _setKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) internal virtual {
        KeyManagerLogic.setKey(this.hashTypedDataV4, operator, tag, key, signature, extraData);
    }

    function _verifyKey(
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData,
        bytes memory keyOwnershipMessage
    ) internal virtual {
        return KeyManagerLogic.verifyKey(tag, key, signature, extraData, keyOwnershipMessage);
    }

    function _setKey(address operator, uint8 tag, bytes memory key) internal virtual {
        return KeyManagerLogic.setKey(operator, tag, key);
    }

    function _setKey32(address operator, uint8 tag, bytes memory key) internal {
        return KeyManagerLogic.setKey32(operator, tag, key);
    }

    function _setKey64(address operator, uint8 tag, bytes memory key) internal {
        return KeyManagerLogic.setKey64(operator, tag, key);
    }

    function _getKey32At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (bytes memory) {
        return KeyManagerLogic.getKey32At(operator, tag, timestamp, hint);
    }

    function _getKey32(address operator, uint8 tag) internal view returns (bytes memory) {
        return KeyManagerLogic.getKey32(operator, tag);
    }

    function _getKey64At(
        address operator,
        uint8 tag,
        uint48 timestamp,
        bytes memory hint
    ) internal view returns (bytes memory) {
        return KeyManagerLogic.getKey64At(operator, tag, timestamp, hint);
    }

    function _getKey64(address operator, uint8 tag) internal view returns (bytes memory) {
        return KeyManagerLogic.getKey64(operator, tag);
    }

    function _serializeKeyTags(
        uint8[] memory keyTags
    ) internal pure returns (uint208) {
        return KeyManagerLogic.serializeKeyTags(keyTags);
    }

    function _deserializeKeyTags(
        uint208 keyTagsData
    ) internal pure returns (uint8[] memory) {
        return KeyManagerLogic.deserializeKeyTags(keyTagsData);
    }
}

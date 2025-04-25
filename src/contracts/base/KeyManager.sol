// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

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

abstract contract KeyManager is OzEIP712, IKeyManager {
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

    function __KeyManager_init(
        KeyManagerInitParams memory initParams
    ) internal virtual onlyInitializing {
        KeyManagerLogic.initialize(initParams);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getRequiredKeyTagsAt(
        uint48 timestamp,
        bytes memory hint
    ) public view virtual returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.getRequiredKeyTagsAt(timestamp, hint);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getRequiredKeyTags() public view virtual returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.getRequiredKeyTags();
    }

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
    function getRequiredKeysAt(
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (Key[] memory requiredKeys) {
        return KeyManagerLogic.getRequiredKeysAt(operator, timestamp, hints);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getRequiredKeys(
        address operator
    ) public view virtual returns (Key[] memory requiredKeys) {
        return KeyManagerLogic.getRequiredKeys(operator);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getRequiredKeysAt(
        uint48 timestamp,
        bytes memory hints
    ) public view virtual returns (OperatorWithKeys[] memory requiredKeys) {
        return KeyManagerLogic.getRequiredKeysAt(timestamp, hints);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function getRequiredKeys() public view virtual returns (OperatorWithKeys[] memory requiredKeys) {
        return KeyManagerLogic.getRequiredKeys();
    }

    function _getKeysOperatorsAt(
        uint48 timestamp,
        bytes[] memory hints
    ) internal view virtual returns (address[] memory operators) {
        return KeyManagerLogic.getKeysOperatorsAt(timestamp, hints);
    }

    function _getKeysOperators() internal view virtual returns (address[] memory operators) {
        return KeyManagerLogic.getKeysOperators();
    }

    function _getKeysOperatorsLengthAt(uint48 timestamp, bytes memory hint) internal view virtual returns (uint256) {
        return KeyManagerLogic.getKeysOperatorsLengthAt(timestamp, hint);
    }

    function _getKeysOperatorsLength() internal view virtual returns (uint256) {
        return KeyManagerLogic.getKeysOperatorsLength();
    }

    function _setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal virtual {
        KeyManagerLogic.setRequiredKeyTags(requiredKeyTags);
    }

    function _registerKeys(address operator, KeyWithSignature[] memory keysWithSignatures) internal virtual {
        return KeyManagerLogic.registerKeys(this.hashTypedDataV4, operator, keysWithSignatures);
    }

    function _setKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData
    ) internal virtual {
        return KeyManagerLogic.setKey(this.hashTypedDataV4, operator, tag, key, signature, extraData);
    }

    function _setKey(
        address operator,
        uint8 tag,
        bytes memory key,
        bytes memory signature,
        bytes memory extraData,
        bytes memory keyOwnershipMessage
    ) internal virtual {
        return KeyManagerLogic.setKey(operator, tag, key, signature, extraData, keyOwnershipMessage);
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

    function _serializeRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) internal pure returns (uint208 requiredKeyTagsData) {
        return KeyManagerLogic.serializeRequiredKeyTags(requiredKeyTags);
    }

    function _deserializeRequiredKeyTags(
        uint208 requiredKeyTagsData
    ) internal pure returns (uint8[] memory requiredKeyTags) {
        return KeyManagerLogic.deserializeRequiredKeyTags(requiredKeyTagsData);
    }
}

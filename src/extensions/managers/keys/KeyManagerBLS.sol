// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyManager} from "../../../managers/extendable/KeyManager.sol";
import {BLSSig} from "../sigs/BLSSig.sol";

import {PauseableEnumerableSet} from "../../../libraries/PauseableEnumerableSet.sol";
import {BN254} from "../../../libraries/BN254.sol";
import {MerkleLib} from "../../../libraries/Merkle.sol";

import {IKeyManagerBLS} from "../../../interfaces/extensions/managers/keys/IKeyManagerBLS.sol";
import {IKeyManager} from "../../../interfaces/managers/extendable/IKeyManager.sol";

import {Checkpoints} from "@symbiotic/contracts/libraries/Checkpoints.sol";

/**
 * @title KeyManagerBLS
 * @notice Manages storage and validation of operator keys using BLS G1 points
 * @dev Extends KeyManager to provide key management functionality
 */
abstract contract KeyManagerBLS is KeyManager, BLSSig, IKeyManagerBLS {
    using BN254 for BN254.G1Point;
    using PauseableEnumerableSet for PauseableEnumerableSet.Status;
    using MerkleLib for MerkleLib.Tree;
    using Checkpoints for Checkpoints.Trace256;

    /**
     * @inheritdoc IKeyManagerBLS
     */
    uint64 public constant KeyManagerBLS_VERSION = 1;

    // must be same as TREE_DEPTH in MerkleLib.sol
    uint256 private constant _TREE_DEPTH = 16;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.KeyManagerBLS")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant KeyManagerBLSStorageLocation =
        0xd7c6d1e3027b949fd4edf42b481934f7c4e193928cd161b15a475e3400c5ed00;

    function _getKeyManagerBLSStorage() internal pure returns (KeyManagerBLSStorage storage s) {
        bytes32 location = KeyManagerBLSStorageLocation;
        assembly {
            s.slot := location
        }
    }

    /**
     * @inheritdoc IKeyManagerBLS
     */
    function verifyAggregate(
        uint48 timestamp,
        BN254.G1Point memory aggregateG1Key,
        BN254.G2Point memory aggregateG2Key,
        BN254.G1Point memory signature,
        bytes32 messageHash,
        BN254.G1Point[] memory nonSigningKeys,
        uint256[] memory nonSigningKeyIndices,
        bytes32[_TREE_DEPTH][] memory nonSigningKeyMerkleProofs,
        bytes memory aggregatedKeyHint,
        bytes memory keyMerkleHint
    ) public view returns (bool) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        // verify that the aggregated key is the same as the one at the timestamp
        uint256 x = $._aggregatedKey.upperLookupRecent(timestamp, aggregatedKeyHint);
        bytes32 root = bytes32($._keyMerkleRoot.upperLookupRecent(timestamp, keyMerkleHint));
        if (aggregateG1Key.X != x) {
            return false;
        }

        BN254.G1Point memory aggregatedNonSigningKey = BN254.G1Point(0, 0);
        for (uint256 i = 0; i < nonSigningKeys.length; i++) {
            if (
                MerkleLib.branchRoot(
                    bytes32(nonSigningKeys[i].X), nonSigningKeyMerkleProofs[i], nonSigningKeyIndices[i]
                ) != root
            ) {
                return false;
            }
            aggregatedNonSigningKey = aggregatedNonSigningKey.plus(nonSigningKeys[i]);
        }

        aggregateG1Key = aggregateG1Key.plus(aggregatedNonSigningKey.negate());
        return BLSSig.verify(aggregateG1Key, aggregateG2Key, signature, messageHash);
    }

    /**
     * @inheritdoc IKeyManager
     */
    function operatorByKey(
        bytes memory key
    ) public view override returns (address) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        BN254.G1Point memory g1Point = abi.decode(key, (BN254.G1Point));
        return $._keyData[g1Point.X].value;
    }

    /**
     * @inheritdoc IKeyManager
     */
    function operatorKey(
        address operator
    ) public view override returns (bytes memory) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        uint48 timestamp = getCaptureTimestamp();
        BN254.G1Point memory key = $._key[operator];
        if ((key.X != 0 || key.Y != 0) && $._keyData[key.X].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        key = $._prevKey[operator];
        if ((key.X != 0 || key.Y != 0) && $._keyData[key.X].status.wasActiveAt(timestamp)) {
            return abi.encode(key);
        }
        return abi.encode(BN254.G1Point(0, 0));
    }

    /**
     * @inheritdoc IKeyManager
     */
    function keyWasActiveAt(uint48 timestamp, bytes memory key_) public view override returns (bool) {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        BN254.G1Point memory key = abi.decode(key_, (BN254.G1Point));
        return $._keyData[key.X].status.wasActiveAt(timestamp);
    }

    /**
     * @inheritdoc KeyManager
     */
    function _updateKey(address operator, bytes memory key_) internal override {
        KeyManagerBLSStorage storage $ = _getKeyManagerBLSStorage();
        uint48 timestamp = _now();
        uint256 compressedKey = $._aggregatedKey.latest();
        BN254.G1Point memory aggregatedKey;
        uint256 derivedY;
        if (compressedKey != 0) {
            uint256 X = uint256(compressedKey) >> 1;
            (derivedY,) = BN254.findYFromX(X);
            aggregatedKey = (compressedKey & 1) == 1
                ? BN254.negate(BN254.G1Point({X: X, Y: derivedY}))
                : BN254.G1Point({X: X, Y: derivedY});
        }
        BN254.G1Point memory prevKey = $._prevKey[operator];
        BN254.G1Point memory currentKey = $._key[operator];
        BN254.G1Point memory key = abi.decode(key_, (BN254.G1Point));

        if ($._keyData[key.X].value != address(0)) {
            revert DuplicateKey();
        }

        if (
            (prevKey.X != 0 || prevKey.Y != 0)
                && !$._keyData[prevKey.X].status.checkUnregister(timestamp, _SLASHING_WINDOW())
        ) {
            revert PreviousKeySlashable();
        }
        delete $._keyData[prevKey.X]; // nothing'll happen if prev key is zero

        $._prevKey[operator] = currentKey;
        $._key[operator] = key;

        if (currentKey.X != 0 || currentKey.Y != 0) {
            $._keyData[currentKey.X].status.disable(timestamp);
        }

        if (key.X != 0 || key.Y != 0) {
            $._keyData[key.X].value = operator;
            $._keyData[key.X].status.set(timestamp);
        }

        if (currentKey.X == 0 && currentKey.Y == 0 && (key.X != 0 || key.Y != 0)) {
            aggregatedKey = aggregatedKey.plus(key);
            $._keyMerkle.insert(bytes32(key.X));
            $._keyMerkleRoot.push(_now(), uint256($._keyMerkle.root()));
            $._aggregatedKey.push(_now(), (aggregatedKey.X << 1) | (derivedY == aggregatedKey.Y ? 0 : 1));
            return;
        }
        bytes32[16] memory proof;
        uint256 index;
        assembly {
            proof := add(key_, 96)
            index := mload(add(key_, 608)) // 32 + 64 + (16 * 32)
        }

        // remove current key from merkle tree and aggregated key when new key is zero else update
        aggregatedKey = aggregatedKey.plus(currentKey.negate());
        if (key.X == 0 && key.Y == 0) {
            $._keyMerkle.remove(bytes32(currentKey.X), proof, index);
        } else {
            aggregatedKey = aggregatedKey.plus(key);
            $._keyMerkle.update(bytes32(key.X), bytes32(currentKey.X), proof, index, false);
        }

        $._aggregatedKey.push(_now(), aggregatedKey.X);
        $._keyMerkleRoot.push(_now(), uint256($._keyMerkle.root()));

        emit UpdateKey(operator, key_);
    }
}

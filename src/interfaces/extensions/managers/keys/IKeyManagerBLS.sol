// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IKeyManager} from "../../../managers/extendable/IKeyManager.sol";

import {BN254} from "../../../../libraries/BN254.sol";
import {PauseableEnumerableSet} from "../../../../libraries/PauseableEnumerableSet.sol";
import {MerkleLib} from "../../../../libraries/Merkle.sol";

import {Checkpoints} from "@symbiotic/contracts/libraries/Checkpoints.sol";

interface IKeyManagerBLS {
    error DuplicateKey();
    error PreviousKeySlashable();

    struct KeyManagerBLSStorage {
        mapping(address => BN254.G1Point) _key;
        mapping(address => BN254.G1Point) _prevKey;
        mapping(uint256 => PauseableEnumerableSet.InnerAddress) _keyData;
        Checkpoints.Trace256 _aggregatedKey;
        MerkleLib.Tree _keyMerkle;
        Checkpoints.Trace256 _keyMerkleRoot;
    }

    function KeyManagerBLS_VERSION() external view returns (uint64);

    function verifyAggregate(
        uint48 timestamp,
        BN254.G1Point memory aggregateG1Key,
        BN254.G2Point memory aggregateG2Key,
        BN254.G1Point memory signature,
        bytes32 messageHash,
        BN254.G1Point[] memory nonSigningKeys,
        uint256[] memory nonSigningKeyIndices,
        bytes32[16][] memory nonSigningKeyMerkleProofs,
        bytes memory aggregatedKeyHint,
        bytes memory keyMerkleHint
    ) external view returns (bool);
}

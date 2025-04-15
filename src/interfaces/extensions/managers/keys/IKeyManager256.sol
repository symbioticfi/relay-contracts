// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IKeyManager} from "../../../managers/extendable/IKeyManager.sol";

import {PauseableEnumerableSet} from "../../../../libraries/PauseableEnumerableSet.sol";

interface IKeyManager256 {
    error DuplicateKey();
    error PreviousKeySlashable();

    struct KeyManager256Storage {
        mapping(address => bytes32) _key;
        mapping(address => bytes32) _prevKey;
        mapping(bytes32 => PauseableEnumerableSet.InnerAddress) _keyData;
    }

    function KeyManager256_VERSION() external view returns (uint64);
}

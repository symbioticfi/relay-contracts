// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IKeyManager} from "../../../managers/extendable/IKeyManager.sol";
import {PauseableEnumerableSet} from "../../../../libraries/PauseableEnumerableSet.sol";

interface IKeyManagerBytes {
    error DuplicateKey();
    error PreviousKeySlashable();

    struct KeyManagerBytesStorage {
        mapping(address => bytes) _key;
        mapping(address => bytes) _prevKey;
        mapping(bytes => PauseableEnumerableSet.InnerAddress) _keyData;
    }

    function KeyManagerBytes_VERSION() external view returns (uint64);
}

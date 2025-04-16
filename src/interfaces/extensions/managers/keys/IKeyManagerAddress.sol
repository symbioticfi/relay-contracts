// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IKeyManager} from "../../../managers/extendable/IKeyManager.sol";

import {PauseableEnumerableSet} from "../../../../libraries/PauseableEnumerableSet.sol";

interface IKeyManagerAddress {
    error DuplicateKey();
    error PreviousKeySlashable();

    struct KeyManagerAddressStorage {
        mapping(address => address) _key;
        mapping(address => address) _prevKey;
        mapping(address => PauseableEnumerableSet.InnerAddress) _keyData;
    }

    function KeyManagerAddress_VERSION() external view returns (uint64);
}

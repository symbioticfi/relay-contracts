// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "./interfaces/IVault.sol";
import {IDelegator} from "./interfaces/IDelegator.sol";
import {IOperatorRegistry} from "./interfaces/IOperatorRegistry.sol";
import {Arrays} from "./utils/Arrays.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {console} from "forge-std/Test.sol";

abstract contract KeyRegistry {
    using Arrays for Arrays.CheckpointedBytesArray;

    address internal immutable networkKR;
    IOperatorRegistry internal immutable _operatorRegistry;
    mapping(address => Arrays.CheckpointedBytesArray) internal operatorKeys;
    mapping(bytes => address) public keyOperator;

    constructor(address network_, address operatorRegistry_) {
        networkKR = network_;
        _operatorRegistry = IOperatorRegistry(operatorRegistry_);
    }

    function getAllOperatorKeys(address operator) external view returns (bytes[] memory) {
        return operatorKeys[operator].array;
    }

    function getOperatorKeys(address operator, uint48 captureTimestamp) public view returns (bytes[] memory) {
        return operatorKeys[operator].getActive(captureTimestamp);
    }

    // TODO mb we need to define keys types and prove posession with signature,
    // could be frontrunned by anyone who registers as operators
    function registerKeys(bytes[] calldata _keys) external {
        if (!_operatorRegistry.isEntity(msg.sender)) {
            revert();
        }
        operatorKeys[msg.sender].add(_keys);
        for (uint256 i = 0; i < _keys.length; ++i) {
            keyOperator[_keys[i]] = msg.sender;
        }
    }

    function acceptKeys(address operator, uint256[] calldata buckets, uint256[] calldata data) external {
        if (msg.sender != networkKR || !_operatorRegistry.isEntity(operator)) {
            revert();
        }
        operatorKeys[operator].setActive(buckets, data);
    }

    function removePrefixKeys(address operator, uint256 newRemovedPrefixKeys) external {
        if (msg.sender != networkKR) {
            revert();
        }

        operatorKeys[operator].removePrefix(newRemovedPrefixKeys);
    }
}

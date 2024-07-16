// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "./interfaces/IVault.sol";
import {IDelegator} from "./interfaces/IDelegator.sol";
import {IOperatorRegistry} from "./interfaces/IOperatorRegistry.sol";
import {Arrays} from "./utils/Arrays.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

abstract contract KeyRegistry {
    using Arrays for Arrays.CheckpointedBytesArray;

    address internal immutable networkKR;
    IOperatorRegistry internal immutable operatorRegistry;
    mapping(address => Arrays.CheckpointedBytesArray) internal operatorKeys;
    mapping(bytes => address) public keyOperator;

    constructor(address network_, address _operatorRegistry) {
        networkKR = network_;
        operatorRegistry = IOperatorRegistry(_operatorRegistry);
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
        if (!operatorRegistry.isEntity(msg.sender)) {
            revert();
        }
        operatorKeys[msg.sender].add(_keys);
        for (uint256 i = 0; i < _keys.length; ++i) {
            keyOperator[_keys[i]] = msg.sender;
        }
    }

    function setActiveKeys(address operator, uint256[] calldata buckets, uint256[] calldata data) external {
        if (msg.sender != networkKR || !operatorRegistry.isEntity(operator)) {
            revert();
        }
        operatorKeys[operator].setActive(buckets, data);
    }
}

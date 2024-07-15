// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "./interfaces/IVault.sol";
import {IDelegator} from "./interfaces/IDelegator.sol";
import {IOperatorRegistry} from "./interfaces/IOperatorRegistry.sol";
import {CheckpointedArrays} from "./utils/CheckpointedArrays.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {console} from "forge-std/Test.sol";

abstract contract KeyRegistry {
    using CheckpointedArrays for CheckpointedArrays.CheckpointedBytesArray;

    address public immutable _network;
    IOperatorRegistry public immutable _operatorRegistry;
    CheckpointedArrays.CheckpointedBytesArray internal keys;
    mapping(bytes => address) public keyOperator;

    constructor(address network_, address operatorRegistry_) {
        _network = network_;
        _operatorRegistry = IOperatorRegistry(operatorRegistry_);
    }

    function getKeys() external view returns (bytes[] memory) {
        return keys.data;
    }

    function getActiveKeys() external view returns (bytes[] memory) {
        return keys.getActive();
    }

    // actually view function

    function getOperatorsKeys(address[] memory operators) internal returns (bytes[][] memory, uint256) {
        bytes[] memory activeKeys = keys.getActive();
        console.log(activeKeys.length);
        bytes[][] memory operatorsKeys = new bytes[][](operators.length);
        uint256[] memory operatorKeyCount = new uint256[](operators.length);
        for (uint256 i = 0; i < operators.length; ++i) {
            bytes32 slot = keccak256(abi.encode("operatorToIdx", operators[i]));
            assembly {
                sstore(slot, i)
            }
        }
        for (uint256 i = 0; i < activeKeys.length; ++i) {
            bytes32 slot = keccak256(abi.encode("operatorToIdx", keyOperator[activeKeys[i]]));
            uint256 operatorIdx;
            assembly {
                operatorIdx := sload(slot)
            }
            operatorKeyCount[operatorIdx] += 1;
        }
        for (uint256 i = 0; i < operators.length; ++i) {
            operatorsKeys[i] = new bytes[](operatorKeyCount[i]);
            operatorKeyCount[i] = 0;
        }
        for (uint256 i = 0; i < activeKeys.length; ++i) {
            bytes32 slot = keccak256(abi.encode("operatorToIdx", keyOperator[activeKeys[i]]));
            uint256 operatorIdx;
            assembly {
                operatorIdx := sload(slot)
            }
            operatorsKeys[operatorIdx][operatorKeyCount[operatorIdx]] = activeKeys[i];
            operatorKeyCount[operatorIdx] += 1;
        }
        return (operatorsKeys, activeKeys.length);
    }

    function registerKeys(bytes[] calldata _keys) external {
        if (!_operatorRegistry.isEntity(msg.sender)) {
            revert();
        }
        keys.add(_keys);
        for (uint256 i = 0; i < _keys.length; ++i) {
            keyOperator[_keys[i]] = msg.sender;
        }
    }

    function acceptKeys(uint256[] calldata buckets, uint256[] calldata data) external {
        if (msg.sender != _network) {
            revert();
        }
        keys.setActive(buckets, data);
    }

    function removePrefixKeys(uint256 newRemovedPrefixKeys) external {
        if (msg.sender != _network) {
            revert();
        }

        keys.removePrefix(newRemovedPrefixKeys);
    }
}

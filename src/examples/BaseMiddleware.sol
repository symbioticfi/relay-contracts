// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "../interfaces/IVault.sol";
import {IDelegator} from "../interfaces/IDelegator.sol";
import {IOperatorRegistry} from "../interfaces/IOperatorRegistry.sol";
import {CheckpointedArrays} from "../utils/CheckpointedArrays.sol";
import {KeyRegistry} from "../KeyRegistry.sol";
import {Stake} from "../Stake.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Checkpoints} from "../utils/Checkpoints.sol";

contract BaseMiddleware is KeyRegistry, Stake {
    using CheckpointedArrays for CheckpointedArrays.CheckpointedAddressArray;
    using Checkpoints for Checkpoints.Trace208;

    IOperatorRegistry public immutable operatorRegistry;
    address public immutable network;
    uint48 public stakeCaptureDuration;
    uint256 public totalPubkeys;
    CheckpointedArrays.CheckpointedAddressArray internal operators;
    address[] public vaults;
    mapping(address => Checkpoints.Trace208) isActiveOperator;

    struct OperatorData {
        uint256 votingPower;
        bytes key;
    }

    modifier onlyNetwork() {
        if (msg.sender != network) {
            revert();
        }
        _;
    }

    constructor(address _network, uint48 _stakeCaptureDuration, address _operatorRegistry)
        KeyRegistry(_network, _operatorRegistry)
    {
        network = _network;
        stakeCaptureDuration = _stakeCaptureDuration;
        operatorRegistry = IOperatorRegistry(_operatorRegistry);
    }

    // this function is only for offchain calls so it's unoptimized
    function getValidatorSet() external returns (OperatorData[] memory) {
        address[] memory _operators = operators.getActive();
        uint256[] memory stakes = getOperatorsStakeAt(network, _operators, vaults, Time.timestamp());
        (bytes[][] memory operatorsKeys, uint256 keysLen) = getOperatorsKeys(_operators);
        OperatorData[] memory operatorsData = new OperatorData[](keysLen);
        uint256 idx = 0;
        for (uint256 i = 0; i < _operators.length; ++i) {
            uint256 keyPower = stakes[i] / operatorsKeys[i].length;
            for (uint256 j = 0; j < operatorsKeys[i].length; ++j) {
                operatorsData[idx++] = OperatorData(keyPower, operatorsKeys[i][j]);
            }
        }
        return operatorsData;
    }

    function getOperators() external view returns (address[] memory) {
        return operators.data;
    }

    function getActiveOperators() external view returns (address[] memory) {
        return operators.getActive();
    }

    function addVaults(address[] memory _vaults) external onlyNetwork {
        for (uint256 i = 0; i < _vaults.length; ++i) {
            vaults.push(_vaults[i]);
        }
    }

    function addOperators(address[] memory _operators) external onlyNetwork {
        operators.add(_operators);
    }

    function setActiveOperators(uint256[] calldata buckets, uint256[] calldata data) external onlyNetwork {
        if (msg.sender != _network) {
            revert();
        }
        operators.setActive(buckets, data);
    }
}

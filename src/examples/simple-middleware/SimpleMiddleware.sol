// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "../../interfaces/IVault.sol";
import {IDelegator} from "../../interfaces/IDelegator.sol";
import {IOperatorRegistry} from "../../interfaces/IOperatorRegistry.sol";
import {KeyRegistry} from "../../KeyRegistry.sol";
import {BaseMiddleware} from "../../BaseMiddleware.sol";
import {Stake} from "../../Stake.sol";
import {ScheduledEpoch} from "../ScheduledEpoch.sol";
import {CheckpointedOperatorSet} from "../CheckpointedOperatorSet.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";

contract SimpleMiddleware is BaseMiddleware {
    constructor(
        address _network,
        address _operatorRegistry,
        uint48 _epochStart,
        uint48 _epochDuration,
        uint256 _firstEpoch
    )
        BaseMiddleware(
            _network,
            _operatorRegistry,
            address(new ScheduledEpoch(_epochStart, _epochDuration, _firstEpoch)),
            address(new CheckpointedOperatorSet(_network))
        )
    {}

    // this function is only for offchain calls so it's unoptimized
    function getValidatorSet(uint256 _epoch) external view override returns (OperatorData[] memory operatorsData) {
        uint48 captureTimestamp = epoch.epochToTimestamp(_epoch);
        address[] memory operators = operatorSet.get(captureTimestamp);
        uint256 operatorsLen = operators.length;
        uint256[] memory stakes = new uint256[](operatorsLen);
        bytes[][] memory keys = new bytes[][](operatorsLen);
        uint256 totalKeys = 0;

        for (uint256 i = 0; i < operatorsLen; ++i) {
            address operator = operators[i];
            address[] memory vaults = getOperatorVaults(operator, captureTimestamp);
            stakes[i] = getOperatorStakeAt(network, operator, vaults, captureTimestamp);
            keys[i] = getOperatorKeys(operator, captureTimestamp);
            totalKeys += keys[i].length;
        }

        operatorsData = new OperatorData[](totalKeys);
        uint256 idx = 0;

        for (uint256 i = 0; i < operatorsLen; ++i) {
            uint256 keysLen = keys[i].length;
            uint256 _votingPower = votingPower(stakes[i] / keysLen);
            for (uint256 j = 0; j < keysLen; ++j) {
                operatorsData[idx++] = OperatorData(_votingPower, keys[i][j]);
            }
        }
        return operatorsData;
    }

    function votingPower(uint256 stake) public view override returns (uint256) {
        return stake;
    }
}

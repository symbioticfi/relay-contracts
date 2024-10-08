// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {MiddlewareStorage} from "./MiddlewareStorage.sol";
import {EnumerableSetWithTimeData} from "./libraries/EnumerableSetWithTimeData.sol";

abstract contract OperatorManager is MiddlewareStorage {
    using EnumerableSetWithTimeData for EnumerableSetWithTimeData.AddressSet;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorNotRegistered();
    error OperatorAlreadyRegistred();

    EnumerableSetWithTimeData.AddressSet internal operators;

    function operatorsLength() external view returns (uint256) {
        return operators.length();
    }

    function operatorWithTimesAt(uint256 pos) external view returns (address, uint48, uint48) {
        return operators.at(pos);
    }

    function activeOperators(uint48 timestamp) public view returns (address[] memory) {
        return operators.getActive(timestamp);
    }

    function registerOperator(address operator) external onlyOwner {
        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NET_OPTIN).isOptedIn(operator, NETWORK)) {
            revert OperatorNotOptedIn();
        }

        operators.register(operator);
    }

    function pauseOperator(address operator) external onlyOwner {
        operators.pause(operator);
    }

    function unpauseOperator(address operator) external onlyOwner {
        operators.unpause(operator, SLASHING_WINDOW);
    }

    function unregisterOperator(address operator) external onlyOwner {
        operators.unregister(operator, SLASHING_WINDOW);
    }
}

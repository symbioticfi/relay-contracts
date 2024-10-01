// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IOptInService} from "@symbiotic/interfaces/service/IOptInService.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {AddressWithTimes} from "./libraries/AddressWithTimes.sol";

contract OperatorManager is Ownable {
    using AddressWithTimes for AddressWithTimes.Address;

    error NotOperator();
    error OperatorNotOptedIn();
    error OperatorNotRegistered();
    error OperatorAlreadyRegistred();

    error SlashPeriodNotPassed();

    address public immutable NETWORK;
    address public immutable OPERATOR_REGISTRY;
    address public immutable OPERATOR_NET_OPTIN;
    uint48 public immutable SLASHING_WINDOW;
    AddressWithTimes.Address[] public operators;
    mapping(address => uint256) public operatorPositions;

    constructor(
        address owner,
        address network,
        address operatorRegistry,
        address operatorNetOptIn,
        uint48 slashingWindow
    ) Ownable(owner) {
        NETWORK = network;
        OPERATOR_REGISTRY = operatorRegistry;
        OPERATOR_NET_OPTIN = operatorNetOptIn;
        SLASHING_WINDOW = slashingWindow;
    }

    function activeOperators(uint48 timestamp) public view returns (address[] memory) {
        address[] memory _operators = new address[](operators.length);
        uint256 len = 0;
        for (uint256 i; i < operators.length; ++i) {
            if (!operators[i].wasActiveAt(timestamp)) {
                continue;
            }

            _operators[len++] = operators[i].getAddress();
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(_operators, len)
        }

        return _operators;
    }

    function registerOperator(address operator) external onlyOwner {
        if (operatorPositions[operator] != 0) {
            revert OperatorAlreadyRegistred();
        }

        if (!IRegistry(OPERATOR_REGISTRY).isEntity(operator)) {
            revert NotOperator();
        }

        if (!IOptInService(OPERATOR_NET_OPTIN).isOptedIn(operator, NETWORK)) {
            revert OperatorNotOptedIn();
        }

        uint256 pos = operators.length;
        operators.push();
        operators[pos].set(operator);
        operatorPositions[operator] = pos + 1;
    }

    function pauseOperator(address operator) external onlyOwner {
        if (operatorPositions[operator] == 0) {
            revert OperatorNotRegistered();
        }

        operators[operatorPositions[operator] - 1].disable();
    }

    function unpauseOperator(address operator) external onlyOwner {
        if (operatorPositions[operator] == 0) {
            revert OperatorNotRegistered();
        }

        operators[operatorPositions[operator] - 1].checkUnpause(SLASHING_WINDOW);
        operators[operatorPositions[operator] - 1].enable();
    }

    function unregisterOperator(address operator) external onlyOwner {
        if (operatorPositions[operator] == 0) {
            revert OperatorNotRegistered();
        }

        uint256 pos = operatorPositions[operator] - 1;
        operators[pos].checkUnregister(SLASHING_WINDOW);
        operators[pos] = operators[operators.length - 1];
        operators.pop();

        delete operatorPositions[operator];
        operatorPositions[operators[pos].getAddress()] = pos + 1;
    }
}

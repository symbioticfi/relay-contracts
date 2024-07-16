// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MockVault} from "./mock/mockVault.sol";
import {MockOperatorRegistry} from "./mock/mockOperatorRegistry.sol";
import {SimpleMiddleware} from "../src/examples/simple-middleware/SimpleMiddleware.sol";
import {CheckpointedOperatorSet} from "../src/examples/CheckpointedOperatorSet.sol";

contract SimpleMiddlewareTest is Test {
    SimpleMiddleware simpleMiddleware;
    CheckpointedOperatorSet operatorSet;
    address network = address(1);
    address operator = address(2);
    address[] vaults;

    function setUp() public {
        vaults.push(address(new MockVault()));
        address operatorRegistry = address(new MockOperatorRegistry());
        simpleMiddleware = new SimpleMiddleware(network, operatorRegistry, 0, 12, 0);
        operatorSet = CheckpointedOperatorSet(address(simpleMiddleware.operatorSet()));
    }

    function test_Kek() public {
        address[] memory operators = new address[](1);
        operators[0] = operator;
        uint256[] memory buckets = new uint256[](1);
        uint256[] memory data = new uint256[](1);
        buckets[0] = 0;
        data[0] = 1;
        uint256[] memory vaultIdxs = new uint256[](1);
        vaultIdxs[0] = 0;
        vm.startPrank(network);
        operatorSet.addOperators(operators);
        operatorSet.setActiveOperators(buckets, data);
        simpleMiddleware.addVaults(vaults);
        simpleMiddleware.setOperatorVaults(operator, vaultIdxs);
        vm.stopPrank();
        bytes[] memory pubkeys = new bytes[](2);
        pubkeys[0] = abi.encode("kek");
        pubkeys[1] = abi.encode("kek2");
        vm.prank(operator);
        simpleMiddleware.registerKeys(pubkeys);
        data[0] = 3;
        vm.prank(network);
        simpleMiddleware.setActiveKeys(operators[0], buckets, data);
        simpleMiddleware.getValidatorSet(block.timestamp);
    }
}

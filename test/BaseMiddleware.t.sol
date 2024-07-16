// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.13;

// import {Test, console} from "forge-std/Test.sol";
// import {MockVault} from "./mock/mockVault.sol";
// import {MockOperatorRegistry} from "./mock/mockOperatorRegistry.sol";
// import {SimpleMiddleware} from "../src/examples/simple-middleware/SimpleMiddleware.sol";

// contract BaseMiddlewareTest is Test {
//     BaseMiddleware baseMiddleware;
//     address network = address(1);
//     address operator = address(2);
//     address[] vaults;

//     function setUp() public {
//         vaults.push(address(new MockVault()));
//         address operatorRegistry = address(new MockOperatorRegistry());
//         baseMiddleware = new BaseMiddleware(network, 12, operatorRegistry);
//     }

//     function test_Kek() public {
//         address[] memory operators = new address[](1);
//         operators[0] = operator;
//         uint256[] memory buckets = new uint256[](1);
//         uint256[] memory data = new uint256[](1);
//         buckets[0] = 0;
//         data[0] = 1;
//         vm.startPrank(network);
//         baseMiddleware.addOperators(operators);
//         baseMiddleware.addVaults(vaults);
//         baseMiddleware.setActiveOperators(buckets, data);
//         vm.stopPrank();
//         bytes[] memory pubkeys = new bytes[](2);
//         pubkeys[0] = abi.encode("kek");
//         pubkeys[1] = abi.encode("kek2");
//         vm.prank(operator);
//         baseMiddleware.registerKeys(pubkeys);
//         data[0] = 3;
//         vm.prank(network);
//         baseMiddleware.acceptKeys(buckets, data);
//         baseMiddleware.getValidatorSet();
//     }
// }

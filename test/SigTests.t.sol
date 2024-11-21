// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, Vm, console} from "forge-std/Test.sol";
import {POCBaseTest} from "@symbiotic-test/POCBase.t.sol";
import {SelfRegisterMiddleware} from "../src/examples/self-register-network/SelfRegisterMiddleware.sol";
import {SelfRegisterEd25519Middleware} from "../src/examples/self-register-network/SelfRegisterEd25519Middleware.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

contract SigTests is POCBaseTest {
    using ECDSA for bytes32;
    using MessageHashUtils for bytes32;

    SelfRegisterMiddleware internal middleware;
    SelfRegisterEd25519Middleware internal ed25519Middleware;
    uint256 internal operatorPrivateKey;
    address internal operator;
    bytes32 internal operatorPublicKey;
    string internal constant ED25519_TEST_DATA = "test/helpers/ed25519TestData.json";
    address internal ed25519Operator;

    function setUp() public override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        vm.warp(1_729_690_309);
        super.setUp();

        (operator, operatorPrivateKey) = makeAddrAndKey("operator");
        operatorPublicKey = bytes32(uint256(uint160(operator)));

        string memory json = vm.readFile(ED25519_TEST_DATA);
        ed25519Operator = abi.decode(vm.parseJson(json, ".operator"), (address));

        // Initialize both middlewares
        middleware = new SelfRegisterMiddleware(
            address(0x123),
            address(operatorRegistry),
            address(vaultFactory),
            address(operatorNetworkOptInService),
            1200 // slashing window
        );

        ed25519Middleware = new SelfRegisterEd25519Middleware(
            address(0x456),
            address(operatorRegistry),
            address(vaultFactory),
            address(operatorNetworkOptInService),
            1200 // slashing window
        );

        _registerNetwork(address(0x123), address(middleware));
        _registerNetwork(address(0x456), address(ed25519Middleware));
        _registerOperator(operator);
        _registerOperator(ed25519Operator);
        _optInOperatorVault(vault1, operator);
        _optInOperatorVault(vault1, ed25519Operator);
        _optInOperatorNetwork(operator, address(0x123));
        _optInOperatorNetwork(ed25519Operator, address(0x456));
    }

    function testEd25519RegisterOperator() public {
        string memory json = vm.readFile(ED25519_TEST_DATA);
        bytes32 key = abi.decode(vm.parseJson(json, ".key"), (bytes32));
        bytes memory signature = abi.decode(vm.parseJson(json, ".signature"), (bytes));

        // Register operator using Ed25519 signature
        vm.prank(ed25519Operator);
        ed25519Middleware.registerOperator(abi.encode(key), address(vault1), signature);

        // Verify operator is registered correctly
        assertTrue(ed25519Middleware.isOperatorRegistered(ed25519Operator));

        assertEq(abi.decode(ed25519Middleware.operatorKey(ed25519Operator), (bytes32)), bytes32(0));
        vm.warp(block.timestamp + 2);
        assertEq(abi.decode(ed25519Middleware.operatorKey(ed25519Operator), (bytes32)), key);
    }

    function testEd25519RegisterOperatorInvalidSignature() public {
        string memory json = vm.readFile(ED25519_TEST_DATA);
        bytes32 key = abi.decode(vm.parseJson(json, ".key"), (bytes32));

        // Create invalid signature
        bytes32 r = bytes32(uint256(1));
        bytes32 s = bytes32(uint256(2));
        bytes memory signature = abi.encodePacked(r, s);

        // Attempt to register with invalid signature should fail
        vm.prank(ed25519Operator);
        vm.expectRevert();
        ed25519Middleware.registerOperator(abi.encode(key), address(vault1), signature);
    }

    function testEd25519RegisterOperatorWrongSender() public {
        string memory json = vm.readFile(ED25519_TEST_DATA);
        bytes32 key = abi.decode(vm.parseJson(json, ".key"), (bytes32));
        bytes memory signature = abi.decode(vm.parseJson(json, ".signature"), (bytes));
        bytes32 r;
        bytes32 s;
        assembly {
            r := mload(add(signature, 32))
            s := mload(add(signature, 64))
        }

        // Attempt to register from different address should fail
        vm.prank(alice);
        vm.expectRevert();
        ed25519Middleware.registerOperator(abi.encode(key), address(vault1), abi.encodePacked(r, s));
    }

    function testSelfRegisterOperator() public {
        // Create registration message
        bytes32 messageHash = keccak256(abi.encodePacked(operator, operatorPublicKey));
        // Sign message with operator's private key
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);
        // Register operator using their own signature
        vm.prank(operator);
        middleware.registerOperator(abi.encode(operatorPublicKey), address(vault1), signature);

        // Verify operator is registered correctly
        assertTrue(middleware.isOperatorRegistered(operator));

        assertEq(abi.decode(middleware.operatorKey(operator), (bytes32)), bytes32(0));
        vm.warp(vm.getBlockTimestamp() + 100);
        assertEq(abi.decode(middleware.operatorKey(operator), (bytes32)), operatorPublicKey);
    }

    function testSelxfRegisterOperatorInvalidSignature() public {
        // Create registration message with wrong key
        bytes32 wrongKey = bytes32(uint256(1));
        bytes32 messageHash = keccak256(abi.encodePacked(operator, wrongKey));
        // Sign message
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);

        // Attempt to register with mismatched key should fail
        vm.prank(operator);
        vm.expectRevert();
        middleware.registerOperator(abi.encode(operatorPublicKey), address(vault1), signature);
    }

    function testSelfxRegisterOperatorWrongSender() public {
        // Create valid registration message
        bytes32 messageHash = keccak256(abi.encodePacked(operator, operatorPublicKey));
        // Sign message with operator's key
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);

        // Attempt to register from different address should fail
        vm.prank(alice);
        vm.expectRevert();
        middleware.registerOperator(abi.encode(operatorPublicKey), address(vault1), signature);
    }

    function testSelxfRegisterOperatorAlreadyRegistered() public {
        // Create registration message
        bytes32 messageHash = keccak256(abi.encodePacked(operator, operatorPublicKey));
        // Sign message
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);
        // Register operator first time
        vm.prank(operator);
        middleware.registerOperator(abi.encode(operatorPublicKey), address(vault1), signature);

        // Attempt to register again should fail
        vm.prank(operator);
        vm.expectRevert();
        middleware.registerOperator(abi.encode(operatorPublicKey), address(vault1), signature);
    }

    function testEd25519RegisterOperatorMismatchedKeyAndSignature() public {
        string memory json = vm.readFile(ED25519_TEST_DATA);
        bytes32 key = abi.decode(vm.parseJson(json, ".invalidKey"), (bytes32));
        bytes memory signature = abi.decode(vm.parseJson(json, ".invalidSignature"), (bytes));

        // Attempt to register with mismatched key and signature should fail
        vm.prank(ed25519Operator);
        vm.expectRevert();
        ed25519Middleware.registerOperator(abi.encode(key), address(vault1), signature);
    }
}

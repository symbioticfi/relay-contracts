// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, Vm, console} from "forge-std/Test.sol";
import {POCBaseTest} from "@symbiotic-test/POCBase.t.sol";
import {IOperatorSpecificDelegator} from "@symbiotic/interfaces/delegator/IOperatorSpecificDelegator.sol";
import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IVaultConfigurator} from "@symbiotic/interfaces/IVaultConfigurator.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";

import {IBaseMiddlewareReader} from "../src/interfaces/IBaseMiddlewareReader.sol";

import {BaseMiddlewareReader} from "../src/middleware/BaseMiddlewareReader.sol";
import {SelfRegisterMiddleware} from "../src/examples/self-register-network/SelfRegisterMiddleware.sol";
import {SelfRegisterEd25519Middleware} from "../src/examples/self-register-network/SelfRegisterEd25519Middleware.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {EdDSA} from "../src/libraries/EdDSA.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

contract SigTests is POCBaseTest {
    using ECDSA for bytes32;
    using MessageHashUtils for bytes32;

    SelfRegisterMiddleware internal middleware;
    SelfRegisterEd25519Middleware internal ed25519Middleware;
    uint256 internal operatorPrivateKey;
    address internal operator;
    string internal constant ED25519_TEST_DATA = "test/helpers/ed25519TestData.json";
    address internal ed25519Operator;
    address internal vault;
    address internal vaultEd;

    function setUp() public override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        vm.warp(1_729_690_309);
        super.setUp();

        (operator, operatorPrivateKey) = makeAddrAndKey("operator");

        string memory json = vm.readFile(ED25519_TEST_DATA);
        ed25519Operator = abi.decode(vm.parseJson(json, ".operator"), (address));

        address readHelper = address(new BaseMiddlewareReader());

        // Initialize both middlewares
        middleware = new SelfRegisterMiddleware(
            address(0x123),
            1200, // slashing window
            address(vaultFactory),
            address(operatorRegistry),
            address(operatorNetworkOptInService),
            readHelper,
            alice
        );

        ed25519Middleware = new SelfRegisterEd25519Middleware(
            address(0x456),
            1200, // slashing window
            address(vaultFactory),
            address(operatorRegistry),
            address(operatorNetworkOptInService),
            readHelper,
            alice
        );

        _registerNetwork(address(0x123), address(middleware));
        _registerNetwork(address(0x456), address(ed25519Middleware));
        _registerOperator(operator);
        _registerOperator(ed25519Operator);
        _optInOperatorNetwork(operator, address(0x123));
        _optInOperatorNetwork(ed25519Operator, address(0x456));

        vault = address(_getOperatorVault(operator));
        _optInOperatorVault(IVault(vault), operator);

        vaultEd = address(_getOperatorVault(ed25519Operator));
        _optInOperatorVault(IVault(vaultEd), ed25519Operator);
    }

    function testEd25519RegisterOperator() public {
        string memory json = vm.readFile(ED25519_TEST_DATA);
        bytes32 key = abi.decode(vm.parseJson(json, ".key"), (bytes32));
        bytes memory signature = abi.decode(vm.parseJson(json, ".signature"), (bytes));

        // Register operator using Ed25519 signature
        vm.prank(ed25519Operator);
        ed25519Middleware.registerOperator(abi.encode(key), address(vaultEd), signature);

        // Verify operator is registered correctly
        assertTrue(IBaseMiddlewareReader(address(ed25519Middleware)).isOperatorRegistered(ed25519Operator));

        assertEq(
            abi.decode(IBaseMiddlewareReader(address(ed25519Middleware)).operatorKey(ed25519Operator), (bytes32)),
            bytes32(0)
        );
        vm.warp(block.timestamp + 2);
        assertEq(
            abi.decode(IBaseMiddlewareReader(address(ed25519Middleware)).operatorKey(ed25519Operator), (bytes32)), key
        );
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
        ed25519Middleware.registerOperator(abi.encode(key), address(vaultEd), signature);
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
        ed25519Middleware.registerOperator(abi.encode(key), address(vaultEd), abi.encodePacked(r, s));
    }

    function testSelfRegisterOperator() public {
        // Create registration message
        bytes32 messageHash = keccak256(abi.encodePacked(operator, operator));
        // Sign message with operator's private key
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);
        // Register operator using their own signature
        vm.prank(operator);
        middleware.registerOperator(abi.encode(operator), address(vault), signature);

        // Verify operator is registered correctly
        assertTrue(IBaseMiddlewareReader(address(middleware)).isOperatorRegistered(operator));

        assertEq(abi.decode(IBaseMiddlewareReader(address(middleware)).operatorKey(operator), (address)), address(0));
        vm.warp(vm.getBlockTimestamp() + 100);
        assertEq(abi.decode(IBaseMiddlewareReader(address(middleware)).operatorKey(operator), (address)), operator);
    }

    function testSelxfRegisterOperatorInvalidSignature() public {
        // Create registration message with wrong key
        address wrongKey = address(uint160(uint256(1)));
        bytes32 messageHash = keccak256(abi.encodePacked(operator, wrongKey));
        // Sign message
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);

        // Attempt to register with mismatched key should fail
        vm.prank(operator);
        vm.expectRevert();
        middleware.registerOperator(abi.encode(operator), address(vault), signature);
    }

    function testSelfxRegisterOperatorWrongSender() public {
        // Create valid registration message
        bytes32 messageHash = keccak256(abi.encodePacked(operator, operator));
        // Sign message with operator's key
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);

        // Attempt to register from different address should fail
        vm.prank(alice);
        vm.expectRevert();
        middleware.registerOperator(abi.encode(operator), address(vault), signature);
    }

    function testSelxfRegisterOperatorAlreadyRegistered() public {
        // Create registration message
        bytes32 messageHash = keccak256(abi.encodePacked(operator, operator));
        // Sign message
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, messageHash);
        bytes memory signature = abi.encodePacked(r, s, v);
        // Register operator first time
        vm.prank(operator);
        middleware.registerOperator(abi.encode(operator), address(vault), signature);

        // Attempt to register again should fail
        vm.prank(operator);
        vm.expectRevert();
        middleware.registerOperator(abi.encode(operator), address(vault), signature);
    }

    function testEd25519RegisterOperatorMismatchedKeyAndSignature() public {
        string memory json = vm.readFile(ED25519_TEST_DATA);
        bytes32 key = abi.decode(vm.parseJson(json, ".invalidKey"), (bytes32));
        bytes memory signature = abi.decode(vm.parseJson(json, ".invalidSignature"), (bytes));

        // Attempt to register with mismatched key and signature should fail
        vm.prank(ed25519Operator);
        vm.expectRevert();
        ed25519Middleware.registerOperator(abi.encode(key), address(vault), signature);
    }

    function _getOperatorVault(
        address operator
    ) internal returns (IVault) {
        address[] memory networkLimitSetRoleHolders = new address[](1);
        networkLimitSetRoleHolders[0] = alice;
        address[] memory operatorNetworkSharesSetRoleHolders = new address[](1);
        operatorNetworkSharesSetRoleHolders[0] = alice;
        (address vault_,,) = vaultConfigurator.create(
            IVaultConfigurator.InitParams({
                version: 1,
                owner: alice,
                vaultParams: abi.encode(
                    IVault.InitParams({
                        collateral: address(collateral),
                        burner: address(0xdEaD),
                        epochDuration: 7 days,
                        depositWhitelist: false,
                        isDepositLimit: false,
                        depositLimit: 0,
                        defaultAdminRoleHolder: alice,
                        depositWhitelistSetRoleHolder: alice,
                        depositorWhitelistRoleHolder: alice,
                        isDepositLimitSetRoleHolder: alice,
                        depositLimitSetRoleHolder: alice
                    })
                ),
                delegatorIndex: 2,
                delegatorParams: abi.encode(
                    IOperatorSpecificDelegator.InitParams({
                        baseParams: IBaseDelegator.BaseParams({
                            defaultAdminRoleHolder: alice,
                            hook: address(0),
                            hookSetRoleHolder: alice
                        }),
                        networkLimitSetRoleHolders: networkLimitSetRoleHolders,
                        operator: operator
                    })
                ),
                withSlasher: false,
                slasherIndex: 0,
                slasherParams: ""
            })
        );

        return IVault(vault_);
    }
}

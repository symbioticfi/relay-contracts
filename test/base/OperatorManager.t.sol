// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {OperatorManager} from "../../src/contracts/base/OperatorManager.sol";

import {INetworkManager} from "../../src/interfaces/base/INetworkManager.sol";
import {IOperatorManager} from "../../src/interfaces/base/IOperatorManager.sol";
import {INetworkManager} from "../../src/interfaces/base/INetworkManager.sol";

import "../InitSetup.sol";

contract TestOperatorManager is OperatorManager {
    constructor(
        address operatorRegistry
    ) OperatorManager(operatorRegistry) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInitParams
    ) external initializer {
        __NetworkManager_init(netInitParams);
        __OperatorManager_init();
    }

    function registerOperator(
        address operator
    ) external {
        _registerOperator(operator);
    }

    function unregisterOperator(
        address operator
    ) external {
        _unregisterOperator(operator);
    }
}

contract OperatorManagerTest is InitSetup {
    TestOperatorManager internal opManager;

    address validOperator = address(0x1111);
    address invalidOperator = address(0x2222);

    bytes4 private ERR_NOT_OPERATOR = IOperatorManager.OperatorManager_NotOperator.selector;
    bytes4 private ERR_ALREADY_REGISTERED = IOperatorManager.OperatorManager_OperatorAlreadyRegistered.selector;
    bytes4 private ERR_NOT_REGISTERED = IOperatorManager.OperatorManager_OperatorNotRegistered.selector;

    function setUp() public override {
        InitSetup.setUp();

        _registerOperator_SymbioticCore(symbioticCore, validOperator);

        opManager = new TestOperatorManager(address(symbioticCore.operatorRegistry));

        INetworkManager.NetworkManagerInitParams memory netInitParams =
            INetworkManager.NetworkManagerInitParams({network: address(0xAAA), subnetworkID: 123});
        opManager.initialize(netInitParams);
    }

    function test_OperatorManagerVersion() public {
        assertEq(opManager.OperatorManager_VERSION(), 1, "OperatorManager_VERSION mismatch");
    }

    function test_RegisterOperatorValid() public {
        opManager.registerOperator(validOperator);

        bool isReg = opManager.isOperatorRegistered(validOperator);
        assertTrue(isReg, "Should be registered");
        bool isActive = opManager.isOperatorActive(validOperator);
        assertTrue(isActive, "Should be active now");

        address[] memory allOps = opManager.getAllOperators();
        assertEq(allOps.length, 1, "Should have exactly 1 operator");
        assertEq(allOps[0], validOperator, "Operator mismatch in allOps");
    }

    function test_RegisterOperator_RevertIfNotEntity() public {
        vm.expectRevert(ERR_NOT_OPERATOR);
        opManager.registerOperator(invalidOperator);
    }

    function test_RegisterOperator_RevertIfAlreadyRegistered() public {
        opManager.registerOperator(validOperator);
        vm.expectRevert(ERR_ALREADY_REGISTERED);
        opManager.registerOperator(validOperator);
    }

    function test_UnregisterOperator() public {
        opManager.registerOperator(validOperator);

        address[] memory allOps = opManager.getAllOperators();
        assertEq(allOps.length, 1, "Should have exactly 1 operator");
        assertEq(allOps[0], validOperator, "Operator mismatch in allOps");

        address[] memory actOps = opManager.getActiveOperators();
        assertEq(actOps.length, 1, "Should have exactly 1 active operator");
        assertEq(actOps[0], validOperator, "Operator mismatch in actOps");

        opManager.unregisterOperator(validOperator);

        bool isActive = opManager.isOperatorActive(validOperator);
        assertFalse(isActive, "Should not be active after unregister");

        bool isReg = opManager.isOperatorRegistered(validOperator);
        assertTrue(isReg, "It remains physically in 'all' set but is not active");

        allOps = opManager.getAllOperators();
        assertEq(allOps.length, 1, "Should have exactly 1 operator");
        assertEq(allOps[0], validOperator, "Operator mismatch in allOps");

        actOps = opManager.getActiveOperators();
        assertEq(actOps.length, 0, "Should have no active operators");

        uint208 actOpsLength = opManager.getActiveOperatorsLength();
        assertEq(actOpsLength, 0, "Should have no active operators");
    }

    function test_UnregisterOperator_RevertIfNotRegistered() public {
        vm.expectRevert(ERR_NOT_REGISTERED);
        opManager.unregisterOperator(validOperator);
    }

    function test_IsOperatorActiveAt_withTime() public {
        uint48 t0 = uint48(vm.getBlockTimestamp());
        opManager.registerOperator(validOperator);

        vm.warp(vm.getBlockTimestamp() + 100);
        uint48 t1 = uint48(vm.getBlockTimestamp());

        bool wasActiveBefore = opManager.isOperatorActiveAt(validOperator, t0 - 1, "");
        assertFalse(wasActiveBefore, "Should be inactive before we registered");
        bool isActiveT0 = opManager.isOperatorActiveAt(validOperator, t0, "");
        assertTrue(isActiveT0, "Should be active at T0");
        bool isActiveT1 = opManager.isOperatorActiveAt(validOperator, t1, "");
        assertTrue(isActiveT1, "Should be active at T1");
    }

    function testGetActiveOperatorsAt_withTime() public {
        address validOp2 = address(0x3333);
        _registerOperator_SymbioticCore(symbioticCore, validOp2);

        uint48 t0 = uint48(vm.getBlockTimestamp());

        opManager.registerOperator(validOperator);

        {
            address[] memory actOps = opManager.getActiveOperators();
            assertEq(actOps.length, 1, "At T0, 1 active operator");
            assertEq(actOps[0], validOperator);

            uint208 actOpsT0 = opManager.getActiveOperatorsLengthAt(t0, "");
            assertEq(actOpsT0, 1, "At T0, 1 active operator");

            uint208 actOpsT0Length = opManager.getActiveOperatorsLength();
            assertEq(actOpsT0Length, 1, "At T0, 1 active operator");
        }

        vm.warp(t0 + 50);
        uint48 t1 = uint48(vm.getBlockTimestamp());
        opManager.registerOperator(validOp2);

        {
            address[] memory actOpsT0 = opManager.getActiveOperatorsAt(t0, new bytes[](0));
            assertEq(actOpsT0.length, 1, "At T0, only 1 active operator");
            assertEq(actOpsT0[0], validOperator);
        }
        {
            address[] memory actOpsT1 = opManager.getActiveOperatorsAt(t1, new bytes[](0));
            assertEq(actOpsT1.length, 2, "At T1, 2 active operators");
            assertEq(actOpsT1[0], validOperator);
            assertEq(actOpsT1[1], validOp2);
        }
        {
            address[] memory actOps = opManager.getActiveOperators();
            assertEq(actOps.length, 2, "At T1, 2 active operators");
            assertEq(actOps[0], validOperator);
            assertEq(actOps[1], validOp2);

            uint208 actOpsT1 = opManager.getActiveOperatorsLengthAt(t1, "");
            assertEq(actOpsT1, 2, "At T1, 2 active operators");

            uint208 actOpsT1Length = opManager.getActiveOperatorsLength();
            assertEq(actOpsT1Length, 2, "At T1, 2 active operators");
        }
    }

    function test_GetAllOperatorsLength() public {
        assertEq(opManager.getAllOperatorsLength(), 0, "Initially zero operators");
        opManager.registerOperator(validOperator);
        assertEq(opManager.getAllOperatorsLength(), 1, "Now one operator");
    }

    function test_ReinitializeReverts() public {
        INetworkManager.NetworkManagerInitParams memory netInitParams =
            INetworkManager.NetworkManagerInitParams({network: address(0xFFF), subnetworkID: 999});
        vm.expectRevert();
        opManager.initialize(netInitParams);
    }

    function test_Location() public {
        bytes32 location =
            keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorManager")) - 1)) & ~bytes32(uint256(0xff));
        assertEq(location, 0x3b2b549db680c436ebf9aa3c8eeee850852f16da5cdb5137dbc0299ebb219e00, "Location mismatch");
    }
}

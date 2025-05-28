// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import {NoPermissionManager} from "../../../src/contracts/features/permissions/NoPermissionManager.sol";

contract TestNoPermissionManager is NoPermissionManager {
    function initialize() external initializer {
        __NoPermissionManager_init();
    }

    function actionRequiringNoPermission() external checkPermission {}
}

contract NoPermissionManagerTest is Test {
    TestNoPermissionManager noPermManager;

    function setUp() public {
        noPermManager = new TestNoPermissionManager();
        noPermManager.initialize();
    }

    function test_PermissionManagerVersion() public {
        assertEq(noPermManager.PermissionManager_VERSION(), 1, "PermissionManager_VERSION mismatch");
    }

    function test_NoPermissionManagerVersion() public {
        assertEq(noPermManager.NoPermissionManager_VERSION(), 1, "NoPermissionManager_VERSION mismatch");
    }

    function test_NoPermissionCheck() public {
        address randomUser = address(0x12345);
        vm.startPrank(randomUser);

        noPermManager.actionRequiringNoPermission();

        vm.stopPrank();
    }
}

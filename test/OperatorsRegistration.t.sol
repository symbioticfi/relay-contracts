// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {POCBaseTest} from "@symbiotic-test/POCBase.t.sol";

import {SimplePosMiddleware} from "../src/examples/simple-pos-network/SimplePosMiddleware.sol";
import {IBaseMiddlewareReader} from "../src/interfaces/IBaseMiddlewareReader.sol";

//import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
//import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
// import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {BaseMiddlewareReader} from "../src/middleware/BaseMiddlewareReader.sol";
import "forge-std/console.sol";
//import {Slasher} from "@symbiotic/contracts/slasher/Slasher.sol";
//import {VetoSlasher} from "@symbiotic/contracts/slasher/VetoSlasher.sol";

contract OperatorsRegistrationTest is POCBaseTest {
    // using Subnetwork for bytes32;
    // using Subnetwork for address;
    using Math for uint256;

    address network = address(0x123);

    SimplePosMiddleware internal middleware;

    uint48 internal epochDuration = 600; // 10 minutes
    uint48 internal slashingWindow = 1200; // 20 minutes

    function setUp() public override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        vm.warp(1_729_690_309);

        super.setUp();

        _deposit(vault1, alice, 1000 ether);
        _deposit(vault2, alice, 1000 ether);
        _deposit(vault3, alice, 1000 ether);

        address readHelper = address(new BaseMiddlewareReader());

        // Initialize middleware contract
        middleware = new SimplePosMiddleware(
            address(network),
            slashingWindow,
            address(vaultFactory),
            address(operatorRegistry),
            address(operatorNetworkOptInService),
            readHelper,
            owner,
            epochDuration
        );

        _registerNetwork(network, address(middleware));

        vm.warp(vm.getBlockTimestamp() + 1);
    }

    function testOperators() public {
        address operator = address(0x1337);
        bytes memory key = hex"0000000000000000000000000000000000000000000000000000000000000005";
        uint256 operatorsLength = IBaseMiddlewareReader(address(middleware)).operatorsLength();
        assertEq(operatorsLength, 0, "Operators length should be 0");

        // can't register without registration
        vm.expectRevert();
        middleware.registerOperator(operator, key, address(0));

        _registerOperator(operator);

        // can't register without opt-in
        vm.expectRevert();
        middleware.registerOperator(operator, key, address(0));

        // Need to set operator as msg.sender since _optInOperatorNetwork uses vm.startPrank(user)
        // and operator needs to call optIn themselves
        vm.startPrank(operator);
        operatorNetworkOptInService.optIn(network);
        vm.stopPrank();

        middleware.registerOperator(operator, key, address(0));

        (address op, uint48 s, uint48 f) = IBaseMiddlewareReader(address(middleware)).operatorWithTimesAt(0);

        operatorsLength = IBaseMiddlewareReader(address(middleware)).operatorsLength();
        assertEq(operatorsLength, 1, "Operators length should be 1");

        // can't register twice
        vm.expectRevert();
        middleware.registerOperator(operator, key, address(0));

        // activates on next epoch
        address[] memory operators = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(operators.length, 0, "1 Active operators length should be 0");
        skipEpoch();
        operators = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(operators.length, 1, "2 Active operators length should be 1");

        // pause
        middleware.pauseOperator(operator);

        // can't pause twice
        vm.expectRevert();
        middleware.pauseOperator(operator);

        // pause applies on next epoch
        operators = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(operators.length, 1, "3 Active operators length should be 1");

        // can't unpause right now, minumum one epoch before immutable period passed
        vm.expectRevert();
        middleware.unpauseOperator(operator);

        skipImmutablePeriod();
        skipImmutablePeriod();
        operators = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(operators.length, 0, "4 Active operators length should be 0");

        (op, s, f) = IBaseMiddlewareReader(address(middleware)).operatorWithTimesAt(0);

        // unpause
        middleware.unpauseOperator(operator);
        (op, s, f) = IBaseMiddlewareReader(address(middleware)).operatorWithTimesAt(0);

        // unpause applies on next epoch
        operators = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(operators.length, 0, "5 Active operators length should be 0");
        skipEpoch();
        operators = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(operators.length, 1, "6 Active operators length should be 1");

        // pause and unregister
        middleware.pauseOperator(operator);

        // can't unregister before immutable period passed
        vm.expectRevert();
        middleware.unregisterOperator(operator);
        skipEpoch();
        vm.expectRevert();
        middleware.unregisterOperator(operator);
        skipEpoch();
        middleware.unregisterOperator(operator);

        operatorsLength = IBaseMiddlewareReader(address(middleware)).operatorsLength();
        assertEq(operatorsLength, 0, "7 Operators length should be 0");
    }

    function testMultipleOperatorsWithKeys() public {
        // Set up multiple operators with different keys
        address[] memory operators = new address[](3);
        operators[0] = address(0x1337);
        operators[1] = address(0x1338);
        operators[2] = address(0x1339);

        bytes[] memory keys = new bytes[](3);
        keys[0] = hex"0000000000000000000000000000000000000000000000000000000000000001";
        keys[1] = hex"0000000000000000000000000000000000000000000000000000000000000002";
        keys[2] = hex"0000000000000000000000000000000000000000000000000000000000000003";

        // Register and opt-in all operators
        for (uint256 i = 0; i < operators.length; i++) {
            _registerOperator(operators[i]);
            vm.startPrank(operators[i]);
            operatorNetworkOptInService.optIn(network);
            vm.stopPrank();
            middleware.registerOperator(operators[i], keys[i], address(0));
        }

        // Skip epoch to activate all operators
        skipEpoch();

        // Verify all operators are active
        address[] memory activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 3, "Should have 3 active operators");

        // Test complex pause/unpause sequence
        // Pause operator 0
        middleware.pauseOperator(operators[0]);
        skipEpoch();
        activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 2, "Should have 2 active operators after pause");

        // Pause operator 1
        middleware.pauseOperator(operators[1]);
        skipEpoch();
        activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 1, "Should have 1 active operator after second pause");

        // Wait for immutable period and try to unpause operator 0
        skipImmutablePeriod();
        middleware.unpauseOperator(operators[0]);
        skipEpoch();
        activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 2, "Should have 2 active operators after unpause");

        // Test operator was active at specific timestamps
        uint48 currentTimestamp = IBaseMiddlewareReader(address(middleware)).getCaptureTimestamp();
        assertTrue(
            IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(currentTimestamp, operators[0]),
            "Operator 0 should be active"
        );
        assertFalse(
            IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(currentTimestamp, operators[1]),
            "Operator 1 should be inactive"
        );
        assertTrue(
            IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(currentTimestamp, operators[2]),
            "Operator 2 should be active"
        );

        // Test unregistration with active and inactive operators
        vm.expectRevert();
        middleware.unregisterOperator(operators[2]); // Should fail - operator is active

        skipImmutablePeriod();
        middleware.unregisterOperator(operators[1]); // Should succeed - operator is paused

        // Verify final state
        assertEq(IBaseMiddlewareReader(address(middleware)).operatorsLength(), 2, "Should have 2 operators remaining");
        activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 2, "Should still have 2 active operators");
    }

    function testReregisterOperator() public {
        // Set up initial operator
        address operator = address(0x1111);
        bytes memory key = hex"0000000000000000000000000000000000000000000000000000000000001111";

        // Register operator first time
        _registerOperator(operator);
        vm.startPrank(operator);
        operatorNetworkOptInService.optIn(network);
        vm.stopPrank();
        middleware.registerOperator(operator, key, address(0));

        // Skip epoch to activate operator
        skipEpoch();
        assertEq(
            IBaseMiddlewareReader(address(middleware)).activeOperators().length, 1, "Should have 1 active operator"
        );

        // Pause operator
        middleware.pauseOperator(operator);
        skipEpoch();
        assertEq(
            IBaseMiddlewareReader(address(middleware)).activeOperators().length,
            0,
            "Should have 0 active operators after pause"
        );

        // Wait for immutable period and unregister
        skipImmutablePeriod();
        middleware.unregisterOperator(operator);
        assertEq(
            IBaseMiddlewareReader(address(middleware)).operatorsLength(), 0, "Should have 0 operators after unregister"
        );

        // Register same operator again
        bytes memory keyNew = hex"0000000000000000000000000000000000000000000000000000000000001112";
        middleware.registerOperator(operator, keyNew, address(0));

        // Skip epoch to activate operator
        skipEpoch();
        assertEq(
            IBaseMiddlewareReader(address(middleware)).activeOperators().length,
            1,
            "Should have 1 active operator after reregistration"
        );
        assertTrue(
            IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(
                IBaseMiddlewareReader(address(middleware)).getCaptureTimestamp(), operator
            ),
            "Operator should be active after reregistration"
        );
    }

    function testCornerCaseTimings() public {
        // Set up initial operator
        address operator = address(0x1111);
        bytes memory key = hex"0000000000000000000000000000000000000000000000000000000000001111";

        _registerOperator(operator);
        vm.startPrank(operator);
        operatorNetworkOptInService.optIn(network);
        vm.stopPrank();

        // Register operator just before epoch boundary
        middleware.registerOperator(operator, key, address(0));
        vm.warp(middleware.getEpochStart(1));
        assertEq(
            IBaseMiddlewareReader(address(middleware)).activeOperators().length,
            0,
            "Should have no active operators before epoch"
        );

        // Check right at epoch boundary
        vm.warp(middleware.getEpochStart(1) + 1);
        assertEq(
            IBaseMiddlewareReader(address(middleware)).activeOperators().length,
            1,
            "Should have 1 active operator at epoch start"
        );

        // Test pause timing edge cases
        middleware.pauseOperator(operator);
        uint48 pauseTime = uint48(block.timestamp);

        // Try unpause just before slashing window ends
        vm.warp(pauseTime + slashingWindow - 1);
        vm.expectRevert();
        middleware.unpauseOperator(operator);

        // Should work exactly at slashing window
        vm.warp(pauseTime + slashingWindow);
        middleware.unpauseOperator(operator);

        // Test capture timestamp interactions
        uint48 currentEpochStart = middleware.getEpochStart(middleware.getCurrentEpoch() + 1);

        // Pause right before capture timestamp
        vm.warp(currentEpochStart - 1);
        middleware.pauseOperator(operator);
        assertTrue(
            IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(currentEpochStart - 1, operator),
            "Operator should be active before pause"
        );

        // Check status at capture timestamp
        vm.warp(currentEpochStart);
        assertFalse(
            IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(currentEpochStart, operator),
            "Operator should be inactive at capture"
        );

        // Test unregister timing
        vm.warp(currentEpochStart + slashingWindow - 2);

        // Attempt unregister before slashing window
        vm.expectRevert();
        middleware.unregisterOperator(operator);

        // Should succeed exactly at slashing window
        vm.warp(currentEpochStart + slashingWindow);
        middleware.unregisterOperator(operator);

        // Try to register again immediately - should fail
        vm.expectRevert();
        middleware.registerOperator(operator, key, address(0));

        // Test registration in next epoch
        vm.warp(currentEpochStart + 2 * slashingWindow + 1);

        // Should work in next epoch
        bytes memory keyNew = hex"0000000000000000000000000000000000000000000000000000000000001112";
        middleware.registerOperator(operator, keyNew, address(0));
    }

    function testComplexOperatorTimings() public {
        // Set up two operators
        address operator1 = address(0x1111);
        address operator2 = address(0x2222);
        bytes memory key1 = hex"0000000000000000000000000000000000000000000000000000000000001111";
        bytes memory key2 = hex"0000000000000000000000000000000000000000000000000000000000002222";

        // Register and setup both operators
        address[] memory operators = new address[](2);
        operators[0] = operator1;
        operators[1] = operator2;

        for (uint256 i = 0; i < operators.length; i++) {
            _registerOperator(operators[i]);
            vm.startPrank(operators[i]);
            operatorNetworkOptInService.optIn(network);
            vm.stopPrank();
        }

        // Register operators at different times
        middleware.registerOperator(operator1, key1, address(0));
        skipEpoch(); // Skip one epoch
        middleware.registerOperator(operator2, key2, address(0));

        // At this point, operator1 should be active, operator2 pending
        address[] memory activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 1, "Should have 1 active operator");
        assertEq(activeOps[0], operator1, "Active operator should be operator1");

        // Skip epoch to activate operator2
        skipEpoch();
        activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 2, "Should have 2 active operators");

        // Pause operator1, wait partial immutable period, pause operator2
        middleware.pauseOperator(operator1);
        skipEpoch();
        vm.warp(block.timestamp + slashingWindow / 2); // Advance time by half the slashing window
        middleware.pauseOperator(operator2);

        // Skip to when operator1 can be unpaused but operator2 cannot
        vm.warp(block.timestamp + slashingWindow / 2); // Complete immutable period for operator1
        middleware.unpauseOperator(operator1); // Should work
        vm.expectRevert();
        middleware.unpauseOperator(operator2); // Should fail

        // Skip to when operator2 can be unpaused
        skipImmutablePeriod();
        middleware.unpauseOperator(operator2);

        // Skip epoch to activate both operators
        skipEpoch();
        activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 2, "Should have 2 active operators again");

        // Test historical activity
        uint48 timestamp = IBaseMiddlewareReader(address(middleware)).getCaptureTimestamp();
        assertTrue(IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(timestamp, operator1));
        assertTrue(IBaseMiddlewareReader(address(middleware)).operatorWasActiveAt(timestamp, operator2));

        // Pause both operators again but unregister at different times
        middleware.pauseOperator(operator1);
        middleware.pauseOperator(operator2);
        skipImmutablePeriod();

        middleware.unregisterOperator(operator1);
        vm.expectRevert(); // Can't register same operator again
        middleware.registerOperator(operator1, key1, address(0));

        skipEpoch();
        middleware.unregisterOperator(operator2);

        // Verify final state
        assertEq(IBaseMiddlewareReader(address(middleware)).operatorsLength(), 0, "Should have no operators");
        activeOps = IBaseMiddlewareReader(address(middleware)).activeOperators();
        assertEq(activeOps.length, 0, "Should have no active operators");
    }

    function skipEpoch() private {
        vm.warp(block.timestamp + epochDuration);
    }

    function skipImmutablePeriod() private {
        vm.warp(block.timestamp + slashingWindow);
    }
}

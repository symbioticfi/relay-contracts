// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {POCBaseTest} from "@symbiotic-test/POCBase.t.sol";

import {SimpleMiddleware} from "../src/examples/simple-network/SimpleMiddleware.sol";
import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {BaseMiddleware} from "../src/BaseMiddleware.sol";
import {PauseableEnumerableSet} from "../src/libraries/PauseableEnumerableSet.sol";
import {KeyManager} from "../src/KeyManager.sol";
import {OperatorManager} from "../src/OperatorManager.sol";
import {VaultManager} from "../src/VaultManager.sol";
import {Slasher} from "@symbiotic/contracts/slasher/Slasher.sol";
import {VetoSlasher} from "@symbiotic/contracts/slasher/VetoSlasher.sol";

contract SimpleMiddlewareTest is POCBaseTest {
    using Subnetwork for bytes32;
    using Subnetwork for address;
    using Math for uint256;

    address network = address(0x123);

    SimpleMiddleware internal middleware;

    uint48 internal epochDuration = 600; // 10 minutes
    uint48 internal slashingWindow = 1200; // 20 minutes

    address internal operator1;
    address internal operator2;
    address internal operator3;

    bytes32 internal key1 = keccak256("key1");
    bytes32 internal key2 = keccak256("key2");
    bytes32 internal key3 = keccak256("key3");

    uint96 internal subnetwork1 = 0;
    uint96 internal subnetwork2 = 1;

    function setUp() public override {
        vm.warp(1729690309);

        super.setUp();

        vm.prank(network);
        networkRegistry.registerNetwork();

        // Set operators
        operator1 = alice;
        operator2 = bob;
        operator3 = address(0x3); // A third operator

        // Register operator1
        vm.startPrank(operator1);
        operatorRegistry.registerOperator();
        operatorNetworkOptInService.optIn(address(network));
        vm.stopPrank();

        // Register operator2
        vm.startPrank(operator2);
        operatorRegistry.registerOperator();
        operatorNetworkOptInService.optIn(address(network));
        vm.stopPrank();

        // Register operator3
        vm.startPrank(operator3);
        operatorRegistry.registerOperator();
        operatorNetworkOptInService.optIn(address(network));
        vm.stopPrank();

        // Opt-in operators to the vault
        _optInOperatorVault(vault1, operator1);
        _optInOperatorVault(vault1, operator2);
        _optInOperatorVault(vault2, operator3);
        _optInOperatorVault(vault2, operator1);

        // Set network limit and operator shares in the delegator
        _setMaxNetworkLimit(address(delegator1), network, subnetwork1, type(uint256).max);
        _setMaxNetworkLimit(address(delegator2), network, subnetwork1, type(uint256).max);

        _deposit(vault1, alice, 550 ether);
        _deposit(vault2, alice, 500 ether);

        _setNetworkLimitNetwork(delegator1, alice, address(network), 550 ether);
        _setNetworkLimitFull(delegator2, alice, address(network), 450 ether);

        _setOperatorNetworkShares(delegator1, alice, address(network), operator1, 250 ether);
        _setOperatorNetworkShares(delegator1, alice, address(network), operator2, 300 ether);
        _setOperatorNetworkLimit(delegator2, alice, address(network), operator1, 250 ether);
        _setOperatorNetworkLimit(delegator2, alice, address(network), operator3, 200 ether);

        // Initialize middleware contract
        middleware = new SimpleMiddleware(
            address(network),
            address(operatorRegistry),
            address(vaultFactory),
            address(operatorNetworkOptInService),
            owner,
            epochDuration,
            slashingWindow
        );

        // Register network middleware
        vm.prank(network);
        networkMiddlewareService.setMiddleware(address(middleware));

        // Register operators in the middleware
        vm.startPrank(owner);
        middleware.registerOperator(operator1);
        middleware.registerOperator(operator2);
        middleware.registerOperator(operator3);

        // Update keys for operators
        middleware.updateKey(operator1, key1);
        middleware.updateKey(operator2, key2);
        middleware.updateKey(operator3, key3);

        // Register subnetworks
        middleware.registerSubnetwork(subnetwork2);

        // Register vaults
        middleware.registerSharedVault(address(vault1));
        middleware.registerSharedVault(address(vault2));

        vm.stopPrank();

        skipEpoch();
    }

    function testUpdateKeys() public {
        // Update operator1's key
        bytes32 newKey1 = keccak256("newKey1");
        vm.prank(owner);
        middleware.updateKey(operator1, newKey1);

        skipEpoch();

        // Verify that the key is updated
        bytes32 currentKey1 = middleware.operatorKey(operator1);
        assertEq(currentKey1, newKey1, "Operator1's key was not updated correctly");
    }

    function testPauseUnpauseOperator() public {
        // Pause operator2
        vm.prank(owner);
        middleware.pauseOperator(operator2);
        skipEpoch();

        // Verify operator2 is paused
        address[] memory activeOperators = middleware.activeOperators();
        bool foundOperator2 = false;
        for (uint256 i = 0; i < activeOperators.length; i++) {
            if (activeOperators[i] == operator2) {
                foundOperator2 = true;
            }
        }
        assertFalse(foundOperator2, "Operator2 should be paused");

        // Unpause operator2
        vm.prank(owner);
        skipImmutablePeriod();
        middleware.unpauseOperator(operator2);
        skipEpoch();

        // Verify operator2 is active again
        activeOperators = middleware.activeOperators();
        foundOperator2 = false;
        for (uint256 i = 0; i < activeOperators.length; i++) {
            if (activeOperators[i] == operator2) {
                foundOperator2 = true;
                break;
            }
        }
        assertTrue(foundOperator2, "Operator2 should be active after unpausing");
    }

    function testPauseUnpauseVault() public {
        // Pause the vault
        vm.prank(owner);
        middleware.pauseSharedVault(address(vault1));
        skipEpoch();

        // Verify the vault is paused
        address[] memory vaults = middleware.activeVaults(operator1);
        bool foundVault = false;
        for (uint256 i = 0; i < vaults.length; i++) {
            if (vaults[i] == address(vault1)) {
                foundVault = true;
                break;
            }
        }
        assertFalse(foundVault, "Vault should be paused");

        // Unpause the vault
        vm.prank(owner);
        skipImmutablePeriod();
        middleware.unpauseSharedVault(address(vault1));
        skipEpoch();

        // Verify the vault is active again
        vaults = middleware.activeVaults(operator1);
        foundVault = false;
        for (uint256 i = 0; i < vaults.length; i++) {
            if (vaults[i] == address(vault1)) {
                foundVault = true;
                break;
            }
        }
        assertTrue(foundVault, "Vault should be active after unpausing");
    }

    function testPauseUnpauseSubnetwork() public {
        // Pause subnetwork2
        vm.prank(owner);
        middleware.pauseSubnetwork(subnetwork2);
        skipEpoch();

        // Verify subnetwork2 is paused
        uint160[] memory activeSubnetworks = middleware.activeSubnetworks();
        bool foundSubnetwork2 = false;
        for (uint256 i = 0; i < activeSubnetworks.length; i++) {
            if (activeSubnetworks[i] == uint160(subnetwork2)) {
                foundSubnetwork2 = true;
                break;
            }
        }
        assertFalse(foundSubnetwork2, "Subnetwork2 should be paused");

        // Unpause subnetwork2
        vm.prank(owner);
        skipImmutablePeriod();
        middleware.unpauseSubnetwork(subnetwork2);
        skipEpoch();

        // Verify subnetwork2 is active again
        activeSubnetworks = middleware.activeSubnetworks();
        foundSubnetwork2 = false;
        for (uint256 i = 0; i < activeSubnetworks.length; i++) {
            if (activeSubnetworks[i] == uint160(subnetwork2)) {
                foundSubnetwork2 = true;
                break;
            }
        }
        assertTrue(foundSubnetwork2, "Subnetwork2 should be active after unpausing");
    }

    function testSlashOperator() public {
        // Prepare hints (empty in this context)
        uint256 vaultsLen = middleware.activeVaults(operator1).length;
        bytes[][] memory stakeHints = new bytes[][](vaultsLen);
        for (uint256 i; i < vaultsLen; i++) {
            stakeHints[i] = new bytes[](middleware.activeSubnetworks().length);
            for (uint256 j; j < stakeHints[i].length; j++) {
                stakeHints[i][j] = "";
            }
        }

        bytes[] memory slashHints = new bytes[](stakeHints.length);

        skipEpoch();
        uint48 epoch = middleware.getCurrentEpoch();
        uint256 amount = 100 ether;

        // Perform slash on operator1
        vm.prank(owner);
        SimpleMiddleware.SlashResponse[] memory responses =
            middleware.slash(epoch, key1, amount, stakeHints, slashHints);

        // Check that the slashing occurred
        assertEq(responses.length, 2, "Should have one slash response");
        assertEq(responses[0].vault, address(vault1), "Incorrect vault in slash response");
        assertEq(responses[0].slasherType, slasher1.TYPE(), "Incorrect slasher type");
        assertEq(responses[0].response, amount / 2, "Incorrect slashed amount");
        assertEq(responses[1].vault, address(vault2), "Incorrect vault in slash response");
        assertEq(responses[1].slasherType, slasher2.TYPE(), "Incorrect slasher type");
        assertEq(responses[1].response, amount / 2, "Incorrect slashed amount");

        // Verify that the operator's stake has decreased
        uint256 remainingStake =
            delegator1.stakeAt(network.subnetwork(subnetwork1), operator1, uint48(block.timestamp), "");
        assertEq(remainingStake, 227272727272727272727, "Operator1 stake not reduced correctly");
    }

    function testUnregisterOperator() public {
        // Unregister operator3
        vm.startPrank(owner);
        middleware.pauseOperator(operator3);
        skipEpoch();
        skipImmutablePeriod();
        middleware.unregisterOperator(operator3);
        vm.stopPrank();
        skipEpoch();

        // Verify operator3 is unregistered
        address[] memory activeOperators = middleware.activeOperators();
        bool foundOperator3 = false;
        for (uint256 i = 0; i < activeOperators.length; i++) {
            if (activeOperators[i] == operator3) {
                foundOperator3 = true;
                break;
            }
        }
        assertFalse(foundOperator3, "Operator3 should be unregistered");
    }

    function testUnregisterSubnetwork() public {
        // Unregister subnetwork1
        vm.startPrank(owner);
        middleware.pauseSubnetwork(subnetwork1);
        skipEpoch();
        skipImmutablePeriod();
        middleware.unregisterSubnetwork(subnetwork1);
        vm.stopPrank();
        skipEpoch();

        // Verify subnetwork1 is unregistered
        uint160[] memory activeSubnetworks = middleware.activeSubnetworks();
        bool foundSubnetwork1 = false;
        for (uint256 i = 0; i < activeSubnetworks.length; i++) {
            if (activeSubnetworks[i] == uint160(subnetwork1)) {
                foundSubnetwork1 = true;
                break;
            }
        }
        assertFalse(foundSubnetwork1, "Subnetwork1 should be unregistered");
    }

    function testUnregisterVault() public {
        // Unregister the vault
        vm.startPrank(owner);
        middleware.pauseSharedVault(address(vault1));
        skipEpoch();
        skipImmutablePeriod();
        middleware.unregisterSharedVault(address(vault1));
        vm.stopPrank();
        skipEpoch();

        // Verify the vault is unregistered
        address[] memory vaults = middleware.activeVaults(operator1);
        bool foundVault = false;
        for (uint256 i = 0; i < vaults.length; i++) {
            if (vaults[i] == address(vault1)) {
                foundVault = true;
                break;
            }
        }
        assertFalse(foundVault, "Vault should be unregistered");
    }

    function testValidatorSetWithMultipleSubnetworks() public {
        skipEpoch();
        // Get validator set
        SimpleMiddleware.ValidatorData[] memory validatorSet = middleware.getValidatorSet();

        // Expected validator set length is 3
        assertEq(validatorSet.length, 3, "Validator set length should be 3");

        // Verify each validator's power
        for (uint256 i = 0; i < validatorSet.length; i++) {
            SimpleMiddleware.ValidatorData memory validator = validatorSet[i];
            if (validator.key == key1) {
                assertEq(validator.power, 500 ether, "Operator1 power mismatch");
            } else if (validator.key == key2) {
                assertEq(validator.power, 300 ether, "Operator2 power mismatch");
            } else if (validator.key == key3) {
                assertEq(validator.power, 200 ether, "Operator3 power mismatch");
            } else {
                assert(false);
            }
        }
    }

    function testOperatorStakeAfterSlash() public {
        // Prepare hints
        uint256 vaultsLen = middleware.activeVaults(operator1).length;
        bytes[][] memory stakeHints = new bytes[][](vaultsLen);
        for (uint256 i; i < vaultsLen; i++) {
            stakeHints[i] = new bytes[](middleware.activeSubnetworks().length);
            for (uint256 j; j < stakeHints[i].length; j++) {
                stakeHints[i][j] = "";
            }
        }

        bytes[] memory slashHints = new bytes[](stakeHints.length);
        slashHints[0] = "";

        uint48 epoch = middleware.getCurrentEpoch();
        uint256 amount = 100 ether;

        // Perform a slash on operator1
        vm.prank(owner);
        middleware.slash(epoch, key1, amount, stakeHints, slashHints);

        // Verify operator1's stake is reduced
        uint256 remainingStake =
            delegator1.stakeAt(network.subnetwork(subnetwork1), operator1, uint48(block.timestamp), "");
        assertEq(remainingStake, 227272727272727272727, "Operator1 stake not reduced correctly");

        // Verify total stake is updated
        skipEpoch();
        uint256 totalStake = middleware.getTotalStake();
        uint256 expectedTotalStake = 950 ether - 1; // 1000 ether - 100 / 2 ether
        assertEq(totalStake, expectedTotalStake, "Total stake not updated correctly");
    }

    function testRevertOnUnregisteredOperator() public {
        // Attempt to register an operator not in the registry
        address unregisteredOperator = address(0x4);
        vm.expectRevert(OperatorManager.NotOperator.selector);
        vm.prank(owner);
        middleware.registerOperator(unregisteredOperator);
    }

    function testModifyStake() public {
        // Increase operator1's stake
        _deposit(vault1, operator1, 50 ether);

        _setNetworkLimitNetwork(delegator1, operator1, address(network), 600 ether);
        _setOperatorNetworkShares(delegator1, alice, address(network), operator1, 600 ether);

        // Verify the stake is updated
        uint256 newStake = delegator1.stakeAt(network.subnetwork(subnetwork1), operator1, uint48(block.timestamp), "");
        assertEq(newStake, 400 ether, "Operator1's stake not updated correctly");

        skipEpoch();
        // Verify total stake is updated
        uint256 totalStake = middleware.getTotalStake();
        uint256 expectedTotalStake = 1050 ether; // Previous total + 50 ether
        assertEq(totalStake, expectedTotalStake, "Total stake not updated correctly");
    }

    function skipEpoch() private {
        vm.warp(block.timestamp + epochDuration);
    }

    function skipImmutablePeriod() private {
        vm.warp(block.timestamp + slashingWindow);
    }
}

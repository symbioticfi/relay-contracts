// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {POCBaseTest} from "@symbiotic-test/POCBase.t.sol";

import {ExtendedSimpleMiddleware} from "./mocks/ExtendedSimpleMiddleware.sol";
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
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract SDKTest is POCBaseTest {
    using Subnetwork for bytes32;
    using Subnetwork for address;
    using Math for uint256;

    address network = address(0x123);
    address notOwner = address(0xdead);

    ExtendedSimpleMiddleware internal middleware;

    uint48 internal epochDuration = 600; // 10 minutes
    uint48 internal slashingWindow = 1200; // 20 minutes

    function setUp() public override {
        vm.warp(1729690309);

        super.setUp();

        _deposit(vault1, alice, 550 ether);
        _deposit(vault2, alice, 500 ether);

        // Initialize middleware contract
        middleware = new ExtendedSimpleMiddleware(
            address(network),
            address(operatorRegistry),
            address(vaultFactory),
            address(operatorNetworkOptInService),
            owner,
            epochDuration,
            slashingWindow
        );

        _registerNetwork(network, address(middleware));
    }

    function testOperators() public {
        address operator = address(0x1337);
        uint256 operatorsLength = middleware.operatorsLength();
        assertEq(operatorsLength, 0, "Operators length should be 0");

        // can't register without registration
        vm.expectRevert();
        middleware.registerOperator(operator);

        _registerOperator(operator);

        // can't register without opt-in
        vm.expectRevert();
        middleware.registerOperator(operator);

        _optInOperatorNetwork(operator, network);
        middleware.registerOperator(operator);

        operatorsLength = middleware.operatorsLength();
        assertEq(operatorsLength, 1, "Operators length should be 1");

        // can't register twice
        vm.expectRevert();
        middleware.registerOperator(operator);

        // activates on next epoch
        address[] memory operators = middleware.activeOperators();
        assertEq(operators.length, 0, "Active operators length should be 0");
        skipEpoch();
        operators = middleware.activeOperators();
        assertEq(operators.length, 1, "Active operators length should be 1");

        // pause
        middleware.pauseOperator(operator);

        // can't pause twice
        vm.expectRevert();
        middleware.pauseOperator(operator);

        // pause applies on next epoch
        operators = middleware.activeOperators();
        assertEq(operators.length, 1, "Active operators length should be 1");

        // can't unpause right now, minumum one epoch before immutable period passed
        vm.expectRevert();
        middleware.unpauseOperator(operator);

        skipEpoch();
        operators = middleware.activeOperators();
        assertEq(operators.length, 0, "Active operators length should be 0");

        // unpause
        middleware.unpauseOperator(operator);

        // unpause applies on next epoch
        operators = middleware.activeOperators();
        assertEq(operators.length, 0, "Active operators length should be 0");
        skipEpoch();
        operators = middleware.activeOperators();
        assertEq(operators.length, 1, "Active operators length should be 1");

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

        operatorsLength = middleware.operatorsLength();
        assertEq(operatorsLength, 0, "Operators length should be 0");
    }

    function testKeys() public {
        bytes32 key = keccak256("key");
        address operator = address(0x1337);

        bytes32 operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, bytes32(0), "Operator's key should be empty");
        address keyOperator = middleware.operatorByKey(key);
        assertEq(keyOperator, address(0), "Key's operator should be empty");

        middleware.updateKey(operator, key);
        keyOperator = middleware.operatorByKey(key);
        assertEq(keyOperator, operator, "Key's operator was not updated correctly");

        // applies on next epoch
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, bytes32(0), "Operator's key should be empty");

        skipEpoch();
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, key, "Operator's key was not updated correctly");

        // update key
        bytes32 newKey = keccak256("newKey");
        middleware.updateKey(operator, newKey);

        // can't update already active key twice
        vm.expectRevert();
        middleware.updateKey(operator, newKey);

        keyOperator = middleware.operatorByKey(key);
        assertEq(keyOperator, operator, "Key's operator was not updated correctly");

        // applies on next epoch
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, key, "Operator's key should be previous key");

        skipEpoch();
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, newKey, "Operator's key was not updated correctly");

        bytes32 zeroKey = bytes32(0);
        middleware.updateKey(operator, zeroKey);
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, newKey, "Operator's key should be previous key");

        skipEpoch();
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, zeroKey, "Operator's key was not updated correctly");

        // can't set used key to another operator
        vm.expectRevert();
        middleware.updateKey(address(0x123123), key);

        // should apply update to latest updated key
        bytes32 newKey2 = keccak256("newKey2");
        bytes32 newKey3 = keccak256("newKey3");
        middleware.updateKey(operator, newKey2);
        middleware.updateKey(operator, newKey3);
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, zeroKey, "Operator's key should be previous key");

        skipEpoch();
        operatorKey = middleware.operatorKey(operator);
        assertEq(operatorKey, newKey3, "Operator's key was not updated correctly");
    }

    function testBLSKeys() public {
        bytes memory key = "key";
        address operator = address(0x1337);

        bytes memory operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, "", "Operator's BLS key should be empty");
        address keyOperator = middleware.operatorByBLSKey(key);
        assertEq(keyOperator, address(0), "BLS key's operator should be empty");

        middleware.updateBLSKey(operator, key);
        keyOperator = middleware.operatorByBLSKey(key);
        assertEq(keyOperator, operator, "BLS key's operator was not updated correctly");

        // applies on next epoch
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, "", "Operator's BLS key should be empty");

        skipEpoch();
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, key, "Operator's BLS key was not updated correctly");

        // update key
        bytes memory newKey = "newKey";
        middleware.updateBLSKey(operator, newKey);

        // can't update already active bls key twice
        vm.expectRevert();
        middleware.updateBLSKey(operator, newKey);

        keyOperator = middleware.operatorByBLSKey(key);
        assertEq(keyOperator, operator, "BLS key's operator was not updated correctly");

        // applies on next epoch
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, key, "Operator's BLS key should be previous key");

        skipEpoch();
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, newKey, "Operator's BLS key was not updated correctly");

        bytes memory zeroKey = "";
        middleware.updateBLSKey(operator, zeroKey);
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, newKey, "Operator's BLS key should be previous key");

        skipEpoch();
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, zeroKey, "Operator's BLS key was not updated correctly");

        // can't set used bls key to another operator
        vm.expectRevert();
        middleware.updateBLSKey(address(0x123123), key);

        // should apply update to latest updated bls key
        bytes memory newKey2 = "newKey2";
        bytes memory newKey3 = "newKey3";
        middleware.updateBLSKey(operator, newKey2);
        middleware.updateBLSKey(operator, newKey3);
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, zeroKey, "Operator's BLS key should be previous key");

        skipEpoch();
        operatorKey = middleware.operatorBLSKey(operator);
        assertEq(operatorKey, newKey3, "Operator's BLS key was not updated correctly");
    }

    function testSubnetworks() public {
        skipEpoch(); // let first 0 subnetwork activate

        uint96 subnetwork = 1;
        uint256 subnetworksLength = middleware.subnetworksLength();
        assertEq(subnetworksLength, 1, "Subnetworks length should be 1");

        // register
        middleware.registerSubnetwork(subnetwork);

        subnetworksLength = middleware.subnetworksLength();
        assertEq(subnetworksLength, 2, "Subnetworks length should be 2");

        // can't register twice
        vm.expectRevert();
        middleware.registerSubnetwork(subnetwork);

        // activates on next epoch
        uint160[] memory subnetworks = middleware.activeSubnetworks();
        assertEq(subnetworks.length, 1, "Active subnetworks length should be 1");
        skipEpoch();
        subnetworks = middleware.activeSubnetworks();
        assertEq(subnetworks.length, 2, "Active subnetworks length should be 2");

        // pause
        middleware.pauseSubnetwork(subnetwork);

        // can't pause twice
        vm.expectRevert();
        middleware.pauseSubnetwork(subnetwork);

        // pause applies on next epoch
        subnetworks = middleware.activeSubnetworks();
        assertEq(subnetworks.length, 2, "Active subnetworks length should be 2");

        // can't unpause right now, minumum one epoch before immutable period passed
        vm.expectRevert();
        middleware.unpauseSubnetwork(subnetwork);

        skipEpoch();
        subnetworks = middleware.activeSubnetworks();
        assertEq(subnetworks.length, 1, "Active subnetworks length should be 1");

        // unpause
        middleware.unpauseSubnetwork(subnetwork);

        // unpause applies on next epoch
        subnetworks = middleware.activeSubnetworks();
        assertEq(subnetworks.length, 1, "Active subnetworks length should be 1");
        skipEpoch();
        subnetworks = middleware.activeSubnetworks();
        assertEq(subnetworks.length, 2, "Active subnetworks length should be 2");

        // pause and unregister
        middleware.pauseSubnetwork(subnetwork);

        // can't unregister before immutable period passed
        vm.expectRevert();
        middleware.unregisterSubnetwork(subnetwork);
        skipEpoch();
        vm.expectRevert();
        middleware.unregisterSubnetwork(subnetwork);
        skipEpoch();
        middleware.unregisterSubnetwork(subnetwork);

        subnetworksLength = middleware.subnetworksLength();
        assertEq(subnetworksLength, 1, "Subnetworks length should be 1");
    }

    function testVaults() public {
        address operator = address(0x1337);
        address operator2 = address(0x1338);
        address vault = address(vault1);

        // should register only vault
        vm.expectRevert();
        middleware.registerSharedVault(operator);

        // register shared vault
        middleware.registerSharedVault(vault);
        uint256 sharedVaultLength = middleware.sharedVaultsLength();
        assertEq(sharedVaultLength, 1, "Shared vaults length should be 1");

        // active vaults should be zero
        address[] memory activeVaults = middleware.activeVaults(operator);
        assertEq(activeVaults.length, 0, "Active vaults length should be 0");

        // shared vaults are active for each operator
        skipEpoch();
        activeVaults = middleware.activeVaults(operator);
        assertEq(activeVaults.length, 1, "Active vaults length should be 1");

        // can't register twice
        vm.expectRevert();
        middleware.registerSharedVault(vault);

        // can't register as operator vault if registered as shared
        vm.expectRevert();
        middleware.registerOperatorVault(operator, vault);

        middleware.registerOperatorVault(operator, address(vault2));

        // activates only for registered operator
        skipEpoch();
        activeVaults = middleware.activeVaults(operator);
        assertEq(activeVaults.length, 2, "Active vaults length should be 2");
        activeVaults = middleware.activeVaults(operator2);
        assertEq(activeVaults.length, 1, "Active vaults length should be 1");

        // can't register as shared if resgistred as operator's
        vm.expectRevert();
        middleware.registerSharedVault(address(vault2));

        // pause, unpause and unregister same as operators, subnetworks so don't test
        middleware.pauseSharedVault(vault);
        skipImmutablePeriod();
        middleware.unregisterSharedVault(vault);

        // can register to operator after unregister
        middleware.registerOperatorVault(operator, vault);
    }

    function testStakes() public {
        address operator1 = address(0x1337);
        address operator2 = address(0x1338);

        _registerOperator(operator1);
        _registerOperator(operator2);

        _optInOperatorNetwork(operator1, network);
        _optInOperatorNetwork(operator2, network);

        _optInOperatorVault(vault1, operator1);
        _optInOperatorVault(vault1, operator2);
        _optInOperatorVault(vault2, operator1);
        _optInOperatorVault(vault2, operator2);
    }

    // function testSlash() public {}

    // function testEpochs() public {}

    function skipEpoch() private {
        vm.warp(block.timestamp + epochDuration);
    }

    function skipImmutablePeriod() private {
        vm.warp(block.timestamp + slashingWindow);
    }
}

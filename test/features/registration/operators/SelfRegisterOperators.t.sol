// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {SelfRegisterOperators} from
    "../../../../src/contracts/features/registration/operators/SelfRegisterOperators.sol";
import {Tokens} from "../../../../src/contracts/features/registration/tokens/Tokens.sol";
import {VaultManagerLogic} from "../../../../src/contracts/base/logic/VaultManagerLogic.sol";
import {ISelfRegisterOperators} from
    "../../../../src/interfaces/features/registration/operators/ISelfRegisterOperators.sol";
import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {NoPermissionManager} from "../../../../src/contracts/features/permissions/NoPermissionManager.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {EqualStakeToVP} from "../../../../src/contracts/features/stakeToVotingPower/EqualStakeToVP.sol";

import {BN254} from "../../../../src/contracts/libraries/utils/BN254.sol"; // if needed
import "../../../InitSetup.sol";

/**
 * @dev Concrete contract for testing SelfRegisterOperators.
 *      Inherits from NoPermissionManager (so _checkPermission is empty)
 *      plus the other features.
 */
contract TestSelfRegisterOperators is Tokens, SelfRegisterOperators, NoPermissionManager, EqualStakeToVP {
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInit,
        IVaultManager.VaultManagerInitParams memory vaultInit
    ) external initializer {
        __NetworkManager_init(netInit);
        __OperatorManager_init();
        __VaultManager_init(vaultInit);
        __SelfRegisterOperators_init();
    }
}

contract SelfRegisterOperatorsTest is InitSetup {
    TestSelfRegisterOperators private selfRegisterOperators;

    function setUp() public override {
        InitSetup.setUp();

        selfRegisterOperators =
            new TestSelfRegisterOperators(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100});

        selfRegisterOperators.initialize(netInit, vaultInit);

        selfRegisterOperators.registerToken(initSetupParams.masterChain.tokens[0]);
    }

    function test_Version() public {
        assertEq(selfRegisterOperators.SelfRegisterOperators_VERSION(), 1, "SelfRegisterOperators_VERSION mismatch");
    }

    function test_RegisterOperator() public {
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: vars.operators[0].addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: selfRegisterOperators.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 2,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        vm.startPrank(vars.operators[0].addr);
        selfRegisterOperators.registerOperator(vault);
        vm.stopPrank();

        assertTrue(selfRegisterOperators.isOperatorActive(vars.operators[0].addr), "Operator should be active");
        assertTrue(selfRegisterOperators.isOperatorVaultActive(vars.operators[0].addr, vault), "Vault should be active");

        vm.startPrank(vars.operators[0].addr);
        selfRegisterOperators.unregisterOperator();
        vm.stopPrank();

        assertFalse(selfRegisterOperators.isOperatorActive(vars.operators[0].addr), "Operator should be unregistered");
        assertTrue(
            selfRegisterOperators.isOperatorVaultActive(vars.operators[0].addr, vault), "Vault should be unregistered"
        );
    }

    function test_RegisterOperatorVault() public {
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: vars.operators[0].addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: selfRegisterOperators.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 2,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        vm.startPrank(vars.operators[0].addr);
        selfRegisterOperators.registerOperator(vault);
        vm.stopPrank();

        assertTrue(selfRegisterOperators.isOperatorActive(vars.operators[0].addr), "Operator should be active");
        assertTrue(selfRegisterOperators.isOperatorVaultActive(vars.operators[0].addr, vault), "Vault should be active");

        vm.startPrank(vars.operators[0].addr);
        selfRegisterOperators.unregisterOperatorVault(vault);
        vm.stopPrank();

        assertTrue(selfRegisterOperators.isOperatorActive(vars.operators[0].addr), "Operator should be active");
        assertFalse(
            selfRegisterOperators.isOperatorVaultActive(vars.operators[0].addr, vault), "Vault should be unregistered"
        );
    }

    function test_registerOperatorWithSignature() public {
        address operatorAddr = vars.operators[0].addr;
        uint256 operatorPk = vars.operators[0].privateKey;

        uint256 currentNonce = selfRegisterOperators.nonces(operatorAddr);

        address someVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: selfRegisterOperators.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 2,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        bytes32 registerOperatorTypehash = keccak256("RegisterOperator(address operator,address vault,uint256 nonce)");

        bytes32 structHash = keccak256(abi.encode(registerOperatorTypehash, operatorAddr, someVault, currentNonce));

        bytes32 digest = selfRegisterOperators.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPk, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        selfRegisterOperators.registerOperatorWithSignature(operatorAddr, someVault, signature);

        assertTrue(selfRegisterOperators.isOperatorActive(operatorAddr), "Operator should be active");
        assertTrue(selfRegisterOperators.isOperatorVaultActive(operatorAddr, someVault), "Vault should be active");
    }

    function test_registerOperatorWithSignature_RevertIfInvalidSig() public {
        address operatorAddr = vars.operators[0].addr;
        uint256 operatorPk = vars.operators[0].privateKey;

        uint256 wrongPk = 0x999999999;
        address someVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: selfRegisterOperators.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 2,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        uint256 currentNonce = selfRegisterOperators.nonces(operatorAddr);
        bytes32 registerOperatorTypehash = keccak256("RegisterOperator(address operator,address vault,uint256 nonce)");

        bytes32 structHash = keccak256(abi.encode(registerOperatorTypehash, operatorAddr, someVault, currentNonce));
        bytes32 digest = selfRegisterOperators.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(wrongPk, digest);
        bytes memory badSignature = abi.encodePacked(r, s, v);

        vm.expectRevert(ISelfRegisterOperators.SelfRegisterOperators_InvalidSignature.selector);
        selfRegisterOperators.registerOperatorWithSignature(operatorAddr, someVault, badSignature);
    }

    function test_IncreaseNonce() public {
        address operatorAddr = vars.operators[0].addr;
        uint256 oldNonce = selfRegisterOperators.nonces(operatorAddr);
        assertEq(oldNonce, 0, "Initial nonce is 0");

        vm.prank(operatorAddr);
        selfRegisterOperators.increaseNonce();

        uint256 newNonce = selfRegisterOperators.nonces(operatorAddr);
        assertEq(newNonce, 1, "Nonce incremented by 1");
    }

    function test_registerOperatorVaultWithSignature() public {
        address operatorAddr = vars.operators[1].addr;
        uint256 operatorPk = vars.operators[1].privateKey;

        vm.prank(operatorAddr);
        selfRegisterOperators.registerOperator(address(0));

        uint256 currentNonce = selfRegisterOperators.nonces(operatorAddr);
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: selfRegisterOperators.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 2,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        bytes32 operatorVaultTypehash = keccak256("RegisterOperatorVault(address operator,address vault,uint256 nonce)");
        bytes32 structHash = keccak256(abi.encode(operatorVaultTypehash, operatorAddr, vault, currentNonce));
        bytes32 digest = selfRegisterOperators.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPk, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        selfRegisterOperators.registerOperatorVaultWithSignature(operatorAddr, vault, signature);

        assertTrue(selfRegisterOperators.isOperatorActive(operatorAddr), "Operator is active");
        assertTrue(selfRegisterOperators.isOperatorVaultActive(operatorAddr, vault), "Vault is active");
    }

    function test_unregisterOperatorWithSignature() public {
        address operatorAddr = vars.operators[0].addr;
        uint256 operatorPk = vars.operators[0].privateKey;

        vm.prank(operatorAddr);
        selfRegisterOperators.registerOperator(address(0));
        assertTrue(selfRegisterOperators.isOperatorActive(operatorAddr));

        uint256 currentNonce = selfRegisterOperators.nonces(operatorAddr);
        bytes32 typehash = keccak256("UnregisterOperator(address operator,uint256 nonce)");
        bytes32 structHash = keccak256(abi.encode(typehash, operatorAddr, currentNonce));
        bytes32 digest = selfRegisterOperators.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPk, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        selfRegisterOperators.unregisterOperatorWithSignature(operatorAddr, signature);

        assertFalse(selfRegisterOperators.isOperatorActive(operatorAddr), "Should be unregistered now");
    }

    function test_unregisterOperatorVaultWithSignature() public {
        address operatorAddr = vars.operators[0].addr;
        uint256 operatorPk = vars.operators[0].privateKey;

        vm.prank(operatorAddr);
        selfRegisterOperators.registerOperator(address(0));
        assertTrue(selfRegisterOperators.isOperatorActive(operatorAddr));

        uint256 currentNonce = selfRegisterOperators.nonces(operatorAddr);
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: selfRegisterOperators.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 2,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        vm.prank(operatorAddr);
        selfRegisterOperators.registerOperatorVault(vault);
        vm.stopPrank();

        bytes32 operatorVaultTypehash =
            keccak256("UnregisterOperatorVault(address operator,address vault,uint256 nonce)");
        bytes32 structHash = keccak256(abi.encode(operatorVaultTypehash, operatorAddr, vault, currentNonce));
        bytes32 digest = selfRegisterOperators.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPk, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        selfRegisterOperators.unregisterOperatorVaultWithSignature(operatorAddr, vault, signature);

        assertTrue(selfRegisterOperators.isOperatorActive(operatorAddr), "Should be registered now");
        assertFalse(selfRegisterOperators.isOperatorVaultActive(operatorAddr, vault), "Should be unregistered now");
    }

    function test_unregisterOperatorVaultWithSignature_RevertIfInvalidSig() public {
        address operatorAddr = vars.operators[0].addr;
        uint256 operatorPk = vars.operators[0].privateKey;

        vm.prank(operatorAddr);
        selfRegisterOperators.registerOperator(address(0));

        uint256 currentNonce = selfRegisterOperators.nonces(operatorAddr);
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: selfRegisterOperators.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 2,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        bytes32 operatorVaultTypehash = keccak256("RegisterOperatorVault(address operator,address vault,uint256 nonce)");
        bytes32 structHash = keccak256(abi.encode(operatorVaultTypehash, operatorAddr, vault, currentNonce));
        bytes32 digest = selfRegisterOperators.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPk, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        vm.expectRevert(ISelfRegisterOperators.SelfRegisterOperators_InvalidSignature.selector);
        selfRegisterOperators.unregisterOperatorVaultWithSignature(operatorAddr, vault, signature);
    }
}

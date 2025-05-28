// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {ForcePauseSelfRegisterOperators} from
    "../../../../../src/contracts/features/registration/operators/extensions/ForcePauseSelfRegisterOperators.sol";
import {SelfRegisterOperators} from
    "../../../../../src/contracts/features/registration/operators/SelfRegisterOperators.sol";
import {NoPermissionManager} from "../../../../../src/contracts/features/permissions/NoPermissionManager.sol";
import {EqualStakeToVP} from "../../../../../src/contracts/features/stakeToVotingPower/EqualStakeToVP.sol";

import {INetworkManager} from "../../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../../src/interfaces/base/IVaultManager.sol";
import {IForcePauseSelfRegisterOperators} from
    "../../../../../src/interfaces/features/registration/operators/extensions/IForcePauseSelfRegisterOperators.sol";
import {InitSetup} from "../../../../InitSetup.sol";
import {VaultManager} from "../../../../../src/contracts/base/VaultManager.sol";
import {Tokens} from "../../../../../src/contracts/features/registration/tokens/Tokens.sol";

contract TestForcePauseSelfRegisterOperators is
    ForcePauseSelfRegisterOperators,
    NoPermissionManager,
    EqualStakeToVP,
    Tokens
{
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInit,
        IVaultManager.VaultManagerInitParams memory vaultInit
    ) external initializer {
        __NetworkManager_init(netInit);
        __OperatorManager_init();
        __VaultManager_init(vaultInit);
        __SelfRegisterOperators_init();
        __ForcePauseSelfRegisterOperators_init();
    }
}

contract ForcePauseSelfRegisterOperatorsTest is InitSetup {
    TestForcePauseSelfRegisterOperators private forcePauseOps;

    address operator1;
    uint256 operator1Pk;

    address vault1;

    function setUp() public override {
        InitSetup.setUp();

        forcePauseOps = new TestForcePauseSelfRegisterOperators(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100});

        forcePauseOps.initialize(netInit, vaultInit);

        operator1 = vars.operators[0].addr;
        operator1Pk = vars.operators[0].privateKey;

        forcePauseOps.registerToken(initSetupParams.masterChain.tokens[0]);

        vault1 = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: forcePauseOps.getSlashingWindow() * 2,
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
    }

    function test_BasicEnvironment() public {
        assertFalse(forcePauseOps.isOperatorForcePaused(operator1));
    }

    function test_ForcePauseOperator() public {
        vm.startPrank(operator1);
        forcePauseOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(forcePauseOps.isOperatorActive(operator1));

        forcePauseOps.forcePauseOperator(operator1);

        assertTrue(forcePauseOps.isOperatorForcePaused(operator1));
        assertFalse(forcePauseOps.isOperatorActive(operator1));

        vm.startPrank(operator1);
        vm.expectRevert(IForcePauseSelfRegisterOperators.ForcePauseSelfRegisterOperators_OperatorForcePaused.selector);
        forcePauseOps.registerOperator(address(0));
        vm.stopPrank();
    }

    function test_ForcePauseOperator_AlreadyPaused() public {
        forcePauseOps.forcePauseOperator(operator1);

        vm.expectRevert(IForcePauseSelfRegisterOperators.ForcePauseSelfRegisterOperators_OperatorForcePaused.selector);
        forcePauseOps.forcePauseOperator(operator1);
    }

    function test_ForceUnpauseOperator() public {
        forcePauseOps.forcePauseOperator(operator1);
        assertTrue(forcePauseOps.isOperatorForcePaused(operator1));

        forcePauseOps.forceUnpauseOperator(operator1);
        assertFalse(forcePauseOps.isOperatorForcePaused(operator1));

        vm.startPrank(operator1);
        forcePauseOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(forcePauseOps.isOperatorActive(operator1));
    }

    function test_ForceUnpauseOperator_NotPaused() public {
        vm.expectRevert(
            IForcePauseSelfRegisterOperators.ForcePauseSelfRegisterOperators_OperatorNotForcePaused.selector
        );
        forcePauseOps.forceUnpauseOperator(operator1);
    }

    function test_ForcePauseOperatorVault() public {
        vm.startPrank(operator1);
        forcePauseOps.registerOperator(address(0));
        vm.stopPrank();

        vm.startPrank(operator1);
        forcePauseOps.registerOperatorVault(vault1);
        vm.stopPrank();

        assertTrue(forcePauseOps.isOperatorVaultActive(operator1, vault1));

        forcePauseOps.forcePauseOperatorVault(operator1, vault1);

        assertTrue(forcePauseOps.isOperatorVaultForcePaused(operator1, vault1));
        assertFalse(forcePauseOps.isOperatorVaultActive(operator1, vault1));

        vm.startPrank(operator1);
        vm.expectRevert(
            IForcePauseSelfRegisterOperators.ForcePauseSelfRegisterOperators_OperatorVaultForcePaused.selector
        );
        forcePauseOps.registerOperatorVault(vault1);
        vm.stopPrank();
    }

    function test_ForcePauseOperatorVault_AlreadyPaused() public {
        forcePauseOps.forcePauseOperatorVault(operator1, vault1);

        vm.expectRevert(
            IForcePauseSelfRegisterOperators.ForcePauseSelfRegisterOperators_OperatorVaultForcePaused.selector
        );
        forcePauseOps.forcePauseOperatorVault(operator1, vault1);
    }

    function test_ForceUnpauseOperatorVault() public {
        forcePauseOps.forcePauseOperatorVault(operator1, vault1);

        forcePauseOps.forceUnpauseOperatorVault(operator1, vault1);
        assertFalse(forcePauseOps.isOperatorVaultForcePaused(operator1, vault1));

        vm.startPrank(operator1);
        forcePauseOps.registerOperator(address(0));
        vm.stopPrank();

        vm.startPrank(operator1);
        forcePauseOps.registerOperatorVault(vault1);
        vm.stopPrank();

        assertTrue(forcePauseOps.isOperatorVaultActive(operator1, vault1));
    }

    function test_ForceUnpauseOperatorVault_NotPaused() public {
        vm.expectRevert(
            IForcePauseSelfRegisterOperators.ForcePauseSelfRegisterOperators_OperatorVaultNotForcePaused.selector
        );
        forcePauseOps.forceUnpauseOperatorVault(operator1, vault1);
    }

    function test_Location() public {
        bytes32 location = keccak256(
            abi.encode(uint256(keccak256("symbiotic.storage.ForcePauseSelfRegisterOperators")) - 1)
        ) & ~bytes32(uint256(0xff));
        assertEq(location, 0xf3871d05fd4da42686c3c56dfd4be98b1d278da4bf1fd61b1d6e7a6e37722600);
    }
}

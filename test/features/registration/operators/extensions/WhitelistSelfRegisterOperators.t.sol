// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {IWhitelistSelfRegisterOperators} from
    "../../../../../src/interfaces/features/registration/operators/extensions/IWhitelistSelfRegisterOperators.sol";
import "../../../../InitSetup.sol";

import {WhitelistSelfRegisterOperators} from
    "../../../../../src/contracts/features/registration/operators/extensions/WhitelistSelfRegisterOperators.sol";
import {NoPermissionManager} from "../../../../../src/contracts/features/permissions/NoPermissionManager.sol";
import {EqualStakeToVP} from "../../../../../src/contracts/features/stakeToVotingPower/EqualStakeToVP.sol";
import {VaultManager} from "../../../../../src/contracts/base/VaultManager.sol";
import {INetworkManager} from "../../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../../src/interfaces/base/IVaultManager.sol";
import {Tokens} from "../../../../../src/contracts/features/registration/tokens/Tokens.sol";

contract TestWhitelistSelfRegisterOperators is
    WhitelistSelfRegisterOperators,
    NoPermissionManager,
    EqualStakeToVP,
    Tokens
{
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInit,
        IVaultManager.VaultManagerInitParams memory vaultInit,
        WhitelistSelfRegisterOperatorsInitParams memory wlInit
    ) external initializer {
        __NetworkManager_init(netInit);
        __OperatorManager_init();
        __VaultManager_init(vaultInit);

        // SelfRegisterOperators init
        __SelfRegisterOperators_init();
        // Whitelist init
        __WhitelistSelfRegisterOperators_init(wlInit);
    }
}

contract WhitelistSelfRegisterOperatorsTest is Test, InitSetup {
    TestWhitelistSelfRegisterOperators private whitelistOps;

    address operator1;
    address operator2;
    uint256 operator1Pk;

    address vaultA;
    address vaultB;

    function setUp() public override {
        InitSetup.setUp();

        whitelistOps = new TestWhitelistSelfRegisterOperators(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100});
        IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperatorsInitParams memory wlInit =
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperatorsInitParams({isWhitelistEnabled: true});

        whitelistOps.initialize(netInit, vaultInit, wlInit);

        operator1 = vars.operators[0].addr;
        operator1Pk = vars.operators[0].privateKey;

        whitelistOps.registerToken(initSetupParams.masterChain.tokens[0]);

        vaultA = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: whitelistOps.getSlashingWindow() * 2,
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

        vaultB = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: whitelistOps.getSlashingWindow() * 2,
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

    function test_Version() public {
        assertEq(whitelistOps.WhitelistSelfRegisterOperators_VERSION(), 1, "Whitelist version mismatch");
    }

    function test_WhitelistEnabledByDefault() public {
        assertTrue(whitelistOps.isWhitelistEnabled());
    }

    function test_RegisterOperator_RevertIfNotWhitelisted() public {
        vm.startPrank(operator1);
        vm.expectRevert(IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperators_OperatorNotWhitelisted.selector);
        whitelistOps.registerOperator(address(0));
        vm.stopPrank();
    }

    function test_WhitelistOperatorAndRegister() public {
        whitelistOps.whitelistOperator(operator1);

        assertTrue(whitelistOps.isOperatorWhitelisted(operator1));

        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(whitelistOps.isOperatorActive(operator1));
    }

    function test_UnwhitelistOperator_ActiveOperatorGetsUnregistered() public {
        whitelistOps.whitelistOperator(operator1);
        vm.prank(operator1);
        whitelistOps.registerOperator(address(0));
        assertTrue(whitelistOps.isOperatorActive(operator1));

        whitelistOps.unwhitelistOperator(operator1);
        assertFalse(whitelistOps.isOperatorActive(operator1));
        assertFalse(whitelistOps.isOperatorWhitelisted(operator1));
    }

    function test_DisableWhitelistAndRegister() public {
        whitelistOps.setWhitelistStatus(false);
        assertFalse(whitelistOps.isWhitelistEnabled());

        vm.prank(operator1);
        whitelistOps.registerOperator(address(0));
        assertTrue(whitelistOps.isOperatorActive(operator1));
    }

    function test_RegisterOperatorVault_RevertIfNotWhitelisted() public {
        whitelistOps.whitelistOperator(operator1);

        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        vm.expectRevert(
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperators_OperatorVaultNotWhitelisted.selector
        );
        whitelistOps.registerOperatorVault(vaultA);
        vm.stopPrank();
    }

    function test_WhitelistOperatorVaultAndRegister() public {
        whitelistOps.whitelistOperator(operator1);
        whitelistOps.whitelistOperatorVault(operator1, vaultA);

        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        whitelistOps.registerOperatorVault(vaultA);
        vm.stopPrank();

        // confirm active
        assertTrue(whitelistOps.isOperatorActive(operator1));
        assertTrue(whitelistOps.isOperatorVaultActive(operator1, vaultA));
    }

    function test_UnwhitelistOperatorVault_ActiveGetsUnregistered() public {
        whitelistOps.whitelistOperator(operator1);
        whitelistOps.whitelistOperatorVault(operator1, vaultA);
        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        whitelistOps.registerOperatorVault(vaultA);
        vm.stopPrank();
        assertTrue(whitelistOps.isOperatorVaultActive(operator1, vaultA));

        whitelistOps.unwhitelistOperatorVault(operator1, vaultA);
        assertFalse(whitelistOps.isOperatorVaultActive(operator1, vaultA));
        assertFalse(whitelistOps.isOperatorVaultWhitelisted(operator1, vaultA));
    }

    function test_DisableWhitelistAndRegisterOperatorVault() public {
        whitelistOps.setWhitelistStatus(false);

        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        whitelistOps.registerOperatorVault(vaultA);
        vm.stopPrank();

        assertTrue(whitelistOps.isOperatorVaultActive(operator1, vaultA));
    }

    function test_UnwhitelistOperator_RevertIfNotWhitelisted() public {
        vm.expectRevert(IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperators_OperatorNotWhitelisted.selector);
        whitelistOps.unwhitelistOperator(operator1);
    }

    function test_UnwhitelistOperatorVault_RevertIfNotWhitelisted() public {
        vm.expectRevert(
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperators_OperatorVaultNotWhitelisted.selector
        );
        whitelistOps.unwhitelistOperatorVault(operator1, vaultB);
    }

    function test_WhitelistOperator_RevertIfAlreadyWhitelisted() public {
        whitelistOps.whitelistOperator(operator1);
        vm.expectRevert(
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperators_OperatorAlreadyWhitelisted.selector
        );
        whitelistOps.whitelistOperator(operator1);
    }

    function test_WhitelistOperatorVault_RevertIfAlreadyWhitelisted() public {
        whitelistOps.whitelistOperatorVault(operator1, vaultB);
        vm.expectRevert(
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperators_OperatorVaultAlreadyWhitelisted.selector
        );
        whitelistOps.whitelistOperatorVault(operator1, vaultB);
    }

    function test_Location() public {
        bytes32 location = keccak256(
            abi.encode(uint256(keccak256("symbiotic.storage.WhitelistSelfRegisterOperators")) - 1)
        ) & ~bytes32(uint256(0xff));
        assertEq(location, 0x25b93ff8b4a329091c8d52079f1be19dcd6e61195383d70f54f5235ddae87400);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {IOperatorsWhitelist} from "../../../../src/interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol";
import "../../../InitSetup.sol";

import {OperatorsWhitelist} from "../../../../src/contracts/modules/voting-power/extensions/OperatorsWhitelist.sol";
import {NoPermissionManager} from "../../../../src/contracts/modules/common/permissions/NoPermissionManager.sol";
import {EqualStakeToVP} from "../../../../src/contracts/features/stakeToVotingPower/EqualStakeToVP.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {IVotingPowerProvider} from "../../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {MultiToken} from "../../../../src/contracts/modules/voting-power/extensions/MultiToken.sol";
import {IOzEIP712} from "../../../../src/interfaces/base/common/IOzEIP712.sol";
import {VotingPowerProvider} from "../../../../src/contracts/modules/voting-power/VotingPowerProvider.sol";

contract TestOperatorsWhitelist is OperatorsWhitelist, NoPermissionManager, EqualStakeToVP, MultiToken {
    constructor(address operatorRegistry, address vaultFactory) VotingPowerProvider(operatorRegistry, vaultFactory) {}

    function initialize(
        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit,
        OperatorsWhitelistInitParams memory wlInit
    ) external initializer {
        __VotingPowerProvider_init(votingPowerProviderInit);

        __OperatorsWhitelist_init(wlInit);
    }
}

contract OperatorsWhitelistTest is Test, InitSetup {
    TestOperatorsWhitelist private whitelistOps;

    address operator1;
    address operator2;
    uint256 operator1Pk;

    address vaultA;
    address vaultB;

    function setUp() public override {
        InitSetup.setUp();

        whitelistOps =
            new TestOperatorsWhitelist(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100, token: initSetupParams.masterChain.tokens[0]});
        IOperatorsWhitelist.OperatorsWhitelistInitParams memory wlInit =
            IOperatorsWhitelist.OperatorsWhitelistInitParams({isWhitelistEnabled: true});

        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit = IVotingPowerProvider
            .VotingPowerProviderInitParams({
            networkManagerInitParams: netInit,
            vaultManagerInitParams: vaultInit,
            ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "MyVotingPowerProvider", version: "1"})
        });

        whitelistOps.initialize(votingPowerProviderInit, wlInit);

        operator1 = vars.operators[0].addr;
        operator1Pk = vars.operators[0].privateKey;

        // whitelistOps.registerToken(initSetupParams.masterChain.tokens[0]);

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
        assertEq(whitelistOps.OperatorsWhitelist_VERSION(), 1, "Whitelist version mismatch");
    }

    function test_WhitelistEnabledByDefault() public {
        assertTrue(whitelistOps.isWhitelistEnabled());
    }

    function test_RegisterOperator_RevertIfNotWhitelisted() public {
        vm.startPrank(operator1);
        vm.expectRevert(IOperatorsWhitelist.OperatorsWhitelist_OperatorNotWhitelisted.selector);
        whitelistOps.registerOperator(address(0));
        vm.stopPrank();
    }

    function test_WhitelistOperatorAndRegister() public {
        whitelistOps.whitelistOperator(operator1);

        assertTrue(whitelistOps.isOperatorWhitelisted(operator1));

        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(whitelistOps.isOperatorRegistered(operator1));
    }

    function test_UnwhitelistOperator_RegisteredOperatorGetsUnregistered() public {
        whitelistOps.whitelistOperator(operator1);
        vm.prank(operator1);
        whitelistOps.registerOperator(address(0));
        assertTrue(whitelistOps.isOperatorRegistered(operator1));

        whitelistOps.unwhitelistOperator(operator1);
        assertFalse(whitelistOps.isOperatorRegistered(operator1));
        assertFalse(whitelistOps.isOperatorWhitelisted(operator1));
    }

    function test_DisableWhitelistAndRegister() public {
        whitelistOps.setWhitelistStatus(false);
        assertFalse(whitelistOps.isWhitelistEnabled());

        vm.prank(operator1);
        whitelistOps.registerOperator(address(0));
        assertTrue(whitelistOps.isOperatorRegistered(operator1));
    }

    function test_RegisterOperatorVault_RevertIfNotWhitelisted() public {
        whitelistOps.whitelistOperator(operator1);

        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        vm.expectRevert(IOperatorsWhitelist.OperatorsWhitelist_OperatorVaultNotWhitelisted.selector);
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

        // confirm registered
        assertTrue(whitelistOps.isOperatorRegistered(operator1));
        assertTrue(whitelistOps.isOperatorVaultRegistered(operator1, vaultA));
    }

    function test_UnwhitelistOperatorVault_RegisteredGetsUnregistered() public {
        whitelistOps.whitelistOperator(operator1);
        whitelistOps.whitelistOperatorVault(operator1, vaultA);
        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        whitelistOps.registerOperatorVault(vaultA);
        vm.stopPrank();
        assertTrue(whitelistOps.isOperatorVaultRegistered(operator1, vaultA));

        whitelistOps.unwhitelistOperatorVault(operator1, vaultA);
        assertFalse(whitelistOps.isOperatorVaultRegistered(operator1, vaultA));
        assertFalse(whitelistOps.isOperatorVaultWhitelisted(operator1, vaultA));
    }

    function test_DisableWhitelistAndRegisterOperatorVault() public {
        whitelistOps.setWhitelistStatus(false);

        vm.startPrank(operator1);
        whitelistOps.registerOperator(address(0));
        whitelistOps.registerOperatorVault(vaultA);
        vm.stopPrank();

        assertTrue(whitelistOps.isOperatorVaultRegistered(operator1, vaultA));
    }

    function test_UnwhitelistOperator_RevertIfNotWhitelisted() public {
        vm.expectRevert(IOperatorsWhitelist.OperatorsWhitelist_OperatorNotWhitelisted.selector);
        whitelistOps.unwhitelistOperator(operator1);
    }

    function test_UnwhitelistOperatorVault_RevertIfNotWhitelisted() public {
        vm.expectRevert(IOperatorsWhitelist.OperatorsWhitelist_OperatorVaultNotWhitelisted.selector);
        whitelistOps.unwhitelistOperatorVault(operator1, vaultB);
    }

    function test_WhitelistOperator_RevertIfAlreadyWhitelisted() public {
        whitelistOps.whitelistOperator(operator1);
        vm.expectRevert(IOperatorsWhitelist.OperatorsWhitelist_OperatorAlreadyWhitelisted.selector);
        whitelistOps.whitelistOperator(operator1);
    }

    function test_WhitelistOperatorVault_RevertIfAlreadyWhitelisted() public {
        whitelistOps.whitelistOperatorVault(operator1, vaultB);
        vm.expectRevert(IOperatorsWhitelist.OperatorsWhitelist_OperatorVaultAlreadyWhitelisted.selector);
        whitelistOps.whitelistOperatorVault(operator1, vaultB);
    }

    function test_Location() public {
        bytes32 location = keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorsWhitelist")) - 1))
            & ~bytes32(uint256(0xff));
        assertEq(location, 0x25b93ff8b4a329091c8d52079f1be19dcd6e61195383d70f54f5235ddae87400);
    }
}

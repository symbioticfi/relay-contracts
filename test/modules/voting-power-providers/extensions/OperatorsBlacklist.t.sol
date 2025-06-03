// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {OperatorsBlacklist} from "../../../../src/contracts/modules/voting-power/extensions/OperatorsBlacklist.sol";
import {VotingPowerProvider} from "../../../../src/contracts/modules/voting-power/VotingPowerProvider.sol";
import {NoPermissionManager} from "../../../../src/contracts/modules/common/permissions/NoPermissionManager.sol";
import {EqualStakeToVP} from "../../../../src/contracts/features/stakeToVotingPower/EqualStakeToVP.sol";

import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {IOperatorsBlacklist} from "../../../../src/interfaces/modules/voting-power/extensions/IOperatorsBlacklist.sol";
import {InitSetup} from "../../../InitSetup.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {MultiToken} from "../../../../src/contracts/modules/voting-power/extensions/MultiToken.sol";
import {IVotingPowerProvider} from "../../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {IOzEIP712} from "../../../../src/interfaces/base/common/IOzEIP712.sol";

contract TestOperatorsBlacklist is OperatorsBlacklist, NoPermissionManager, EqualStakeToVP, MultiToken {
    constructor(address operatorRegistry, address vaultFactory) VotingPowerProvider(operatorRegistry, vaultFactory) {}

    function initialize(
        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit
    ) external initializer {
        __VotingPowerProvider_init(votingPowerProviderInit);

        __OperatorsBlacklist_init();
    }
}

contract OperatorsBlacklistTest is InitSetup {
    TestOperatorsBlacklist private blacklistOps;

    address operator1;
    uint256 operator1Pk;

    address vault1;

    function setUp() public override {
        InitSetup.setUp();

        blacklistOps =
            new TestOperatorsBlacklist(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100, token: initSetupParams.masterChain.tokens[0]});

        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit = IVotingPowerProvider
            .VotingPowerProviderInitParams({
            networkManagerInitParams: netInit,
            vaultManagerInitParams: vaultInit,
            ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "MyVotingPowerProvider", version: "1"})
        });

        blacklistOps.initialize(votingPowerProviderInit);

        operator1 = vars.operators[0].addr;
        operator1Pk = vars.operators[0].privateKey;

        // blacklistOps.registerToken(initSetupParams.masterChain.tokens[0]);

        vault1 = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: blacklistOps.getSlashingWindow() * 2,
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
        assertFalse(blacklistOps.isOperatorForcePaused(operator1));
    }

    function test_ForcePauseOperator() public {
        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorRegistered(operator1));

        blacklistOps.forcePauseOperator(operator1);

        assertTrue(blacklistOps.isOperatorForcePaused(operator1));
        assertFalse(blacklistOps.isOperatorRegistered(operator1));

        vm.startPrank(operator1);
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorForcePaused.selector);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();
    }

    function test_ForcePauseOperator_AlreadyPaused() public {
        blacklistOps.forcePauseOperator(operator1);

        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorForcePaused.selector);
        blacklistOps.forcePauseOperator(operator1);
    }

    function test_ForceUnpauseOperator() public {
        blacklistOps.forcePauseOperator(operator1);
        assertTrue(blacklistOps.isOperatorForcePaused(operator1));

        blacklistOps.forceUnpauseOperator(operator1);
        assertFalse(blacklistOps.isOperatorForcePaused(operator1));

        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorRegistered(operator1));
    }

    function test_ForceUnpauseOperator_NotPaused() public {
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorNotForcePaused.selector);
        blacklistOps.forceUnpauseOperator(operator1);
    }

    function test_ForcePauseOperatorVault() public {
        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        vm.startPrank(operator1);
        blacklistOps.registerOperatorVault(vault1);
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorVaultRegistered(operator1, vault1));

        blacklistOps.forcePauseOperatorVault(operator1, vault1);

        assertTrue(blacklistOps.isOperatorVaultForcePaused(operator1, vault1));
        assertFalse(blacklistOps.isOperatorVaultRegistered(operator1, vault1));

        vm.startPrank(operator1);
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorVaultForcePaused.selector);
        blacklistOps.registerOperatorVault(vault1);
        vm.stopPrank();
    }

    function test_ForcePauseOperatorVault_AlreadyPaused() public {
        blacklistOps.forcePauseOperatorVault(operator1, vault1);

        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorVaultForcePaused.selector);
        blacklistOps.forcePauseOperatorVault(operator1, vault1);
    }

    function test_ForceUnpauseOperatorVault() public {
        blacklistOps.forcePauseOperatorVault(operator1, vault1);

        blacklistOps.forceUnpauseOperatorVault(operator1, vault1);
        assertFalse(blacklistOps.isOperatorVaultForcePaused(operator1, vault1));

        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        vm.startPrank(operator1);
        blacklistOps.registerOperatorVault(vault1);
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorVaultRegistered(operator1, vault1));
    }

    function test_ForceUnpauseOperatorVault_NotPaused() public {
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorVaultNotForcePaused.selector);
        blacklistOps.forceUnpauseOperatorVault(operator1, vault1);
    }

    function test_Location() public {
        bytes32 location = keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorsBlacklist")) - 1))
            & ~bytes32(uint256(0xff));
        assertEq(location, 0xf3871d05fd4da42686c3c56dfd4be98b1d278da4bf1fd61b1d6e7a6e37722600);
    }
}

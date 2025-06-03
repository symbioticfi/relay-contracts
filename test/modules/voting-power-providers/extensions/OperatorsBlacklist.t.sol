// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {OperatorsBlacklist} from "../../../../src/contracts/modules/voting-power/extensions/OperatorsBlacklist.sol";
import {VotingPowerProvider} from "../../../../src/contracts/modules/voting-power/VotingPowerProvider.sol";
import {NoPermissionManager} from "../../../../test/mocks/NoPermissionManager.sol";
import {EqualStakeVPCalc} from "../../../../src/contracts/modules/voting-power/extensions/EqualStakeVPCalc.sol";

import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {IOperatorsBlacklist} from "../../../../src/interfaces/modules/voting-power/extensions/IOperatorsBlacklist.sol";
import {InitSetup} from "../../../InitSetup.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {MultiToken} from "../../../../src/contracts/modules/voting-power/extensions/MultiToken.sol";
import {IVotingPowerProvider} from "../../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {IOzEIP712} from "../../../../src/interfaces/base/common/IOzEIP712.sol";

contract TestOperatorsBlacklist is OperatorsBlacklist, NoPermissionManager, EqualStakeVPCalc, MultiToken {
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
        assertFalse(blacklistOps.isOperatorBlacklisted(operator1));
    }

    function test_BlacklistOperator() public {
        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorRegistered(operator1));

        blacklistOps.blacklistOperator(operator1);

        assertTrue(blacklistOps.isOperatorBlacklisted(operator1));
        assertFalse(blacklistOps.isOperatorRegistered(operator1));

        vm.startPrank(operator1);
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorBlacklisted.selector);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();
    }

    function test_BlacklistOperator_OperatorBlacklisted() public {
        blacklistOps.blacklistOperator(operator1);

        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorBlacklisted.selector);
        blacklistOps.blacklistOperator(operator1);
    }

    function test_UnblacklistOperator() public {
        blacklistOps.blacklistOperator(operator1);
        assertTrue(blacklistOps.isOperatorBlacklisted(operator1));

        blacklistOps.unblacklistOperator(operator1);
        assertFalse(blacklistOps.isOperatorBlacklisted(operator1));

        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorRegistered(operator1));
    }

    function test_UnblacklistOperator_OperatorNotBlacklisted() public {
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorNotBlacklisted.selector);
        blacklistOps.unblacklistOperator(operator1);
    }

    function test_BlacklistOperatorVault() public {
        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        vm.startPrank(operator1);
        blacklistOps.registerOperatorVault(vault1);
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorVaultRegistered(operator1, vault1));

        blacklistOps.blacklistOperatorVault(operator1, vault1);

        assertTrue(blacklistOps.isOperatorVaultBlacklisted(operator1, vault1));
        assertFalse(blacklistOps.isOperatorVaultRegistered(operator1, vault1));

        vm.startPrank(operator1);
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorVaultBlacklisted.selector);
        blacklistOps.registerOperatorVault(vault1);
        vm.stopPrank();
    }

    function test_BlacklistOperatorVault_OperatorVaultBlacklisted() public {
        blacklistOps.blacklistOperatorVault(operator1, vault1);

        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorVaultBlacklisted.selector);
        blacklistOps.blacklistOperatorVault(operator1, vault1);
    }

    function test_UnblacklistOperatorVault() public {
        blacklistOps.blacklistOperatorVault(operator1, vault1);

        blacklistOps.unblacklistOperatorVault(operator1, vault1);
        assertFalse(blacklistOps.isOperatorVaultBlacklisted(operator1, vault1));

        vm.startPrank(operator1);
        blacklistOps.registerOperator(address(0));
        vm.stopPrank();

        vm.startPrank(operator1);
        blacklistOps.registerOperatorVault(vault1);
        vm.stopPrank();

        assertTrue(blacklistOps.isOperatorVaultRegistered(operator1, vault1));
    }

    function test_UnblacklistOperatorVault_OperatorVaultNotBlacklisted() public {
        vm.expectRevert(IOperatorsBlacklist.OperatorsBlacklist_OperatorVaultNotBlacklisted.selector);
        blacklistOps.unblacklistOperatorVault(operator1, vault1);
    }

    function test_Location() public {
        bytes32 location = keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorsBlacklist")) - 1))
            & ~bytes32(uint256(0xff));
        assertEq(location, 0x23ffaefb5f6b29c7a77ac2a8c6e8b7a8cb63a59ee84629217d13308576dcc800);
    }
}

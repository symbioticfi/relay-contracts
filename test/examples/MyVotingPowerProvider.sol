// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {MyVotingPowerProvider} from "../../examples/MyVotingPowerProvider.sol";

import {InitSetup} from "../InitSetup.sol";

import {INetworkManager} from "../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../src/interfaces/base/IVaultManager.sol";
import {IOperatorsWhitelist} from "../../src/interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol";
import {IOzEIP712} from "../../src/interfaces/base/common/IOzEIP712.sol";
import {IOzOwnable} from "../../src/interfaces/modules/common/permissions/IOzOwnable.sol";
import {IVotingPowerProvider} from "../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";

contract MyVotingPowerProviderTest is InitSetup {
    MyVotingPowerProvider private aggregator;

    address private owner = address(this);
    address private nonOwner = address(0xABCD);

    address operator1;
    uint256 operator1Pk;

    address vaultA;

    function setUp() public override {
        InitSetup.setUp();

        aggregator =
            new MyVotingPowerProvider(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100, token: initSetupParams.masterChain.tokens[0]});
        IOzEIP712.OzEIP712InitParams memory eip712Init =
            IOzEIP712.OzEIP712InitParams({name: "MyVotingPowerProvider", version: "1"});
        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit = IVotingPowerProvider
            .VotingPowerProviderInitParams({
            networkManagerInitParams: netInit,
            vaultManagerInitParams: vaultInit,
            ozEip712InitParams: eip712Init
        });
        IOzOwnable.OzOwnableInitParams memory ownableInit = IOzOwnable.OzOwnableInitParams({owner: owner});

        aggregator.initialize(votingPowerProviderInit, ownableInit);

        operator1 = vars.operators[0].addr;
        operator1Pk = vars.operators[0].privateKey;

        vaultA = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: aggregator.getSlashingWindow() * 2,
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

        // aggregator.registerToken(initSetupParams.masterChain.tokens[0]);
    }

    function testBasicChecks() public {
        assertEq(aggregator.owner(), owner, "Owner mismatch in OzOwnable");
    }

    function testFullScenario() public {
        vm.startPrank(operator1);
        aggregator.registerOperator();
        vm.stopPrank();

        aggregator.registerOperatorVault(operator1, vaultA);

        assertTrue(aggregator.isOperatorRegistered(operator1), "Operator not registered");
        assertTrue(aggregator.isOperatorVaultRegistered(operator1, vaultA), "Vault not registered");

        vm.startPrank(operator1);
        aggregator.unregisterOperator();
        vm.stopPrank();

        aggregator.unregisterOperatorVault(operator1, vaultA);

        assertFalse(aggregator.isOperatorRegistered(operator1), "Should be registered again");
        assertFalse(aggregator.isOperatorVaultRegistered(operator1, vaultA), "Vault registered again");
    }

    function testStakeToVotingPower() public {
        uint256 stake = 12_345;
        uint256 vp = aggregator.stakeToVotingPower(address(0xAAA), stake, bytes(""));
        assertEq(vp, stake, "EqualStakeVPCalc must return stake exactly");

        uint48 someTimestamp = uint48(vm.getBlockTimestamp() + 100);
        uint256 vp2 = aggregator.stakeToVotingPowerAt(address(0xAAA), stake, bytes("whatever"), someTimestamp);
        assertEq(vp2, stake, "Should be 1:1 stake => vp");
    }
}

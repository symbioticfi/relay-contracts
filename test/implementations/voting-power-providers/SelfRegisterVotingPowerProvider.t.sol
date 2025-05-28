// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {SelfRegisterVotingPowerProvider} from
    "../../../src/contracts/implementations/voting-power-providers/SelfRegisterVotingPowerProvider.sol";

import {InitSetup} from "../../InitSetup.sol";

import {INetworkManager} from "../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../src/interfaces/base/IVaultManager.sol";
import {ISelfRegisterVotingPowerProvider} from
    "../../../src/interfaces/implementations/voting-power-providers/ISelfRegisterVotingPowerProvider.sol";
import {IWhitelistSelfRegisterOperators} from
    "../../../src/interfaces/features/registration/operators/extensions/IWhitelistSelfRegisterOperators.sol";
import {IOzEIP712} from "../../../src/interfaces/base/common/IOzEIP712.sol";
import {IOzOwnable} from "../../../src/interfaces/features/permissions/IOzOwnable.sol";

contract SelfRegisterVotingPowerProviderTest is InitSetup {
    SelfRegisterVotingPowerProvider private aggregator;

    address private owner = address(this);
    address private nonOwner = address(0xABCD);

    address operator1;
    uint256 operator1Pk;

    address vaultA;

    function setUp() public override {
        InitSetup.setUp();

        aggregator = new SelfRegisterVotingPowerProvider(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100});
        IOzEIP712.OzEIP712InitParams memory eip712Init =
            IOzEIP712.OzEIP712InitParams({name: "SelfRegisterVotingPowerProvider", version: "1"});
        IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperatorsInitParams memory wlInit =
            IWhitelistSelfRegisterOperators.WhitelistSelfRegisterOperatorsInitParams({isWhitelistEnabled: true});
        IOzOwnable.OzOwnableInitParams memory ownableInit = IOzOwnable.OzOwnableInitParams({owner: owner});

        aggregator.initialize(netInit, vaultInit, eip712Init, wlInit, ownableInit);

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

        aggregator.registerToken(initSetupParams.masterChain.tokens[0]);
    }

    function testBasicChecks() public {
        assertEq(aggregator.owner(), owner, "Owner mismatch in OzOwnable");
    }

    function testPermissionCheck_RevertForNonOwner() public {
        vm.startPrank(nonOwner);
        vm.expectRevert();
        aggregator.setWhitelistStatus(false);
        vm.stopPrank();
    }

    function testFullScenario() public {
        vm.prank(owner);
        aggregator.whitelistOperator(operator1);
        vm.prank(owner);
        aggregator.whitelistOperatorVault(operator1, vaultA);

        vm.startPrank(operator1);
        aggregator.registerOperator(address(0));
        aggregator.registerOperatorVault(vaultA);
        vm.stopPrank();

        assertTrue(aggregator.isOperatorActive(operator1), "Operator not active");
        assertTrue(aggregator.isOperatorVaultActive(operator1, vaultA), "Vault not active");

        vm.prank(owner);
        aggregator.forcePauseOperator(operator1);

        assertTrue(aggregator.isOperatorForcePaused(operator1), "Operator not force paused");
        assertFalse(aggregator.isOperatorActive(operator1), "Operator should be unregistered after pause");

        vm.startPrank(operator1);
        vm.expectRevert(bytes4(keccak256("ForcePauseSelfRegisterOperators_OperatorForcePaused()")));
        aggregator.registerOperator(address(0));
        vm.stopPrank();

        vm.prank(owner);
        aggregator.forceUnpauseOperator(operator1);

        assertFalse(aggregator.isOperatorForcePaused(operator1), "Operator must be unpaused now");

        vm.startPrank(operator1);
        aggregator.registerOperator(address(0));
        vm.stopPrank();

        assertTrue(aggregator.isOperatorActive(operator1), "Should be active again");
        assertTrue(aggregator.isOperatorVaultActive(operator1, vaultA), "Vault active again");
    }

    function testStakeToVotingPower() public {
        uint256 stake = 12_345;
        uint256 vp = aggregator.stakeToVotingPower(address(0xAAA), stake, bytes(""));
        assertEq(vp, stake, "EqualStakeToVP must return stake exactly");

        uint48 someTimestamp = uint48(block.timestamp + 100);
        uint256 vp2 = aggregator.stakeToVotingPowerAt(address(0xAAA), stake, bytes("whatever"), someTimestamp);
        assertEq(vp2, stake, "Should be 1:1 stake => vp");
    }
}

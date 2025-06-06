// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {IOperatorsWhitelist} from "../../../../src/interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol";
import "../../../InitSetup.sol";

import {OperatorsWhitelist} from "../../../../src/contracts/modules/voting-power/extensions/OperatorsWhitelist.sol";
import {NoPermissionManager} from "../../../../test/mocks/NoPermissionManager.sol";
import {EqualStakeVPCalc} from "../../../../src/contracts/modules/voting-power/extensions/EqualStakeVPCalc.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {IVotingPowerProvider} from "../../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {MultiToken} from "../../../../src/contracts/modules/voting-power/extensions/MultiToken.sol";
import {IOzEIP712} from "../../../../src/interfaces/base/common/IOzEIP712.sol";
import {VotingPowerProvider} from "../../../../src/contracts/modules/voting-power/VotingPowerProvider.sol";
import {SelfNetwork} from "../../../../src/contracts/modules/voting-power/extensions/SelfNetwork.sol";
import {VotingPowerProviderFull} from "../../../../test/mocks/VotingPowerProviderFull.sol";
import {IOzOwnable} from "../../../../src/interfaces/modules/common/permissions/IOzOwnable.sol";
import {ISelfNetwork} from "../../../../src/interfaces/modules/voting-power/extensions/ISelfNetwork.sol";
import {IOpNetVaultAutoDeploy} from
    "../../../../src/interfaces/modules/voting-power/extensions/IOpNetVaultAutoDeploy.sol";

contract SelfNetworkTest is Test, InitSetup {
    VotingPowerProviderFull private votingPowerProvider;

    address operator1;
    address operator2;
    uint256 operator1Pk;

    address vaultA;
    address vaultB;

    function setUp() public override {
        InitSetup.setUp();

        votingPowerProvider = new VotingPowerProviderFull(
            address(symbioticCore.operatorRegistry),
            address(symbioticCore.vaultFactory),
            address(symbioticCore.networkRegistry),
            address(symbioticCore.networkMiddlewareService),
            address(symbioticCore.vaultConfigurator)
        );
    }

    function test_Version() public {
        assertEq(votingPowerProvider.SelfNetwork_VERSION(), 1, "SelfNetwork version mismatch");
    }

    function test_NETWORK() public {
        INetworkManager.NetworkManagerInitParams memory netInit =
            INetworkManager.NetworkManagerInitParams({network: address(0), subnetworkID: initSetupParams.subnetworkID});
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

        IOzOwnable.OzOwnableInitParams memory ozOwnableInit = IOzOwnable.OzOwnableInitParams({owner: address(this)});

        IOpNetVaultAutoDeploy.OpNetVaultAutoDeployInitParams memory opNetVaultAutoDeployInit = IOpNetVaultAutoDeploy
            .OpNetVaultAutoDeployInitParams({
            config: IOpNetVaultAutoDeploy.AutoDeployConfig({
                epochDuration: 100 days,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: address(1),
                withSlasher: true,
                isBurnerHook: true
            })
        });

        votingPowerProvider.initialize(votingPowerProviderInit, ozOwnableInit, wlInit, opNetVaultAutoDeployInit);

        assertEq(votingPowerProvider.NETWORK(), address(votingPowerProvider), "NETWORK mismatch");
        assertEq(votingPowerProvider.SUBNETWORK(), votingPowerProvider.SUBNETWORK(), "SUBNETWORK mismatch");
    }

    function test_NETWORK2() public {
        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: address(votingPowerProvider),
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

        IOzOwnable.OzOwnableInitParams memory ozOwnableInit = IOzOwnable.OzOwnableInitParams({owner: address(this)});

        IOpNetVaultAutoDeploy.OpNetVaultAutoDeployInitParams memory opNetVaultAutoDeployInit = IOpNetVaultAutoDeploy
            .OpNetVaultAutoDeployInitParams({
            config: IOpNetVaultAutoDeploy.AutoDeployConfig({
                epochDuration: 100 days,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: address(1),
                withSlasher: true,
                isBurnerHook: true
            })
        });

        votingPowerProvider.initialize(votingPowerProviderInit, ozOwnableInit, wlInit, opNetVaultAutoDeployInit);

        assertEq(votingPowerProvider.NETWORK(), address(votingPowerProvider), "NETWORK mismatch");
        assertEq(votingPowerProvider.SUBNETWORK(), votingPowerProvider.SUBNETWORK(), "SUBNETWORK mismatch");
    }
}

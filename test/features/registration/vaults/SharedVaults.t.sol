// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {SharedVaults} from "../../../../src/contracts/features/registration/vaults/SharedVaults.sol";
import {VaultManagerLogic} from "../../../../src/contracts/base/logic/VaultManagerLogic.sol";
import {ISharedVaults} from "../../../../src/interfaces/features/registration/vaults/ISharedVaults.sol";
import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {NoPermissionManager} from "../../../../src/contracts/features/permissions/NoPermissionManager.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {EqualStakeToVP} from "../../../../src/contracts/features/stakeToVotingPower/EqualStakeToVP.sol";

import "../../../InitSetup.sol";

contract TestSharedVaults is SharedVaults, NoPermissionManager, EqualStakeToVP {
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInit,
        IVaultManager.VaultManagerInitParams memory vaultInit
    ) external initializer {
        __NetworkManager_init(netInit);
        __OperatorManager_init();
        __VaultManager_init(vaultInit);
        __SharedVaults_init();
    }

    function registerToken(
        address token
    ) public {
        _registerToken(token);
    }
}

contract SharedVaultsTest is InitSetup {
    TestSharedVaults private sharedVaults;

    address private owner = address(0x12345);
    address private nonOwner = address(0xABC);

    address dummyOperatorRegistry = address(0xAAA1);
    address dummyVaultFactory = address(0xBBB2);

    function setUp() public override {
        InitSetup.setUp();
        sharedVaults =
            new TestSharedVaults(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100});

        sharedVaults.initialize(netInit, vaultInit);
    }

    function test_Version() public {
        assertEq(sharedVaults.SharedVaults_VERSION(), 1, "SharedVaults_VERSION mismatch");
    }

    function test_RegisterSharedVault_OnlyOwnerCanCall() public {
        sharedVaults.registerToken(initSetupParams.masterChain.tokens[0]);

        sharedVaults.registerSharedVault(initSetupParams.masterChain.vaults[0]);
    }

    function test_RegisterUnregisterSharedVault_VaultManagerSide() public {
        sharedVaults.registerToken(initSetupParams.masterChain.tokens[0]);

        sharedVaults.registerSharedVault(initSetupParams.masterChain.vaults[0]);

        assertTrue(sharedVaults.isSharedVaultRegistered(initSetupParams.masterChain.vaults[0]));

        sharedVaults.unregisterSharedVault(initSetupParams.masterChain.vaults[0]);

        assertFalse(sharedVaults.isSharedVaultRegistered(initSetupParams.masterChain.vaults[0]));
    }
}

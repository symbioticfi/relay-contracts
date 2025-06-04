// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {MultiToken} from "../../../../src/contracts/modules/voting-power/extensions/MultiToken.sol";
import {VaultManagerLogic} from "../../../../src/contracts/base/logic/VaultManagerLogic.sol";
import {IMultiToken} from "../../../../src/interfaces/modules/voting-power/extensions/IMultiToken.sol";
import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {NoPermissionManager} from "../../../../test/mocks/NoPermissionManager.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {EqualStakeVPCalc} from "../../../../src/contracts/modules/voting-power/extensions/EqualStakeVPCalc.sol";

import "../../../InitSetup.sol";

contract TestMultiToken is MultiToken, NoPermissionManager, EqualStakeVPCalc {
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInit,
        IVaultManager.VaultManagerInitParams memory vaultInit
    ) external initializer {
        __NetworkManager_init(netInit);
        __VaultManager_init(vaultInit);
    }
}

contract MultiTokenTest is InitSetup {
    TestMultiToken private tokens;

    address private owner = address(0x12345);
    address private nonOwner = address(0xABC);

    address dummyOperatorRegistry = address(0xAAA1);
    address dummyVaultFactory = address(0xBBB2);

    function setUp() public override {
        InitSetup.setUp();
        tokens = new TestMultiToken(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100, token: initSetupParams.masterChain.tokens[0]});

        tokens.initialize(netInit, vaultInit);
    }

    function test_Version() public {
        assertEq(tokens.MultiToken_VERSION(), 1, "MultiToken_VERSION mismatch");
    }

    function test_RegisterToken_OnlyOwnerCanCall() public {
        tokens.registerToken(address(1));
    }

    function test_RegisterUnregisterToken_VaultManagerSide() public {
        tokens.registerToken(address(1));

        assertTrue(tokens.isTokenRegistered(address(1)));

        tokens.unregisterToken(address(1));

        assertFalse(tokens.isTokenRegistered(address(1)));
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {Tokens} from "../../../../src/contracts/features/registration/tokens/Tokens.sol";
import {VaultManagerLogic} from "../../../../src/contracts/base/logic/VaultManagerLogic.sol";
import {ITokens} from "../../../../src/interfaces/features/registration/tokens/ITokens.sol";
import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {NoPermissionManager} from "../../../../src/contracts/features/permissions/NoPermissionManager.sol";
import {VaultManager} from "../../../../src/contracts/base/VaultManager.sol";
import {EqualStakeToVP} from "../../../../src/contracts/features/stakeToVotingPower/EqualStakeToVP.sol";

import "../../../InitSetup.sol";

contract TestTokens is Tokens, NoPermissionManager, EqualStakeToVP {
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInit,
        IVaultManager.VaultManagerInitParams memory vaultInit
    ) external initializer {
        __NetworkManager_init(netInit);
        __OperatorManager_init();
        __VaultManager_init(vaultInit);
        __Tokens_init();
    }
}

contract TokensTest is InitSetup {
    TestTokens private tokens;

    address private owner = address(0x12345);
    address private nonOwner = address(0xABC);

    address dummyOperatorRegistry = address(0xAAA1);
    address dummyVaultFactory = address(0xBBB2);

    function setUp() public override {
        InitSetup.setUp();
        tokens = new TestTokens(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100});

        tokens.initialize(netInit, vaultInit);
    }

    function test_Version() public {
        assertEq(tokens.Tokens_VERSION(), 1, "Tokens_VERSION mismatch");
    }

    function test_RegisterToken_OnlyOwnerCanCall() public {
        tokens.registerToken(initSetupParams.masterChain.tokens[0]);
    }

    function test_RegisterUnregisterToken_VaultManagerSide() public {
        tokens.registerToken(initSetupParams.masterChain.tokens[0]);

        assertTrue(tokens.isTokenRegistered(initSetupParams.masterChain.tokens[0]));

        tokens.unregisterToken(initSetupParams.masterChain.tokens[0]);

        assertFalse(tokens.isTokenRegistered(initSetupParams.masterChain.tokens[0]));
    }
}

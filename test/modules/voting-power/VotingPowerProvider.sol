// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {VotingPowerProvider} from "../../../src/contracts/modules/voting-power/VotingPowerProvider.sol";
import {MultiToken} from "../../../src/contracts/modules/voting-power/extensions/MultiToken.sol";
import {VaultManagerLogic} from "../../../src/contracts/base/logic/VaultManagerLogic.sol";
import {IVotingPowerProvider} from "../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {INetworkManager} from "../../../src/interfaces/base/INetworkManager.sol";
import {IVaultManager} from "../../../src/interfaces/base/IVaultManager.sol";
import {IOzEIP712} from "../../../src/interfaces/base/common/IOzEIP712.sol";
import {NoPermissionManager} from "../../../test/mocks/NoPermissionManager.sol";
import {VaultManager} from "../../../src/contracts/base/VaultManager.sol";
import {EqualStakeVPCalc} from "../../../src/contracts/modules/voting-power/extensions/EqualStakeVPCalc.sol";
import {OperatorVaults} from "../../../src/contracts/modules/voting-power/extensions/OperatorVaults.sol";

import {BN254} from "../../../src/contracts/libraries/utils/BN254.sol";
import "../../InitSetup.sol";

contract TestVotingPowerProvider is
    MultiToken,
    VotingPowerProvider,
    OperatorVaults,
    NoPermissionManager,
    EqualStakeVPCalc
{
    constructor(address operatorRegistry, address vaultFactory) VotingPowerProvider(operatorRegistry, vaultFactory) {}

    function initialize(
        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit
    ) external initializer {
        __VotingPowerProvider_init(votingPowerProviderInit);
        __OperatorVaults_init();
    }
}

contract VotingPowerProviderTest is InitSetupTest {
    TestVotingPowerProvider private votingPowerProvider;

    function setUp() public override {
        InitSetupTest.setUp();

        votingPowerProvider =
            new TestVotingPowerProvider(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit =
            INetworkManager.NetworkManagerInitParams({network: vars.network.addr, subnetworkID: IDENTIFIER});
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100, token: initSetupParams.masterChain.tokens[0]});

        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit = IVotingPowerProvider
            .VotingPowerProviderInitParams({
            networkManagerInitParams: netInit,
            vaultManagerInitParams: vaultInit,
            ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "MyVotingPowerProvider", version: "1"})
        });

        votingPowerProvider.initialize(votingPowerProviderInit);

        // votingPowerProvider.registerToken(initSetupParams.masterChain.tokens[0]);
    }

    function test_RegisterOperator() public {
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: getOperator(0).addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: votingPowerProvider.getSlashingWindow() * 2,
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

        vm.startPrank(getOperator(0).addr);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        votingPowerProvider.registerOperatorVault(getOperator(0).addr, vault);

        assertTrue(votingPowerProvider.isOperatorRegistered(getOperator(0).addr), "Operator should be registered");
        assertTrue(
            votingPowerProvider.isOperatorVaultRegistered(getOperator(0).addr, vault), "Vault should be registered"
        );
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(vault), "Vault should be registered");

        vm.startPrank(getOperator(0).addr);
        votingPowerProvider.unregisterOperator();
        vm.stopPrank();

        assertFalse(votingPowerProvider.isOperatorRegistered(getOperator(0).addr), "Operator should be unregistered");
        assertTrue(
            votingPowerProvider.isOperatorVaultRegistered(getOperator(0).addr, vault), "Vault should be unregistered"
        );
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(vault), "Vault should be unregistered");
    }

    function test_RegisterOperatorVault() public {
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: getOperator(0).addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: votingPowerProvider.getSlashingWindow() * 2,
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

        vm.startPrank(getOperator(0).addr);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        votingPowerProvider.registerOperatorVault(getOperator(0).addr, vault);

        assertTrue(votingPowerProvider.isOperatorRegistered(getOperator(0).addr), "Operator should be registered");
        assertTrue(
            votingPowerProvider.isOperatorVaultRegistered(getOperator(0).addr, vault), "Vault should be registered"
        );
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(vault), "Vault should be registered");

        vm.startPrank(getOperator(0).addr);
        votingPowerProvider.unregisterOperatorVault(getOperator(0).addr, vault);
        vm.stopPrank();

        assertTrue(votingPowerProvider.isOperatorRegistered(getOperator(0).addr), "Operator should be registered");
        assertFalse(
            votingPowerProvider.isOperatorVaultRegistered(getOperator(0).addr, vault), "Vault should be unregistered"
        );
        assertFalse(votingPowerProvider.isOperatorVaultRegistered(vault), "Vault should be unregistered");
    }

    function test_registerOperatorWithSignature() public {
        address operatorAddr = getOperator(0).addr;
        uint256 operatorPk = getOperator(0).privateKey;

        uint256 currentNonce = votingPowerProvider.nonces(operatorAddr);

        address someVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: votingPowerProvider.getSlashingWindow() * 2,
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

        bytes32 registerOperatorTypehash = keccak256("RegisterOperator(address operator,uint256 nonce)");

        bytes32 structHash = keccak256(abi.encode(registerOperatorTypehash, operatorAddr, currentNonce));

        bytes32 digest = votingPowerProvider.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPk, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        votingPowerProvider.registerOperatorWithSignature(operatorAddr, signature);

        assertTrue(votingPowerProvider.isOperatorRegistered(operatorAddr), "Operator should be registered");

        votingPowerProvider.registerOperatorVault(operatorAddr, someVault);
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(operatorAddr, someVault), "Vault should be registered");
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(someVault), "Vault should be registered");
    }

    function test_registerOperatorWithSignature_RevertIfInvalidSig() public {
        address operatorAddr = getOperator(0).addr;
        uint256 operatorPk = getOperator(0).privateKey;

        uint256 wrongPk = 0x999999999;
        address someVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: votingPowerProvider.getSlashingWindow() * 2,
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

        uint256 currentNonce = votingPowerProvider.nonces(operatorAddr);
        bytes32 registerOperatorTypehash = keccak256("RegisterOperator(address operator,address vault,uint256 nonce)");

        bytes32 structHash = keccak256(abi.encode(registerOperatorTypehash, operatorAddr, currentNonce));
        bytes32 digest = votingPowerProvider.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(wrongPk, digest);
        bytes memory badSignature = abi.encodePacked(r, s, v);

        vm.expectRevert(IVotingPowerProvider.VotingPowerProvider_InvalidSignature.selector);
        votingPowerProvider.registerOperatorWithSignature(operatorAddr, badSignature);
    }

    function test_IncreaseNonce() public {
        address operatorAddr = getOperator(0).addr;
        uint256 oldNonce = votingPowerProvider.nonces(operatorAddr);
        assertEq(oldNonce, 0, "Initial nonce is 0");

        vm.prank(operatorAddr);
        votingPowerProvider.invalidateOldSignatures();

        uint256 newNonce = votingPowerProvider.nonces(operatorAddr);
        assertEq(newNonce, 1, "Nonce incremented by 1");
    }

    function test_unregisterOperatorWithSignature() public {
        address operatorAddr = getOperator(0).addr;
        uint256 operatorPk = getOperator(0).privateKey;

        vm.prank(operatorAddr);
        votingPowerProvider.registerOperator();
        assertTrue(votingPowerProvider.isOperatorRegistered(operatorAddr));

        uint256 currentNonce = votingPowerProvider.nonces(operatorAddr);
        bytes32 typehash = keccak256("UnregisterOperator(address operator,uint256 nonce)");
        bytes32 structHash = keccak256(abi.encode(typehash, operatorAddr, currentNonce));
        bytes32 digest = votingPowerProvider.hashTypedDataV4(structHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPk, digest);
        bytes memory signature = abi.encodePacked(r, s, v);

        votingPowerProvider.unregisterOperatorWithSignature(operatorAddr, signature);

        assertFalse(votingPowerProvider.isOperatorRegistered(operatorAddr), "Should be unregistered now");
    }
}

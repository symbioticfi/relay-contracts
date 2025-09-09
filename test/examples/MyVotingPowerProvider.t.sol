// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {VotingPowerProvider} from "../../src/modules/voting-power/VotingPowerProvider.sol";
import {VotingPowerProviderLogic} from "../../src/modules/voting-power/logic/VotingPowerProviderLogic.sol";
import {MultiToken} from "../../src/modules/voting-power/extensions/MultiToken.sol";
import {IVotingPowerProvider} from "../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {INetworkManager} from "../../src/interfaces/modules/base/INetworkManager.sol";
import {IOzEIP712} from "../../src/interfaces/modules/base/IOzEIP712.sol";
import {NoPermissionManager} from "../../test/mocks/NoPermissionManager.sol";
import {EqualStakeVPCalc} from "../../src/modules/voting-power/common/voting-power-calc/EqualStakeVPCalc.sol";
import {OperatorVaults} from "../../src/modules/voting-power/extensions/OperatorVaults.sol";
import {IOzOwnable} from "../../src/interfaces/modules/common/permissions/IOzOwnable.sol";

import {BN254} from "../../src/libraries/utils/BN254.sol";
import "../InitSetup.sol";

contract MyVotingPowerProviderTest is InitSetupTest {
    MyVotingPowerProvider private votingPowerProvider;

    address operator1 = address(0xAAA1);
    address operator2 = address(0xAAA2);
    address tokenA = address(0xBEE1);
    address tokenB = address(0xBEE2);

    address validOperator = address(0x1111);
    address invalidOperator = address(0x2222);

    bytes4 private ERR_INVALID_OPERATOR = IVotingPowerProvider.VotingPowerProvider_InvalidOperator.selector;
    bytes4 private ERR_ALREADY_REGISTERED = IVotingPowerProvider.VotingPowerProvider_OperatorAlreadyRegistered.selector;
    bytes4 private ERR_NOT_REGISTERED = IVotingPowerProvider.VotingPowerProvider_OperatorNotRegistered.selector;

    bytes4 private ERR_TOKEN_ALREADY_registered =
        IVotingPowerProvider.VotingPowerProvider_TokenAlreadyIsRegistered.selector;
    bytes4 private ERR_TOKEN_NOT_registered = IVotingPowerProvider.VotingPowerProvider_TokenNotRegistered.selector;
    bytes4 private ERR_INVALID_TOKEN = IVotingPowerProvider.VotingPowerProvider_InvalidToken.selector;

    bytes4 private ERR_SHARED_VAULT_ALREADY_registered =
        IVotingPowerProvider.VotingPowerProvider_SharedVaultAlreadyIsRegistered.selector;
    bytes4 private ERR_OPERATOR_VAULT_ALREADY_registered =
        IVotingPowerProvider.VotingPowerProvider_OperatorVaultAlreadyIsRegistered.selector;
    bytes4 private ERR_INVALID_VAULT = IVotingPowerProvider.VotingPowerProvider_InvalidVault.selector;

    bytes4 private ERR_INVALID_SHARED_VAULT = IVotingPowerProvider.VotingPowerProvider_InvalidSharedVault.selector;
    bytes4 private ERR_INVALID_OPERATOR_VAULT = IVotingPowerProvider.VotingPowerProvider_InvalidOperatorVault.selector;
    bytes4 private ERR_OPERATOR_NOT_REGISTERED = IVotingPowerProvider.VotingPowerProvider_OperatorNotRegistered.selector;

    function setUp() public override {
        InitSetupTest.setUp();

        votingPowerProvider =
            new MyVotingPowerProvider(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit =
            INetworkManager.NetworkManagerInitParams({network: vars.network.addr, subnetworkId: IDENTIFIER});

        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit = IVotingPowerProvider
            .VotingPowerProviderInitParams({
            networkManagerInitParams: netInit,
            ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "MyVotingPowerProvider", version: "1"}),
            requireSlasher: true,
            minVaultEpochDuration: 100,
            token: initSetupParams.masterChain.tokens[0]
        });

        votingPowerProvider.initialize(
            votingPowerProviderInit, IOzOwnable.OzOwnableInitParams({owner: vars.deployer.addr})
        );

        _registerOperator_SymbioticCore(symbioticCore, operator1);
        _registerOperator_SymbioticCore(symbioticCore, operator2);

        _registerOperator_SymbioticCore(symbioticCore, validOperator);

        // votingPowerProvider.registerToken(initSetupParams.masterChain.tokens[0]);
    }

    function test_RegisterOperatorValid() public {
        vm.startPrank(validOperator);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        bool isRegistered = votingPowerProvider.isOperatorRegistered(validOperator);
        assertTrue(isRegistered, "Should be registered now");
    }

    function test_RegisterOperator_RevertIfNotEntity() public {
        vm.expectRevert(ERR_INVALID_OPERATOR);
        vm.startPrank(invalidOperator);
        votingPowerProvider.registerOperator();
        vm.stopPrank();
    }

    function test_RegisterOperator_RevertIfAlreadyRegistered() public {
        vm.startPrank(validOperator);
        votingPowerProvider.registerOperator();
        vm.stopPrank();
        vm.expectRevert(ERR_ALREADY_REGISTERED);
        vm.startPrank(validOperator);
        votingPowerProvider.registerOperator();
        vm.stopPrank();
    }

    function test_UnregisterOperator() public {
        vm.startPrank(validOperator);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        address[] memory actOps = votingPowerProvider.getOperators();
        assertEq(actOps.length, 1, "Should have exactly 1 registered operator");
        assertEq(actOps[0], validOperator, "Operator mismatch in actOps");

        vm.startPrank(validOperator);
        votingPowerProvider.unregisterOperator();
        vm.stopPrank();

        bool isRegistered = votingPowerProvider.isOperatorRegistered(validOperator);
        assertFalse(isRegistered, "Should not be registered after unregister");

        actOps = votingPowerProvider.getOperators();
        assertEq(actOps.length, 0, "Should have no registered operators");
    }

    function test_UnregisterOperator_RevertIfNotRegistered() public {
        vm.expectRevert(ERR_NOT_REGISTERED);
        vm.startPrank(validOperator);
        votingPowerProvider.unregisterOperator();
        vm.stopPrank();
    }

    function test_IsOperatorRegisteredAt_withTime() public {
        uint48 t0 = uint48(vm.getBlockTimestamp());
        vm.startPrank(validOperator);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        vm.warp(vm.getBlockTimestamp() + 100);
        uint48 t1 = uint48(vm.getBlockTimestamp());

        bool wasRegisteredBefore = votingPowerProvider.isOperatorRegisteredAt(validOperator, t0 - 1);
        assertFalse(wasRegisteredBefore, "Should be inregistered before we registered");
        bool isRegisteredT0 = votingPowerProvider.isOperatorRegisteredAt(validOperator, t0);
        assertTrue(isRegisteredT0, "Should be registered at T0");
        bool isRegisteredT1 = votingPowerProvider.isOperatorRegisteredAt(validOperator, t1);
        assertTrue(isRegisteredT1, "Should be registered at T1");
    }

    function testGetOperatorsAt_withTime() public {
        address validOp2 = address(0x3333);
        _registerOperator_SymbioticCore(symbioticCore, validOp2);

        uint48 t0 = uint48(vm.getBlockTimestamp());

        vm.startPrank(validOperator);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        {
            address[] memory actOps = votingPowerProvider.getOperators();
            assertEq(actOps.length, 1, "At T0, 1 registered operator");
            assertEq(actOps[0], validOperator);
        }

        vm.warp(t0 + 50);
        uint48 t1 = uint48(vm.getBlockTimestamp());
        vm.startPrank(validOp2);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        {
            address[] memory actOpsT0 = votingPowerProvider.getOperatorsAt(t0);
            assertEq(actOpsT0.length, 1, "At T0, only 1 registered operator");
            assertEq(actOpsT0[0], validOperator);
        }
        {
            address[] memory actOpsT1 = votingPowerProvider.getOperatorsAt(t1);
            assertEq(actOpsT1.length, 2, "At T1, 2 registered operators");
            assertEq(actOpsT1[0], validOperator);
            assertEq(actOpsT1[1], validOp2);
        }
        {
            address[] memory actOps = votingPowerProvider.getOperators();
            assertEq(actOps.length, 2, "At T1, 2 registered operators");
            assertEq(actOps[0], validOperator);
            assertEq(actOps[1], validOp2);
        }
    }

    function test_SlashingData() public {
        (bool requireSlasher, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        assertTrue(requireSlasher);
        assertEq(minVaultEpochDuration, 100);
        (requireSlasher, minVaultEpochDuration) =
            votingPowerProvider.getSlashingDataAt(uint48(vm.getBlockTimestamp()), "");
        assertTrue(requireSlasher);
        assertEq(minVaultEpochDuration, 100);
        (requireSlasher, minVaultEpochDuration) =
            votingPowerProvider.getSlashingDataAt(uint48(vm.getBlockTimestamp()) - 1, "");
        assertFalse(requireSlasher);
        assertEq(minVaultEpochDuration, 0);
    }

    function test_RegisterOperatorVault() public {
        address[] memory networkLimitSetRoleHolders = new address[](1);
        networkLimitSetRoleHolders[0] = address(this);
        address[] memory operatorNetworkSharesSetRoleHolders = new address[](1);
        operatorNetworkSharesSetRoleHolders[0] = address(this);

        (bool requireSlasher, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        address opVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: minVaultEpochDuration * 2,
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

        vm.startPrank(operator1);
        votingPowerProvider.registerOperator();
        vm.stopPrank();

        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.registerOperatorVault(operator1, opVault);
        vm.stopPrank();

        vm.expectRevert(ERR_OPERATOR_VAULT_ALREADY_registered);
        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.registerOperatorVault(operator1, opVault);
        vm.stopPrank();

        address[] memory registeredOperatorVaults = votingPowerProvider.getOperatorVaults(operator1);
        assertEq(registeredOperatorVaults.length, 1);
        assertEq(registeredOperatorVaults[0], opVault);

        registeredOperatorVaults = votingPowerProvider.getOperatorVaultsAt(operator1, uint48(vm.getBlockTimestamp()));
        assertEq(registeredOperatorVaults.length, 1);

        assertEq(votingPowerProvider.isOperatorVaultRegistered(operator1, opVault), true);
        assertEq(
            votingPowerProvider.isOperatorVaultRegisteredAt(operator1, opVault, uint48(vm.getBlockTimestamp())), true
        );
        assertEq(votingPowerProvider.isOperatorVaultRegisteredAt(opVault, uint48(vm.getBlockTimestamp())), true);

        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.unregisterOperatorVault(operator1, opVault);
        vm.stopPrank();

        registeredOperatorVaults = votingPowerProvider.getOperatorVaults(operator1);
        assertEq(registeredOperatorVaults.length, 0);
    }

    function test_RegisterOperatorVault_RevertIfOperatorNotRegistered() public {
        address operator3 = address(0x777);
        _registerOperator_SymbioticCore(symbioticCore, operator3);
        (bool requireSlasher, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        address opVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operator3,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: minVaultEpochDuration * 2,
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

        vm.expectRevert(ERR_OPERATOR_NOT_REGISTERED);
        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.registerOperatorVault(operator3, opVault);
        vm.stopPrank();
    }

    function test_SlashVault_InstantSlasher() public {}

    function test_SlashVault_VetoSlasherFlow() public {}

    function test_SlashVault_RevertIfNoSlasher() public {}

    function test_DistributeRewards() public {}

    function test_CheckStakes() public {
        votingPowerProvider =
            new MyVotingPowerProvider(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit =
            INetworkManager.NetworkManagerInitParams({network: vars.network.addr, subnetworkId: IDENTIFIER});

        IVotingPowerProvider.VotingPowerProviderInitParams memory votingPowerProviderInit = IVotingPowerProvider
            .VotingPowerProviderInitParams({
            networkManagerInitParams: netInit,
            ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "MyVotingPowerProvider", version: "1"}),
            requireSlasher: true,
            minVaultEpochDuration: 100,
            token: initSetupParams.masterChain.tokens[0]
        });

        votingPowerProvider.initialize(
            votingPowerProviderInit, IOzOwnable.OzOwnableInitParams({owner: vars.deployer.addr})
        );

        _networkSetMiddleware_SymbioticCore(vars.network.addr, address(votingPowerProvider));

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            Vm.Wallet memory operator = getOperator(i);
            vm.startPrank(operator.addr);
            votingPowerProvider.registerOperator();
            vm.stopPrank();
        }

        (, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            Vm.Wallet memory operator = getOperator(i);
            address operatorVault = _getVault_SymbioticCore(
                VaultParams({
                    owner: operator.addr,
                    collateral: initSetupParams.masterChain.tokens[0],
                    burner: 0x000000000000000000000000000000000000dEaD,
                    epochDuration: minVaultEpochDuration * 2,
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

            _operatorOptIn_SymbioticCore(operator.addr, operatorVault);
            _networkSetMaxNetworkLimit_SymbioticCore(
                votingPowerProvider.NETWORK(),
                operatorVault,
                votingPowerProvider.SUBNETWORK_IDENTIFIER(),
                type(uint256).max
            );
            _curatorSetNetworkLimit_SymbioticCore(
                operator.addr, operatorVault, votingPowerProvider.SUBNETWORK(), type(uint256).max
            );
            _stakerDeposit_SymbioticCore(getStaker(0).addr, operatorVault, 1000 + i);
            vm.startPrank(vars.network.addr);
            votingPowerProvider.registerOperatorVault(operator.addr, operatorVault);
            vm.stopPrank();
        }

        IVotingPowerProvider.OperatorVotingPower[] memory operatorVotingPowers1 =
            votingPowerProvider.getVotingPowers(new bytes[](0));
        assertEq(
            abi.encode(operatorVotingPowers1),
            abi.encode(votingPowerProvider.getVotingPowersAt(new bytes[](0), uint48(vm.getBlockTimestamp())))
        );

        uint256 totalStake;
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            Vm.Wallet memory operator = getOperator(i);
            IVotingPowerProvider.VaultValue[] memory vaultStakes1 = votingPowerProvider.getOperatorStakes(operator.addr);
            assertEq(
                abi.encode(vaultStakes1),
                abi.encode(votingPowerProvider.getOperatorStakesAt(operator.addr, uint48(vm.getBlockTimestamp())))
            );
            IVotingPowerProvider.VaultValue[] memory vaultVotingPowers1 =
                votingPowerProvider.getOperatorVotingPowers(operator.addr, "");
            assertEq(
                abi.encode(vaultVotingPowers1),
                abi.encode(
                    votingPowerProvider.getOperatorVotingPowersAt(operator.addr, "", uint48(vm.getBlockTimestamp()))
                )
            );
            assertEq(
                abi.encode(vaultVotingPowers1),
                abi.encode(
                    votingPowerProvider.getOperatorVotingPowersAt(
                        operator.addr,
                        abi.encode(
                            IVotingPowerProvider.OperatorVotingPowersExtraData({
                                sharedVaultsExtraData: new bytes[](0),
                                operatorVaultsExtraData: new bytes[](0)
                            })
                        ),
                        uint48(vm.getBlockTimestamp())
                    )
                )
            );
            assertEq(
                abi.encode(vaultVotingPowers1),
                abi.encode(
                    votingPowerProvider.getOperatorVotingPowers(
                        operator.addr,
                        abi.encode(
                            IVotingPowerProvider.OperatorVotingPowersExtraData({
                                sharedVaultsExtraData: new bytes[](0),
                                operatorVaultsExtraData: new bytes[](0)
                            })
                        )
                    )
                )
            );

            uint256 operatorVaultStake = (_normalizeForToken_Symbiotic(1000 + i, initSetupParams.masterChain.tokens[0]));
            assertEq(vaultStakes1.length, 1);
            assertEq(vaultStakes1[0].value, operatorVaultStake);
            assertEq(vaultVotingPowers1.length, 1);
            assertEq(vaultVotingPowers1[0].value, operatorVaultStake);
            assertEq(operatorVotingPowers1[i].operator, operator.addr);
            assertEq(operatorVotingPowers1[i].vaults[0].value, operatorVaultStake);

            totalStake += operatorVaultStake;
        }
        assertGt(totalStake, 0);
    }

    function test_RegisterOperator() public {
        (bool requireSlasher, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: getOperator(0).addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: minVaultEpochDuration * 2,
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

        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.registerOperatorVault(getOperator(0).addr, vault);
        vm.stopPrank();

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

    function test_RegisterOperatorVaultExternal() public {
        (bool requireSlasher, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        address vault = _getVault_SymbioticCore(
            VaultParams({
                owner: getOperator(0).addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: minVaultEpochDuration * 2,
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

        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.registerOperatorVault(getOperator(0).addr, vault);
        vm.stopPrank();

        assertTrue(votingPowerProvider.isOperatorRegistered(getOperator(0).addr), "Operator should be registered");
        assertTrue(
            votingPowerProvider.isOperatorVaultRegistered(getOperator(0).addr, vault), "Vault should be registered"
        );
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(vault), "Vault should be registered");

        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.unregisterOperatorVault(getOperator(0).addr, vault);
        vm.stopPrank();

        assertTrue(votingPowerProvider.isOperatorRegistered(getOperator(0).addr), "Operator should be registered");
        assertFalse(
            votingPowerProvider.isOperatorVaultRegistered(getOperator(0).addr, vault), "Vault should be unregistered"
        );
        assertFalse(votingPowerProvider.isOperatorVaultRegistered(vault), "Vault should be unregistered");
    }

    function test_registerOperatorWithSignature() public {
        (bool requireSlasher, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        address operatorAddr = getOperator(0).addr;
        uint256 operatorPk = getOperator(0).privateKey;

        uint256 currentNonce = votingPowerProvider.nonces(operatorAddr);

        address someVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: minVaultEpochDuration * 2,
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

        vm.startPrank(vars.deployer.addr);
        votingPowerProvider.registerOperatorVault(operatorAddr, someVault);
        vm.stopPrank();
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(operatorAddr, someVault), "Vault should be registered");
        assertTrue(votingPowerProvider.isOperatorVaultRegistered(someVault), "Vault should be registered");
    }

    function test_registerOperatorWithSignature_RevertIfInvalidSig() public {
        address operatorAddr = getOperator(0).addr;
        uint256 operatorPk = getOperator(0).privateKey;
        (bool requireSlasher, uint48 minVaultEpochDuration) = votingPowerProvider.getSlashingData();
        uint256 wrongPk = 0x999999999;
        address someVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operatorAddr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: minVaultEpochDuration * 2,
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

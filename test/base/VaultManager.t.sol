// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {IVaultManager} from "../../src/interfaces/base/IVaultManager.sol";
import {INetworkManager} from "../../src/interfaces/base/INetworkManager.sol";

import "../InitSetup.sol";

import {VaultManager} from "../../src/contracts/base/VaultManager.sol";
import {VaultManagerLogic} from "../../src/contracts/base/logic/VaultManagerLogic.sol";
import {EqualStakeVPCalc} from "../../src/contracts/modules/voting-power/extensions/EqualStakeVPCalc.sol";

contract TestVaultManager is VaultManager, EqualStakeVPCalc {
    constructor(address operatorRegistry, address vaultFactory) VaultManager(operatorRegistry, vaultFactory) {}

    function initialize(
        INetworkManager.NetworkManagerInitParams memory netInit,
        IVaultManager.VaultManagerInitParams memory vaultInit
    ) external initializer {
        __NetworkManager_init(netInit);
        __VaultManager_init(vaultInit);
    }

    function registerOperator(
        address operator
    ) external {
        _registerOperator(operator);
    }

    function unregisterOperator(
        address operator
    ) external {
        _unregisterOperator(operator);
    }

    function setSlashingWindow(
        uint48 sw
    ) external {
        _setSlashingWindow(sw);
    }

    function registerToken(
        address token
    ) external {
        _registerToken(token);
    }

    function unregisterToken(
        address token
    ) external {
        _unregisterToken(token);
    }

    function registerSharedVault(
        address vault
    ) external {
        _registerSharedVault(vault);
    }

    function unregisterSharedVault(
        address vault
    ) external {
        _unregisterSharedVault(vault);
    }

    function registerOperatorVault(address operator, address vault) external {
        _registerOperatorVault(operator, vault);
    }

    function unregisterOperatorVault(address operator, address vault) external {
        _unregisterOperatorVault(operator, vault);
    }

    function validateVault(
        address vault
    ) external view returns (bool) {
        return VaultManagerLogic._validateVault(vault);
    }

    function validateSharedVault(
        address vault
    ) external view returns (bool) {
        return VaultManagerLogic._validateSharedVault(vault);
    }

    function validateOperatorVault(address operator, address vault) external view returns (bool) {
        return VaultManagerLogic._validateOperatorVault(operator, vault);
    }

    function validateVaultEpochDuration(
        address vault
    ) external view returns (bool) {
        return VaultManagerLogic._validateVaultEpochDuration(vault);
    }

    function getOperatorStake(address vault, address operator) external view returns (uint256) {
        return _getOperatorStake(vault, operator);
    }

    function getOperatorStakeAt(
        address vault,
        address operator,
        uint48 timestamp,
        bytes memory hints
    ) external view returns (uint256) {
        return _getOperatorStakeAt(vault, operator, timestamp, hints);
    }
}

contract VaultManagerTest is InitSetup {
    TestVaultManager vaultManager;

    address operator1 = address(0xAAA1);
    address operator2 = address(0xAAA2);
    address tokenA = address(0xBEE1);
    address tokenB = address(0xBEE2);

    address validOperator = address(0x1111);
    address invalidOperator = address(0x2222);

    bytes4 private ERR_INVALID_OPERATOR = IVaultManager.VaultManager_InvalidOperator.selector;
    bytes4 private ERR_ALREADY_REGISTERED = IVaultManager.VaultManager_OperatorAlreadyRegistered.selector;
    bytes4 private ERR_NOT_REGISTERED = IVaultManager.VaultManager_OperatorNotRegistered.selector;

    bytes4 private ERR_TOKEN_ALREADY_registered = IVaultManager.VaultManager_TokenAlreadyIsRegistered.selector;
    bytes4 private ERR_TOKEN_NOT_registered = IVaultManager.VaultManager_TokenNotRegistered.selector;
    bytes4 private ERR_INVALID_TOKEN = IVaultManager.VaultManager_InvalidToken.selector;

    bytes4 private ERR_SHARED_VAULT_ALREADY_registered =
        IVaultManager.VaultManager_SharedVaultAlreadyIsRegistered.selector;
    bytes4 private ERR_OPERATOR_VAULT_ALREADY_registered =
        IVaultManager.VaultManager_OperatorVaultAlreadyIsRegistered.selector;
    bytes4 private ERR_INVALID_VAULT = IVaultManager.VaultManager_InvalidVault.selector;

    bytes4 private ERR_INVALID_SHARED_VAULT = IVaultManager.VaultManager_InvalidSharedVault.selector;
    bytes4 private ERR_INVALID_OPERATOR_VAULT = IVaultManager.VaultManager_InvalidOperatorVault.selector;
    bytes4 private ERR_OPERATOR_NOT_REGISTERED = IVaultManager.VaultManager_OperatorNotRegistered.selector;

    bytes4 private ERR_INregistered_OPERATOR_SLASH = IVaultManager.VaultManager_UnregisteredOperatorSlash.selector;
    bytes4 private ERR_INregistered_VAULT_SLASH = IVaultManager.VaultManager_UnregisteredVaultSlash.selector;
    bytes4 private ERR_NO_SLASHER = IVaultManager.VaultManager_NoSlasher.selector;

    function setUp() public override {
        InitSetup.setUp();

        vaultManager =
            new TestVaultManager(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit =
            INetworkManager.NetworkManagerInitParams({network: address(0x1111), subnetworkID: 777});
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100, token: address(0)});
        vaultManager.initialize(netInit, vaultInit);

        _registerOperator_SymbioticCore(symbioticCore, operator1);
        _registerOperator_SymbioticCore(symbioticCore, operator2);

        _registerOperator_SymbioticCore(symbioticCore, validOperator);
    }

    function test_Version() public {
        assertEq(vaultManager.VaultManager_VERSION(), 1, "Version mismatch");
    }

    function test_RegisterOperatorValid() public {
        vaultManager.registerOperator(validOperator);

        bool isRegistered = vaultManager.isOperatorRegistered(validOperator);
        assertTrue(isRegistered, "Should be registered now");
    }

    function test_RegisterOperator_RevertIfNotEntity() public {
        vm.expectRevert(ERR_INVALID_OPERATOR);
        vaultManager.registerOperator(invalidOperator);
    }

    function test_RegisterOperator_RevertIfAlreadyRegistered() public {
        vaultManager.registerOperator(validOperator);
        vm.expectRevert(ERR_ALREADY_REGISTERED);
        vaultManager.registerOperator(validOperator);
    }

    function test_UnregisterOperator() public {
        vaultManager.registerOperator(validOperator);

        address[] memory actOps = vaultManager.getOperators();
        assertEq(actOps.length, 1, "Should have exactly 1 registered operator");
        assertEq(actOps[0], validOperator, "Operator mismatch in actOps");

        vaultManager.unregisterOperator(validOperator);

        bool isRegistered = vaultManager.isOperatorRegistered(validOperator);
        assertFalse(isRegistered, "Should not be registered after unregister");

        actOps = vaultManager.getOperators();
        assertEq(actOps.length, 0, "Should have no registered operators");

        uint256 actOpsLength = vaultManager.getOperatorsLength();
        assertEq(actOpsLength, 0, "Should have no registered operators");
    }

    function test_UnregisterOperator_RevertIfNotRegistered() public {
        vm.expectRevert(ERR_NOT_REGISTERED);
        vaultManager.unregisterOperator(validOperator);
    }

    function test_IsOperatorRegisteredAt_withTime() public {
        uint48 t0 = uint48(vm.getBlockTimestamp());
        vaultManager.registerOperator(validOperator);

        vm.warp(vm.getBlockTimestamp() + 100);
        uint48 t1 = uint48(vm.getBlockTimestamp());

        bool wasRegisteredBefore = vaultManager.isOperatorRegisteredAt(validOperator, t0 - 1, "");
        assertFalse(wasRegisteredBefore, "Should be inregistered before we registered");
        bool isRegisteredT0 = vaultManager.isOperatorRegisteredAt(validOperator, t0, "");
        assertTrue(isRegisteredT0, "Should be registered at T0");
        bool isRegisteredT1 = vaultManager.isOperatorRegisteredAt(validOperator, t1, "");
        assertTrue(isRegisteredT1, "Should be registered at T1");
    }

    function testGetOperatorsAt_withTime() public {
        address validOp2 = address(0x3333);
        _registerOperator_SymbioticCore(symbioticCore, validOp2);

        uint48 t0 = uint48(vm.getBlockTimestamp());

        vaultManager.registerOperator(validOperator);

        {
            address[] memory actOps = vaultManager.getOperators();
            assertEq(actOps.length, 1, "At T0, 1 registered operator");
            assertEq(actOps[0], validOperator);

            uint256 actOpsT0Length = vaultManager.getOperatorsLength();
            assertEq(actOpsT0Length, 1, "At T0, 1 registered operator");
        }

        vm.warp(t0 + 50);
        uint48 t1 = uint48(vm.getBlockTimestamp());
        vaultManager.registerOperator(validOp2);

        {
            address[] memory actOpsT0 = vaultManager.getOperatorsAt(t0);
            assertEq(actOpsT0.length, 1, "At T0, only 1 registered operator");
            assertEq(actOpsT0[0], validOperator);
        }
        {
            address[] memory actOpsT1 = vaultManager.getOperatorsAt(t1);
            assertEq(actOpsT1.length, 2, "At T1, 2 registered operators");
            assertEq(actOpsT1[0], validOperator);
            assertEq(actOpsT1[1], validOp2);
        }
        {
            address[] memory actOps = vaultManager.getOperators();
            assertEq(actOps.length, 2, "At T1, 2 registered operators");
            assertEq(actOps[0], validOperator);
            assertEq(actOps[1], validOp2);

            uint256 actOpsT1Length = vaultManager.getOperatorsLength();
            assertEq(actOpsT1Length, 2, "At T1, 2 registered operators");
        }
    }

    function test_SlashingWindow() public {
        assertEq(vaultManager.getSlashingWindow(), 100);
        vm.warp(vm.getBlockTimestamp() + 100);
        vaultManager.setSlashingWindow(50);
        assertEq(vaultManager.getSlashingWindow(), 50);
    }

    function test_SetSlashingWindow_RevertIfLarger() public {
        vm.expectRevert(IVaultManager.VaultManager_SlashingWindowTooLarge.selector);
        vaultManager.setSlashingWindow(200);
    }

    function test_RegisterToken() public {
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);
        vm.expectRevert(ERR_TOKEN_ALREADY_registered);
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);

        assertEq(vaultManager.getTokensLength(), 1);

        address[] memory registeredTokens = vaultManager.getTokensAt(uint48(vm.getBlockTimestamp()) - 100);
        assertEq(registeredTokens.length, 0);
        registeredTokens = vaultManager.getTokensAt(uint48(vm.getBlockTimestamp()));

        vaultManager.registerToken(tokenB);

        assertEq(vaultManager.getTokensLength(), 2);

        registeredTokens = vaultManager.getTokensAt(uint48(vm.getBlockTimestamp()));
        assertEq(registeredTokens.length, 2);
        assertEq(registeredTokens[0], initSetupParams.masterChain.tokens[0]);
        assertEq(registeredTokens[1], tokenB);

        vaultManager.unregisterToken(tokenB);

        assertEq(vaultManager.getTokensLength(), 1);

        registeredTokens = vaultManager.getTokensAt(uint48(vm.getBlockTimestamp()));
        assertEq(registeredTokens.length, 1);
        assertEq(registeredTokens[0], initSetupParams.masterChain.tokens[0]);

        assertTrue(vaultManager.isTokenRegistered(initSetupParams.masterChain.tokens[0]));
        assertFalse(vaultManager.isTokenRegisteredAt(tokenB, uint48(vm.getBlockTimestamp()), ""));

        registeredTokens = vaultManager.getTokens();
        assertEq(registeredTokens.length, 1);
        assertEq(registeredTokens[0], initSetupParams.masterChain.tokens[0]);
    }

    function test_RegisterToken_RevertOnZeroAddress() public {
        vm.expectRevert(ERR_INVALID_TOKEN);
        vaultManager.registerToken(address(0));
    }

    function test_UnregisterToken() public {
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);
        vaultManager.unregisterToken(initSetupParams.masterChain.tokens[0]);
        vm.expectRevert(ERR_TOKEN_NOT_registered);
        vaultManager.unregisterToken(initSetupParams.masterChain.tokens[0]);
    }

    function test_RegisterSharedVault() public {
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);

        vaultManager.registerSharedVault(initSetupParams.masterChain.vaults[0]);

        vm.expectRevert(ERR_SHARED_VAULT_ALREADY_registered);
        vaultManager.registerSharedVault(initSetupParams.masterChain.vaults[0]);

        address[] memory registeredSharedVaults = vaultManager.getSharedVaults();
        assertEq(registeredSharedVaults.length, 1);
        assertEq(registeredSharedVaults[0], initSetupParams.masterChain.vaults[0]);

        registeredSharedVaults = vaultManager.getSharedVaultsAt(uint48(vm.getBlockTimestamp()));
        assertEq(registeredSharedVaults.length, 1);

        assertEq(vaultManager.isSharedVaultRegistered(initSetupParams.masterChain.vaults[0]), true);
        assertEq(
            vaultManager.isSharedVaultRegisteredAt(
                initSetupParams.masterChain.vaults[0], uint48(vm.getBlockTimestamp()), ""
            ),
            true
        );

        vaultManager.unregisterSharedVault(initSetupParams.masterChain.vaults[0]);

        assertEq(vaultManager.getSharedVaultsLength(), 0);

        registeredSharedVaults = vaultManager.getSharedVaults();
        assertEq(registeredSharedVaults.length, 0);
    }

    function test_RegisterSharedVault_RevertIfInvalidVault() public {
        vm.expectRevert(ERR_INVALID_VAULT);
        vaultManager.registerSharedVault(address(0));
    }

    function test_RegisterSharedVault_RevertIfTokenNotRegistered() public {
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);

        vm.expectRevert(ERR_INVALID_VAULT);
        vaultManager.registerSharedVault(address(1));

        address newVault = _getVault_SymbioticCore(
            VaultParams({
                owner: vars.deployer.addr,
                collateral: address(2),
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: vaultManager.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 0,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        vm.expectRevert(ERR_INVALID_VAULT);
        vaultManager.registerSharedVault(newVault);

        newVault = _getVault_SymbioticCore(
            VaultParams({
                owner: vars.deployer.addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: vaultManager.getSlashingWindow() - 1,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 0,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 0,
                vetoDuration: 1
            })
        );

        vm.expectRevert(ERR_INVALID_VAULT);
        vaultManager.registerSharedVault(newVault);

        newVault = _getVault_SymbioticCore(
            VaultParams({
                owner: vars.deployer.addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: vaultManager.getSlashingWindow() * 2,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 0,
                hook: address(0),
                network: address(0),
                withSlasher: false,
                slasherIndex: 0,
                vetoDuration: 0
            })
        );

        vm.expectRevert(ERR_INVALID_VAULT);
        vaultManager.registerSharedVault(newVault);

        newVault = _getVault_SymbioticCore(
            VaultParams({
                owner: vars.deployer.addr,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: vaultManager.getSlashingWindow() - 1,
                whitelistedDepositors: new address[](0),
                depositLimit: 0,
                delegatorIndex: 0,
                hook: address(0),
                network: address(0),
                withSlasher: true,
                slasherIndex: 1,
                vetoDuration: 1
            })
        );

        vm.expectRevert(ERR_INVALID_VAULT);
        vaultManager.registerSharedVault(newVault);
    }

    function test_RegisterOperatorVault() public {
        address[] memory networkLimitSetRoleHolders = new address[](1);
        networkLimitSetRoleHolders[0] = address(this);
        address[] memory operatorNetworkSharesSetRoleHolders = new address[](1);
        operatorNetworkSharesSetRoleHolders[0] = address(this);

        address opVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: vaultManager.getSlashingWindow() * 2,
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

        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);

        vaultManager.registerOperator(operator1);

        vaultManager.registerOperatorVault(operator1, opVault);

        vm.expectRevert(ERR_OPERATOR_VAULT_ALREADY_registered);
        vaultManager.registerOperatorVault(operator1, opVault);

        address[] memory registeredOperatorVaults = vaultManager.getOperatorVaults(operator1);
        assertEq(registeredOperatorVaults.length, 1);
        assertEq(registeredOperatorVaults[0], opVault);

        registeredOperatorVaults = vaultManager.getOperatorVaultsAt(operator1, uint48(vm.getBlockTimestamp()));
        assertEq(registeredOperatorVaults.length, 1);

        assertEq(vaultManager.isOperatorVaultRegistered(operator1, opVault), true);
        assertEq(vaultManager.isOperatorVaultRegisteredAt(operator1, opVault, uint48(vm.getBlockTimestamp()), ""), true);
        assertEq(vaultManager.isOperatorVaultRegisteredAt(opVault, uint48(vm.getBlockTimestamp()), ""), true);

        vaultManager.unregisterOperatorVault(operator1, opVault);

        assertEq(vaultManager.getOperatorVaultsLength(operator1), 0);

        registeredOperatorVaults = vaultManager.getOperatorVaults(operator1);
        assertEq(registeredOperatorVaults.length, 0);
    }

    function test_RegisterOperatorVault_RevertIfOperatorNotRegistered() public {
        address operator3 = address(0x777);
        _registerOperator_SymbioticCore(symbioticCore, operator3);
        address opVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operator3,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: vaultManager.getSlashingWindow() * 2,
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
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);

        vm.expectRevert(ERR_OPERATOR_NOT_REGISTERED);
        vaultManager.registerOperatorVault(operator3, opVault);
    }

    function test_SlashVault_InstantSlasher() public {}

    function test_SlashVault_VetoSlasherFlow() public {}

    function test_SlashVault_RevertIfNoSlasher() public {}

    function test_DistributeRewards() public {}

    function test_ValidateVault() public {
        address someVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: vaultManager.getSlashingWindow() * 2,
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
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);

        bool ok = vaultManager.validateVault(someVault);
        assertTrue(ok, "should pass validation");
    }

    function test_ValidateVaultEpochDurationFailsIfLessThanSlashingWindow() public {
        address shortVault = _getVault_SymbioticCore(
            VaultParams({
                owner: operator1,
                collateral: initSetupParams.masterChain.tokens[0],
                burner: 0x000000000000000000000000000000000000dEaD,
                epochDuration: 50,
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
        vaultManager.registerToken(initSetupParams.masterChain.tokens[0]);

        bool ok = vaultManager.validateVault(shortVault);
        assertFalse(ok, "should fail since 50 < slashingWindow=100");
    }

    function test_Location() public {
        bytes32 location =
            keccak256(abi.encode(uint256(keccak256("symbiotic.storage.VaultManager")) - 1)) & ~bytes32(uint256(0xff));
        assertEq(location, 0x485f0695561726d087d0cb5cf546efed37ef61dfced21455f1ba7eb5e5b3db00, "Location mismatch");
    }

    function test_CheckStakes() public {
        vaultManager =
            new TestVaultManager(address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory));

        INetworkManager.NetworkManagerInitParams memory netInit = INetworkManager.NetworkManagerInitParams({
            network: vars.network.addr,
            subnetworkID: initSetupParams.subnetworkID
        });
        IVaultManager.VaultManagerInitParams memory vaultInit =
            IVaultManager.VaultManagerInitParams({slashingWindow: 100, token: initSetupParams.masterChain.tokens[0]});
        vaultManager.initialize(netInit, vaultInit);

        _networkSetMiddleware_SymbioticCore(vars.network.addr, address(vaultManager));

        // for (uint256 i; i < initSetupParams.masterChain.tokens.length; ++i) {
        //     vm.startPrank(vars.deployer.addr);
        //     vaultManager.registerToken(initSetupParams.masterChain.tokens[i]);
        //     vm.stopPrank();
        // }
        for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
            _setMaxNetworkLimit_SymbioticCore(
                vars.network.addr,
                initSetupParams.masterChain.vaults[i],
                initSetupParams.subnetworkID,
                type(uint256).max
            );
            _setNetworkLimit_SymbioticCore(
                vars.deployer.addr, initSetupParams.masterChain.vaults[i], vaultManager.SUBNETWORK(), type(uint256).max
            );
            for (uint256 j; j < vars.operators.length; ++j) {
                _setOperatorNetworkShares_SymbioticCore(
                    vars.deployer.addr,
                    initSetupParams.masterChain.vaults[i],
                    vaultManager.SUBNETWORK(),
                    vars.operators[j].addr,
                    1e18
                );
            }
            vm.startPrank(vars.network.addr);
            vaultManager.registerSharedVault(initSetupParams.masterChain.vaults[i]);
            vm.stopPrank();
        }

        for (uint256 i; i < vars.operators.length; ++i) {
            vm.startPrank(vars.operators[i].addr);
            vaultManager.registerOperator(vars.operators[i].addr);
            vm.stopPrank();

            _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, vars.network.addr);

            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, initSetupParams.masterChain.vaults[j]);
            }
        }

        IVaultManager.OperatorVotingPower[] memory operatorVotingPowers1 = vaultManager.getVotingPowers(new bytes[](0));
        IVaultManager.OperatorVotingPower[] memory operatorVotingPowers2 =
            vaultManager.getVotingPowersAt(new bytes[](0), uint48(vm.getBlockTimestamp()));

        uint256 totalStake;
        for (uint256 i; i < vars.operators.length; ++i) {
            IVaultManager.VaultVotingPower[] memory vaultVotingPowers1 =
                vaultManager.getOperatorVotingPowers(vars.operators[i].addr, "");
            IVaultManager.VaultVotingPower[] memory vaultVotingPowers2 =
                vaultManager.getOperatorVotingPowersAt(vars.operators[i].addr, "", uint48(vm.getBlockTimestamp()));
            uint256 operatorStake;
            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                uint256 operatorVaultStake = (
                    _normalizeForToken_Symbiotic(
                        SYMBIOTIC_CORE_MIN_TOKENS_TO_DEPOSIT_TIMES_1e18, initSetupParams.masterChain.tokens[0]
                    ) + j
                ) / vars.operators.length;
                assertEq(
                    vaultManager.getOperatorStake(initSetupParams.masterChain.vaults[j], vars.operators[i].addr),
                    operatorVaultStake
                );
                assertEq(
                    vaultManager.getOperatorStakeAt(
                        initSetupParams.masterChain.vaults[j],
                        vars.operators[i].addr,
                        uint48(vm.getBlockTimestamp()),
                        ""
                    ),
                    operatorVaultStake
                );

                assertEq(
                    vaultManager.getOperatorVotingPower(
                        vars.operators[i].addr, initSetupParams.masterChain.vaults[j], ""
                    ),
                    operatorVaultStake
                );

                assertEq(
                    vaultManager.getOperatorVotingPowerAt(
                        vars.operators[i].addr,
                        initSetupParams.masterChain.vaults[j],
                        "",
                        uint48(vm.getBlockTimestamp()),
                        ""
                    ),
                    operatorVaultStake
                );
                assertEq(vaultVotingPowers1[j].vault, initSetupParams.masterChain.vaults[j]);
                assertEq(vaultVotingPowers1[j].votingPower, operatorVaultStake);
                assertEq(vaultVotingPowers2[j].vault, initSetupParams.masterChain.vaults[j]);
                assertEq(vaultVotingPowers2[j].votingPower, operatorVaultStake);
                assertEq(operatorVotingPowers1[i].operator, vars.operators[i].addr);
                assertEq(operatorVotingPowers1[i].vaults[j].vault, initSetupParams.masterChain.vaults[j]);
                assertEq(operatorVotingPowers1[i].vaults[j].votingPower, operatorVaultStake);
                assertEq(operatorVotingPowers2[i].operator, vars.operators[i].addr);
                assertEq(operatorVotingPowers2[i].vaults[j].vault, initSetupParams.masterChain.vaults[j]);
                assertEq(operatorVotingPowers2[i].vaults[j].votingPower, operatorVaultStake);
                operatorStake += operatorVaultStake;
            }

            totalStake += operatorStake;
        }
    }
}

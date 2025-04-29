// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import {Master} from "../../src/contracts/implementations/settlement/Master.sol";
import {Replica} from "../../src/contracts/implementations/settlement/Replica.sol";
import {KeyRegistry} from "../../src/contracts/implementations/key-registries/KeyRegistry.sol";
import {SelfRegisterVotingPowerProvider} from
    "../../src/contracts/implementations/voting-power-providers/SelfRegisterVotingPowerProvider.sol";

import {ISettlementManager} from "../../src/interfaces/implementations/settlement/ISettlementManager.sol";
import {IValSetConfigManager} from "../../src/interfaces/implementations/settlement/IValSetConfigManager.sol";
import {IMasterConfigManager} from "../../src/interfaces/implementations/settlement/IMasterConfigManager.sol";
import {IOzOwnable} from "../../src/interfaces/features/permissions/IOzOwnable.sol";
import {INetworkManager} from "../../src/interfaces/base/INetworkManager.sol";
import {IEpochManager} from "../../src/interfaces/base/IEpochManager.sol";
import {IOzEIP712} from "../../src/interfaces/base/common/IOzEIP712.sol";
import {IKeyManager} from "../../src/interfaces/base/IKeyManager.sol";

import {KeyTag} from "../../src/contracts/libraries/utils/KeyTag.sol";

import {SigVerifierMock} from "../../test/mocks/SigVerifierMock.sol";

import "@symbioticfi/core/script/integration/SymbioticCoreInit.sol";

contract InstanceScript is SymbioticCoreInit {
    using KeyTag for uint8;

    uint256 public SYMBIOTIC_CORE_NUMBER_OF_VAULTS = 3;
    uint256 public SYMBIOTIC_CORE_NUMBER_OF_OPERATORS = 3;
    uint256 public SYMBIOTIC_CORE_NUMBER_OF_STAKERS = 1;

    function run(uint256 seed, address owner) public {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";

        SYMBIOTIC_CORE_MIN_EPOCH_DURATION = 5 hours;
        SYMBIOTIC_CORE_MAX_EPOCH_DURATION = 21 days;
        SYMBIOTIC_CORE_MIN_VETO_DURATION = 5 minutes;
        SYMBIOTIC_CORE_MAX_VETO_DURATION = 60 minutes;

        SYMBIOTIC_CORE_TOKENS_TO_SET_TIMES_1e18 = 0.03 * 1e18;
        SYMBIOTIC_CORE_MIN_TOKENS_TO_DEPOSIT_TIMES_1e18 = 0.00001 * 1e18;
        SYMBIOTIC_CORE_MAX_TOKENS_TO_DEPOSIT_TIMES_1e18 = 0.001 * 1e18;

        SYMBIOTIC_CORE_MIN_MAX_NETWORK_LIMIT_TIMES_1e18 = 0.0001 * 1e18;
        SYMBIOTIC_CORE_MAX_MAX_NETWORK_LIMIT_TIMES_1e18 = 0.001 * 1e18;
        SYMBIOTIC_CORE_MIN_NETWORK_LIMIT_TIMES_1e18 = 0.00001 * 1e18;
        SYMBIOTIC_CORE_MAX_NETWORK_LIMIT_TIMES_1e18 = 0.001 * 1e18;
        SYMBIOTIC_CORE_MIN_OPERATOR_NETWORK_LIMIT_TIMES_1e18 = 0.00001 * 1e18;
        SYMBIOTIC_CORE_MAX_OPERATOR_NETWORK_LIMIT_TIMES_1e18 = 0.001 * 1e18;

        SYMBIOTIC_CORE_USE_EXISTING_DEPLOYMENT = true;

        SYMBIOTIC_CORE_DELEGATOR_TYPES = [0, 2];

        Vm.Wallet memory PRIVATE_KEY_WALLET = vm.createWallet(vm.envUint("PRIVATE_KEY"));

        uint48 ZERO_TIMESTAMP = vm.getBlockTimestamp() + 60 * 60;
        uint96 IDENTIFIER = 0;
        address[] memory tokens = new address[](1);
        tokens[0] = SymbioticCoreConstants.wstETH();

        SymbioticCoreInit.run(seed);

        vm.startBroadcast();
        (,, address deployer) = vm.readCallers();

        address network;
        {
            Vm.Wallet memory wallet = _getAccount_Symbiotic();
            network = wallet.addr;
            vm.rememberKey(wallet.privateKey);
        }

        Vm.Wallet[] memory stakers = new Vm.Wallet[](SYMBIOTIC_CORE_NUMBER_OF_STAKERS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            stakers[i] = _getStaker_SymbioticCore(tokens);
            vm.rememberKey(stakers[i].privateKey);
            console2.log("Staker -", stakers[i].addr, stakers[i].privateKey);
        }

        Vm.Wallet[] memory operators = new Vm.Wallet[](SYMBIOTIC_CORE_NUMBER_OF_OPERATORS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            operators[i] = _getAccount_Symbiotic();
            vm.rememberKey(operators[i].privateKey);
            console2.log("Operator -", operators[i].addr, operators[i].privateKey);
        }

        vm.createSelectFork(vm.rpcUrl("holesky"));

        {
            _deal_Symbiotic(network, 0.001 ether);

            if (!symbioticCore.networkRegistry.isEntity(network)) {
                _networkRegister_SymbioticCore(network);
                _networkSetMiddleware_SymbioticCore(network, PRIVATE_KEY_WALLET.addr);
            }
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            _deal_Symbiotic(stakers[i].addr, 0.001 ether);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            _deal_Symbiotic(operators[i].addr, 0.001 ether);
            _operatorRegister_SymbioticCore(operators[i].addr);
        }

        address[] memory holeskyVaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++i) {
            holeskyVaults[i] =
                _getVaultRandom_SymbioticCore(_vmWalletsToAddresses_Symbiotic(operators), _randomPick_Symbiotic(tokens));
            console2.log("Vault -", holeskyVaults[i]);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            for (uint256 j; j < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++j) {
                _stakerDepositRandom_SymbioticCore(stakers[i].addr, holeskyVaults[j]);
            }
        }

        SigVerifierMock sigVerifier = new SigVerifierMock();
        Master master = new Master();
        ISettlementManager.QuorumThreshold[] memory quorumThresholds = new ISettlementManager.QuorumThreshold[](1);
        quorumThresholds[0] = ISettlementManager.QuorumThreshold({
            keyTag: uint8(IKeyManager.KeyType.BLS_BN254).keyTag(15),
            threshold: 0.66 * 1e18
        });
        uint8[] memory requiredKeyTags = new uint8[](1);
        requiredKeyTags[0] = uint8(IKeyManager.KeyType.BLS_BN254).keyTag(15);
        requiredKeyTags[1] = uint8(IKeyManager.KeyType.ECDSA_SECP256K1).keyTag(0);
        IMasterConfigManager.CrossChainAddress[] memory votingPowerProviders = new IMasterConfigManager.CrossChainAddress[](1);
        votingPowerProviders[0] = IMasterConfigManager.CrossChainAddress({addr: network, chainId: 1});
        IMasterConfigManager.CrossChainAddress memory keysProvider = IMasterConfigManager.CrossChainAddress({addr: network, chainId: 1});
        IMasterConfigManager.CrossChainAddress[] memory replicas = new IMasterConfigManager.CrossChainAddress[](1);
        replicas[0] = IMasterConfigManager.CrossChainAddress({addr: network, chainId: 1});
        master.initialize(
            ISettlementManager.SettlementManagerInitParams({
                networkManagerInitParams: INetworkManager.NetworkManagerInitParams({network: network, subnetworkID: 0}),
                epochManagerInitParams: IEpochManager.EpochManagerInitParams({
                    epochDuration: 3 * 60 * 60,
                    epochDurationTimestamp: ZERO_TIMESTAMP
                }),
                ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "Master", version: "1"}),
                quorumThresholds: quorumThresholds,
                commitDuration: 45 * 60,
                requiredKeyTag: uint8(IKeyManager.KeyType.BLS_BN254).keyTag(15),
                sigVerifier: address(sigVerifier)
            }),
            IValSetConfigManager.ValSetConfigManagerInitParams({
                maxVotingPower: 1e16,
                minInclusionVotingPower: 1e4,
                maxValidatorsCount: 5,
                requiredKeyTags: requiredKeyTags
            }),
            IMasterConfigManager.MasterConfigManagerInitParams({
                votingPowerProviders: votingPowerProviders,
                keysProvider: keysProvider,
                replicas: replicas
            }),
            IOzOwnable.OzOwnableInitParams({owner: deployer})
        );

        vm.createSelectFork(vm.rpcUrl("sepolia"));

        {
            _deal_Symbiotic(network, 0.001 ether);

            if (!symbioticCore.networkRegistry.isEntity(network)) {
                _networkRegister_SymbioticCore(network);
                _networkSetMiddleware_SymbioticCore(network, PRIVATE_KEY_WALLET.addr);
            }
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            _deal_Symbiotic(stakers[i].addr, 0.001 ether);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_OPERATORS; ++i) {
            _deal_Symbiotic(operators[i].addr, 0.001 ether);
            _operatorRegister_SymbioticCore(operators[i].addr);
        }

        address[] memory sepoliaVaults = new address[](SYMBIOTIC_CORE_NUMBER_OF_VAULTS);
        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++i) {
            sepoliaVaults[i] =
                _getVaultRandom_SymbioticCore(_vmWalletsToAddresses_Symbiotic(operators), _randomPick_Symbiotic(tokens));
            console2.log("Vault -", sepoliaVaults[i]);
        }

        for (uint256 i; i < SYMBIOTIC_CORE_NUMBER_OF_STAKERS; ++i) {
            for (uint256 j; j < SYMBIOTIC_CORE_NUMBER_OF_VAULTS; ++j) {
                _stakerDepositRandom_SymbioticCore(stakers[i].addr, sepoliaVaults[j]);
            }
        }

        console2.log("VaultFactory: ");

        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import {ISettlementManager} from "../src/interfaces/implementations/settlement/ISettlementManager.sol";
import {IValSetConfigManager} from "../src/interfaces/implementations/settlement/IValSetConfigManager.sol";
import {IMasterConfigManager} from "../src/interfaces/implementations/settlement/IMasterConfigManager.sol";
import {IEpochManager} from "../src/interfaces/base/IEpochManager.sol";

import {KeyTag} from "../src/contracts/libraries/utils/KeyTag.sol";
import {KeyEcdsaSecp256k1} from "../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {KeyManagerLogic} from "../src/contracts/base/logic/KeyManagerLogic.sol";

import {BN254G2} from "./libraries/BN254G2.sol";

import {ISettlementManager} from "../src/interfaces/implementations/settlement/ISettlementManager.sol";
import {IOzOwnable} from "../src/interfaces/features/permissions/IOzOwnable.sol";
import {INetworkManager} from "../src/interfaces/base/INetworkManager.sol";
import {IEpochManager} from "../src/interfaces/base/IEpochManager.sol";
import {IOzEIP712} from "../src/interfaces/base/common/IOzEIP712.sol";
import {IVaultManager} from "../src/interfaces/base/IVaultManager.sol";

import "./InitSetup.sol";

contract MasterSetup is InitSetup {
    using KeyTag for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    bytes32 internal constant KEY_OWNERSHIP_TYPEHASH = keccak256("KeyOwnership(address operator,bytes key)");

    struct MasterSetupParams {
        KeyRegistry keyRegistry;
        Master master;
        SelfRegisterVotingPowerProvider votingPowerProvider;
    }

    MasterSetupParams public masterSetupParams;

    function setUp() public virtual override {
        InitSetup.setUp();
        symbioticCore = initSetupParams.masterChain.core;
        loadMasterSetupParams();
    }

    // function getG2Key(
    //     uint256 privateKey
    // ) public view returns (BN254.G2Point memory) {
    //     BN254.G2Point memory G2 = BN254.generatorG2();
    //     (uint256 x1, uint256 x2, uint256 y1, uint256 y2) =
    //         BN254G2.ECTwistMul(privateKey, G2.X[1], G2.X[0], G2.Y[1], G2.Y[0]);
    //     return BN254.G2Point([x2, x1], [y2, y1]);
    // }

    // function loadMasterSetupParams(InitSetupParams memory initSetupParams, Vars memory vars) public returns (MasterSetupParams memory masterSetupParams) {
    //     vm.startPrank(vars.deployer.addr);
    //     masterSetupParams.votingPowerProvider = new SelfRegisterVotingPowerProvider(
    //         address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
    //     );
    //     masterSetupParams.votingPowerProvider.initialize(
    //         INetworkManager.NetworkManagerInitParams({
    //             network: vars.network.addr,
    //             subnetworkID: initSetupParams.subnetworkID
    //         }),
    //         IVaultManager.VaultManagerInitParams({slashingWindow: initSetupParams.slashingWindow}),
    //         IOzEIP712.OzEIP712InitParams({name: "SelfRegisterVotingPowerProvider", version: "1"}),
    //         IOzOwnable.OzOwnableInitParams({owner: vars.network.addr})
    //     );
    //     vm.stopPrank();

    //     _networkSetMiddleware_SymbioticCore(vars.network.addr, address(masterSetupParams.votingPowerProvider));

    //     for (uint256 i; i < initSetupParams.masterChain.tokens.length; ++i) {
    //         vm.startPrank(vars.deployer.addr);
    //         masterSetupParams.votingPowerProvider.registerToken(initSetupParams.masterChain.tokens[i]);
    //         vm.stopPrank();
    //     }
    //     for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
    //         _setMaxNetworkLimit_SymbioticCore(
    //             vars.network.addr,
    //             initSetupParams.masterChain.vaults[i],
    //             initSetupParams.subnetworkID,
    //             type(uint256).max
    //         );
    //         _setNetworkLimit_SymbioticCore(
    //             vars.deployer.addr,
    //             initSetupParams.masterChain.vaults[i],
    //             masterSetupParams.votingPowerProvider.SUBNETWORK(),
    //             type(uint256).max
    //         );
    //         for (uint256 j; j < vars.operators.length; ++j) {
    //             _setOperatorNetworkShares_SymbioticCore(
    //                 vars.deployer.addr,
    //                 initSetupParams.masterChain.vaults[i],
    //                 masterSetupParams.votingPowerProvider.SUBNETWORK(),
    //                 vars.operators[j].addr,
    //                 1e18
    //             );
    //         }
    //         vm.startPrank(vars.network.addr);
    //         masterSetupParams.votingPowerProvider.registerSharedVault(initSetupParams.masterChain.vaults[i]);
    //         vm.stopPrank();
    //     }

    //     vm.startPrank(vars.deployer.addr);
    //     masterSetupParams.keyRegistry = new KeyRegistry();
    //     masterSetupParams.keyRegistry.initialize(IOzEIP712.OzEIP712InitParams({name: "KeyRegistry", version: "1"}));
    //     vm.stopPrank();

    //     for (uint256 i; i < vars.operators.length; ++i) {
    //         _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, vars.network.addr);

    //         for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
    //             _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, initSetupParams.masterChain.vaults[j]);
    //         }

    //         vm.startPrank(vars.operators[i].addr);
    //         masterSetupParams.votingPowerProvider.registerOperator(address(0));
    //         vm.stopPrank();

    //         {
    //             vm.startPrank(vars.operators[i].addr);
    //             bytes memory key1Bytes = KeyEcdsaSecp256k1.wrap(vars.operators[i].addr).toBytes();
    //             bytes32 messageHash1 = masterSetupParams.keyRegistry.hashTypedDataV4(
    //                 keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, vars.operators[i].addr, keccak256(key1Bytes)))
    //             );
    //             (uint8 v, bytes32 r, bytes32 s) = vm.sign(vars.operators[i].privateKey, messageHash1);
    //             bytes memory signature1 = abi.encodePacked(r, s, v);
    //             masterSetupParams.keyRegistry.setKey(
    //                 KeyManagerLogic.KEY_TYPE_ECDSA_SECP256K1.keyTag(0), key1Bytes, signature1, new bytes(0)
    //             );
    //             vm.stopPrank();
    //         }

    //         {
    //             vm.startPrank(vars.operators[i].addr);
    //             BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(vars.operators[i].privateKey);
    //             BN254.G2Point memory keyG2 = getG2Key(vars.operators[i].privateKey);
    //             bytes memory key0Bytes = KeyBlsBn254.wrap(keyG1).toBytes();
    //             bytes32 messageHash0 = masterSetupParams.keyRegistry.hashTypedDataV4(
    //                 keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, vars.operators[i].addr, keccak256(key0Bytes)))
    //             );
    //             BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash0);
    //             BN254.G1Point memory sigG1 = messageG1.scalar_mul(vars.operators[i].privateKey);
    //             masterSetupParams.keyRegistry.setKey(
    //                 KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15), key0Bytes, abi.encode(sigG1), abi.encode(keyG2)
    //             );
    //             vm.stopPrank();
    //         }
    //     }

    //     vm.startPrank(vars.deployer.addr);
    //     masterSetupParams.master = new Master();
    //     {
    //         ISettlementManager.QuorumThreshold[] memory quorumThresholds = new ISettlementManager.QuorumThreshold[](1);
    //         quorumThresholds[0] = ISettlementManager.QuorumThreshold({
    //             keyTag: KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
    //             threshold: uint208(Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil))
    //         });
    //         uint8[] memory requiredKeyTags = new uint8[](2);
    //         requiredKeyTags[0] = KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15);
    //         requiredKeyTags[1] = KeyManagerLogic.KEY_TYPE_ECDSA_SECP256K1.keyTag(0);
    //         IMasterConfigManager.CrossChainAddress[] memory votingPowerProviders =
    //             new IMasterConfigManager.CrossChainAddress[](1);
    //         // IMasterConfigManager.CrossChainAddress[] memory votingPowerProviders =
    //         //     new IMasterConfigManager.CrossChainAddress[](2);
    //         votingPowerProviders[0] = IMasterConfigManager.CrossChainAddress({
    //             addr: address(masterSetupParams.votingPowerProvider),
    //             chainId: uint64(initSetupParams.masterChain.chainId)
    //         });
    //         // votingPowerProviders[1] = IMasterConfigManager.CrossChainAddress({
    //         //     addr: address(secondarySetupParams.votingPowerProvider),
    //         //     chainId: uint64(initSetupParams.secondaryChain.chainId)
    //         // });
    //         IMasterConfigManager.CrossChainAddress memory keysProvider = IMasterConfigManager.CrossChainAddress({
    //             addr: address(masterSetupParams.keyRegistry),
    //             chainId: uint64(initSetupParams.masterChain.chainId)
    //         });
    //         IMasterConfigManager.CrossChainAddress[] memory replicas = new IMasterConfigManager.CrossChainAddress[](0);
    //         // IMasterConfigManager.CrossChainAddress[] memory replicas = new IMasterConfigManager.CrossChainAddress[](1);
    //         // replicas[0] = IMasterConfigManager.CrossChainAddress({
    //         //     addr: address(secondarySetupParams.replica),
    //         //     chainId: uint64(initSetupParams.secondaryChain.chainId)
    //         // });
    //         masterSetupParams.master.initialize(
    //             ISettlementManager.SettlementManagerInitParams({
    //                 networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
    //                     network: vars.network.addr,
    //                     subnetworkID: initSetupParams.subnetworkID
    //                 }),
    //                 epochManagerInitParams: IEpochManager.EpochManagerInitParams({
    //                     epochDuration: initSetupParams.epochDuration,
    //                     epochDurationTimestamp: initSetupParams.zeroTimestamp
    //                 }),
    //                 ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "Middleware", version: "1"}),
    //                 quorumThresholds: quorumThresholds,
    //                 commitDuration: initSetupParams.commitDuration,
    //                 requiredKeyTag: KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
    //                 sigVerifier: address(new SigVerifierMock())
    //             }),
    //             IValSetConfigManager.ValSetConfigManagerInitParams({
    //                 maxVotingPower: 1e16,
    //                 minInclusionVotingPower: 1e4,
    //                 maxValidatorsCount: 5,
    //                 requiredKeyTags: requiredKeyTags
    //             }),
    //             IMasterConfigManager.MasterConfigManagerInitParams({
    //                 votingPowerProviders: votingPowerProviders,
    //                 keysProvider: keysProvider,
    //                 replicas: replicas
    //             }),
    //             vars.deployer.addr
    //         );
    //     }
    //     vm.stopPrank();
    // }

    function loadMasterSetupParams() public {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/script/test/data/master_setup_params.json");
        string memory json = vm.readFile(path);
        bytes memory data = vm.parseJson(json);
        masterSetupParams = abi.decode(data, (MasterSetupParams));
    }
}

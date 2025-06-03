// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";

import {ISettlement} from "../../src/interfaces/modules/settlement/ISettlement.sol";
import {IConfigProvider} from "../../src/interfaces/modules/settlement/IConfigProvider.sol";
import {IEpochManager} from "../../src/interfaces/base/IEpochManager.sol";

import {KeyTags} from "../../src/contracts/libraries/utils/KeyTags.sol";
import {KeyEcdsaSecp256k1} from "../../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {KeyManagerLogic} from "../../src/contracts/base/logic/KeyManagerLogic.sol";

import {BN254G2} from "../../test/helpers/BN254G2.sol";

import "./SecondarySetup.s.sol";

import {SigVerifierBlsBn254ZK} from "../../src/contracts/modules/settlement/sig-verifiers/SigVerifierBlsBn254ZK.sol";
import {Verifier as Verifier_10} from "../../src/contracts/modules/settlement/sig-verifiers/zk/Verifier_10.sol";
import {Verifier as Verifier_100} from "../../src/contracts/modules/settlement/sig-verifiers/zk/Verifier_100.sol";
import {Verifier as Verifier_1000} from "../../src/contracts/modules/settlement/sig-verifiers/zk/Verifier_1000.sol";

import {VotingPowerProviderSharedVaults} from "../../test/mocks/VotingPowerProviderSharedVaults.sol";

// forge script script/test/MasterSetup.s.sol:MasterSetupScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_MASTER

contract MasterSetupScript is SecondarySetupScript {
    using KeyTags for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    struct MasterSetupParams {
        KeyRegistry keyRegistry;
        MasterSettlement master;
        VotingPowerProviderSharedVaults votingPowerProvider;
    }

    function run(
        uint256 seed
    ) public virtual override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        SymbioticInit.run(seed);

        string memory obj = "data";
        string memory finalJson;
        (InitSetupParams memory initSetupParams, Vars memory vars) = loadInitSetupParamsAndVars();
        symbioticCore = initSetupParams.masterChain.core;
        // SecondarySetupParams memory secondarySetupParams = loadSecondarySetupParams();
        MasterSetupParams memory masterSetupParams;

        vm.startBroadcast(vars.deployer.privateKey);
        console2.log("MyVotingPowerProvider nonce", vm.getNonce(vars.deployer.addr));
        masterSetupParams.votingPowerProvider = new VotingPowerProviderSharedVaults(
            address(symbioticCore.operatorRegistry), address(symbioticCore.vaultFactory)
        );
        masterSetupParams.votingPowerProvider.initialize(
            IVotingPowerProvider.VotingPowerProviderInitParams({
                networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                    network: vars.network.addr,
                    subnetworkID: initSetupParams.subnetworkID
                }),
                vaultManagerInitParams: IVaultManager.VaultManagerInitParams({
                    slashingWindow: initSetupParams.slashingWindow,
                    token: initSetupParams.masterChain.tokens[0]
                }),
                ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "MyVotingPowerProvider", version: "1"})
            }),
            IOzOwnable.OzOwnableInitParams({owner: vars.network.addr})
        );
        vm.stopBroadcast();
        vm.serializeAddress(obj, "votingPowerProvider", address(masterSetupParams.votingPowerProvider));

        _networkSetMiddleware_SymbioticCore(vars.network.addr, address(masterSetupParams.votingPowerProvider));

        // for (uint256 i; i < initSetupParams.masterChain.tokens.length; ++i) {
        //     vm.startBroadcast(vars.deployer.privateKey);
        //     masterSetupParams.votingPowerProvider.registerToken(initSetupParams.masterChain.tokens[i]);
        //     vm.stopBroadcast();
        // }
        for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
            _setMaxNetworkLimit_SymbioticCore(
                vars.network.addr,
                initSetupParams.masterChain.vaults[i],
                initSetupParams.subnetworkID,
                type(uint256).max
            );
            _setNetworkLimit_SymbioticCore(
                vars.deployer.addr,
                initSetupParams.masterChain.vaults[i],
                masterSetupParams.votingPowerProvider.SUBNETWORK(),
                type(uint256).max
            );
            for (uint256 j; j < vars.operators.length; ++j) {
                _setOperatorNetworkShares_SymbioticCore(
                    vars.deployer.addr,
                    initSetupParams.masterChain.vaults[i],
                    masterSetupParams.votingPowerProvider.SUBNETWORK(),
                    vars.operators[j].addr,
                    1e18
                );
            }
            vm.startBroadcast(vars.network.privateKey);
            masterSetupParams.votingPowerProvider.registerSharedVault(initSetupParams.masterChain.vaults[i]);
            vm.stopBroadcast();
        }

        vm.startBroadcast(vars.deployer.privateKey);
        console2.log("KeyRegistry nonce", vm.getNonce(vars.deployer.addr));
        masterSetupParams.keyRegistry = new KeyRegistry();
        masterSetupParams.keyRegistry.initialize(IOzEIP712.OzEIP712InitParams({name: "KeyRegistry", version: "1"}));
        vm.stopBroadcast();
        vm.serializeAddress(obj, "keyRegistry", address(masterSetupParams.keyRegistry));

        for (uint256 i; i < vars.operators.length; ++i) {
            _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, vars.network.addr);

            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, initSetupParams.masterChain.vaults[j]);
            }

            vm.startBroadcast(vars.operators[i].privateKey);
            masterSetupParams.votingPowerProvider.registerOperator(address(0));
            vm.stopBroadcast();

            {
                vm.startBroadcast(vars.operators[i].privateKey);
                bytes memory key1Bytes = KeyEcdsaSecp256k1.wrap(vars.operators[i].addr).toBytes();
                bytes32 messageHash1 = masterSetupParams.keyRegistry.hashTypedDataV4(
                    keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, vars.operators[i].addr, keccak256(key1Bytes)))
                );
                (uint8 v, bytes32 r, bytes32 s) = vm.sign(vars.operators[i].privateKey, messageHash1);
                bytes memory signature1 = abi.encodePacked(r, s, v);
                masterSetupParams.keyRegistry.setKey(
                    KeyManagerLogic.KEY_TYPE_ECDSA_SECP256K1.getKeyTag(0), key1Bytes, signature1, new bytes(0)
                );
                vm.stopBroadcast();
            }

            {
                vm.startBroadcast(vars.operators[i].privateKey);
                BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(vars.operators[i].privateKey);
                BN254.G2Point memory keyG2 = getG2Key(vars.operators[i].privateKey);
                bytes memory key0Bytes = KeyBlsBn254.wrap(keyG1).toBytes();
                bytes32 messageHash0 = masterSetupParams.keyRegistry.hashTypedDataV4(
                    keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, vars.operators[i].addr, keccak256(key0Bytes)))
                );
                BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash0);
                BN254.G1Point memory sigG1 = messageG1.scalar_mul(vars.operators[i].privateKey);
                masterSetupParams.keyRegistry.setKey(
                    KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15), key0Bytes, abi.encode(sigG1), abi.encode(keyG2)
                );
                vm.stopBroadcast();
            }
        }

        vm.startBroadcast(vars.deployer.privateKey);
        console2.log("MasterSettlement nonce", vm.getNonce(vars.deployer.addr));
        masterSetupParams.master = new MasterSettlement{salt: bytes32("master")}();
        {
            uint8[] memory requiredKeyTags = new uint8[](2);
            requiredKeyTags[0] = KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15);
            requiredKeyTags[1] = KeyManagerLogic.KEY_TYPE_ECDSA_SECP256K1.getKeyTag(0);
            IConfigProvider.CrossChainAddress[] memory votingPowerProviders = new IConfigProvider.CrossChainAddress[](1);
            // IConfigProvider.CrossChainAddress[] memory votingPowerProviders =
            //     new IConfigProvider.CrossChainAddress[](2);
            votingPowerProviders[0] = IConfigProvider.CrossChainAddress({
                addr: address(masterSetupParams.votingPowerProvider),
                chainId: uint64(initSetupParams.masterChain.chainId)
            });
            // votingPowerProviders[1] = IConfigProvider.CrossChainAddress({
            //     addr: address(secondarySetupParams.votingPowerProvider),
            //     chainId: uint64(initSetupParams.secondaryChain.chainId)
            // });
            IConfigProvider.CrossChainAddress memory keysProvider = IConfigProvider.CrossChainAddress({
                addr: address(masterSetupParams.keyRegistry),
                chainId: uint64(initSetupParams.masterChain.chainId)
            });
            IConfigProvider.CrossChainAddress[] memory replicas = new IConfigProvider.CrossChainAddress[](0);
            // IConfigProvider.CrossChainAddress[] memory replicas = new IConfigProvider.CrossChainAddress[](1);
            // replicas[0] = IConfigProvider.CrossChainAddress({
            //     addr: address(secondarySetupParams.replica),
            //     chainId: uint64(initSetupParams.secondaryChain.chainId)
            // });
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            masterSetupParams.master.initialize(
                ISettlement.SettlementInitParams({
                    networkManagerInitParams: INetworkManager.NetworkManagerInitParams({
                        network: vars.network.addr,
                        subnetworkID: initSetupParams.subnetworkID
                    }),
                    epochManagerInitParams: IEpochManager.EpochManagerInitParams({
                        epochDuration: initSetupParams.epochDuration,
                        epochDurationTimestamp: initSetupParams.zeroTimestamp
                    }),
                    ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "Middleware", version: "1"}),
                    commitDuration: initSetupParams.commitDuration,
                    prolongDuration: initSetupParams.prolongDuration,
                    requiredKeyTag: KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15),
                    sigVerifier: address(new SigVerifierBlsBn254ZK(verifiers, maxValidators))
                }),
                IConfigProvider.ConfigProviderInitParams({
                    votingPowerProviders: votingPowerProviders,
                    keysProvider: keysProvider,
                    replicas: replicas,
                    verificationType: 0,
                    maxVotingPower: 1e36,
                    minInclusionVotingPower: 0,
                    maxValidatorsCount: 99_999_999,
                    requiredKeyTags: requiredKeyTags
                }),
                vars.deployer.addr
            );
        }
        vm.stopBroadcast();
        finalJson = vm.serializeAddress(obj, "master", address(masterSetupParams.master));

        console2.log("MasterSettlement - VotingPowerProvider: ", address(masterSetupParams.votingPowerProvider));
        console2.log("MasterSettlement - KeyRegistry: ", address(masterSetupParams.keyRegistry));
        console2.log("MasterSettlement - MasterSettlement: ", address(masterSetupParams.master));

        vm.writeJson(finalJson, "script/test/data/master_setup_params.json");
    }

    function getG2Key(
        uint256 privateKey
    ) public view returns (BN254.G2Point memory) {
        BN254.G2Point memory G2 = BN254.generatorG2();
        (uint256 x1, uint256 x2, uint256 y1, uint256 y2) =
            BN254G2.ECTwistMul(privateKey, G2.X[1], G2.X[0], G2.Y[1], G2.Y[0]);
        return BN254.G2Point([x2, x1], [y2, y1]);
    }

    function loadMasterSetupParams() public returns (MasterSetupParams memory masterSetupParams) {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/script/test/data/master_setup_params.json");
        string memory json = vm.readFile(path);
        bytes memory data = vm.parseJson(json);
        masterSetupParams = abi.decode(data, (MasterSetupParams));
    }
}

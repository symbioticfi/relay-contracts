// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IConfigProvider} from "../../../../src/interfaces/modules/settlement/IConfigProvider.sol";

import {KeyTags} from "../../../../src/contracts/libraries/utils/KeyTags.sol";
import {KeyEcdsaSecp256k1} from "../../../../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../../../../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {SigBlsBn254} from "../../../../src/contracts/libraries/sigs/SigBlsBn254.sol";
import {KeyManagerLogic} from "../../../../src/contracts/base/logic/KeyManagerLogic.sol";
import {ExtraDataStorageHelper} from
    "../../../../src/contracts/modules/settlement/sig-verifiers/libraries/ExtraDataStorageHelper.sol";

import {BN254G2} from "../../../helpers/BN254G2.sol";

import {ISettlement} from "../../../../src/interfaces/modules/settlement/ISettlement.sol";
import {IBaseKeyManager} from "../../../../src/interfaces/base/IBaseKeyManager.sol";
import {IOzOwnable} from "../../../../src/interfaces/modules/common/permissions/IOzOwnable.sol";
import {INetworkManager} from "../../../../src/interfaces/base/INetworkManager.sol";
import {IEpochManager} from "../../../../src/interfaces/base/IEpochManager.sol";
import {IOperatorsWhitelist} from "../../../../src/interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol";
import {IOzEIP712} from "../../../../src/interfaces/base/common/IOzEIP712.sol";
import {IVaultManager} from "../../../../src/interfaces/base/IVaultManager.sol";
import {ISigVerifierBlsBn254Simple} from
    "../../../../src/interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254Simple.sol";
import {IVotingPowerProvider} from "../../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";

import {MasterGenesisSetup} from "../../../MasterGenesisSetup.sol";

import {console2} from "forge-std/console2.sol";

import {Verifier as Verifier_10} from "../../../../script/test/data/zk/Verifier_10.sol";
import {Verifier as Verifier_100} from "../../../../script/test/data/zk/Verifier_100.sol";
import {Verifier as Verifier_1000} from "../../../../script/test/data/zk/Verifier_1000.sol";
import {SigVerifierBlsBn254Simple} from
    "../../../../src/contracts/modules/settlement/sig-verifiers/SigVerifierBlsBn254Simple.sol";
import "../../../InitSetup.sol";

import {ISigVerifier} from "../../../../src/interfaces/base/ISigVerifier.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {VotingPowerProviderSemiFull} from "../../../mocks/VotingPowerProviderSemiFull.sol";
import {MyKeyRegistry} from "../../../../examples/MyKeyRegistry.sol";
import {MyMasterSettlement} from "../../../../examples/MyMasterSettlement.sol";
import {IMasterSettlement} from "../../../../src/interfaces/modules/settlement/IMasterSettlement.sol";
import {IKeyRegistry} from "../../../../src/interfaces/modules/key-registry/IKeyRegistry.sol";

contract SigVerifierBlsBn254SimpleTest is MasterGenesisSetup {
    using KeyTags for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using Math for uint256;
    using ExtraDataStorageHelper for uint32;

    struct ZkProof {
        uint256[] input;
        bytes proof;
    }

    struct SimpleGenesis {
        ISettlement.ValSetHeader header;
        ISettlement.ExtraData[] extraData;
    }

    function setUp() public override {
        InitSetup.setUp();

        vm.warp(initSetupParams.zeroTimestamp);

        loadMasterSetupParamsSimple();

        (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData) = loadGenesisSimple();

        vm.startPrank(vars.deployer.addr);
        masterSetupParams.master.setGenesis(valSetHeader, extraData);
        vm.stopPrank();
    }

    function test_verifyQuorumSig() public {
        bytes32 messageHash = 0x204e0c470c62e2f8426b236c004b581084dd3aaa935ed3afe24dc37e0d040823;

        BN254.G2Point memory aggKeyG2;
        BN254.G1Point memory aggSigG1;

        for (uint256 i; i < vars.operators.length; ++i) {
            BN254.G2Point memory keyG2 = getG2Key(vars.operators[i].privateKey);
            BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash);
            BN254.G1Point memory sigG1 = messageG1.scalar_mul(vars.operators[i].privateKey);

            if (i % 4 != 0) {
                aggSigG1 = aggSigG1.plus(sigG1);

                if (aggKeyG2.X[0] == 0 && aggKeyG2.X[1] == 0 && aggKeyG2.Y[0] == 0 && aggKeyG2.Y[1] == 0) {
                    aggKeyG2 = keyG2;
                } else {
                    (uint256 x1, uint256 x2, uint256 y1, uint256 y2) = BN254G2.ECTwistAdd(
                        aggKeyG2.X[1],
                        aggKeyG2.X[0],
                        aggKeyG2.Y[1],
                        aggKeyG2.Y[0],
                        keyG2.X[1],
                        keyG2.X[0],
                        keyG2.Y[1],
                        keyG2.Y[0]
                    );
                    aggKeyG2 = BN254.G2Point([x2, x1], [y2, y1]);
                }
            }
        }

        ISigVerifierBlsBn254Simple.ValidatorData[] memory validatorsData = getValidatorsData();
        bool[] memory isNonSigners = new bool[](validatorsData.length);
        for (uint256 i; i < validatorsData.length; ++i) {
            if (i % 4 != 0) {
                isNonSigners[i] = false;
            } else {
                isNonSigners[i] = true;
            }
        }
        bytes memory fullProof = abi.encodePacked(
            abi.encode(aggSigG1), abi.encode(aggKeyG2), abi.encode(validatorsData), abi.encode(isNonSigners)
        );

        IVaultManager.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower = 0;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].votingPower;
            }
        }

        bytes memory data = abi.encodeWithSelector(
            ISettlement.verifyQuorumSig.selector,
            masterSetupParams.master.getCurrentValSetEpoch(),
            abi.encode(messageHash),
            KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15),
            Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
            fullProof,
            new bytes(0)
        );
        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory result) = address(masterSetupParams.master).call(data);
        assertTrue(success);
        assertTrue(abi.decode(result, (bool)));
        // assertTrue(
        //     masterSetupParams.master.verifyQuorumSig(
        //         masterSetupParams.master.getCurrentValSetEpoch(),
        //         abi.encode(messageHash),
        //         KeyManagerLogic.KEY_TYPE_BLS_BN254.getKeyTag(15),
        //         Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(
        //             masterSetupParams.votingPowerProvider.getTotalVotingPower(new bytes[](0)), 1e18
        //         ) + 1,
        //         fullProof,
        //         new bytes(0)
        //     )
        // );
        vm.stopPrank();
    }

    function loadMasterSetupParamsSimple() public {
        vm.startPrank(vars.deployer.addr);
        // vm.setNonce(vars.deployer.addr, 44);
        masterSetupParams.votingPowerProvider = new VotingPowerProviderSemiFull(
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
            IOzOwnable.OzOwnableInitParams({owner: vars.network.addr}),
            IOperatorsWhitelist.OperatorsWhitelistInitParams({isWhitelistEnabled: false})
        );
        vm.stopPrank();

        _networkSetMiddleware_SymbioticCore(vars.network.addr, address(masterSetupParams.votingPowerProvider));

        // for (uint256 i; i < initSetupParams.masterChain.tokens.length; ++i) {
        //     vm.startPrank(vars.deployer.addr);
        //     masterSetupParams.votingPowerProvider.registerToken(initSetupParams.masterChain.tokens[i]);
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
            vm.startPrank(vars.network.addr);
            masterSetupParams.votingPowerProvider.registerSharedVault(initSetupParams.masterChain.vaults[i]);
            vm.stopPrank();
        }

        vm.startPrank(vars.deployer.addr);
        // vm.setNonce(vars.deployer.addr, 66);
        masterSetupParams.keyRegistry = new MyKeyRegistry();
        masterSetupParams.keyRegistry.initialize(
            IKeyRegistry.KeyRegistryInitParams({
                ozEip712InitParams: IOzEIP712.OzEIP712InitParams({name: "KeyRegistry", version: "1"})
            })
        );
        vm.stopPrank();

        for (uint256 i; i < vars.operators.length; ++i) {
            _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, vars.network.addr);

            for (uint256 j; j < initSetupParams.masterChain.vaults.length; ++j) {
                _operatorOptInWeak_SymbioticCore(vars.operators[i].addr, initSetupParams.masterChain.vaults[j]);
            }

            vm.startPrank(vars.operators[i].addr);
            masterSetupParams.votingPowerProvider.registerOperator();
            vm.stopPrank();

            {
                vm.startPrank(vars.operators[i].addr);
                bytes memory key1Bytes = KeyEcdsaSecp256k1.wrap(vars.operators[i].addr).toBytes();
                bytes32 messageHash1 = masterSetupParams.keyRegistry.hashTypedDataV4(
                    keccak256(abi.encode(KEY_OWNERSHIP_TYPEHASH, vars.operators[i].addr, keccak256(key1Bytes)))
                );
                (uint8 v, bytes32 r, bytes32 s) = vm.sign(vars.operators[i].privateKey, messageHash1);
                bytes memory signature1 = abi.encodePacked(r, s, v);
                masterSetupParams.keyRegistry.setKey(
                    KeyManagerLogic.KEY_TYPE_ECDSA_SECP256K1.getKeyTag(0), key1Bytes, signature1, new bytes(0)
                );
                vm.stopPrank();
            }

            {
                vm.startPrank(vars.operators[i].addr);
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
                vm.stopPrank();
            }
        }

        vm.startPrank(vars.deployer.addr);
        // vm.setNonce(vars.deployer.addr, 68);
        masterSetupParams.master = new MyMasterSettlement{salt: bytes32("master")}();
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
            masterSetupParams.master.initialize(
                IMasterSettlement.MasterSettlementInitParams({
                    settlementInitParams: ISettlement.SettlementInitParams({
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
                        sigVerifier: address(new SigVerifierBlsBn254Simple())
                    }),
                    configProviderInitParams: IConfigProvider.ConfigProviderInitParams({
                        votingPowerProviders: votingPowerProviders,
                        keysProvider: keysProvider,
                        replicas: replicas,
                        verificationType: 1,
                        maxVotingPower: 1e36,
                        minInclusionVotingPower: 0,
                        maxValidatorsCount: 99_999_999,
                        requiredKeyTags: requiredKeyTags
                    })
                }),
                vars.deployer.addr
            );
        }
        vm.stopPrank();
    }

    function loadGenesisSimple()
        public
        returns (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData)
    {
        IVaultManager.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower = 0;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].votingPower;
            }
        }
        valSetHeader = ISettlement.ValSetHeader({
            version: 1,
            requiredKeyTag: 15,
            epoch: 0,
            captureTimestamp: 1_731_325_031,
            quorumThreshold: uint256(2).mulDiv(1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
            validatorsSszMRoot: 0x0000000000000000000000000000000000000000000000000000000000000000,
            previousHeaderHash: 0x0000000000000000000000000000000000000000000000000000000000000000
        });

        extraData = new ISettlement.ExtraData[](3);
        SigVerifierBlsBn254Simple sigVerifier = SigVerifierBlsBn254Simple(masterSetupParams.master.getSigVerifier());

        {
            ISigVerifierBlsBn254Simple.ValidatorData[] memory validatorsData = getValidatorsData();
            bytes32 validatorSetHash = keccak256(abi.encode(validatorsData));
            extraData[0] = ISettlement.ExtraData({
                key: uint32(1).getKey(15, sigVerifier.VALIDATOR_SET_HASH_KECCAK256()),
                value: validatorSetHash
            });
        }
        {
            IVaultManager.OperatorVotingPower[] memory votingPowers =
                masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
            uint256 totalVotingPower = 0;
            for (uint256 i; i < votingPowers.length; ++i) {
                for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                    totalVotingPower += votingPowers[i].vaults[j].votingPower;
                }
            }
            extraData[1] = ISettlement.ExtraData({
                key: uint32(1).getKey(sigVerifier.TOTAL_VOTING_POWER()),
                value: bytes32(totalVotingPower)
            });
        }
        {
            BN254.G1Point memory aggPublicKeyG1Raw;
            for (uint256 i; i < vars.operators.length; ++i) {
                BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(vars.operators[i].privateKey);
                aggPublicKeyG1Raw = aggPublicKeyG1Raw.plus(keyG1);
            }
            bytes32 aggPublicKeyG1 = abi.decode(aggPublicKeyG1Raw.wrap().serialize(), (bytes32));

            extraData[2] = ISettlement.ExtraData({
                key: uint32(1).getKey(15, sigVerifier.AGGREGATED_PUBLIC_KEY_G1()),
                value: aggPublicKeyG1
            });
        }
    }

    function getValidatorsData()
        public
        view
        returns (ISigVerifierBlsBn254Simple.ValidatorData[] memory validatorsData)
    {
        validatorsData = new ISigVerifierBlsBn254Simple.ValidatorData[](vars.operators.length);
        for (uint256 i; i < vars.operators.length; ++i) {
            BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(vars.operators[i].privateKey);
            IVaultManager.VaultVotingPower[] memory votingPowers =
                masterSetupParams.votingPowerProvider.getOperatorVotingPowers(vars.operators[i].addr, new bytes(0));
            uint256 operatorVotingPower = 0;
            for (uint256 i; i < votingPowers.length; ++i) {
                operatorVotingPower += votingPowers[i].votingPower;
            }
            validatorsData[i] =
                ISigVerifierBlsBn254Simple.ValidatorData({publicKey: keyG1, votingPower: operatorVotingPower});
        }
    }
}

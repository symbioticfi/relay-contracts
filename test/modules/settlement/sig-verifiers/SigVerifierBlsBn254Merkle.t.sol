// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {KeyTags} from "../../../../src/libraries/utils/KeyTags.sol";
import {KeyEcdsaSecp256k1} from "../../../../src/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../../../../src/libraries/keys/KeyBlsBn254.sol";
import {SigBlsBn254} from "../../../../src/libraries/sigs/SigBlsBn254.sol";
import {
    KEY_TYPE_BLS_BN254,
    KEY_TYPE_ECDSA_SECP256K1
} from "../../../../src/interfaces/modules/key-registry/IKeyRegistry.sol";
import {ExtraDataStorageHelper} from
    "../../../../src/modules/settlement/sig-verifiers/libraries/ExtraDataStorageHelper.sol";

import {BN254G2} from "../../../helpers/BN254G2.sol";

import {ISettlement} from "../../../../src/interfaces/modules/settlement/ISettlement.sol";
import {IOzOwnable} from "../../../../src/interfaces/modules/common/permissions/IOzOwnable.sol";
import {INetworkManager} from "../../../../src/interfaces/modules/base/INetworkManager.sol";
import {IEpochManager} from "../../../../src/interfaces/modules/valset-driver/IEpochManager.sol";
import {IOperatorsWhitelist} from "../../../../src/interfaces/modules/voting-power/extensions/IOperatorsWhitelist.sol";
import {IOzEIP712} from "../../../../src/interfaces/modules/base/IOzEIP712.sol";
import {ISigVerifierBlsBn254Simple} from
    "../../../../src/interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254Simple.sol";
import {IVotingPowerProvider} from "../../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";

import {MasterSetupTest} from "../../../MasterSetup.sol";

import {console2} from "forge-std/console2.sol";

import {SigVerifierBlsBn254Merkle} from "../../../../src/modules/settlement/sig-verifiers/SigVerifierBlsBn254Merkle.sol";
import "../../../InitSetup.sol";

import {ISigVerifier} from "../../../../src/interfaces/modules/settlement/sig-verifiers/ISigVerifier.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {VotingPowerProviderSemiFull} from "../../../mocks/VotingPowerProviderSemiFull.sol";
import {MyKeyRegistry} from "../../../../examples/MyKeyRegistry.sol";
import {MySettlement} from "../../../../examples/MySettlement.sol";
import {MyValSetDriver} from "../../../../examples/MyValSetDriver.sol";
import {ISettlement} from "../../../../src/interfaces/modules/settlement/ISettlement.sol";
import {IKeyRegistry} from "../../../../src/interfaces/modules/key-registry/IKeyRegistry.sol";
import {IValSetDriver} from "../../../../src/interfaces/modules/valset-driver/IValSetDriver.sol";

import {MultiProofBuilder} from "../../../helpers/MultiProofBuilder.sol";

contract SigVerifierBlsBn254MerkleTest is MasterSetupTest {
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

    struct MerkleGenesis {
        ISettlement.ValSetHeader header;
        ISettlement.ExtraData[] extraData;
    }

    function setUp() public override {
        VERIFICATION_TYPE = 2;
        MasterSetupTest.setUp();

        (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData) = loadGenesisMerkle();

        vm.warp(masterSetupParams.valSetDriver.getEpochStart(0) + 1);

        vm.startPrank(vars.deployer.addr);
        masterSetupParams.settlement.setGenesis(valSetHeader, extraData);
        vm.stopPrank();
    }

    function test_verifyQuorumSig1() public {
        bytes32 messageHash = 0x204e0c470c62e2f8426b236c004b581084dd3aaa935ed3afe24dc37e0d040823;

        BN254.G2Point memory aggKeyG2;
        BN254.G1Point memory aggSigG1;
        uint256 n = 6;

        (ValidatorData[] memory validatorsData, uint256[] memory privateKeys) = getValidatorsData();
        for (uint256 i; i < validatorsData.length; ++i) {
            if (i % n != 0) {
                BN254.G2Point memory keyG2 = getG2Key(privateKeys[i]);
                {
                    BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash);
                    BN254.G1Point memory sigG1 = messageG1.scalar_mul(privateKeys[i]);

                    aggSigG1 = aggSigG1.plus(sigG1);
                }

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

        SigVerifierBlsBn254Merkle.ValidatorData[] memory nonSigners =
            new SigVerifierBlsBn254Merkle.ValidatorData[]((validatorsData.length + n - 1) / n);
        uint256[] memory indices = new uint256[]((validatorsData.length + n - 1) / n);
        for (uint8 i; i < validatorsData.length; ++i) {
            if (i % n == 0) {
                nonSigners[i / n] = SigVerifierBlsBn254Merkle.ValidatorData({
                    keySerialized: validatorsData[i].keySerialized,
                    votingPower: validatorsData[i].votingPower
                });
                indices[i / n] = i;
            }
        }

        bytes32[] memory leaves = new bytes32[](validatorsData.length);
        for (uint256 i; i < leaves.length; ++i) {
            leaves[i] = keccak256(
                bytes.concat(keccak256(abi.encode(validatorsData[i].keySerialized, validatorsData[i].votingPower)))
            );
        }
        (,, bytes32[] memory proofs, bool[] memory flags) = MultiProofBuilder.buildProof(leaves, indices);

        bytes memory fullProof = abi.encodePacked(
            abi.encode(aggSigG1),
            abi.encode(aggKeyG2),
            Bytes.slice(abi.encode(nonSigners), 32),
            abi.encode(proofs, flags)
        );

        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }

        bytes memory data = abi.encodeCall(
            ISettlement.verifyQuorumSigAt,
            (
                abi.encode(messageHash),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
                fullProof,
                masterSetupParams.settlement.getLastCommittedHeaderEpoch(),
                new bytes(0)
            )
        );
        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory result) = address(masterSetupParams.settlement).call(data);
        assertTrue(success);
        assertTrue(abi.decode(result, (bool)));
    }

    function test_verifyQuorumSig2() public {
        bytes32 messageHash = 0x204e0c470c62e2f8426b236c004b581084dd3aaa935ed3afe24dc37e0d040823;

        BN254.G2Point memory aggKeyG2;
        BN254.G1Point memory aggSigG1;
        uint256 n = 100_000;

        (ValidatorData[] memory validatorsData, uint256[] memory privateKeys) = getValidatorsData();
        for (uint256 i; i < validatorsData.length; ++i) {
            if (i % n != 0) {
                BN254.G2Point memory keyG2 = getG2Key(privateKeys[i]);
                {
                    BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash);
                    BN254.G1Point memory sigG1 = messageG1.scalar_mul(privateKeys[i]);

                    aggSigG1 = aggSigG1.plus(sigG1);
                }

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

        SigVerifierBlsBn254Merkle.ValidatorData[] memory nonSigners =
            new SigVerifierBlsBn254Merkle.ValidatorData[]((validatorsData.length + n - 1) / n);
        uint256[] memory indices = new uint256[]((validatorsData.length + n - 1) / n);
        for (uint8 i; i < validatorsData.length; ++i) {
            if (i % n == 0) {
                nonSigners[i / n] = SigVerifierBlsBn254Merkle.ValidatorData({
                    keySerialized: validatorsData[i].keySerialized,
                    votingPower: validatorsData[i].votingPower
                });
                indices[i / n] = i;
            }
        }

        bytes32[] memory leaves = new bytes32[](validatorsData.length);
        for (uint256 i; i < leaves.length; ++i) {
            leaves[i] = keccak256(
                bytes.concat(keccak256(abi.encode(validatorsData[i].keySerialized, validatorsData[i].votingPower)))
            );
        }
        (,, bytes32[] memory proofs, bool[] memory flags) = MultiProofBuilder.buildProof(leaves, indices);

        bytes memory fullProof = abi.encodePacked(
            abi.encode(aggSigG1),
            abi.encode(aggKeyG2),
            Bytes.slice(abi.encode(nonSigners), 32),
            abi.encode(proofs, flags)
        );

        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }

        bytes memory data = abi.encodeCall(
            ISettlement.verifyQuorumSigAt,
            (
                abi.encode(messageHash),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
                fullProof,
                masterSetupParams.settlement.getLastCommittedHeaderEpoch(),
                new bytes(0)
            )
        );
        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory result) = address(masterSetupParams.settlement).call(data);
        assertTrue(success);
        assertTrue(abi.decode(result, (bool)));
    }

    function test_verifyQuorumSig3() public {
        bytes32 messageHash = 0x204e0c470c62e2f8426b236c004b581084dd3aaa935ed3afe24dc37e0d040823;

        BN254.G2Point memory aggKeyG2;
        BN254.G1Point memory aggSigG1;
        uint256 n = 4;

        (ValidatorData[] memory validatorsData, uint256[] memory privateKeys) = getValidatorsData();
        for (uint256 i; i < validatorsData.length; ++i) {
            if (i % n != 0) {
                BN254.G2Point memory keyG2 = getG2Key(privateKeys[i]);
                {
                    BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash);
                    BN254.G1Point memory sigG1 = messageG1.scalar_mul(privateKeys[i]);

                    aggSigG1 = aggSigG1.plus(sigG1);
                }

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

        SigVerifierBlsBn254Merkle.ValidatorData[] memory nonSigners =
            new SigVerifierBlsBn254Merkle.ValidatorData[]((validatorsData.length + n - 1) / n);
        uint256[] memory indices = new uint256[]((validatorsData.length + n - 1) / n);
        for (uint8 i; i < validatorsData.length; ++i) {
            if (i % n == 0) {
                nonSigners[i / n] = SigVerifierBlsBn254Merkle.ValidatorData({
                    keySerialized: validatorsData[i].keySerialized,
                    votingPower: validatorsData[i].votingPower
                });
                indices[i / n] = i;
            }
        }

        bytes32[] memory leaves = new bytes32[](validatorsData.length);
        for (uint256 i; i < leaves.length; ++i) {
            leaves[i] = keccak256(
                bytes.concat(keccak256(abi.encode(validatorsData[i].keySerialized, validatorsData[i].votingPower)))
            );
        }
        (,, bytes32[] memory proofs, bool[] memory flags) = MultiProofBuilder.buildProof(leaves, indices);

        bytes memory fullProof = abi.encodePacked(
            abi.encode(aggSigG1),
            abi.encode(aggKeyG2),
            Bytes.slice(abi.encode(nonSigners), 32),
            abi.encode(proofs, flags)
        );

        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }

        bytes memory data = abi.encodeCall(
            ISettlement.verifyQuorumSigAt,
            (
                abi.encode(messageHash),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
                fullProof,
                masterSetupParams.settlement.getLastCommittedHeaderEpoch(),
                new bytes(0)
            )
        );
        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory result) = address(masterSetupParams.settlement).call(data);
        assertTrue(success);
        assertTrue(abi.decode(result, (bool)));
    }

    function loadGenesisMerkle()
        public
        returns (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData)
    {
        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        valSetHeader = ISettlement.ValSetHeader({
            version: 1,
            requiredKeyTag: 15,
            epoch: 0,
            captureTimestamp: masterSetupParams.valSetDriver.getEpochStart(0),
            quorumThreshold: uint256(2).mulDiv(1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
            totalVotingPower: totalVotingPower,
            validatorsSszMRoot: 0x0000000000000000000000000000000000000000000000000000000000000001,
            previousHeaderHash: 0xd397b3b043d87fcd6fad1291ff0bfd16401c274896d8c63a923727f077b8e0b5
        });

        extraData = new ISettlement.ExtraData[](2);
        SigVerifierBlsBn254Merkle sigVerifier = SigVerifierBlsBn254Merkle(masterSetupParams.settlement.getSigVerifier());

        {
            (ValidatorData[] memory validatorsData,) = getValidatorsData();
            bytes32[] memory leaves = new bytes32[](validatorsData.length);
            for (uint256 i; i < leaves.length; ++i) {
                leaves[i] = keccak256(
                    bytes.concat(keccak256(abi.encode(validatorsData[i].keySerialized, validatorsData[i].votingPower)))
                );
            }
            uint256[] memory indices;
            (bytes32 root,,,) = MultiProofBuilder.buildProof(leaves, indices);
            extraData[0] = ISettlement.ExtraData({
                key: uint32(2).getKey(15, sigVerifier.VALIDATOR_SET_MERKLE_ROOT_HASH()),
                value: root
            });
        }
        {
            BN254.G1Point memory aggPublicKeyG1Raw;
            for (uint256 i; i < networkSetupParams.OPERATORS_TO_REGISTER; ++i) {
                BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(getOperator(i).privateKey);
                aggPublicKeyG1Raw = aggPublicKeyG1Raw.plus(keyG1);
            }
            bytes32 aggPublicKeyG1 = abi.decode(aggPublicKeyG1Raw.wrap().serialize(), (bytes32));

            extraData[1] = ISettlement.ExtraData({
                key: uint32(2).getKey(15, sigVerifier.AGGREGATED_PUBLIC_KEY_G1_HASH()),
                value: aggPublicKeyG1
            });
        }
    }

    struct ValidatorData {
        bytes32 keySerialized;
        uint256 votingPower;
    }

    function getValidatorsData() public returns (ValidatorData[] memory validatorsData, uint256[] memory privateKeys) {
        validatorsData = new ValidatorData[](networkSetupParams.OPERATORS_TO_REGISTER);
        privateKeys = new uint256[](networkSetupParams.OPERATORS_TO_REGISTER);
        for (uint256 i; i < networkSetupParams.OPERATORS_TO_REGISTER; ++i) {
            BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(getOperator(i).privateKey);
            IVotingPowerProvider.VaultValue[] memory votingPowers =
                masterSetupParams.votingPowerProvider.getOperatorVotingPowers(getOperator(i).addr, new bytes(0));
            uint256 operatorVotingPower;
            for (uint256 j; j < votingPowers.length; ++j) {
                operatorVotingPower += votingPowers[j].value;
            }
            validatorsData[i] = ValidatorData({
                keySerialized: abi.decode(keyG1.wrap().serialize(), (bytes32)),
                votingPower: operatorVotingPower
            });
            privateKeys[i] = getOperator(i).privateKey;
        }

        for (uint256 i; i < validatorsData.length; ++i) {
            for (uint256 j; j < validatorsData.length - i - 1; ++j) {
                if (uint256(validatorsData[j].keySerialized) > uint256(validatorsData[j + 1].keySerialized)) {
                    (validatorsData[j], validatorsData[j + 1]) = (validatorsData[j + 1], validatorsData[j]);
                    (privateKeys[j], privateKeys[j + 1]) = (privateKeys[j + 1], privateKeys[j]);
                }
            }
        }
    }
}

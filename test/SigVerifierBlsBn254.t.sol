// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {KeyTag} from "../src/contracts/libraries/utils/KeyTag.sol";
import {KeyEcdsaSecp256k1} from "../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {SigBlsBn254} from "../src/contracts/libraries/sigs/SigBlsBn254.sol";
import {KeyManagerLogic} from "../src/contracts/base/logic/KeyManagerLogic.sol";

import {BN254G2} from "./libraries/BN254G2.sol";

import {ISettlement} from "../src/interfaces/implementations/settlement/ISettlement.sol";
import {IBaseKeyManager} from "../src/interfaces/base/IBaseKeyManager.sol";

import {MasterGenesisSetup} from "./MasterGenesisSetup.sol";

import {console2} from "forge-std/console2.sol";

import {Verifier} from "../src/contracts/implementations/sig-verifiers/zk/HashVerifier.sol";
import {SigVerifier} from "../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254.sol";

import {ISigVerifier} from "../src/interfaces/base/ISigVerifier.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SigVerifierBlsBn254Test is MasterGenesisSetup {
    using KeyTag for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    struct ZkProof {
        uint256[] input;
        bytes proof;
    }

    function setUp() public override {
        super.setUp();

        vm.warp(initSetupParams.zeroTimestamp);

        setGenesis();
    }

    function test_verifyQuorumSig() public {
        bytes32 messageHash = 0xacaf3289d7b601cbd114fb36c4d29c85bbfd5e133f14cb355c3fd8d99367964f;
        uint256 nonSignersVotingPower = 0;

        BN254.G1Point memory aggKeyG1;
        BN254.G2Point memory aggKeyG2;
        BN254.G1Point memory aggSigG1;

        for (uint256 i = 0; i < vars.operators.length; i++) {
            BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(vars.operators[i].privateKey);

            BN254.G2Point memory keyG2 = getG2Key(vars.operators[i].privateKey);
            BN254.G1Point memory messageG1 = BN254.hashToG1(messageHash);
            BN254.G1Point memory sigG1 = messageG1.scalar_mul(vars.operators[i].privateKey);
            aggSigG1 = aggSigG1.plus(sigG1);
            aggKeyG1 = aggKeyG1.plus(keyG1);

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

        bytes memory zkProof =
            hex"0acc30133e99cf5c4d59fbb160c9ebc5aecc600ffe45e69f8d5347202c2a3b2f0e1451dff30967e16a66d5a54021a3ef80e863624db714fe80a685440bfffca6235952fe9997a7cebbabd5757a0205e39a5a6aa5dc191f51c40e27674a8492aa2b939ce02777edafec4cc1c584ce418344e2cd8699128791f3d220213e51fe120b5159f000be4a81827f6a97920ca73e12693a62efc15d925cefab290429bdcb20049e807ffdb5d573b5bd7c1e20c6d564faa1ab48174794c111427d39e31d272be621c63169982a162700a1eb5afe2a0ae0e617db2ee7fbf72c0ce7ec203e30080ca5752c772248e5bf162de3e48fb6a56a2c326d9d19f4f116d5bbb1e47347000000011acafc2c5dd497dcada25c68d296edcbf1097240d76a0303d073f020de1568430011b1700a3e5448c12f4d73c627d47e13a697698dca76662454c06f79490c770a88e7869ab9bbef4a9931eb14d6679c0205afb3478abbc7ca67e28be93b2c4a03198b0ce7d323eaa51c8aba32340e12896afb3dd62dd0c0125e5418e6bd995d";

        bytes memory fullProof;

        {
            bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
            bytes memory commitments = Bytes.slice(zkProof, 260, 324);
            bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

            fullProof = abi.encodePacked(proof_, commitments, commitmentPok, nonSignersVotingPower);
        }

        address zkVerifier = address(new Verifier());
        SigVerifier sigVerifier = new SigVerifier(zkVerifier);

        assertTrue(
            sigVerifier.verifyQuorumSig(
                address(masterSetupParams.master),
                masterSetupParams.master.getCurrentValSetEpoch(),
                abi.encode(messageHash),
                KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
                uint208(Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil)),
                fullProof
            )
        );
    }
}

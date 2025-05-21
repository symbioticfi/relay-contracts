// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {KeyTag} from "../src/contracts/libraries/utils/KeyTag.sol";
import {KeyEcdsaSecp256k1} from "../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {SigBlsBn254} from "../src/contracts/libraries/sigs/SigBlsBn254.sol";
import {KeyManagerLogic} from "../src/contracts/base/logic/KeyManagerLogic.sol";

import {BN254G2} from "./libraries/BN254G2.sol";

import {ISettlementManager} from "../src/interfaces/implementations/settlement/ISettlementManager.sol";
import {IBaseKeyManager} from "../src/interfaces/base/IBaseKeyManager.sol";

import {MasterGenesisSetup} from "./MasterGenesisSetup.sol";

import {console2} from "forge-std/console2.sol";

import {Verifier} from "../src/contracts/implementations/sig-verifiers/zk/HashVerifier.sol";
import {SigVerifier} from "../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254.sol";

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
        bytes32 messageHash = 0xf6fd88868836d3f28687942f43ceeb5cce58eb4bc81dc44a044c69cbfd26965a;
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

        ZkProof memory zkProof = loadZkProof();

        bytes memory proof_ = Bytes.slice(zkProof.proof, 0, 256);
        bytes memory commitments = Bytes.slice(zkProof.proof, 260, 324);
        bytes memory commitmentPok = Bytes.slice(zkProof.proof, 324, 388);

        bytes memory fullProof = abi.encodePacked(proof_, commitments, commitmentPok, nonSignersVotingPower);

        console2.log("fullProof");
        console2.logBytes(fullProof);

        address zkVerifier = address(new Verifier());
        SigVerifier sigVerifier = new SigVerifier(zkVerifier);

        assertTrue(
            sigVerifier.verifyQuorumSig(
                address(masterSetupParams.master),
                abi.encode(messageHash),
                KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
                uint208(Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil)),
                fullProof
            )
        );
    }

    function loadZkProof() internal returns (ZkProof memory) {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/test/data/zk_proof.json");
        string memory json = vm.readFile(path);
        bytes memory data = vm.parseJson(json);
        return abi.decode(data, (ZkProof));
    }
}

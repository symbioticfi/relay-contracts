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

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SettlementTest is MasterGenesisSetup {
    using KeyTag for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash)");

    struct ZkProof {
        uint256[] input;
        bytes proof;
    }

    function setUp() public override {
        super.setUp();

        vm.warp(initSetupParams.zeroTimestamp);

        setGenesis();
    }

    function test_commitValSetHeader() public {
        vm.warp(masterSetupParams.master.getNextEpochStart());

        ISettlement.ValSetHeader memory valSetHeader = loadGenesis();

        console2.log("version");
        console2.log(valSetHeader.version);
        console2.log("extraData");
        console2.logBytes(valSetHeader.extraData);
        console2.log("validatorsSszMRoot");
        console2.logBytes32(valSetHeader.validatorsSszMRoot);
        console2.log("totalActiveVotingPower");
        console2.log(valSetHeader.totalActiveVotingPower);
        console2.log("activeAggregatedKeys");
        for (uint256 i = 0; i < valSetHeader.activeAggregatedKeys.length; i++) {
            console2.log(valSetHeader.activeAggregatedKeys[i].tag);
            console2.logBytes(valSetHeader.activeAggregatedKeys[i].payload);
        }

        bytes32 messageHash = masterSetupParams.master.hashTypedDataV4CrossChain(
            keccak256(
                abi.encode(
                    VALSET_HEADER_COMMIT_TYPEHASH,
                    masterSetupParams.master.SUBNETWORK(),
                    masterSetupParams.master.getCurrentEpoch(),
                    keccak256(abi.encode(valSetHeader))
                )
            )
        );

        console2.log("VALSET_HEADER_COMMIT_TYPEHASH");
        console2.logBytes32(VALSET_HEADER_COMMIT_TYPEHASH);
        console2.log("SUBNETWORK");
        console2.logBytes32(masterSetupParams.master.SUBNETWORK());
        console2.log("getCurrentEpoch");
        console2.log(masterSetupParams.master.getCurrentEpoch());
        console2.log("keccak256(abi.encode(valSetHeader))");
        console2.logBytes32(keccak256(abi.encode(valSetHeader)));

        console2.log("messageHash");
        console2.logBytes32(messageHash);

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
        console2.log("proof_");
        console2.logBytes(proof_);
        bytes memory commitments = Bytes.slice(zkProof.proof, 260, 324);
        console2.log("commitments");
        console2.logBytes(commitments);
        bytes memory commitmentPok = Bytes.slice(zkProof.proof, 324, 388);
        console2.log("commitmentPok");
        console2.logBytes(commitmentPok);

        console2.log("aggSigG1");
        console2.logBytes(abi.encode(aggSigG1));
        console2.log("aggKeyG2");
        console2.logBytes(abi.encode(aggKeyG2));

        uint256 nonSignersVotingPower = 0;

        bytes memory fullProof = abi.encodePacked(proof_, commitments, commitmentPok, nonSignersVotingPower);
        console2.log("fullProof");
        console2.logBytes(fullProof);

        console2.log("commitValSetHeader");
        console2.logBytes(abi.encodeWithSelector(ISettlement.commitValSetHeader.selector, valSetHeader, fullProof));
        masterSetupParams.master.commitValSetHeader(valSetHeader, fullProof);
    }

    function loadZkProof() internal returns (ZkProof memory) {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/test/data/zk_proof.json");
        string memory json = vm.readFile(path);
        bytes memory data = vm.parseJson(json);
        return abi.decode(data, (ZkProof));
    }
}

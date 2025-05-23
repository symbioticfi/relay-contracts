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
import {SigVerifierBlsBn254ZK} from "../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254ZK.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SettlementTest is MasterGenesisSetup {
    using KeyTag for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    bytes32 private constant VALSET_HEADER_COMMIT_TYPEHASH =
        keccak256("ValSetHeaderCommit(bytes32 subnetwork,uint48 epoch,bytes32 headerHash,bytes32 extraDataHash)");

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

        (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData) = loadGenesis();

        valSetHeader.epoch = 1;
        valSetHeader.captureTimestamp = masterSetupParams.master.getCurrentEpochStart();
        valSetHeader.previousHeaderHash = keccak256(abi.encode(masterSetupParams.master.getValSetHeaderAt(0)));

        bytes32 messageHash = masterSetupParams.master.hashTypedDataV4CrossChain(
            keccak256(
                abi.encode(
                    VALSET_HEADER_COMMIT_TYPEHASH,
                    masterSetupParams.master.SUBNETWORK(),
                    masterSetupParams.master.getCurrentEpoch(),
                    keccak256(abi.encode(valSetHeader)),
                    keccak256(abi.encode(extraData))
                )
            )
        );

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

        bytes memory zkProof =
            hex"2d65cbbbd71885c8e7f28860fa3343b48c8044d844b7b5e20ae8fe2797a48ea320cccb32c189e68867a9af837f1052ddb3751b385ebf3e8638801f6a92657c0801a7e2445adc43945fa94fbcb4d456c378f18ace765a837f7bb79fe222bc51272ba93456cdbba04de6e25194c432114c10cdb6f39d6eb579bbeb5b502b04985e1c87ce239bb869beb4128035efb77fff51c4268099ca480a6c8ff185e9cbf78625be2019010cd71f22e645d080c74bf7e8810c7ac986c7ffa1fab0f2a9bcf5480bbd70092c2f13796ba38a8b4d04ed9d98fe736ef0b2ffd0f8129c15f62411b61b7de037701f467e6b9887597d720db4aa434ebf84d1925c8b3b7d41f2a43fe50000000120b32cc1153b6526c516257bde3168889d93f0e499989908a8736500a9b4e4422d4538548d8ddd393d7e98a5ba21422de11c79537b2896931607a83cc37a5bf9215a74bdbc3b20661e3720a68d22ffb11780cd690e28e2098fa75b947bf4edc6263babd70230f34e8a5117bd1311623191f495597324baa8a90b2931b360225d";

        bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
        bytes memory commitments = Bytes.slice(zkProof, 260, 324);
        bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

        uint256 signersVotingPower = 30_000_000_000_000;

        bytes memory fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);

        masterSetupParams.master.commitValSetHeader(valSetHeader, extraData, fullProof, new bytes(0));
    }
}

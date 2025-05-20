// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {IBaseKeyManager} from "../../src/interfaces/base/IBaseKeyManager.sol";

import "./MasterGenesisSetup.s.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

// forge script script/test/MasterCommit.s.sol:MasterCommitScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_MASTER

contract MasterCommitScript is MasterGenesisSetupScript {

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

    function run(
        uint256 seed
    ) public virtual override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        SymbioticInit.run(seed);

        (, Vars memory vars) = loadInitSetupParamsAndVars();
        MasterSetupParams memory masterSetupParams = loadMasterSetupParams();

        ISettlementManager.ValSetHeader memory valSetHeader = loadGenesis();

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
        bytes memory fullProof = abi.encodePacked(
            abi.encode(aggSigG1), abi.encode(aggKeyG2), proof_, commitments, commitmentPok, zkProof.input
        );
        console2.log("fullProof");
        console2.logBytes(fullProof);

        console2.log("commitValSetHeader");

        vm.startBroadcast(vars.deployer.privateKey);
        masterSetupParams.master.commitValSetHeader(valSetHeader, fullProof);
        vm.stopBroadcast();
    }

    function loadZkProof() internal returns (ZkProof memory) {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/test/data/zk_proof.json");
        string memory json = vm.readFile(path);
        bytes memory data = vm.parseJson(json);
        return abi.decode(data, (ZkProof));
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {KeyTag} from "../../../src/contracts/libraries/utils/KeyTag.sol";
import {KeyEcdsaSecp256k1} from "../../../src/contracts/libraries/keys/KeyEcdsaSecp256k1.sol";
import {KeyBlsBn254, BN254} from "../../../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {SigBlsBn254} from "../../../src/contracts/libraries/sigs/SigBlsBn254.sol";
import {KeyManagerLogic} from "../../../src/contracts/base/logic/KeyManagerLogic.sol";

import {BN254G2} from "../../helpers/BN254G2.sol";

import {ISettlement} from "../../../src/interfaces/implementations/settlement/ISettlement.sol";
import {IBaseKeyManager} from "../../../src/interfaces/base/IBaseKeyManager.sol";

import {MasterGenesisSetup} from "../../MasterGenesisSetup.sol";

import {console2} from "forge-std/console2.sol";

import {SigVerifierBlsBn254ZK} from "../../../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254ZK.sol";

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
            hex"0c9d92bd8aac8588329e85aade26354a7b9206e170f0df0ee891c3927e5a58522adf6d35c9649dbf628cfe567bc31647d52cf5ae023c88984cecbf01fb477d492761b1f57ca217b83d1851f3e9276e3a758fe92b0f7022d9610ed51e1d7da1521458461ac568a806eb566e1f177baba0bee7c49bbb225347da8d236def25eb3829f4a51eecc66d28b5c973a943d752aa383cbab591b59406da361cbeac1dfcc22afdfa764b84685fabc31a3e5367ca30c2eaa3480ec44a9f847f952da34df4ca0ec698607fb631abd2939ea85d57c69e097b8cdba0734b21154479dc7c39d2a11d2dec162d71b5fad118e59a9dd6917335f251384a3cb16ed48af9f3dbed8266000000011199b925c505c27fe05e9f75e2a0965aea4b6cdb945a4a481c6bc06bd080da701cd2629a69c1946bcd2695c369de10999ce9ec4f0c51d1f8d265460b4f2646d923e00d2fa0a29d4760394d8da2af4f7545377705157c75b86a20044f792a50b30068fdfeaa3eb3be8444c454fdf3629d902034c84714a652394c35da7fa2fb6f";

        bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
        bytes memory commitments = Bytes.slice(zkProof, 260, 324);
        bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

        uint256 signersVotingPower = masterSetupParams.votingPowerProvider.getTotalVotingPower(new bytes[](0));

        bytes memory fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);

        console2.log("messageHash");
        console2.logBytes32(messageHash);

        masterSetupParams.master.commitValSetHeader(valSetHeader, extraData, fullProof, new bytes(0));
    }
}

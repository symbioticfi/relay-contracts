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

import {BN254G2} from "../../../helpers/BN254G2.sol";

import {ISettlement} from "../../../../src/interfaces/modules/settlement/ISettlement.sol";

import "../../../MasterGenesisSetup.sol";

import {console2} from "forge-std/console2.sol";
import {stdStorage, StdStorage} from "forge-std/Test.sol";

import {SigVerifierBlsBn254ZK} from "../../../../src/modules/settlement/sig-verifiers/SigVerifierBlsBn254ZK.sol";

import {ISigVerifier} from "../../../../src/interfaces/modules/settlement/sig-verifiers/ISigVerifier.sol";
import {IVotingPowerProvider} from "../../../../src/interfaces/modules/voting-power/IVotingPowerProvider.sol";
import {
    ISigVerifierBlsBn254ZK
} from "../../../../src/interfaces/modules/settlement/sig-verifiers/ISigVerifierBlsBn254ZK.sol";

import {
    ExtraDataStorageHelper
} from "../../../../src/modules/settlement/sig-verifiers/libraries/ExtraDataStorageHelper.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SigVerifierBlsBn254ZKTest is MasterGenesisSetupTest {
    using KeyTags for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using Math for uint256;
    using ExtraDataStorageHelper for uint32;
    using stdStorage for StdStorage;

    struct ZkProof {
        uint256[] input;
        bytes proof;
    }

    function setUp() public override {
        SYMBIOTIC_CORE_NUMBER_OF_OPERATORS = 20;
        VERIFICATION_TYPE = 0;

        MasterSetupTest.setUp();

        vm.warp(masterSetupParams.valSetDriver.getEpochStart(0) + 1);

        vm.startPrank(vars.deployer.addr);
        (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData) = loadGenesis();
        valSetHeader.captureTimestamp = masterSetupParams.valSetDriver.getCurrentEpochStart();
        valSetHeader.epoch = masterSetupParams.valSetDriver.getCurrentEpoch();
        valSetHeader.requiredKeyTag = masterSetupParams.valSetDriver.getRequiredHeaderKeyTag();
        valSetHeader.version = masterSetupParams.settlement.VALIDATOR_SET_VERSION();

        SigVerifierBlsBn254ZK sigVerifier = SigVerifierBlsBn254ZK(masterSetupParams.settlement.getSigVerifier());
        extraData = new ISettlement.ExtraData[](2);
        extraData[0].key = uint32(VERIFICATION_TYPE).getKey(sigVerifier.TOTAL_ACTIVE_VALIDATORS_HASH());
        extraData[0].value = bytes32(SYMBIOTIC_CORE_NUMBER_OF_OPERATORS);
        extraData[1].key = uint32(VERIFICATION_TYPE).getKey(15, sigVerifier.VALIDATOR_SET_HASH_MIMC_HASH());
        extraData[1].value = bytes32(0x215238d5b8f70cc786ad1a8f601cbaa82930011ba6163616924ca8887c90bbb8);

        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        uint256 quorumThreshold;
        IValSetDriver.QuorumThreshold[] memory quorumThresholds = masterSetupParams.valSetDriver.getQuorumThresholds();
        for (uint256 i; i < quorumThresholds.length; ++i) {
            if (quorumThresholds[i].keyTag == valSetHeader.requiredKeyTag) {
                quorumThreshold = quorumThresholds[i].quorumThreshold;
                break;
            }
        }
        valSetHeader.quorumThreshold =
            quorumThreshold.mulDiv(totalVotingPower, masterSetupParams.valSetDriver.MAX_QUORUM_THRESHOLD()) + 1;
        valSetHeader.totalVotingPower = totalVotingPower;

        masterSetupParams.settlement.setGenesis(valSetHeader, extraData);
        vm.stopPrank();
    }

    function test_Create() public {
        address[] memory verifiers = new address[](3);
        verifiers[0] = address(new Verifier_10());
        verifiers[1] = address(new Verifier_100());
        verifiers[2] = address(new Verifier_1000());
        uint256[] memory maxValidators = new uint256[](verifiers.length);
        maxValidators[0] = 10;
        maxValidators[1] = 100;
        maxValidators[2] = 1000;
        new SigVerifierBlsBn254ZK(verifiers, maxValidators);
    }

    function test_RevertInvalidLength() public {
        address[] memory verifiers;
        uint256[] memory maxValidators;
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidLength.selector);
        new SigVerifierBlsBn254ZK(verifiers, maxValidators);

        verifiers = new address[](3);
        verifiers[0] = address(new Verifier_10());
        verifiers[1] = address(new Verifier_100());
        verifiers[2] = address(new Verifier_1000());
        maxValidators = new uint256[](verifiers.length - 1);
        maxValidators[0] = 10;
        maxValidators[1] = 100;
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidLength.selector);
        new SigVerifierBlsBn254ZK(verifiers, maxValidators);
    }

    function test_Revert_InvalidMaxValidators() public {
        address[] memory verifiers = new address[](3);
        verifiers[0] = address(new Verifier_10());
        verifiers[1] = address(new Verifier_100());
        verifiers[2] = address(new Verifier_1000());
        uint256[] memory maxValidators = new uint256[](verifiers.length);
        maxValidators[0];
        maxValidators[1] = 100;
        maxValidators[2] = 1000;
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidMaxValidators.selector);
        new SigVerifierBlsBn254ZK(verifiers, maxValidators);
    }

    function test_Revert_InvalidVerifier() public {
        address[] memory verifiers = new address[](3);
        verifiers[0] = address(0);
        verifiers[1] = address(new Verifier_100());
        verifiers[2] = address(new Verifier_1000());
        uint256[] memory maxValidators = new uint256[](verifiers.length);
        maxValidators[0] = 10;
        maxValidators[1] = 100;
        maxValidators[2] = 1000;
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidVerifier.selector);
        new SigVerifierBlsBn254ZK(verifiers, maxValidators);
    }

    function test_Revert_InvalidMaxValidatorsOrder() public {
        address[] memory verifiers = new address[](3);
        verifiers[0] = address(new Verifier_10());
        verifiers[1] = address(new Verifier_100());
        verifiers[2] = address(new Verifier_1000());
        uint256[] memory maxValidators = new uint256[](verifiers.length);
        maxValidators[0] = 10;
        maxValidators[1] = 10;
        maxValidators[2] = 1000;
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder.selector);
        new SigVerifierBlsBn254ZK(verifiers, maxValidators);
    }

    function test_Revert_UnsupportedKeyTag() public {
        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }
        uint48 epoch = masterSetupParams.settlement.getLastCommittedHeaderEpoch();
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_UnsupportedKeyTag.selector);
        sigVerifier.verifyQuorumSig(
            address(masterSetupParams.settlement),
            epoch,
            new bytes(0),
            KEY_TYPE_ECDSA_SECP256K1.getKeyTag(15),
            0,
            new bytes(0)
        );
    }

    function test_Revert_InvalidMessageLength() public {
        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }
        uint48 lastCommittedHeaderEpoch = masterSetupParams.settlement.getLastCommittedHeaderEpoch();
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidMessageLength.selector);
        sigVerifier.verifyQuorumSig(
            address(masterSetupParams.settlement),
            lastCommittedHeaderEpoch,
            abi.encode(bytes32(0), bytes32(0)),
            KEY_TYPE_BLS_BN254.getKeyTag(15),
            0,
            new bytes(0)
        );
    }

    function test_Revert_InvalidProofLength() public {
        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }
        uint48 lastCommittedHeaderEpoch = masterSetupParams.settlement.getLastCommittedHeaderEpoch();

        bytes memory data = abi.encodeCall(
            ISigVerifier.verifyQuorumSig,
            (
                address(masterSetupParams.settlement),
                lastCommittedHeaderEpoch,
                new bytes(32),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                0,
                new bytes(0)
            )
        );

        console2.logBytes(data);
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidProofLength.selector);
        sigVerifier.verifyQuorumSig(
            address(masterSetupParams.settlement),
            lastCommittedHeaderEpoch,
            new bytes(32),
            KEY_TYPE_BLS_BN254.getKeyTag(15),
            0,
            new bytes(1)
        );
    }

    function test_FalseQuorumThreshold() public {
        bytes32 messageHash = 0xcca0534ef01f2606de9b6c90df9f0a2e1a18fb5ce4d1f9cf1f94d35b398ebce4;
        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        uint256 signersVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            if (i % 6 != 0) {
                for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                    signersVotingPower += votingPowers[i].vaults[j].value;
                }
            }
        }

        bytes memory zkProof =
            hex"206dcae2b8c85cf21fdec90f0c718b2b115ab037f7d88bc97c9fcbe78178d79c001672afd6466491721608401c541bbfa3c0af0344c7ecf5b34f1ed1adc50e0c04eeb48b81242bb6ddaf5b484a4e1f17399e7b6f3e22dfc4e08adb50f3f8cc1a1233d76b3501e0d42b155e2dbdc15901c6285c2178333e2bea608d3f793edd09101c412530bdc2cd34b5c3c133fc40b5c816b9000119af23924522b631210a492f302cd1061050191b5ec2101686d9afdea9837c9854b046a180d60c216b86072b475fd4f3681aca234aa664eaa9fa4dd76a94916f11748c9328838738ccc61b10801588c803ca9164aee59d14415caf0e36606ae89af3749344990a970d72bf00000001155d4078507ab771f11f8274dd997fae37e4837e4a4484bfba2bb32d10b3a15c078ad1b161d8e4654cc6f7da0cff253803886be55c499e9789f3ba715c6e4ac92c094e338654bad5b13c344bc5ba3b50cc289030515d3172f098836bb24f15061246e4eab3a3977f7f6e2fafae2b081000b121bb3cfd37aa1327db15835ae0a7";

        bytes memory fullProof;

        {
            bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
            bytes memory commitments = Bytes.slice(zkProof, 260, 324);
            bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

            fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);
        }

        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }

        assertFalse(
            sigVerifier.verifyQuorumSig(
                address(masterSetupParams.settlement),
                masterSetupParams.settlement.getLastCommittedHeaderEpoch(),
                abi.encode(messageHash),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                totalVotingPower + 1,
                fullProof
            )
        );
    }

    function test_verifyQuorumSig() public {
        bytes32 messageHash = 0x658bc250cfe17f8ad77a5f5d92afb6e9316088b5c89c6df2db63785116b22948;
        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        uint256 signersVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            if (i % 6 != 0) {
                for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                    signersVotingPower += votingPowers[i].vaults[j].value;
                }
            }
        }

        bytes memory zkProof =
            hex"13d086452f3fe7fac6abf4f339daf55bde6b6f95fd6be61811b9beb187c14dd309f028a8a30763ce04a7d670dcb3a2d47afadf84d53c20e62964f2d6fe94de020d9636b4c918f9acd95eba0bfa12ff65b1774adbd836409f456249745324b51d17fbb243d0c6900b921f7f671083900cffd164a771272cd94546a59e0ec343dd263ce71215f672efa1a264633cdd112cf836c03f19e8d17fb871939b3187a4f51854de25e3c6798f28b3de47d764601202bf1f13dcb5766f85f82606dfb2ea332d1ea579a163dffe6f85798bed0d78e6f363fd8a8589938fe2ab7cdc1bf5c6a9125502cb1cfc971c5ba2e4783da4abe2103cf2645507eda6c5e04d453a51dc4c0000000110fe29da882e27e8f7750ceaa385ccf63c9b3bb53e10de028a23d2ae3b4511592bc0e0dd165b6a0f2cad89c812d83e55279107d050070a016e93bccd2ecfcc8d07714400658a933cec1a864dc85b609d1b0188a0304becfcad2deed1c8e37132049d45673b0a05d1ae0fd775f34aa975b1adbbb39343d39a2dd9bca3ec373458";

        bytes memory fullProof;

        {
            bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
            bytes memory commitments = Bytes.slice(zkProof, 260, 324);
            bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

            fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);
        }

        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }

        bytes memory data = abi.encodeCall(
            ISigVerifier.verifyQuorumSig,
            (
                address(masterSetupParams.settlement),
                masterSetupParams.settlement.getLastCommittedHeaderEpoch(),
                abi.encode(messageHash),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
                fullProof
            )
        );
        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory ret) = address(sigVerifier).call(data);

        assertTrue(success);
        assertTrue(abi.decode(ret, (bool)));
        vm.stopPrank();
    }

    function test_verifyQuorumSig_FalseZkProof() public {
        bytes32 messageHash = 0x658bc250cfe17f8ad77a5f5d92afb6e9316088b5c89c6df2db63785116b22948;
        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        uint256 signersVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            if (i % 6 != 0) {
                for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                    signersVotingPower += votingPowers[i].vaults[j].value;
                }
            }
        }

        bytes memory zkProof =
            hex"13d086452f3fe7fac6abf4f339daf55bde6b6f950d6be61811b9beb187c14dd309f028a8a30763ce04a7d670dcb3a2d47afadf84d53c20e62964f2d6fe94de020d9636b4c918f9acd95eba0bfa12ff65b1774adbd836409f456249745324b51d17fbb243d0c6900b921f7f671083900cffd164a771272cd94546a59e0ec343dd263ce71215f672efa1a264633cdd112cf836c03f19e8d17fb871939b3187a4f51854de25e3c6798f28b3de47d764601202bf1f13dcb5766f85f82606dfb2ea332d1ea579a163dffe6f85798bed0d78e6f363fd8a8589938fe2ab7cdc1bf5c6a9125502cb1cfc971c5ba2e4783da4abe2103cf2645507eda6c5e04d453a51dc4c0000000110fe29da882e27e8f7750ceaa385ccf63c9b3bb53e10de028a23d2ae3b4511592bc0e0dd165b6a0f2cad89c812d83e55279107d050070a016e93bccd2ecfcc8d07714400658a933cec1a864dc85b609d1b0188a0304becfcad2deed1c8e37132049d45673b0a05d1ae0fd775f34aa975b1adbbb39343d39a2dd9bca3ec373458";

        bytes memory fullProof;

        {
            bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
            bytes memory commitments = Bytes.slice(zkProof, 260, 324);
            bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

            fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);
        }

        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }

        bytes memory data = abi.encodeCall(
            ISigVerifier.verifyQuorumSig,
            (
                address(masterSetupParams.settlement),
                masterSetupParams.settlement.getLastCommittedHeaderEpoch(),
                abi.encode(messageHash),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
                fullProof
            )
        );
        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory ret) = address(sigVerifier).call(data);

        assertTrue(success);
        assertFalse(abi.decode(ret, (bool)));
        vm.stopPrank();
    }

    function test_ZeroValidators() public {
        bytes32 messageHash = 0x658bc250cfe17f8ad77a5f5d92afb6e9316088b5c89c6df2db63785116b22948;
        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        uint256 signersVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            if (i % 6 != 0) {
                for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                    signersVotingPower += votingPowers[i].vaults[j].value;
                }
            }
        }

        bytes memory zkProof =
            hex"13d086452f3fe7fac6abf4f339daf55bde6b6f95fd6be61811b9beb187c14dd309f028a8a30763ce04a7d670dcb3a2d47afadf84d53c20e62964f2d6fe94de020d9636b4c918f9acd95eba0bfa12ff65b1774adbd836409f456249745324b51d17fbb243d0c6900b921f7f671083900cffd164a771272cd94546a59e0ec343dd263ce71215f672efa1a264633cdd112cf836c03f19e8d17fb871939b3187a4f51854de25e3c6798f28b3de47d764601202bf1f13dcb5766f85f82606dfb2ea332d1ea579a163dffe6f85798bed0d78e6f363fd8a8589938fe2ab7cdc1bf5c6a9125502cb1cfc971c5ba2e4783da4abe2103cf2645507eda6c5e04d453a51dc4c0000000110fe29da882e27e8f7750ceaa385ccf63c9b3bb53e10de028a23d2ae3b4511592bc0e0dd165b6a0f2cad89c812d83e55279107d050070a016e93bccd2ecfcc8d07714400658a933cec1a864dc85b609d1b0188a0304becfcad2deed1c8e37132049d45673b0a05d1ae0fd775f34aa975b1adbbb39343d39a2dd9bca3ec373458";

        bytes memory fullProof;

        {
            bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
            bytes memory commitments = Bytes.slice(zkProof, 260, 324);
            bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

            fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);
        }

        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }

        bytes memory data = abi.encodeCall(
            ISigVerifier.verifyQuorumSig,
            (
                address(masterSetupParams.settlement),
                masterSetupParams.settlement.getLastCommittedHeaderEpoch(),
                abi.encode(messageHash),
                KEY_TYPE_BLS_BN254.getKeyTag(15),
                Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
                fullProof
            )
        );

        stdstore.target(address(masterSetupParams.settlement))
            .sig("getExtraDataAt(uint48,bytes32)")
            .with_key(masterSetupParams.settlement.getLastCommittedHeaderEpoch())
            .with_key(uint32(0).getKey(sigVerifier.TOTAL_ACTIVE_VALIDATORS_HASH()))
            .checked_write(bytes32(uint256(0)));

        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory ret) = address(sigVerifier).call(data);

        assertTrue(success);
        assertFalse(abi.decode(ret, (bool)));
        vm.stopPrank();
    }

    function test_RevertInvalidTotalActiveValidators() public {
        bytes32 messageHash = 0x658bc250cfe17f8ad77a5f5d92afb6e9316088b5c89c6df2db63785116b22948;
        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        uint256 signersVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            if (i % 6 != 0) {
                for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                    signersVotingPower += votingPowers[i].vaults[j].value;
                }
            }
        }

        bytes memory zkProof =
            hex"13d086452f3fe7fac6abf4f339daf55bde6b6f95fd6be61811b9beb187c14dd309f028a8a30763ce04a7d670dcb3a2d47afadf84d53c20e62964f2d6fe94de020d9636b4c918f9acd95eba0bfa12ff65b1774adbd836409f456249745324b51d17fbb243d0c6900b921f7f671083900cffd164a771272cd94546a59e0ec343dd263ce71215f672efa1a264633cdd112cf836c03f19e8d17fb871939b3187a4f51854de25e3c6798f28b3de47d764601202bf1f13dcb5766f85f82606dfb2ea332d1ea579a163dffe6f85798bed0d78e6f363fd8a8589938fe2ab7cdc1bf5c6a9125502cb1cfc971c5ba2e4783da4abe2103cf2645507eda6c5e04d453a51dc4c0000000110fe29da882e27e8f7750ceaa385ccf63c9b3bb53e10de028a23d2ae3b4511592bc0e0dd165b6a0f2cad89c812d83e55279107d050070a016e93bccd2ecfcc8d07714400658a933cec1a864dc85b609d1b0188a0304becfcad2deed1c8e37132049d45673b0a05d1ae0fd775f34aa975b1adbbb39343d39a2dd9bca3ec373458";

        bytes memory fullProof;

        {
            bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
            bytes memory commitments = Bytes.slice(zkProof, 260, 324);
            bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

            fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);
        }

        SigVerifierBlsBn254ZK sigVerifier;
        {
            address[] memory verifiers = new address[](3);
            verifiers[0] = address(new Verifier_10());
            verifiers[1] = address(new Verifier_100());
            verifiers[2] = address(new Verifier_1000());
            uint256[] memory maxValidators = new uint256[](verifiers.length);
            maxValidators[0] = 10;
            maxValidators[1] = 100;
            maxValidators[2] = 1000;
            sigVerifier = new SigVerifierBlsBn254ZK(verifiers, maxValidators);
        }

        stdstore.target(address(masterSetupParams.settlement))
            .sig("getExtraDataAt(uint48,bytes32)")
            .with_key(masterSetupParams.settlement.getLastCommittedHeaderEpoch())
            .with_key(uint32(0).getKey(sigVerifier.TOTAL_ACTIVE_VALIDATORS_HASH()))
            .checked_write(bytes32(uint256(1001)));

        vm.startPrank(vars.deployer.addr);
        uint48 lastCommittedHeaderEpoch = masterSetupParams.settlement.getLastCommittedHeaderEpoch();
        vm.expectRevert(ISigVerifierBlsBn254ZK.SigVerifierBlsBn254ZK_InvalidTotalActiveValidators.selector);
        sigVerifier.verifyQuorumSig(
            address(masterSetupParams.settlement),
            lastCommittedHeaderEpoch,
            abi.encode(messageHash),
            KEY_TYPE_BLS_BN254.getKeyTag(15),
            Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
            fullProof
        );

        vm.stopPrank();
    }
}

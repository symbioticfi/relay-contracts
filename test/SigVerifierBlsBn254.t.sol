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
import {SigVerifierBlsBn254} from "../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254.sol";

import {ISigVerifier} from "../src/interfaces/base/ISigVerifier.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SigVerifierBlsBn254Test is MasterGenesisSetup {
    using KeyTag for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;
    using Math for uint256;
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
        bytes32 messageHash = 0x204e0c470c62e2f8426b236c004b581084dd3aaa935ed3afe24dc37e0d040823;
        uint256 totalVotingPower = 30_000_000_000_000;
        uint256 signersVotingPower = 30_000_000_000_000;

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
            hex"1bbfff6bd2dab940e651197642237ce9b2c5d3c4ec761c1498c636c57bb95bc70f49530a1198c69455cd2610373c49520fa928ec515be0fa60fc54ac2bd85de2213a9cc1dbc30d714b201e430181009865153b9890fef27bfaefbeeba0ec1f681bceebfa810aeb7340150fa1add34f4a95e10bfff22738c6a2893f3f868b7e9d10700bc426b575300ec36536e940d317113630f335f48c2fb5e9bec2141b4f4618cd4bc1c884af0573e7bcdab39ff9867f01a1d4514c26caba520186ae70a84017e330c31720ed1d205fef008c4d04e37b00866eac3070740c71d6074f0b0f8f03bb5a30835dc8bf3d4a89200255dc5f6b9c0330dddb54765ba271d8868247ee000000012cfd0371e370f57f6c816e941bb100f74b14e3821976ed3df69235f29df30ead059287c9ab778cbe120f4caafcbb7debaad03b860265043362f45bd22904a3c8076235b408d60d192e44b8f8d7295a0ea94202c3185431ddef1ad6c66325ece40c1742dd5278cddfd2500e3873e800f12250358b96939d11256375e3082030d3";

        bytes memory fullProof;

        {
            bytes memory proof_ = Bytes.slice(zkProof, 0, 256);
            bytes memory commitments = Bytes.slice(zkProof, 260, 324);
            bytes memory commitmentPok = Bytes.slice(zkProof, 324, 388);

            fullProof = abi.encodePacked(proof_, commitments, commitmentPok, signersVotingPower);
        }

        SigVerifierBlsBn254 sigVerifier;
        {
            address zkVerifier = address(new Verifier());
            address[] memory verifiers = new address[](1);
            verifiers[0] = zkVerifier;
            uint256[] memory maxValidators = new uint256[](1);
            maxValidators[0] = 10;
            sigVerifier = new SigVerifierBlsBn254(verifiers, maxValidators);
        }

        assertTrue(
            sigVerifier.verifyQuorumSig(
                address(masterSetupParams.master),
                masterSetupParams.master.getCurrentValSetEpoch(),
                abi.encode(messageHash),
                KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
                Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
                fullProof
            )
        );
    }
}

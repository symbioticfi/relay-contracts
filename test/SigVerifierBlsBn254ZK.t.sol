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

import {Verifier as Verifier_10} from "../src/contracts/implementations/sig-verifiers/zk/Verifier_10.sol";
import {Verifier as Verifier_100} from "../src/contracts/implementations/sig-verifiers/zk/Verifier_100.sol";
import {Verifier as Verifier_1000} from "../src/contracts/implementations/sig-verifiers/zk/Verifier_1000.sol";
import {SigVerifierBlsBn254ZK} from "../src/contracts/implementations/sig-verifiers/SigVerifierBlsBn254ZK.sol";

import {ISigVerifier} from "../src/interfaces/base/ISigVerifier.sol";

import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract SigVerifierBlsBn254ZKTest is MasterGenesisSetup {
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
        vm.warp(vm.getBlockTimestamp() + 0 * masterSetupParams.master.getEpochDuration(0, new bytes(0)));

        setGenesis();
    }

    function test_verifyQuorumSig() public {
        bytes32 messageHash = 0xcca0534ef01f2606de9b6c90df9f0a2e1a18fb5ce4d1f9cf1f94d35b398ebce4;
        uint256 totalVotingPower = masterSetupParams.votingPowerProvider.getTotalVotingPower(new bytes[](0));
        uint256 signersVotingPower = masterSetupParams.votingPowerProvider.getTotalVotingPower(new bytes[](0));

        bytes memory zkProof =
            hex"0c9d92bd8aac8588329e85aade26354a7b9206e170f0df0ee891c3927e5a58522adf6d35c9649dbf628cfe567bc31647d52cf5ae023c88984cecbf01fb477d492761b1f57ca217b83d1851f3e9276e3a758fe92b0f7022d9610ed51e1d7da1521458461ac568a806eb566e1f177baba0bee7c49bbb225347da8d236def25eb3829f4a51eecc66d28b5c973a943d752aa383cbab591b59406da361cbeac1dfcc22afdfa764b84685fabc31a3e5367ca30c2eaa3480ec44a9f847f952da34df4ca0ec698607fb631abd2939ea85d57c69e097b8cdba0734b21154479dc7c39d2a11d2dec162d71b5fad118e59a9dd6917335f251384a3cb16ed48af9f3dbed8266000000011199b925c505c27fe05e9f75e2a0965aea4b6cdb945a4a481c6bc06bd080da701cd2629a69c1946bcd2695c369de10999ce9ec4f0c51d1f8d265460b4f2646d923e00d2fa0a29d4760394d8da2af4f7545377705157c75b86a20044f792a50b30068fdfeaa3eb3be8444c454fdf3629d902034c84714a652394c35da7fa2fb6f";

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

        bytes memory data = abi.encodeWithSelector(
            ISettlement.verifyQuorumSig.selector,
            masterSetupParams.master.getCurrentValSetEpoch(),
            abi.encode(messageHash),
            KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
            Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
            fullProof,
            new bytes(0)
        );
        vm.startPrank(vars.deployer.addr);
        (bool success, bytes memory ret) = address(masterSetupParams.master).call(data);

        assertTrue(success);
        assertTrue(abi.decode(ret, (bool)));
        // assertTrue(
        //     sigVerifier.verifyQuorumSig(
        //         address(masterSetupParams.master),
        //         masterSetupParams.master.getCurrentValSetEpoch(),
        //         abi.encode(messageHash),
        //         KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
        //         Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil).mulDiv(totalVotingPower, 1e18) + 1,
        //         fullProof
        //     )
        // );
        vm.stopPrank();
    }
}

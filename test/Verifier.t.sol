// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console2} from "forge-std/Test.sol";
import {Verifier} from "../src/contracts/implementations/sig-verifiers/zk/HashVerifier.sol";

contract VerifierTest is Test {
    Verifier public verifier;

    function setUp() public {
        verifier = new Verifier();
    }

    function test_VerifyProof() public {
        uint256[8] memory proof = [
            11_259_344_575_957_824_505_569_471_591_131_217_734_551_968_904_254_045_072_668_503_928_117_870_967_861,
            12_372_238_518_341_222_429_586_291_607_693_099_124_806_481_200_148_490_640_976_589_497_870_452_569_706,
            2_592_220_248_331_388_362_578_021_605_491_070_656_152_631_920_481_204_957_928_682_281_037_273_598_568,
            3_603_217_173_207_309_764_989_344_433_739_454_137_106_986_362_430_066_495_832_701_396_284_371_578_584,
            19_824_749_903_096_195_502_885_000_997_124_551_305_171_308_992_855_949_171_409_100_837_531_285_820_236,
            2_679_925_840_037_644_127_212_355_343_802_064_624_418_625_739_277_165_554_362_335_786_354_977_557_600,
            6_946_438_689_566_289_547_180_878_419_849_397_207_659_543_688_045_069_504_145_958_135_109_132_592_393,
            19_910_616_632_734_343_582_456_419_359_077_413_705_785_352_222_630_185_126_063_076_858_060_489_727_493
        ];

        uint256[2] memory commitments = [
            10_665_425_893_805_271_034_823_067_741_462_810_332_848_709_216_276_585_568_202_774_081_800_584_607_901,
            15_716_919_684_523_594_503_658_131_226_591_584_049_424_857_543_226_051_202_221_486_776_098_926_906_520
        ];

        uint256[2] memory commitmentPok = [
            20_640_307_764_888_134_506_176_778_972_854_677_535_318_807_973_827_242_878_891_626_654_659_821_871_773,
            42_700_936_043_624_767_000_952_170_233_233_977_307_525_660_593_156_347_304_289_035_550_143_573_380
        ];

        uint256[10] memory input = [
            13_135_174_975_364_003_986,
            15_049_462_675_729_768_817,
            14_075_989_400_503_486_379,
            2_014_212_811_743_502_784,
            3_042_222_257_416_980_913,
            253_809_691_186_717_763,
            320_565_771_619_168_693,
            3_225_200_386_394_861_427,
            8_979_589_025_089_385_557_053_825_413_193_983_101_083_324_188_806_080_436_473_109_202_925_796_606_557,
            300
        ];

        verifier.verifyProof(proof, commitments, commitmentPok, input);
    }

    function test_VerifyQuorumSig() public {
        uint256[10] calldata input;
        {
            uint256[8] calldata _proof;
            uint256[2] calldata commitments;
            uint256[2] calldata commitmentPok;

            // Extract proof components from the calldata
            // Assuming proof[192 + len:] contains the ZK proof components in the expected format

            // Parse the proof components from the calldata
            assembly {
                // Load each element of the proof array
                _proof := add(proof.offset, 224)

                // Load commitments (2 values)
                commitments := add(proof.offset, 480)

                // Load commitment proof of knowledge (2 values)
                commitmentPok := add(proof.offset, 544)

                // Load input values (10 values)
                input := add(proof.offset, 608)
            }

            try verifier.verifyProof(_proof, commitments, commitmentPok, input) {}
            catch {
                return false;
            }
        }

        uint256 totalActiveVotingPower =
            ISettlementManager(settlementManager).getTotalActiveVotingPowerFromValSetHeader();
        if (
            totalActiveVotingPower - input[9]
                < Math.mulDiv(quorumThreshold, totalActiveVotingPower, QUORUM_THRESHOLD_BASE, Math.Rounding.Ceil)
        ) {
            return false;
        }

        bytes memory aggPublicKeyG1Bytes =
            ISettlementManager(settlementManager).getActiveAggregatedKeyFromValSetHeader(keyTag);
        BN254.G1Point memory nonSignersPublicKeyG1Raw = BN254.G1Point(
            input[0] + input[1] * 2 ** 64 + input[2] * 2 ** 128 + input[3] * 2 ** 192,
            input[4] + input[5] * 2 ** 64 + input[6] * 2 ** 128 + input[7] * 2 ** 192
        );
        bytes calldata signature = proof[0:64];
        bytes calldata aggPublicKeyG2 = proof[64:192];
        return SigBlsBn254.verify(
            aggPublicKeyG1Bytes.fromBytes().unwrap().plus(nonSignersPublicKeyG1Raw.negate()).wrap().toBytes(),
            message,
            signature,
            aggPublicKeyG2
        );
    }
}

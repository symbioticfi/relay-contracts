// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console2} from "forge-std/Test.sol";
import {Verifier} from "../src/contracts/implementations/sig-verifiers/zk/HashVerifier.sol";

import {KeyManagerLogic} from "../src/contracts/base/logic/KeyManagerLogic.sol";
import {KeyBlsBn254} from "../src/contracts/libraries/keys/KeyBlsBn254.sol";
import {SigBlsBn254} from "../src/contracts/libraries/sigs/SigBlsBn254.sol";
import {BN254} from "../src/contracts/libraries/utils/BN254.sol";
import {KeyTag} from "../src/contracts/libraries/utils/KeyTag.sol";

import {ISigVerifier} from "../src/interfaces/base/ISigVerifier.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract VerifierTest is Test {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;
    using KeyTag for uint8;

    Verifier public verifier;

    function setUp() public {
        verifier = new Verifier();
    }

    function test_VerifyProof() public {
        uint256[8] memory proof = [
            5_616_046_827_220_820_150_474_664_575_967_763_695_204_054_487_512_079_889_945_451_783_859_762_705_052,
            14_082_521_680_548_071_498_278_014_482_928_136_053_196_815_893_245_151_238_531_440_241_177_301_158_807,
            5_216_234_952_528_682_999_865_665_883_549_656_497_491_967_437_097_978_481_618_183_417_588_015_182_944,
            15_691_665_214_957_673_690_949_009_117_178_861_190_914_332_192_373_740_591_226_018_841_639_937_944_452,
            15_926_959_584_850_828_749_664_169_526_096_808_587_933_430_191_272_192_199_488_954_978_683_952_782_305,
            12_102_761_508_761_628_145_033_715_287_301_901_185_444_376_101_937_536_318_777_456_977_506_748_748_311,
            6_129_191_198_784_294_185_497_958_815_268_385_918_375_665_093_466_648_477_546_709_547_352_070_014_462,
            17_472_763_918_771_358_856_054_267_893_339_035_657_205_455_945_238_444_418_568_410_620_883_981_440_438
        ];

        uint256[2] memory commitments = [
            12_986_248_808_077_178_648_032_697_226_927_502_558_646_497_838_428_457_477_802_457_034_394_849_271_936,
            14_168_216_973_382_849_624_034_903_703_941_083_186_490_345_229_568_213_134_497_182_237_904_531_639_938
        ];

        uint256[2] memory commitmentPok = [
            9_058_806_989_287_585_852_346_482_298_962_184_375_284_442_517_450_296_846_456_313_114_920_174_225_283,
            2_092_331_491_875_408_689_835_823_149_784_257_415_244_513_952_834_856_319_578_238_208_486_316_687_342
        ];

        uint256[10] memory input = [
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            17_452_784_377_140_135_873_242_247_846_499_243_451_530_443_834_097_508_626_974_155_003_329_264_289_405,
            0
        ];

        verifier.verifyProof(proof, commitments, commitmentPok, input);
    }

    // function test_VerifyQuorumSig() public {
    //     bytes memory proof;
    //     {
    //         uint256[8] memory proof_ = [
    //             18_068_471_592_369_900_080_086_019_929_664_136_990_020_345_338_642_594_076_044_546_406_616_108_860_458,
    //             17_404_282_317_538_194_155_810_149_446_957_107_361_954_541_016_770_782_090_987_143_054_053_364_480_585,
    //             5_369_750_919_927_924_234_025_396_432_672_309_727_864_288_543_891_552_199_896_134_410_126_657_504_620,
    //             10_170_410_621_472_133_693_328_019_160_011_215_295_244_098_738_233_103_419_324_857_659_353_599_495_118,
    //             13_724_077_448_799_128_449_522_428_051_212_972_600_856_794_200_197_668_848_283_270_517_930_669_431_773,
    //             1_668_370_453_211_114_608_160_872_959_498_217_557_159_852_303_010_698_137_494_577_899_846_194_357_485,
    //             12_677_934_797_643_173_707_744_679_549_688_415_133_882_052_265_076_208_500_976_345_587_724_276_574_265,
    //             7_619_731_530_626_530_345_068_899_172_065_582_768_680_986_513_846_990_605_802_634_340_538_856_978_334
    //         ];

    //         uint256[2] memory commitments = [
    //             19_875_655_667_354_794_609_545_585_561_568_489_404_901_806_135_879_266_889_887_830_664_967_755_941_530,
    //             7_167_646_312_549_912_921_910_022_759_870_643_845_931_770_248_061_673_052_775_949_555_374_764_268_373
    //         ];

    //         uint256[2] memory commitmentPok = [
    //             10_513_007_462_152_563_642_470_766_149_209_590_826_593_053_340_436_038_064_892_849_395_252_172_002_705,
    //             47_371_770_325_254_258_771_528_373_396_928_173_288_841_656_173_035_632_142_373_575_737_494_898_625
    //         ];

    //         uint256[10] memory input = [
    //             13_135_174_975_364_003_986,
    //             15_049_462_675_729_768_817,
    //             14_075_989_400_503_486_379,
    //             2_014_212_811_743_502_784,
    //             3_042_222_257_416_980_913,
    //             253_809_691_186_717_763,
    //             320_565_771_619_168_693,
    //             3_225_200_386_394_861_427,
    //             4_710_649_947_027_036_142_537_626_843_986_725_977_990_456_672_471_128_238_006_104_560_326_814_007_781,
    //             300
    //         ];

    //         bytes memory signature = abi.encode(BN254.G1Point(1, 2));
    //         bytes memory aggPublicKeyG2 = abi.encode(BN254.G2Point([uint256(1), uint256(2)], [uint256(3), uint256(4)]));

    //         proof = abi.encodePacked(signature, aggPublicKeyG2, proof_, commitments, commitmentPok, input);
    //     }

    //     bytes memory message = abi.encode(bytes32(0));

    //     SigVerifierBlsBn254Mock sigVerifier = new SigVerifierBlsBn254Mock(address(verifier));

    //     assertTrue(
    //         sigVerifier.verifyQuorumSig(
    //             address(0),
    //             message,
    //             KeyManagerLogic.KEY_TYPE_BLS_BN254.keyTag(15),
    //             uint208(Math.mulDiv(2, 1e18, 3, Math.Rounding.Ceil)),
    //             proof
    //         )
    //     );
    // }
}

contract SigVerifierBlsBn254Mock is ISigVerifier {
    using KeyBlsBn254 for bytes;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyBlsBn254 for BN254.G1Point;
    using SigBlsBn254 for bytes;
    using BN254 for BN254.G1Point;

    Verifier public verifier;

    uint256 public constant QUORUM_THRESHOLD_BASE = 1e18; // 100%

    constructor(
        address _verifier
    ) {
        verifier = Verifier(_verifier);
    }

    function verifyQuorumSig(
        address settlementManager,
        bytes memory message,
        uint8 keyTag,
        uint208 quorumThreshold,
        bytes calldata proof // size | 64 bytes are signature | 128 bytes pubkeyG2 |
    ) public view returns (bool) {
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

        uint256 totalActiveVotingPower = 1_015_185_279_717_969;
        if (
            totalActiveVotingPower - input[9]
                < Math.mulDiv(quorumThreshold, totalActiveVotingPower, QUORUM_THRESHOLD_BASE, Math.Rounding.Ceil)
        ) {
            return false;
        }

        bytes memory aggPublicKeyG1Bytes =
            hex"264621561abeb4dac9a497cb21f305b8f41b56389734832656d7c7adde2247081ffa73b25b82c16096babd6a15d259a24a8304cd96ee6c27e790ff27d8744a5b";
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

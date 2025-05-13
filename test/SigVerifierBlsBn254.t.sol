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

import {MasterSetup} from "./MasterSetup.sol";

import {console2} from "forge-std/console2.sol";

contract SigVerifierBlsBn254Test is MasterSetup {
    using KeyTag for uint8;
    using KeyBlsBn254 for BN254.G1Point;
    using BN254 for BN254.G1Point;
    using KeyBlsBn254 for KeyBlsBn254.KEY_BLS_BN254;
    using KeyEcdsaSecp256k1 for KeyEcdsaSecp256k1.KEY_ECDSA_SECP256K1;

    struct KeyStruct {
        bytes payload;
        uint8 tag;
    }

    struct ValSetHeaderStruct {
        KeyStruct[] activeAggregatedKeys;
        bytes32 extraData;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        uint8 version;
    }

    function setUp() public override {
        MasterSetup.setUp();

        for (uint256 i; i < initSetupParams.masterChain.vaults.length; ++i) {
            console2.log(initSetupParams.masterChain.vaults[i]);
        }
    }

    function test_verifyQuorumSig() public {
        bytes32 messageHash = bytes32(uint256(111));

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
            console2.log(BN254G2._isOnCurve(keyG2.X[1], keyG2.X[0], keyG2.Y[1], keyG2.Y[0]));

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

        assertTrue(
            SigBlsBn254.verify(
                KeyBlsBn254.wrap(aggKeyG1).toBytes(),
                abi.encode(messageHash),
                abi.encode(aggSigG1),
                abi.encode(aggKeyG2)
            )
        );
    }

    // function getG2Key(
    //     uint256 privateKey
    // ) internal view returns (BN254.G2Point memory) {
    //     BN254.G2Point memory G2 = BN254.generatorG2();
    //     (uint256 x1, uint256 x2, uint256 y1, uint256 y2) =
    //         BN254G2.ECTwistMul(privateKey, G2.X[1], G2.X[0], G2.Y[1], G2.Y[0]);
    //     return BN254.G2Point([x2, x1], [y2, y1]);
    // }

    function loadGenesis() public returns (ISettlementManager.ValSetHeader memory valSetHeader) {
        ValSetHeaderStruct memory valSetHeaderStruct;
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/test/data/genesis_header.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            valSetHeaderStruct = abi.decode(data, (ValSetHeaderStruct));
        }

        IBaseKeyManager.Key[] memory activeAggregatedKeys =
            new IBaseKeyManager.Key[](valSetHeaderStruct.activeAggregatedKeys.length);
        for (uint256 i; i < valSetHeaderStruct.activeAggregatedKeys.length; ++i) {
            activeAggregatedKeys[i] = IBaseKeyManager.Key({
                payload: valSetHeaderStruct.activeAggregatedKeys[i].payload,
                tag: valSetHeaderStruct.activeAggregatedKeys[i].tag
            });
        }

        return ISettlementManager.ValSetHeader({
            version: valSetHeaderStruct.version,
            activeAggregatedKeys: activeAggregatedKeys,
            totalActiveVotingPower: valSetHeaderStruct.totalActiveVotingPower,
            validatorsSszMRoot: valSetHeaderStruct.validatorsSszMRoot,
            extraData: abi.encode(valSetHeaderStruct.extraData)
        });
    }
}

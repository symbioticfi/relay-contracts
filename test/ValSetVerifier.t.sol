// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {ValSetVerifier} from "../src/contracts/libraries/utils/ValSetVerifier.sol";

import {ValSetVerifierMock} from "./mocks/ValSetVerifierMock.sol";

contract ValSetVerifierTest is Test {
    ValSetVerifierMock valSetVerifierMock;

    function setUp() public {
        valSetVerifierMock = new ValSetVerifierMock();
    }

    function test_verify() public {
        bytes32[] memory validatorRootProof = new bytes32[](21);
        validatorRootProof[0] = 0x1ecac809801faca2574300e39d4a1abfa6dc6f32e7b0f8cfc84a4fa55bd1cf73;
        validatorRootProof[1] = 0x3e5707b56749e5bd90df7fb27ea26cdeb420f72b1b855b9b87f6bdfb4e7c4f04;
        validatorRootProof[2] = 0xdb56114e00fdd4c1f85c892bf35ac9a89289aaecb1ebd0a96cde606a748b5d71;
        validatorRootProof[3] = 0xc78009fdf07fc56a11f122370658a353aaa542ed63e44c4bc15ff4cd105ab33c;
        validatorRootProof[4] = 0x536d98837f2dd165a55d5eeae91485954472d56f246df256bf3cae19352a123c;
        validatorRootProof[5] = 0x9efde052aa15429fae05bad4d0b1d7c64da64d03d7a1854a588c2cb8430c0d30;
        validatorRootProof[6] = 0xd88ddfeed400a8755596b21942c1497e114c302e6118290f91e6772976041fa1;
        validatorRootProof[7] = 0x87eb0ddba57e35f6d286673802a4af5975e22506c7cf4c64bb6be5ee11527f2c;
        validatorRootProof[8] = 0x26846476fd5fc54a5d43385167c95144f2643f533cc85bb9d16b782f8d7db193;
        validatorRootProof[9] = 0x506d86582d252405b840018792cad2bf1259f1ef5aa5f887e13cb2f0094f51e1;
        validatorRootProof[10] = 0xffff0ad7e659772f9534c195c815efc4014ef1e1daed4404c06385d11192e92b;
        validatorRootProof[11] = 0x6cf04127db05441cd833107a52be852868890e4317e6a02ab47683aa75964220;
        validatorRootProof[12] = 0xb7d05f875f140027ef5118a2247bbb84ce8f2f0f1123623085daf7960c329f5f;
        validatorRootProof[13] = 0xdf6af5f5bbdb6be9ef8aa618e4bf8073960867171e29676f8b284dea6a08a85e;
        validatorRootProof[14] = 0xb58d900f5e182e3c50ef74969ea16c7726c549757cc23523c369587da7293784;
        validatorRootProof[15] = 0xd49a7502ffcfb0340b1d7885688500ca308161a7f96b62df9d083b71fcc8f2bb;
        validatorRootProof[16] = 0x8fe6b1689256c0d385f42f5bbe2027a22c1996e110ba97c171d3e5948de92beb;
        validatorRootProof[17] = 0x8d0d63c39ebade8509e0ae3c9c3876fb5fa112be18f905ecacfecb92057603ab;
        validatorRootProof[18] = 0x95eec8b2e541cad4e91de38385f2e046619f54496c2382cb6cacd5b98c26f5a4;
        validatorRootProof[19] = 0xf893e908917775b62bff23294dbbe3a1cd8e6cc1c35b4801887b646a6f81f17f;
        validatorRootProof[20] = 0x0300000000000000000000000000000000000000000000000000000000000000;

        ValSetVerifier.SszProof memory validatorRootProofStruct = ValSetVerifier.SszProof({
            leaf: 0xc7cc60b8f9968f882d4a9e3c5c04ddf263fedcfbf52bd384a5c20b9763570071,
            proof: validatorRootProof
        });

        bytes32[] memory operatorRootProof = new bytes32[](3);
        operatorRootProof[0] = 0x01b0bcb6a0198e00000000000000000000000000000000000000000000000000;
        operatorRootProof[1] = 0x05514fc7e11f97fc9ba846ba19dcb552857b979e0c558ceaa754abf560f21e49;
        operatorRootProof[2] = 0x034a4394de6d5f5d8850b850d10ba3877030d2b7b4a9d09d4353c771ff3c72bf;

        ValSetVerifier.SszProof memory operatorRootProofStruct = ValSetVerifier.SszProof({
            leaf: 0x1740403ebee1cf24ffb3dc4de0c9f0225dff5a71000000000000000000000000,
            proof: operatorRootProof
        });

        assertTrue(
            valSetVerifierMock.verifyValidatorRootLocal(
                validatorRootProofStruct, 0, 0x86a3631cc2338c25a99fd5c8550a6ef90ffef8ad3ce08160355bf404c5041331
            )
        );

        assertTrue(
            valSetVerifierMock.verifyValidatorOperatorLocal(operatorRootProofStruct, validatorRootProofStruct.leaf)
        );

        assertTrue(
            valSetVerifierMock.verifyOperator(
                validatorRootProofStruct,
                0,
                0x86a3631cc2338c25a99fd5c8550a6ef90ffef8ad3ce08160355bf404c5041331,
                operatorRootProofStruct
            )
        );
    }
}

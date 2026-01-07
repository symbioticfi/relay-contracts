// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

import {BLS12381} from "../../src/libraries/utils/BLS12381.sol";

abstract contract Bls12381GoHelper is Test {
    string internal constant GO_DIR = "test/ffi/bls12381";

    function _goHashToG1(bytes memory message) internal returns (BLS12381.G1Point memory) {
        bytes memory out = _ffi1("hash-to-g1", vm.toString(message));
        return abi.decode(out, (BLS12381.G1Point));
    }

    function _goG1Mul(bytes32 scalar) internal returns (BLS12381.G1Point memory) {
        bytes memory out = _ffi1("g1-mul", vm.toString(scalar));
        return abi.decode(out, (BLS12381.G1Point));
    }

    function _goG2Mul(bytes32 scalar) internal returns (BLS12381.G2Point memory) {
        bytes memory out = _ffi1("g2-mul", vm.toString(scalar));
        return abi.decode(out, (BLS12381.G2Point));
    }

    function _goSign(bytes32 messageHash, bytes32 scalar)
        internal
        returns (BLS12381.G1Point memory, BLS12381.G2Point memory, BLS12381.G1Point memory)
    {
        bytes memory out = _ffi2("sign", vm.toString(messageHash), vm.toString(scalar));
        return abi.decode(out, (BLS12381.G1Point, BLS12381.G2Point, BLS12381.G1Point));
    }

    function _ffi1(string memory subcommand, string memory arg) internal returns (bytes memory) {
        string[] memory args = new string[](7);
        args[0] = "go";
        args[1] = "-C";
        args[2] = GO_DIR;
        args[3] = "run";
        args[4] = ".";
        args[5] = subcommand;
        args[6] = arg;
        return vm.ffi(args);
    }

    function _ffi2(string memory subcommand, string memory arg1, string memory arg2) internal returns (bytes memory) {
        string[] memory args = new string[](8);
        args[0] = "go";
        args[1] = "-C";
        args[2] = GO_DIR;
        args[3] = "run";
        args[4] = ".";
        args[5] = subcommand;
        args[6] = arg1;
        args[7] = arg2;
        return vm.ffi(args);
    }
}

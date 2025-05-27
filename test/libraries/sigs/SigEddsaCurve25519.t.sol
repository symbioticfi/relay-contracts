// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";

import {SigEddsaCurve25519} from "../../../src/contracts/libraries/sigs/unaudited/SigEddsaCurve25519.sol";
import {KeyEddsaCurve25519} from "../../../src/contracts/libraries/keys/unaudited/KeyEddsaCurve25519.sol";

contract SigEddsaCurve25519Test is Test {
    using KeyEddsaCurve25519 for KeyEddsaCurve25519.KEY_EDDSA_CURVE25519;

    function setUp() public {}
}

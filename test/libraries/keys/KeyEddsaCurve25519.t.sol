// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console2} from "forge-std/Test.sol";

import {KeyEddsaCurve25519} from "../../../src/contracts/libraries/keys/unaudited/KeyEddsaCurve25519.sol";

import {KeyEddsaCurve25519Mock} from "../../mocks/KeyEddsaCurve25519Mock.sol";

contract KeyEddsaCurve25519Test is Test {
    using KeyEddsaCurve25519 for bytes32;
    using KeyEddsaCurve25519 for KeyEddsaCurve25519.KEY_EDDSA_CURVE25519;

    KeyEddsaCurve25519Mock mock;

    function setUp() public {
        mock = new KeyEddsaCurve25519Mock();
    }
}

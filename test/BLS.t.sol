// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {POCBaseTest} from "@symbiotic-test/POCBase.t.sol";

import {BLSSqrtTaskMiddleware} from "../src/examples/sqrt-task-network/BLSSqrtTaskMiddleware.sol";
import {IBaseMiddlewareReader} from "../src/interfaces/IBaseMiddlewareReader.sol";

//import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
//import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
// import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {BaseMiddlewareReader} from "../src/middleware/BaseMiddlewareReader.sol";
import {BN254} from "../src/libraries/BN254.sol";
import "forge-std/console.sol";
//import {Slasher} from "@symbiotic/contracts/slasher/Slasher.sol";
//import {VetoSlasher} from "@symbiotic/contracts/slasher/VetoSlasher.sol";

contract OperatorsRegistrationTest is POCBaseTest {
    // using Subnetwork for bytes32;
    // using Subnetwork for address;
    using Math for uint256;

    address network = address(0x123);

    BLSSqrtTaskMiddleware internal middleware;

    uint48 internal slashingWindow = 1200; // 20 minutes
    string internal constant BLS_TEST_DATA = "test/helpers/blsTestVectors.json";

    function setUp() public override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        vm.warp(1_729_690_309);

        super.setUp();

        _deposit(vault1, alice, 1000 ether);
        _deposit(vault2, alice, 1000 ether);
        _deposit(vault3, alice, 1000 ether);

        address readHelper = address(new BaseMiddlewareReader());

        // Initialize middleware contract
        middleware = new BLSSqrtTaskMiddleware(
            address(network),
            slashingWindow,
            address(operatorRegistry),
            address(vaultFactory),
            address(operatorNetworkOptInService),
            readHelper,
            owner
        );

        _registerNetwork(network, address(middleware));

        vm.warp(vm.getBlockTimestamp() + 1);
    }

    function testBLSRegisterOperator() public {
        string memory json = vm.readFile(BLS_TEST_DATA);
        address operator = abi.decode(vm.parseJson(json, ".operator"), (address));
        uint256[] memory keyg1 = vm.parseJsonUintArray(json, ".publicKeyG1");
        uint256[] memory keyg2 = vm.parseJsonUintArray(json, ".publicKeyG2");
        BN254.G1Point memory keyG1 = BN254.G1Point(keyg1[0], keyg1[1]);
        BN254.G2Point memory keyG2 = BN254.G2Point([keyg2[0], keyg2[1]], [keyg2[2], keyg2[3]]);
        uint256[] memory sig = vm.parseJsonUintArray(json, ".signature");
        bytes memory signature = abi.encode(sig[0], sig[1]);
        bytes memory key = abi.encode(keyG1, keyG2);
        console.log("key: ", keyG1.X, keyG1.Y);
        console.logBytes(key);

        // Register operator using Ed25519 signature
        vm.prank(operator);
        middleware.registerOperator(key, address(0), signature);

        // Verify operator is registered correctly
        assertTrue(IBaseMiddlewareReader(address(middleware)).isOperatorRegistered(operator));

        assertEq(abi.decode(IBaseMiddlewareReader(address(middleware)).operatorKey(operator), (bytes32)), bytes32(0));
        vm.warp(block.timestamp + 2);
        assertEq(
            abi.decode(IBaseMiddlewareReader(address(middleware)).operatorKey(operator), (BN254.G1Point)).X, keyG1.X
        );
    }
}

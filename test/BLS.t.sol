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
import {BN254G2} from "../test/libraries/BN254G2.sol";
import "forge-std/console.sol";
//import {Slasher} from "@symbiotic/contracts/slasher/Slasher.sol";
//import {VetoSlasher} from "@symbiotic/contracts/slasher/VetoSlasher.sol";

contract OperatorsRegistrationTest is POCBaseTest {
    // using Subnetwork for bytes32;
    // using Subnetwork for address;
    using Math for uint256;
    using BN254 for BN254.G1Point;

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

    function getG2Key(
        uint256 privateKey
    ) public view returns (BN254.G2Point memory) {
        BN254.G2Point memory G2 = BN254.generatorG2();
        (uint256 x1, uint256 x2, uint256 y1, uint256 y2) =
            BN254G2.ECTwistMul(privateKey, G2.X[1], G2.X[0], G2.Y[1], G2.Y[0]);
        return BN254.G2Point([x2, x1], [y2, y1]);
    }

    function testBLSRegisterOperator() public {
        address operator = address(0x123);
        uint256 privateKey = 123;

        // get G1 public key
        BN254.G1Point memory keyG1 = BN254.generatorG1().scalar_mul(privateKey);
        // get G2 public key
        BN254.G2Point memory keyG2 = getG2Key(privateKey);

        // craft message [operator, keyG1, keyG2]
        bytes memory message = abi.encode(operator, keyG1, keyG2);

        // map hash to G1
        BN254.G1Point memory messageG1 = BN254.hashToG1(keccak256(message));

        // sign message
        BN254.G1Point memory sigG1 = messageG1.scalar_mul(privateKey);

        bytes memory signature = abi.encode(sigG1);
        bytes memory key = abi.encode(keyG1, keyG2);

        // register operator in global registry
        _registerOperator(operator);

        // opt-in operator to network
        _optInOperatorNetwork(operator, network);

        // Register operator using BLS bn254 signature in middleware
        vm.prank(operator);
        middleware.registerOperator(key, address(0), signature);

        // Verify operator is registered correctly
        assertTrue(IBaseMiddlewareReader(address(middleware)).isOperatorRegistered(operator));

        // Verify operator key is registered correctly
        assertEq(abi.decode(IBaseMiddlewareReader(address(middleware)).operatorKey(operator), (bytes32)), bytes32(0));
        vm.warp(block.timestamp + 2);
        assertEq(
            abi.decode(IBaseMiddlewareReader(address(middleware)).operatorKey(operator), (BN254.G1Point)).X, keyG1.X
        );
    }
}

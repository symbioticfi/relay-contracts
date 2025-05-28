// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {ValSetConfigProvider} from "../../../src/contracts/implementations/settlement/ValSetConfigProvider.sol";
import {ValSetConfigProviderLogic} from
    "../../../src/contracts/implementations/settlement/logic/ValSetConfigProviderLogic.sol";
import {IValSetConfigProvider} from "../../../src/interfaces/implementations/settlement/IValSetConfigProvider.sol";

contract TestValSetConfigProvider is ValSetConfigProvider {
    address public owner;

    function initialize(
        IValSetConfigProvider.ValSetConfigProviderInitParams memory initParams,
        address _owner
    ) external initializer {
        __ValSetConfigProvider_init(initParams);
        owner = _owner;
    }

    function _checkPermission() internal view override {
        require(msg.sender == owner, "Not authorized");
    }
}

contract ValSetConfigProviderTest is Test {
    TestValSetConfigProvider private testValSet;

    address private owner = address(0x1234);
    address private nonOwner = address(0x9999);

    function setUp() public {
        testValSet = new TestValSetConfigProvider();

        IValSetConfigProvider.ValSetConfigProviderInitParams memory initParams = IValSetConfigProvider
            .ValSetConfigProviderInitParams({
            maxVotingPower: 1e36,
            minInclusionVotingPower: 0,
            maxValidatorsCount: 100,
            requiredKeyTags: new uint8[](1)
        });
        initParams.requiredKeyTags[0] = 0x2A;

        testValSet.initialize(initParams, owner);
    }

    function testVersion() public {
        assertEq(testValSet.ValSetConfigProvider_VERSION(), 1, "Version mismatch");
    }

    function testInitialConfig() public {
        assertEq(testValSet.getMaxVotingPower(), 1e36, "maxVotingPower mismatch");
        assertEq(testValSet.getMinInclusionVotingPower(), 0, "minInclusion mismatch");
        assertEq(testValSet.getMaxValidatorsCount(), 100, "maxValidators mismatch");

        uint8[] memory reqTags = testValSet.getRequiredKeyTags();
        assertEq(reqTags.length, 1, "Should have 1 required keyTag");
        assertEq(reqTags[0], 0x2A, "KeyTag mismatch");
    }

    function testPermissionChecks() public {
        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testValSet.setMaxVotingPower(999_999);

        vm.prank(owner);
        testValSet.setMaxVotingPower(999_999);

        assertEq(testValSet.getMaxVotingPower(), 999_999);
    }

    function testUpdateAllConfigs() public {
        vm.startPrank(owner);
        testValSet.setMaxVotingPower(5000);
        testValSet.setMinInclusionVotingPower(123);
        testValSet.setMaxValidatorsCount(777);
        uint8[] memory newTags = new uint8[](2);
        newTags[0] = 1;
        newTags[1] = 2;
        testValSet.setRequiredKeyTags(newTags);
        vm.stopPrank();

        assertEq(testValSet.getMaxVotingPower(), 5000);
        assertEq(testValSet.getMinInclusionVotingPower(), 123);
        assertEq(testValSet.getMaxValidatorsCount(), 777);
        uint8[] memory gotTags = testValSet.getRequiredKeyTags();
        assertEq(gotTags.length, 2);
        assertEq(gotTags[0], 1);
        assertEq(gotTags[1], 2);

        assertEq(testValSet.getMaxVotingPowerAt(uint48(block.timestamp), ""), 5000);
        assertEq(testValSet.getMinInclusionVotingPowerAt(uint48(block.timestamp), ""), 123);
        assertEq(testValSet.getMaxValidatorsCountAt(uint48(block.timestamp), ""), 777);
        uint8[] memory gotTagsAt = testValSet.getRequiredKeyTagsAt(uint48(block.timestamp), "");
        assertEq(gotTagsAt.length, 2);
        assertEq(gotTagsAt[0], 1);
        assertEq(gotTagsAt[1], 2);

        vm.warp(block.timestamp + 100);

        vm.startPrank(owner);
        testValSet.setMaxVotingPower(999);
        testValSet.setMinInclusionVotingPower(124);
        testValSet.setMaxValidatorsCount(778);
        uint8[] memory newTags2 = new uint8[](1);
        newTags2[0] = 3;
        testValSet.setRequiredKeyTags(newTags2);
        vm.stopPrank();

        assertEq(testValSet.getMaxVotingPowerAt(uint48(block.timestamp) - 1, ""), 5000);
        assertEq(testValSet.getMinInclusionVotingPowerAt(uint48(block.timestamp) - 1, ""), 123);
        assertEq(testValSet.getMaxValidatorsCountAt(uint48(block.timestamp) - 1, ""), 777);
        uint8[] memory gotTagsAt2 = testValSet.getRequiredKeyTagsAt(uint48(block.timestamp) - 1, "");
        assertEq(gotTagsAt2.length, 2);
        assertEq(gotTagsAt2[0], 1);
        assertEq(gotTagsAt2[1], 2);

        assertEq(testValSet.getMaxVotingPowerAt(uint48(block.timestamp + 100), ""), 999);
        assertEq(testValSet.getMinInclusionVotingPowerAt(uint48(block.timestamp + 100), ""), 124);
        assertEq(testValSet.getMaxValidatorsCountAt(uint48(block.timestamp + 100), ""), 778);
        uint8[] memory gotTagsAt3 = testValSet.getRequiredKeyTagsAt(uint48(block.timestamp + 100), "");
        assertEq(gotTagsAt3.length, 1);
        assertEq(gotTagsAt3[0], 3);

        IValSetConfigProvider.ValSetConfig memory cfg = testValSet.getValSetConfigAt(uint48(block.timestamp), "");
        assertEq(cfg.maxVotingPower, 999);
        assertEq(cfg.minInclusionVotingPower, 124);
        assertEq(cfg.maxValidatorsCount, 778);
        assertEq(cfg.requiredKeyTags.length, 1);
        assertEq(cfg.requiredKeyTags[0], 3);
    }

    function testTimeBasedConfig() public {
        vm.warp(block.timestamp + 100);

        vm.prank(owner);
        testValSet.setMaxVotingPower(999);

        uint256 oldValue = testValSet.getMaxVotingPowerAt(uint48(block.timestamp - 1), "");
        assertEq(oldValue, 1e36, "Old maxVotingPower mismatch");

        uint256 newValue = testValSet.getMaxVotingPowerAt(uint48(block.timestamp), "");
        assertEq(newValue, 999, "New maxVotingPower mismatch");
    }

    function testGetValSetConfig() public {
        IValSetConfigProvider.ValSetConfig memory cfg = testValSet.getValSetConfig();
        assertEq(cfg.maxVotingPower, 1e36, "maxVotingPower mismatch");
        assertEq(cfg.minInclusionVotingPower, 0, "minInclusion mismatch");
        assertEq(cfg.maxValidatorsCount, 100, "maxValidators mismatch");
        assertEq(cfg.requiredKeyTags.length, 1, "tags length mismatch");
        assertEq(cfg.requiredKeyTags[0], 0x2A, "tag mismatch");
    }

    function test_Location() public {
        bytes32 location = keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ValSetConfigProvider")) - 1))
            & ~bytes32(uint256(0xff));
        assertEq(location, 0x0e26c25c7769fd2876414d74c7d7fb400553bc4a9e17cd87546c1439a6ebe100, "location mismatch");
    }
}

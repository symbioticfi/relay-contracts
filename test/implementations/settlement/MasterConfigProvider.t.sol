// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {MasterConfigProvider} from "../../../src/contracts/implementations/settlement/MasterConfigProvider.sol";
import {IMasterConfigProvider} from "../../../src/interfaces/implementations/settlement/IMasterConfigProvider.sol";

contract TestMasterConfigProvider is MasterConfigProvider {
    address public owner;

    function initialize(
        IMasterConfigProvider.MasterConfigProviderInitParams memory initParams,
        address _owner
    ) external initializer {
        __MasterConfigProvider_init(initParams);
        owner = _owner;
    }

    function _checkPermission() internal view override {
        require(msg.sender == owner, "Not authorized");
    }
}

contract MasterConfigProviderTest is Test {
    TestMasterConfigProvider private testMCP;

    address private owner = address(this);
    address private nonOwner = address(0x1111);

    function cca(
        address _addr,
        uint64 _chainId
    ) internal pure returns (IMasterConfigProvider.CrossChainAddress memory) {
        return IMasterConfigProvider.CrossChainAddress({addr: _addr, chainId: _chainId});
    }

    function setUp() public {
        testMCP = new TestMasterConfigProvider();

        IMasterConfigProvider.CrossChainAddress[] memory vpps = new IMasterConfigProvider.CrossChainAddress[](2);
        vpps[0] = cca(address(0xAA01), 101);
        vpps[1] = cca(address(0xAA02), 102);

        IMasterConfigProvider.CrossChainAddress memory keysProv = cca(address(444), 222);

        IMasterConfigProvider.CrossChainAddress[] memory reps = new IMasterConfigProvider.CrossChainAddress[](1);
        reps[0] = cca(address(0xBB01), 303);

        IMasterConfigProvider.MasterConfigProviderInitParams memory initParams = IMasterConfigProvider
            .MasterConfigProviderInitParams({
            votingPowerProviders: vpps,
            keysProvider: keysProv,
            replicas: reps,
            verificationType: 7
        });

        testMCP.initialize(initParams, owner);
    }

    function testVersion() public {
        assertEq(testMCP.MasterConfigProvider_VERSION(), 1, "Version mismatch");
    }

    function testInitialConfig() public {
        IMasterConfigProvider.CrossChainAddress[] memory vpps = testMCP.getActiveVotingPowerProviders();
        assertEq(vpps.length, 2, "Should have 2 votingPowerProviders");
        assertEq(vpps[0].addr, address(0xAA01));
        assertEq(vpps[0].chainId, 101);
        assertEq(vpps[1].addr, address(0xAA02));
        assertEq(vpps[1].chainId, 102);

        assertEq(testMCP.isVotingPowerProviderActive(vpps[0]), true);
        assertEq(testMCP.isVotingPowerProviderActive(vpps[1]), true);
        assertEq(testMCP.isVotingPowerProviderActive(cca(address(0xAA03), 103)), false);

        IMasterConfigProvider.CrossChainAddress[] memory activeVpps =
            testMCP.getActiveVotingPowerProvidersAt(uint48(vm.getBlockTimestamp()), new bytes[](0));
        assertEq(activeVpps.length, 2, "Should have 2 active votingPowerProviders");
        assertEq(activeVpps[0].addr, address(0xAA01));
        assertEq(activeVpps[0].chainId, 101);
        assertEq(activeVpps[1].addr, address(0xAA02));
        assertEq(activeVpps[1].chainId, 102);

        assertEq(testMCP.isVotingPowerProviderActiveAt(vpps[0], uint48(vm.getBlockTimestamp()), ""), true);
        assertEq(testMCP.isVotingPowerProviderActiveAt(vpps[1], uint48(vm.getBlockTimestamp()), ""), true);
        assertEq(
            testMCP.isVotingPowerProviderActiveAt(cca(address(0xAA03), 103), uint48(vm.getBlockTimestamp()), ""), false
        );

        IMasterConfigProvider.CrossChainAddress memory keysP = testMCP.getKeysProvider();
        assertEq(keysP.addr, address(444), "keysProvider addr mismatch");
        assertEq(keysP.chainId, 222, "keysProvider chainId mismatch");

        IMasterConfigProvider.CrossChainAddress[] memory reps = testMCP.getActiveReplicas();
        assertEq(reps.length, 1, "Should have 1 replica");
        assertEq(reps[0].addr, address(0xBB01));
        assertEq(reps[0].chainId, 303);

        uint32 vt = testMCP.getVerificationType();
        assertEq(vt, 7, "verificationType mismatch");

        IMasterConfigProvider.MasterConfig memory mc = testMCP.getMasterConfig();
        assertEq(mc.votingPowerProviders.length, 2);
        assertEq(mc.votingPowerProviders[0].addr, address(0xAA01));
        assertEq(mc.keysProvider.addr, address(444));
        assertEq(mc.replicas.length, 1);
        assertEq(mc.verificationType, 7);
    }

    function testPermissionChecks() public {
        IMasterConfigProvider.CrossChainAddress memory newVPP = cca(address(0xAA03), 103);
        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.addVotingPowerProvider(newVPP);

        vm.prank(owner);
        testMCP.addVotingPowerProvider(newVPP);

        vm.prank(owner);
        vm.expectRevert(IMasterConfigProvider.MasterConfigProvider_AlreadyAdded.selector);
        testMCP.addVotingPowerProvider(newVPP);

        IMasterConfigProvider.CrossChainAddress[] memory vpps = testMCP.getActiveVotingPowerProviders();
        assertEq(vpps.length, 3, "Now have 3 vpps");
    }

    function testAddRemoveVotingPowerProvider() public {
        IMasterConfigProvider.CrossChainAddress memory vpp4 = cca(address(0xAA04), 104);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.addVotingPowerProvider(vpp4);

        vm.prank(owner);
        testMCP.addVotingPowerProvider(vpp4);
        IMasterConfigProvider.CrossChainAddress[] memory vpps = testMCP.getActiveVotingPowerProviders();
        assertEq(vpps.length, 3, "Should have 3 after adding vpp4");

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.removeVotingPowerProvider(vpp4);

        vm.prank(owner);
        testMCP.removeVotingPowerProvider(vpp4);
        vpps = testMCP.getActiveVotingPowerProviders();
        assertEq(vpps.length, 2);

        vm.prank(owner);
        vm.expectRevert(IMasterConfigProvider.MasterConfigProvider_NotAdded.selector);
        testMCP.removeVotingPowerProvider(vpp4);
    }

    function testSetKeysProvider() public {
        IMasterConfigProvider.CrossChainAddress memory newKeys = cca(address(4444), 555);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.setKeysProvider(newKeys);

        vm.prank(owner);
        testMCP.setKeysProvider(newKeys);

        IMasterConfigProvider.CrossChainAddress memory got = testMCP.getKeysProvider();
        assertEq(got.addr, address(4444));
        assertEq(got.chainId, 555);

        got = testMCP.getKeysProviderAt(uint48(vm.getBlockTimestamp()), "");
        assertEq(got.addr, address(4444));
        assertEq(got.chainId, 555);
    }

    function testAddRemoveReplica() public {
        IMasterConfigProvider.CrossChainAddress memory rep2 = cca(address(0xBB02), 304);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.addReplica(rep2);

        vm.prank(owner);
        testMCP.addReplica(rep2);
        IMasterConfigProvider.CrossChainAddress[] memory reps = testMCP.getActiveReplicas();
        assertEq(reps.length, 2, "Should have 2 replicas now");
        assertEq(reps[1].addr, address(0xBB02));

        vm.prank(owner);
        vm.expectRevert(IMasterConfigProvider.MasterConfigProvider_AlreadyAdded.selector);
        testMCP.addReplica(rep2);

        reps = testMCP.getActiveReplicasAt(uint48(vm.getBlockTimestamp()), new bytes[](0));
        assertEq(reps.length, 2, "Should have 2 replicas now");
        assertEq(reps[1].addr, address(0xBB02));

        assertEq(testMCP.isReplicaActive(rep2), true);
        assertEq(testMCP.isReplicaActiveAt(rep2, uint48(vm.getBlockTimestamp()), ""), true);
        assertEq(testMCP.isReplicaActive(cca(address(0xBB03), 305)), false);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.removeReplica(rep2);

        vm.prank(owner);
        testMCP.removeReplica(rep2);
        reps = testMCP.getActiveReplicas();
        assertEq(reps.length, 1);

        vm.prank(owner);
        vm.expectRevert(IMasterConfigProvider.MasterConfigProvider_NotAdded.selector);
        testMCP.removeReplica(rep2);
    }

    function testSetVerificationType() public {
        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.setVerificationType(999);

        vm.prank(owner);
        testMCP.setVerificationType(999);

        assertEq(testMCP.getVerificationType(), 999);
    }

    function testTimeBasedQueries() public {
        vm.warp(vm.getBlockTimestamp() + 100);

        vm.startPrank(owner);
        testMCP.setVerificationType(777);
        vm.stopPrank();

        uint32 oldVT = testMCP.getVerificationTypeAt(uint48(vm.getBlockTimestamp() - 1), "");
        assertEq(oldVT, 7);

        uint32 newVT = testMCP.getVerificationTypeAt(uint48(vm.getBlockTimestamp()), "");
        assertEq(newVT, 777);

        IMasterConfigProvider.MasterConfig memory mcOld =
            testMCP.getMasterConfigAt(uint48(vm.getBlockTimestamp() - 1), "");
        assertEq(mcOld.verificationType, 7);

        IMasterConfigProvider.MasterConfig memory mcNew = testMCP.getMasterConfigAt(uint48(vm.getBlockTimestamp()), "");
        assertEq(mcNew.verificationType, 777);
    }

    function test_Location() public {
        bytes32 location = keccak256(abi.encode(uint256(keccak256("symbiotic.storage.MasterConfigProvider")) - 1))
            & ~bytes32(uint256(0xff));
        assertEq(location, 0x3b25976de016b97f279165d4656d567d2e016e58c5d4ca9db65295c2ee815b00, "location mismatch");
    }
}

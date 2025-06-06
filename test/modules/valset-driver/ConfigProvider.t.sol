// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import {ConfigProvider} from "../../../src/contracts/modules/valset-driver/ConfigProvider.sol";
import {IConfigProvider} from "../../../src/interfaces/modules/valset-driver/IConfigProvider.sol";

contract TestConfigProvider is ConfigProvider {
    address public owner;

    function initialize(
        IConfigProvider.ConfigProviderInitParams memory initParams,
        address _owner
    ) external initializer {
        __ConfigProvider_init(initParams);
        owner = _owner;
    }

    function _checkPermission() internal view override {
        require(msg.sender == owner, "Not authorized");
    }
}

contract ConfigProviderTest is Test {
    TestConfigProvider private testMCP;

    address private owner = address(this);
    address private nonOwner = address(0x1111);

    function cca(address _addr, uint64 _chainId) internal pure returns (IConfigProvider.CrossChainAddress memory) {
        return IConfigProvider.CrossChainAddress({addr: _addr, chainId: _chainId});
    }

    function setUp() public {
        testMCP = new TestConfigProvider();

        IConfigProvider.CrossChainAddress[] memory vpps = new IConfigProvider.CrossChainAddress[](2);
        vpps[0] = cca(address(0xAA01), 101);
        vpps[1] = cca(address(0xAA02), 102);

        IConfigProvider.CrossChainAddress memory keysProv = cca(address(444), 222);

        IConfigProvider.CrossChainAddress[] memory reps = new IConfigProvider.CrossChainAddress[](1);
        reps[0] = cca(address(0xBB01), 303);

        uint8[] memory requiredKeyTags = new uint8[](1);
        requiredKeyTags[0] = 0x2A;
        IConfigProvider.ConfigProviderInitParams memory initParams = IConfigProvider.ConfigProviderInitParams({
            votingPowerProviders: vpps,
            keysProvider: keysProv,
            replicas: reps,
            verificationType: 7,
            maxVotingPower: 1e36,
            minInclusionVotingPower: 0,
            maxValidatorsCount: 100,
            requiredKeyTags: requiredKeyTags,
            requiredKeyTag: requiredKeyTags[0]
        });

        testMCP.initialize(initParams, owner);
    }

    function test_Version() public {
        assertEq(testMCP.ConfigProvider_VERSION(), 1, "Version mismatch");
    }

    function test_InitialConfig() public {
        assertEq(testMCP.getMaxVotingPower(), 1e36, "maxVotingPower mismatch");
        assertEq(testMCP.getMinInclusionVotingPower(), 0, "minInclusion mismatch");
        assertEq(testMCP.getMaxValidatorsCount(), 100, "maxValidators mismatch");

        uint8[] memory reqTags = testMCP.getRequiredKeyTags();
        assertEq(reqTags.length, 1, "Should have 1 required keyTag");
        assertEq(reqTags[0], 0x2A, "KeyTag mismatch");

        IConfigProvider.CrossChainAddress[] memory vpps = testMCP.getVotingPowerProviders();
        assertEq(vpps.length, 2, "Should have 2 votingPowerProviders");
        assertEq(vpps[0].addr, address(0xAA01));
        assertEq(vpps[0].chainId, 101);
        assertEq(vpps[1].addr, address(0xAA02));
        assertEq(vpps[1].chainId, 102);

        assertEq(testMCP.isVotingPowerProviderRegistered(vpps[0]), true);
        assertEq(testMCP.isVotingPowerProviderRegistered(vpps[1]), true);
        assertEq(testMCP.isVotingPowerProviderRegistered(cca(address(0xAA03), 103)), false);

        IConfigProvider.CrossChainAddress[] memory registeredVpps =
            testMCP.getVotingPowerProvidersAt(uint48(vm.getBlockTimestamp()));
        assertEq(registeredVpps.length, 2, "Should have 2 registered votingPowerProviders");
        assertEq(registeredVpps[0].addr, address(0xAA01));
        assertEq(registeredVpps[0].chainId, 101);
        assertEq(registeredVpps[1].addr, address(0xAA02));
        assertEq(registeredVpps[1].chainId, 102);

        assertEq(testMCP.isVotingPowerProviderRegisteredAt(vpps[0], uint48(vm.getBlockTimestamp())), true);
        assertEq(testMCP.isVotingPowerProviderRegisteredAt(vpps[1], uint48(vm.getBlockTimestamp())), true);
        assertEq(
            testMCP.isVotingPowerProviderRegisteredAt(cca(address(0xAA03), 103), uint48(vm.getBlockTimestamp())), false
        );

        IConfigProvider.CrossChainAddress memory keysP = testMCP.getKeysProvider();
        assertEq(keysP.addr, address(444), "keysProvider addr mismatch");
        assertEq(keysP.chainId, 222, "keysProvider chainId mismatch");

        IConfigProvider.CrossChainAddress[] memory reps = testMCP.getReplicas();
        assertEq(reps.length, 1, "Should have 1 replica");
        assertEq(reps[0].addr, address(0xBB01));
        assertEq(reps[0].chainId, 303);

        uint32 vt = testMCP.getVerificationType();
        assertEq(vt, 7, "verificationType mismatch");

        IConfigProvider.Config memory mc = testMCP.getConfig();
        assertEq(mc.votingPowerProviders.length, 2);
        assertEq(mc.votingPowerProviders[0].addr, address(0xAA01));
        assertEq(mc.keysProvider.addr, address(444));
        assertEq(mc.replicas.length, 1);
        assertEq(mc.verificationType, 7);
    }

    function test_PermissionChecks() public {
        IConfigProvider.CrossChainAddress memory newVPP = cca(address(0xAA03), 103);
        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.addVotingPowerProvider(newVPP);

        vm.prank(owner);
        testMCP.addVotingPowerProvider(newVPP);

        vm.prank(owner);
        vm.expectRevert(IConfigProvider.ConfigProvider_AlreadyAdded.selector);
        testMCP.addVotingPowerProvider(newVPP);

        IConfigProvider.CrossChainAddress[] memory vpps = testMCP.getVotingPowerProviders();
        assertEq(vpps.length, 3, "Now have 3 vpps");

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.setMaxVotingPower(999_999);

        vm.prank(owner);
        testMCP.setMaxVotingPower(999_999);

        assertEq(testMCP.getMaxVotingPower(), 999_999);
    }

    function test_AddRemoveVotingPowerProvider() public {
        IConfigProvider.CrossChainAddress memory vpp4 = cca(address(0xAA04), 104);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.addVotingPowerProvider(vpp4);

        vm.prank(owner);
        testMCP.addVotingPowerProvider(vpp4);
        IConfigProvider.CrossChainAddress[] memory vpps = testMCP.getVotingPowerProviders();
        assertEq(vpps.length, 3, "Should have 3 after adding vpp4");

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.removeVotingPowerProvider(vpp4);

        vm.prank(owner);
        testMCP.removeVotingPowerProvider(vpp4);
        vpps = testMCP.getVotingPowerProviders();
        assertEq(vpps.length, 2);

        vm.prank(owner);
        vm.expectRevert(IConfigProvider.ConfigProvider_NotAdded.selector);
        testMCP.removeVotingPowerProvider(vpp4);
    }

    function test_SetKeysProvider() public {
        IConfigProvider.CrossChainAddress memory newKeys = cca(address(4444), 555);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.setKeysProvider(newKeys);

        vm.prank(owner);
        testMCP.setKeysProvider(newKeys);

        IConfigProvider.CrossChainAddress memory got = testMCP.getKeysProvider();
        assertEq(got.addr, address(4444));
        assertEq(got.chainId, 555);

        got = testMCP.getKeysProviderAt(uint48(vm.getBlockTimestamp()));
        assertEq(got.addr, address(4444));
        assertEq(got.chainId, 555);
    }

    function test_AddRemoveReplica() public {
        IConfigProvider.CrossChainAddress memory rep2 = cca(address(0xBB02), 304);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.addReplica(rep2);

        vm.prank(owner);
        testMCP.addReplica(rep2);
        IConfigProvider.CrossChainAddress[] memory reps = testMCP.getReplicas();
        assertEq(reps.length, 2, "Should have 2 replicas now");
        assertEq(reps[1].addr, address(0xBB02));

        vm.prank(owner);
        vm.expectRevert(IConfigProvider.ConfigProvider_AlreadyAdded.selector);
        testMCP.addReplica(rep2);

        reps = testMCP.getReplicasAt(uint48(vm.getBlockTimestamp()));
        assertEq(reps.length, 2, "Should have 2 replicas now");
        assertEq(reps[1].addr, address(0xBB02));

        assertEq(testMCP.isReplicaRegistered(rep2), true);
        assertEq(testMCP.isReplicaRegisteredAt(rep2, uint48(vm.getBlockTimestamp())), true);
        assertEq(testMCP.isReplicaRegistered(cca(address(0xBB03), 305)), false);

        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.removeReplica(rep2);

        vm.prank(owner);
        testMCP.removeReplica(rep2);
        reps = testMCP.getReplicas();
        assertEq(reps.length, 1);

        vm.prank(owner);
        vm.expectRevert(IConfigProvider.ConfigProvider_NotAdded.selector);
        testMCP.removeReplica(rep2);
    }

    function test_SetVerificationType() public {
        vm.prank(nonOwner);
        vm.expectRevert("Not authorized");
        testMCP.setVerificationType(999);

        vm.prank(owner);
        testMCP.setVerificationType(999);

        assertEq(testMCP.getVerificationType(), 999);
    }

    function test_TimeBasedQueries() public {
        vm.warp(vm.getBlockTimestamp() + 100);

        vm.startPrank(owner);
        testMCP.setVerificationType(777);
        vm.stopPrank();

        uint32 oldVT = testMCP.getVerificationTypeAt(uint48(vm.getBlockTimestamp() - 1));
        assertEq(oldVT, 7);

        uint32 newVT = testMCP.getVerificationTypeAt(uint48(vm.getBlockTimestamp()));
        assertEq(newVT, 777);

        IConfigProvider.Config memory mcOld = testMCP.getConfigAt(uint48(vm.getBlockTimestamp() - 1));
        assertEq(mcOld.verificationType, 7);

        IConfigProvider.Config memory mcNew = testMCP.getConfigAt(uint48(vm.getBlockTimestamp()));
        assertEq(mcNew.verificationType, 777);
    }

    function test_Location() public {
        bytes32 location =
            keccak256(abi.encode(uint256(keccak256("symbiotic.storage.ConfigProvider")) - 1)) & ~bytes32(uint256(0xff));
        assertEq(location, 0x69cc2103f98d9422293b17af4701294142032f76ec5b84d4141038932799fa00, "location mismatch");
    }

    function test_UpdateAllConfigs() public {
        vm.startPrank(owner);
        testMCP.setMaxVotingPower(5000);
        testMCP.setMinInclusionVotingPower(123);
        testMCP.setMaxValidatorsCount(777);
        uint8[] memory newTags = new uint8[](2);
        newTags[0] = 1;
        newTags[1] = 2;
        testMCP.setRequiredKeyTags(newTags);
        testMCP.setRequiredKeyTag(3);
        vm.stopPrank();

        assertEq(testMCP.getMaxVotingPower(), 5000);
        assertEq(testMCP.getMinInclusionVotingPower(), 123);
        assertEq(testMCP.getMaxValidatorsCount(), 777);
        uint8[] memory gotTags = testMCP.getRequiredKeyTags();
        assertEq(gotTags.length, 2);
        assertEq(gotTags[0], 1);
        assertEq(gotTags[1], 2);

        assertEq(testMCP.getMaxVotingPowerAt(uint48(vm.getBlockTimestamp())), 5000);
        assertEq(testMCP.getMinInclusionVotingPowerAt(uint48(vm.getBlockTimestamp())), 123);
        assertEq(testMCP.getMaxValidatorsCountAt(uint48(vm.getBlockTimestamp())), 777);
        uint8[] memory gotTagsAt = testMCP.getRequiredKeyTagsAt(uint48(vm.getBlockTimestamp()));
        assertEq(gotTagsAt.length, 2);
        assertEq(gotTagsAt[0], 1);
        assertEq(gotTagsAt[1], 2);

        vm.warp(vm.getBlockTimestamp() + 100);

        vm.startPrank(owner);
        testMCP.setMaxVotingPower(999);
        testMCP.setMinInclusionVotingPower(124);
        testMCP.setMaxValidatorsCount(778);
        uint8[] memory newTags2 = new uint8[](1);
        newTags2[0] = 3;
        testMCP.setRequiredKeyTags(newTags2);
        testMCP.setRequiredKeyTag(4);
        vm.stopPrank();

        assertEq(testMCP.getMaxVotingPowerAt(uint48(vm.getBlockTimestamp()) - 1), 5000);
        assertEq(testMCP.getMinInclusionVotingPowerAt(uint48(vm.getBlockTimestamp()) - 1), 123);
        assertEq(testMCP.getMaxValidatorsCountAt(uint48(vm.getBlockTimestamp()) - 1), 777);
        uint8[] memory gotTagsAt2 = testMCP.getRequiredKeyTagsAt(uint48(vm.getBlockTimestamp()) - 1);
        assertEq(gotTagsAt2.length, 2);
        assertEq(gotTagsAt2[0], 1);
        assertEq(gotTagsAt2[1], 2);
        assertEq(testMCP.getRequiredKeyTagAt(uint48(vm.getBlockTimestamp()) - 1), 3);

        assertEq(testMCP.getMaxVotingPowerAt(uint48(vm.getBlockTimestamp() + 100)), 999);
        assertEq(testMCP.getMinInclusionVotingPowerAt(uint48(vm.getBlockTimestamp() + 100)), 124);
        assertEq(testMCP.getMaxValidatorsCountAt(uint48(vm.getBlockTimestamp() + 100)), 778);
        uint8[] memory gotTagsAt3 = testMCP.getRequiredKeyTagsAt(uint48(vm.getBlockTimestamp() + 100));
        assertEq(gotTagsAt3.length, 1);
        assertEq(gotTagsAt3[0], 3);
        assertEq(testMCP.getRequiredKeyTag(), 4);
        assertEq(testMCP.getRequiredKeyTagAt(uint48(vm.getBlockTimestamp())), 4);

        IConfigProvider.Config memory cfg = testMCP.getConfigAt(uint48(vm.getBlockTimestamp()));
        assertEq(cfg.maxVotingPower, 999);
        assertEq(cfg.minInclusionVotingPower, 124);
        assertEq(cfg.maxValidatorsCount, 778);
        assertEq(cfg.requiredKeyTags.length, 1);
        assertEq(cfg.requiredKeyTags[0], 3);
        assertEq(cfg.requiredKeyTag, 4);
    }

    function test_TimeBasedConfig() public {
        vm.warp(vm.getBlockTimestamp() + 100);

        vm.prank(owner);
        testMCP.setMaxVotingPower(999);

        uint256 oldValue = testMCP.getMaxVotingPowerAt(uint48(vm.getBlockTimestamp() - 1));
        assertEq(oldValue, 1e36, "Old maxVotingPower mismatch");

        uint256 newValue = testMCP.getMaxVotingPowerAt(uint48(vm.getBlockTimestamp()));
        assertEq(newValue, 999, "New maxVotingPower mismatch");
    }

    function test_GetValSetConfig() public {
        IConfigProvider.Config memory cfg = testMCP.getConfig();
        assertEq(cfg.maxVotingPower, 1e36, "maxVotingPower mismatch");
        assertEq(cfg.minInclusionVotingPower, 0, "minInclusion mismatch");
        assertEq(cfg.maxValidatorsCount, 100, "maxValidators mismatch");
        assertEq(cfg.requiredKeyTags.length, 1, "tags length mismatch");
        assertEq(cfg.requiredKeyTags[0], 0x2A, "tag mismatch");
    }
}

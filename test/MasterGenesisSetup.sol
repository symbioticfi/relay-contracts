// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./MasterSetup.sol";

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {stdJson} from "forge-std/StdJson.sol";

contract MasterGenesisSetupTest is MasterSetupTest {
    using Math for uint256;
    using stdJson for string;

    function setUp() public virtual override {
        MasterSetupTest.setUp();

        vm.warp(masterSetupParams.valSetDriver.getEpochStart(0) + 1);

        vm.startBroadcast(vars.deployer.privateKey);
        (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData) = loadGenesis();
        valSetHeader.captureTimestamp = masterSetupParams.valSetDriver.getCurrentEpochStart();
        valSetHeader.epoch = masterSetupParams.valSetDriver.getCurrentEpoch();
        valSetHeader.requiredKeyTag = masterSetupParams.valSetDriver.getRequiredHeaderKeyTag();
        valSetHeader.version = masterSetupParams.settlement.VALIDATOR_SET_VERSION();

        IVotingPowerProvider.OperatorVotingPower[] memory votingPowers =
            masterSetupParams.votingPowerProvider.getVotingPowers(new bytes[](0));
        uint256 totalVotingPower;
        for (uint256 i; i < votingPowers.length; ++i) {
            for (uint256 j; j < votingPowers[i].vaults.length; ++j) {
                totalVotingPower += votingPowers[i].vaults[j].value;
            }
        }
        uint256 quorumThreshold;
        IValSetDriver.QuorumThreshold[] memory quorumThresholds = masterSetupParams.valSetDriver.getQuorumThresholds();
        for (uint256 i; i < quorumThresholds.length; ++i) {
            if (quorumThresholds[i].keyTag == valSetHeader.requiredKeyTag) {
                quorumThreshold = quorumThresholds[i].quorumThreshold;
                break;
            }
        }
        valSetHeader.quorumThreshold =
            quorumThreshold.mulDiv(totalVotingPower, masterSetupParams.valSetDriver.MAX_QUORUM_THRESHOLD()) + 1;

        masterSetupParams.settlement.setGenesis(valSetHeader, extraData);
        vm.stopBroadcast();
    }

    function loadGenesis()
        public
        returns (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData)
    {
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "/test/data/genesis_header.json");
        string memory json = vm.readFile(path);

        valSetHeader = ISettlement.ValSetHeader({
            version: uint8(json.readUint(".header.version")),
            requiredKeyTag: uint8(json.readUint(".header.requiredKeyTag")),
            epoch: uint48(json.readUint(".header.epoch")),
            captureTimestamp: uint48(json.readUint(".header.captureTimestamp")),
            quorumThreshold: json.readUint(".header.quorumThreshold"),
            totalVotingPower: json.readUint(".header.totalVotingPower"),
            validatorsSszMRoot: json.readBytes32(".header.validatorsSszMRoot")
        });

        extraData = abi.decode(json.parseRaw(".extraData"), (ISettlement.ExtraData[]));
    }
}

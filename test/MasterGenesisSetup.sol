// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {IBaseKeyManager} from "../src/interfaces/base/IBaseKeyManager.sol";

import "./MasterSetup.sol";

contract MasterGenesisSetup is MasterSetup {
    struct Genesis {
        ExtraDataStruct[] extraData;
        ValSetHeaderStruct header;
    }

    struct ExtraDataStruct {
        bytes32 key;
        bytes32 value;
    }

    struct ValSetHeaderStruct {
        uint48 epoch;
        uint48 captureTimestamp;
        bytes32 previousHeaderHash;
        uint256 quorumThreshold;
        uint8 requiredKeyTag;
        bytes32 validatorsSszMRoot;
        uint32 verificationType;
        uint8 version;
    }

    function setUp() public virtual override {
        MasterSetup.setUp();
    }

    function setGenesis() public {
        vm.startPrank(vars.deployer.addr);
        (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData) = loadGenesis();
        masterSetupParams.master.setGenesis(valSetHeader, extraData);
        vm.stopPrank();
    }

    function loadGenesis()
        public
        returns (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData)
    {
        Genesis memory genesis;
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/test/data/genesis_header.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            genesis = abi.decode(data, (Genesis));
        }

        valSetHeader = ISettlement.ValSetHeader({
            version: genesis.header.version,
            requiredKeyTag: genesis.header.requiredKeyTag,
            epoch: genesis.header.epoch,
            captureTimestamp: genesis.header.captureTimestamp,
            verificationType: genesis.header.verificationType,
            quorumThreshold: genesis.header.quorumThreshold,
            validatorsSszMRoot: genesis.header.validatorsSszMRoot,
            previousHeaderHash: genesis.header.previousHeaderHash
        });

        extraData = new ISettlement.ExtraData[](genesis.extraData.length);
        for (uint256 i; i < genesis.extraData.length; ++i) {
            extraData[i] = ISettlement.ExtraData({key: genesis.extraData[i].key, value: genesis.extraData[i].value});
        }
    }
}

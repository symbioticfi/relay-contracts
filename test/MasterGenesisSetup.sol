// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {IBaseKeyManager} from "../src/interfaces/base/IBaseKeyManager.sol";

import "./MasterSetup.sol";

contract MasterGenesisSetup is MasterSetup {
    struct KeyStruct {
        bytes payload;
        uint8 tag;
    }

    struct ValSetHeaderStruct {
        KeyStruct[] activeAggregatedKeys;
        bytes32 extraData;
        uint256 totalActiveVotingPower;
        bytes32 validatorsSszMRoot;
        uint8 version;
    }

    function setUp() public virtual override {
        MasterSetup.setUp();

        vm.startPrank(vars.deployer.addr);
        ISettlementManager.ValSetHeader memory valSetHeader = loadGenesis();
        masterSetupParams.master.setGenesis(valSetHeader);
        vm.stopPrank();
    }

    function loadGenesis() public returns (ISettlementManager.ValSetHeader memory valSetHeader) {
        ValSetHeaderStruct memory valSetHeaderStruct;
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/test/data/genesis_header.json");
            string memory json = vm.readFile(path);
            bytes memory data = vm.parseJson(json);
            valSetHeaderStruct = abi.decode(data, (ValSetHeaderStruct));
        }

        IBaseKeyManager.Key[] memory activeAggregatedKeys =
            new IBaseKeyManager.Key[](valSetHeaderStruct.activeAggregatedKeys.length);
        for (uint256 i; i < valSetHeaderStruct.activeAggregatedKeys.length; ++i) {
            activeAggregatedKeys[i] = IBaseKeyManager.Key({
                payload: valSetHeaderStruct.activeAggregatedKeys[i].payload,
                tag: valSetHeaderStruct.activeAggregatedKeys[i].tag
            });
        }

        return ISettlementManager.ValSetHeader({
            version: valSetHeaderStruct.version,
            activeAggregatedKeys: activeAggregatedKeys,
            totalActiveVotingPower: valSetHeaderStruct.totalActiveVotingPower,
            validatorsSszMRoot: valSetHeaderStruct.validatorsSszMRoot,
            extraData: abi.encode(valSetHeaderStruct.extraData)
        });
    }
}

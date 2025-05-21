// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.25;

import {IBaseKeyManager} from "../../src/interfaces/base/IBaseKeyManager.sol";

import "./MasterSetup.s.sol";

// forge script script/test/MasterGenesisSetup.s.sol:MasterGenesisSetupScript 25235 --sig "run(uint256)" --rpc-url $ETH_RPC_URL_MASTER

contract MasterGenesisSetupScript is MasterSetupScript {
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

    function run(
        uint256 seed
    ) public virtual override {
        SYMBIOTIC_CORE_PROJECT_ROOT = "lib/core/";
        SymbioticInit.run(seed);

        (, Vars memory vars) = loadInitSetupParamsAndVars();
        MasterSetupParams memory masterSetupParams = loadMasterSetupParams();

        vm.startBroadcast(vars.deployer.privateKey);
        ISettlement.ValSetHeader memory valSetHeader = loadGenesis();
        masterSetupParams.master.setGenesis(valSetHeader);
        vm.stopBroadcast();
    }

    function loadGenesis() public returns (ISettlement.ValSetHeader memory valSetHeader) {
        ValSetHeaderStruct memory valSetHeaderStruct;
        {
            string memory root = vm.projectRoot();
            string memory path = string.concat(root, "/script/test/data/genesis_header.json");
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

        return ISettlement.ValSetHeader({
            version: valSetHeaderStruct.version,
            activeAggregatedKeys: activeAggregatedKeys,
            totalActiveVotingPower: valSetHeaderStruct.totalActiveVotingPower,
            validatorsSszMRoot: valSetHeaderStruct.validatorsSszMRoot,
            extraData: abi.encode(valSetHeaderStruct.extraData)
        });
    }
}

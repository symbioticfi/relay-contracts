// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IBaseKeyManager} from "../src/interfaces/base/IBaseKeyManager.sol";

import "./MasterSetup.sol";

contract MasterGenesisSetup is MasterSetup {
    function setUp() public virtual override {
        MasterSetup.setUp();
    }

    function setGenesis() public {
        vm.startPrank(vars.deployer.addr);
        (ISettlement.ValSetHeader memory valSetHeader, ISettlement.ExtraData[] memory extraData) = loadGenesis();
        valSetHeader.captureTimestamp = initSetupParams.zeroTimestamp;
        // vm.warp(valSetHeader.captureTimestamp);
        masterSetupParams.master.setGenesis(valSetHeader, extraData);
        vm.stopPrank();
    }
}

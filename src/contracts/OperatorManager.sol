// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {NetworkConfig} from "./NetworkConfig.sol";

import {OperatorManagerLogic} from "./libraries/logic/OperatorManagerLogic.sol";

import {IOperatorManager} from "../interfaces/IOperatorManager.sol";

contract OperatorManager is NetworkConfig, IOperatorManager {
    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorManagerStorageLocation =
        0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

    bytes32 internal constant REQUIRED_KEY_TAGS_SET_ROLE = keccak256("REQUIRED_KEY_TAGS_SET_ROLE");

    bytes32 internal constant OPERATOR_UNREGISTER_ROLE = keccak256("OPERATOR_UNREGISTER_ROLE");

    bytes32 internal constant OPERATOR_PAUSE_ROLE = keccak256("OPERATOR_PAUSE_ROLE");

    bytes32 internal constant OPERATOR_UNPAUSE_ROLE = keccak256("OPERATOR_UNPAUSE_ROLE");

    constructor(
        address factory
    ) NetworkConfig(factory) {}

    function getRequiredKeyTags() public view returns (uint8[] memory) {
        return OperatorManagerLogic.getRequiredKeyTags(_getOperatorManagerStorage(), _getNetworkConfigStorage());
    }

    function getKey(address operator, uint8 tag) public view returns (bytes memory) {
        return OperatorManagerLogic.getKey(_getOperatorManagerStorage(), _getNetworkConfigStorage(), operator, tag);
    }

    function getCompressedKey(address operator, uint8 tag) public view returns (bytes memory) {
        return OperatorManagerLogic.getCompressedKey(
            _getOperatorManagerStorage(), _getNetworkConfigStorage(), operator, tag
        );
    }

    function getOperator(
        bytes memory compressedKey
    ) public view returns (address) {
        return OperatorManagerLogic.getOperator(_getOperatorManagerStorage(), compressedKey);
    }

    function setRequiredKeyTags(
        uint8[] memory requiredKeyTags
    ) public onlyRole(REQUIRED_KEY_TAGS_SET_ROLE) {
        OperatorManagerLogic.setRequiredKeyTags(
            _getOperatorManagerStorage(), _getNetworkConfigStorage(), requiredKeyTags
        );
    }

    function registerOperator(address operator, KeyWithTag[] memory keysWithTags, bytes[] memory signatures) public {
        OperatorManagerLogic.registerOperator(
            _getOperatorManagerStorage(), _getNetworkConfigStorage(), operator, keysWithTags, signatures
        );
    }

    function updateKey(address operator, uint8 tag, bytes memory key, bytes memory signature) public {
        OperatorManagerLogic.updateKey(
            _getOperatorManagerStorage(), _getNetworkConfigStorage(), operator, tag, key, signature
        );
    }

    function unregisterOperator(
        address operator
    ) public onlyRole(OPERATOR_UNREGISTER_ROLE) {
        OperatorManagerLogic.unregisterOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage(), operator);
    }

    function unregisterOperator() public {
        OperatorManagerLogic.unregisterOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage());
    }

    function pauseOperator(
        address operator
    ) public onlyRole(OPERATOR_PAUSE_ROLE) {
        OperatorManagerLogic.pauseOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage(), operator);
    }

    function pauseOperator() public {
        OperatorManagerLogic.pauseOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage());
    }

    function unpauseOperator(
        address operator
    ) public onlyRole(OPERATOR_UNPAUSE_ROLE) {
        OperatorManagerLogic.unpauseOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage(), operator);
    }

    function unpauseOperator() public {
        OperatorManagerLogic.unpauseOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage());
    }

    function _getOperatorManagerStorage() internal pure returns (OperatorManagerStorage storage $) {
        assembly ("memory-safe") {
            $.slot := OperatorManagerStorageLocation
        }
    }

    function _initialize(uint64 initialVersion, address owner, bytes memory data) internal virtual override {
        OperatorManagerInitParams memory initParams = abi.decode(data, (OperatorManagerInitParams));
        super._initialize(initialVersion, owner, abi.encode(initParams.baseParams));

        OperatorManagerLogic.initialize(_getOperatorManagerStorage(), initParams);
    }
}

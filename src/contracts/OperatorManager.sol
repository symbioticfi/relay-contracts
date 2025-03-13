// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {NetworkConfig} from "./NetworkConfig.sol";
import {Updatable} from "./libraries/utils/Updatable.sol";
import {OperatorManagerLogic} from "./libraries/logic/OperatorManagerLogic.sol";
import {UpdatableEnumerableSet} from "./libraries/utils/UpdatableEnumerableSet.sol";

contract OperatorManager is NetworkConfig {
    struct OperatorManagerInitParams {
        NetworkConfig.NetworkConfigInitParams baseParams;
        uint48 requiredKeyTags; // bitmap with key tags (000000000000000000000000000000000000000000000011 means BN254 and SECP256K1)
    }

    /// @custom:storage-location erc7201:symbiotic.storage.OperatorManager
    struct OperatorManagerStorage {
        Updatable.Uint48Value _requiredKeyTags;
        mapping(address => mapping(KeyTag => Updatable.Bytes32Value)) _keys;
        mapping(bytes32 => address) _operatorsByKeys;
        UpdatableEnumerableSet.AddressSet _operators;
    }

    enum KeyTag {
        BN254,
        SECP256K1,
        EDDSA
    }

    struct KeyWithTag {
        KeyTag keyTag;
        bytes key;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OperatorManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OperatorManagerStorageLocation =
        0xfd87879bc98f37af7578af722aecfbe5843e5ad354da2d1e70cb5157c4ec8800;

    bytes32 public constant REQUIRED_KEY_TAGS_SET_ROLE = keccak256("REQUIRED_KEY_TAGS_SET_ROLE");

    constructor(
        address factory
    ) NetworkConfig(factory) {}

    function getRequiredKeyTags() public view returns (uint48) {
        return OperatorManagerLogic.getRequiredKeyTags(_getOperatorManagerStorage(), _getNetworkConfigStorage());
    }

    function getKey(address operator, KeyTag keyTag) public view returns (bytes memory) {
        return OperatorManagerLogic.getKey(_getOperatorManagerStorage(), _getNetworkConfigStorage(), operator, keyTag);
    }

    function getOperator(
        bytes32 key
    ) public view returns (address) {
        return OperatorManagerLogic.getOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage(), key);
    }

    function setRequiredKeyTags(
        uint48 requiredKeyTags
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

    function updateKey(address operator, KeyTag tag, bytes memory key, bytes memory signature) public {
        OperatorManagerLogic.updateKey(
            _getOperatorManagerStorage(), _getNetworkConfigStorage(), operator, tag, key, signature
        );
    }

    function unregisterOperator() public {
        OperatorManagerLogic.unregisterOperator(_getOperatorManagerStorage(), _getNetworkConfigStorage());
    }

    function _getOperatorManagerStorage() internal pure returns (OperatorManagerStorage storage $) {
        assembly {
            $.slot := OperatorManagerStorageLocation
        }
    }

    function _initialize(uint64 initialVersion, address owner, bytes memory data) internal virtual override {
        OperatorManagerInitParams memory initParams = abi.decode(data, (OperatorManagerInitParams));
        super._initialize(initialVersion, owner, abi.encode(initParams.baseParams));

        OperatorManagerLogic.initialize(_getOperatorManagerStorage(), initParams);
    }
}

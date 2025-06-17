// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISetMaxNetworkLimitHook} from "./ISetMaxNetworkLimitHook.sol";

interface INetwork is ISetMaxNetworkLimitHook {
    error InvalidNewDelay();
    error InvalidTargetAndSelector();
    error InvalidDataLength();
    error NotMiddleware();

    /// @custom:storage-location erc7201:symbiotic.storage.Network
    struct NetworkStorage {
        mapping(bytes32 => uint256) _minDelays;
        mapping(bytes32 => bool) _isMinDelayEnabled;
        string _name;
        string _metadataURI;
    }

    struct DelayParams {
        address target;
        bytes4 selector;
        uint256 delay;
    }

    struct NetworkInitParams {
        uint256 globalMinDelay;
        DelayParams[] delayParams;
        address[] proposers;
        address[] executors;
        string name;
        string metadataURI;
        address defaultAdminRoleHolder;
        address nameUpdateRoleHolder;
        address metadataURIUpdateRoleHolder;
    }

    event MinDelayChange(
        address indexed target,
        bytes4 indexed selector,
        bool oldEnabledStatus,
        uint256 oldDelay,
        bool newEnabledStatus,
        uint256 newDelay
    );

    event NameSet(string name);

    event MetadataURISet(string metadataURI);

    function NAME_UPDATE_ROLE() external view returns (bytes32);

    function METADATA_URI_UPDATE_ROLE() external view returns (bytes32);

    function NETWORK_REGISTRY() external view returns (address);

    function NETWORK_MIDDLEWARE_SERVICE() external view returns (address);

    function getMinDelay(address target, bytes memory data) external view returns (uint256 delay);

    function name() external view returns (string memory);

    function metadataURI() external view returns (string memory);

    function updateDelay(address target, bytes4 selector, bool enabled, uint256 newDelay) external;

    function updateName(
        string memory name
    ) external;

    function updateMetadataURI(
        string memory metadataURI
    ) external;

    function setMaxNetworkLimit(address delegator, uint96 subnetworkID, uint256 maxNetworkLimit) external;
}

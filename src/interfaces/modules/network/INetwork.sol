// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INetwork {
    error InvalidNewDelay();
    error InvalidTargetAndSelector();
    error InvalidDataLength();

    /// @custom:storage-location erc7201:symbiotic.storage.Network
    struct NetworkStorage {
        mapping(bytes32 => uint256) _minDelays;
        mapping(bytes32 => bool) _isMinDelayEnabled;
        string _name;
        bytes _metadataURI;
    }

    struct DelayParams {
        address target;
        bytes4 selector;
        uint256 delay;
    }

    struct InitParams {
        uint256 globalMinDelay;
        DelayParams[] delayParams;
        address[] proposers;
        address[] executors;
        string name;
        bytes metadataURI;
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

    event MetadataURISet(bytes metadataURI);

    function NAME_UPDATE_ROLE() external view returns (bytes32);

    function METADATA_URI_UPDATE_ROLE() external view returns (bytes32);

    function getMinDelay(address target, bytes memory data) external view returns (uint256 delay);

    function name() external view returns (string memory);

    function metadataURI() external view returns (bytes memory);

    function initialize(
        InitParams memory initParams
    ) external;

    function updateDelay(address target, bytes4 selector, bool enabled, uint256 newDelay) external;

    function updateName(
        string calldata name
    ) external;

    function updateMetadataURI(
        bytes calldata metadataURI
    ) external;
}

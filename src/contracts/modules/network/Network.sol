// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {INetwork} from "../../../interfaces/modules/network/INetwork.sol";

import {TimelockControllerUpgradeable} from
    "@openzeppelin/contracts-upgradeable/governance/TimelockControllerUpgradeable.sol";
import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";

contract Network is TimelockControllerUpgradeable, INetwork {
    using Bytes for bytes;

    /**
     * @inheritdoc INetwork
     */
    bytes32 public constant NAME_UPDATE_ROLE = keccak256("NAME_UPDATE_ROLE");

    /**
     * @inheritdoc INetwork
     */
    bytes32 public constant METADATA_URI_UPDATE_ROLE = keccak256("METADATA_URI_UPDATE_ROLE");

    bytes4 private constant CUSTOM_UPDATE_DELAY_SELECTOR = 0x6a63fa02;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.Network")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant NetworkStorageLocation = 0xad58d27706f0faa4634000571d7d9c19a0123d182a06ad775cbe8a9c22f64400;

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TimelockController")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TimelockControllerStorageLocation =
        0x9a37c2aa9d186a0969ff8a8267bf4e07e864c2f2768f5040949e28a624fb3600;

    function _getNetworkStorage() internal pure returns (NetworkStorage storage $) {
        bytes32 location = NetworkStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function _getTimelockControllerStorageOverriden() internal pure returns (TimelockControllerStorage storage $) {
        assembly {
            $.slot := TimelockControllerStorageLocation
        }
    }

    /**
     * @inheritdoc INetwork
     */
    function getMinDelay(address target, bytes memory data) public view returns (uint256) {
        bytes4 selector = _getSelector(data);
        if (target == address(this) && selector == CUSTOM_UPDATE_DELAY_SELECTOR) {
            (address underlyingTarget, bytes4 underlyingSelector,,) =
                abi.decode(_getPayload(data), (address, bytes4, bool, uint256));
            return _getMinDelay(underlyingTarget, underlyingSelector);
        }
        return _getMinDelay(target, selector);
    }

    /**
     * @inheritdoc INetwork
     */
    function name() public view returns (string memory) {
        return _getNetworkStorage()._name;
    }

    /**
     * @inheritdoc INetwork
     */
    function metadataURI() public view returns (bytes memory) {
        return _getNetworkStorage()._metadataURI;
    }

    /**
     * @inheritdoc INetwork
     */
    function initialize(
        InitParams memory initParams
    ) public virtual initializer {
        __TimelockController_init(
            initParams.globalMinDelay, initParams.proposers, initParams.executors, initParams.defaultAdminRoleHolder
        );

        if (initParams.defaultAdminRoleHolder != address(0)) {
            _grantRole(DEFAULT_ADMIN_ROLE, initParams.defaultAdminRoleHolder);
        }
        if (initParams.nameUpdateRoleHolder != address(0)) {
            _grantRole(NAME_UPDATE_ROLE, initParams.nameUpdateRoleHolder);
        }
        if (initParams.metadataURIUpdateRoleHolder != address(0)) {
            _grantRole(METADATA_URI_UPDATE_ROLE, initParams.metadataURIUpdateRoleHolder);
        }

        for (uint256 i; i < initParams.delayParams.length; ++i) {
            updateDelay(
                initParams.delayParams[i].target,
                initParams.delayParams[i].selector,
                true,
                initParams.delayParams[i].delay
            );
        }
    }

    /**
     * @inheritdoc INetwork
     */
    function updateDelay(address target, bytes4 selector, bool enabled, uint256 newDelay) public virtual {
        NetworkStorage storage $ = _getNetworkStorage();
        address sender = _msgSender();
        if (sender != address(this)) {
            revert TimelockUnauthorizedCaller(sender);
        }
        if (!enabled && newDelay != 0) {
            revert InvalidNewDelay();
        }
        bytes32 id = _getId(target, selector);
        emit MinDelayChange(target, selector, $._isMinDelayEnabled[id], $._minDelays[id], enabled, newDelay);
        $._isMinDelayEnabled[id] = enabled;
        $._minDelays[id] = newDelay;
    }

    /**
     * @inheritdoc INetwork
     */
    function updateName(
        string calldata name_
    ) external virtual onlyRole(NAME_UPDATE_ROLE) {
        _updateName(name_);
    }

    /**
     * @inheritdoc INetwork
     */
    function updateMetadataURI(
        bytes calldata metadataURI_
    ) external virtual onlyRole(METADATA_URI_UPDATE_ROLE) {
        _updateMetadataURI(metadataURI_);
    }

    /**
     * @inheritdoc TimelockControllerUpgradeable
     */
    function schedule(
        address target,
        uint256 value,
        bytes calldata data,
        bytes32 predecessor,
        bytes32 salt,
        uint256 delay
    ) public virtual override onlyRole(PROPOSER_ROLE) {
        uint256 minDelay = getMinDelay(target, data);
        if (delay < minDelay) {
            revert TimelockInsufficientDelay(delay, minDelay);
        }
        bytes32 id = hashOperation(target, value, data, predecessor, salt);
        _scheduleOverriden(id, delay);
        emit CallScheduled(id, 0, target, value, data, predecessor, delay);
        if (salt != bytes32(0)) {
            emit CallSalt(id, salt);
        }
    }

    /**
     * @inheritdoc TimelockControllerUpgradeable
     */
    function scheduleBatch(
        address[] calldata targets,
        uint256[] calldata values,
        bytes[] calldata payloads,
        bytes32 predecessor,
        bytes32 salt,
        uint256 delay
    ) public virtual override onlyRole(PROPOSER_ROLE) {
        if (targets.length != values.length || targets.length != payloads.length) {
            revert TimelockInvalidOperationLength(targets.length, payloads.length, values.length);
        }
        for (uint256 i; i < targets.length; ++i) {
            uint256 minDelay = getMinDelay(targets[i], payloads[i]);
            if (delay < minDelay) {
                revert TimelockInsufficientDelay(delay, minDelay);
            }
        }

        bytes32 id = hashOperationBatch(targets, values, payloads, predecessor, salt);
        _scheduleOverriden(id, delay);
        for (uint256 i = 0; i < targets.length; ++i) {
            emit CallScheduled(id, i, targets[i], values[i], payloads[i], predecessor, delay);
        }
        if (salt != bytes32(0)) {
            emit CallSalt(id, salt);
        }
    }

    function _updateDelay(address target, bytes4 selector, bool enabled, uint256 newDelay) internal {}

    function _updateName(
        string calldata name_
    ) internal {
        _getNetworkStorage()._name = name_;
        emit NameSet(name_);
    }

    function _updateMetadataURI(
        bytes calldata metadataURI_
    ) internal {
        _getNetworkStorage()._metadataURI = metadataURI_;
        emit MetadataURISet(metadataURI_);
    }

    function _scheduleOverriden(bytes32 id, uint256 delay) internal virtual {
        TimelockControllerStorage storage $ = _getTimelockControllerStorageOverriden();
        if (isOperation(id)) {
            revert TimelockUnexpectedOperationState(id, _encodeStateBitmap(OperationState.Unset));
        }
        $._timestamps[id] = block.timestamp + delay;
    }

    function _getId(address target, bytes4 selector) internal pure virtual returns (bytes32 id) {
        return keccak256(abi.encode(target, selector));
    }

    function _getMinDelay(address target, bytes4 selector) internal view virtual returns (uint256) {
        _validateTargetAndSelector(target, selector);

        (bool enabled, uint256 minDelay) = _getMinDelay(_getId(target, selector));
        if (enabled) {
            return minDelay;
        }
        (enabled, minDelay) = _getMinDelay(_getId(address(0), selector));
        if (enabled) {
            return minDelay;
        }
        return getMinDelay();
    }

    function _getMinDelay(
        bytes32 id
    ) internal view virtual returns (bool, uint256) {
        NetworkStorage storage $ = _getNetworkStorage();
        return ($._isMinDelayEnabled[id], $._minDelays[id]);
    }

    function _validateTargetAndSelector(address target, bytes4 selector) internal view virtual {
        if (
            target == address(0) || selector == bytes4(0)
                || (target == address(this) && selector == CUSTOM_UPDATE_DELAY_SELECTOR)
        ) {
            revert InvalidTargetAndSelector();
        }
    }

    function _getSelector(
        bytes memory data
    ) internal pure returns (bytes4 selector) {
        if (data.length < 4) {
            revert InvalidDataLength();
        }
        assembly ("memory-safe") {
            selector := mload(add(data, 32))
        }
    }

    function _getPayload(
        bytes memory data
    ) internal pure returns (bytes memory payload) {
        if (data.length < 4) {
            revert InvalidDataLength();
        }
        return data.slice(4);
    }
}

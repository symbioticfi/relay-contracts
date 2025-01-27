// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AccessManager} from "../../../managers/extendable/AccessManager.sol";
import {IOwnableAccessManager} from "../../../interfaces/extensions/managers/access/IOwnableAccessManager.sol";

/**
 * @title OwnableAccessManager
 * @notice A middleware extension that restricts access to a single owner address
 * @dev Implements AccessManager with owner-based access control
 */
abstract contract OwnableAccessManager is AccessManager, IOwnableAccessManager {
    uint64 public constant OwnableAccessManager_VERSION = 1;

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OwnableAccessManager")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OwnableAccessManagerStorageLocation =
        0xcee92923a0c63eca6fc0402d78c9efde9f9f3dc73e6f9e14501bf734ed77f100;

    function _owner() private view returns (address owner_) {
        bytes32 location = OwnableAccessManagerStorageLocation;
        assembly {
            owner_ := sload(location)
        }
    }

    /**
     * @notice Initializes the contract with an owner address
     * @param owner_ The address to set as the owner
     */
    function __OwnableAccessManager_init(
        address owner_
    ) internal onlyInitializing {
        if (owner_ == address(0)) {
            revert InvalidOwner(address(0));
        }
        _setOwner(owner_);
    }

    function _setOwner(
        address owner_
    ) private {
        bytes32 location = OwnableAccessManagerStorageLocation;
        assembly {
            sstore(location, owner_)
        }
    }

    /**
     * @inheritdoc IOwnableAccessManager
     */
    function owner() public view returns (address) {
        return _owner();
    }

    /**
     * @notice Checks if the caller has access (is the owner)
     * @dev Reverts if the caller is not the owner
     */
    function _checkAccess() internal view virtual override {
        if (msg.sender != _owner()) {
            revert OnlyOwnerCanCall(msg.sender);
        }
    }

    /**
     * @inheritdoc IOwnableAccessManager
     */
    function setOwner(
        address owner_
    ) public checkAccess {
        if (owner_ == address(0)) {
            revert InvalidOwner(address(0));
        }
        _setOwner(owner_);
    }

    /**
     * @inheritdoc IOwnableAccessManager
     */
    function renounceOwnership() public virtual {
        _checkAccess();
        _setOwner(address(0));
    }
}

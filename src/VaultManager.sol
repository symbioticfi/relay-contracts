// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IVault} from "@symbiotic/interfaces/vault/IVault.sol";
import {IBaseDelegator} from "@symbiotic/interfaces/delegator/IBaseDelegator.sol";
import {IRegistry} from "@symbiotic/interfaces/common/IRegistry.sol";
import {IEntity} from "@symbiotic/interfaces/common/IEntity.sol";
import {IVetoSlasher} from "@symbiotic/interfaces/slasher/IVetoSlasher.sol";
import {Subnetwork} from "@symbiotic/contracts/libraries/Subnetwork.sol";
import {ISlasher} from "@symbiotic/interfaces/slasher/ISlasher.sol";
import {IVetoSlasher} from "@symbiotic/interfaces/slasher/IVetoSlasher.sol";

import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

import {AddressWithTimes} from "./libraries/AddressWithTimes.sol";

contract VaultManager is Ownable {
    using AddressWithTimes for AddressWithTimes.Address;
    using Subnetwork for address;

    error NotVault();
    error VaultNotRegistered();
    error VaultAlreadyRegistred();
    error VaultEpochTooShort();

    error TooOldEpoch();
    error InvalidEpoch();

    error InvalidSubnetworksCnt();

    error SlashPeriodNotPassed();
    error UnknownSlasherType();

    address public immutable NETWORK;
    address public immutable VAULT_REGISTRY;
    uint48 public immutable SLASHING_WINDOW;
    uint48 public constant INSTANT_SLASHER_TYPE = 0;
    uint48 public constant VETO_SLASHER_TYPE = 1;
    uint256 public subnetworks;
    AddressWithTimes.Address[] public sharedVaults;
    mapping(address => AddressWithTimes.Address[]) public operatorVaults;
    mapping(address => uint256) public vaultPositions;

    constructor(address owner, address network, address vaultRegistry, uint48 slashingWindow) Ownable(owner) {
        NETWORK = network;
        VAULT_REGISTRY = vaultRegistry;
        SLASHING_WINDOW = slashingWindow;
        subnetworks = 1;
    }

    function activeVaults(address operator, uint48 timestamp) public view returns (address[] memory) {
        address[] memory vaults = new address[](sharedVaults.length + operatorVaults[operator].length);
        uint256 len = 0;
        for (uint256 i; i < sharedVaults.length; ++i) {
            if (!sharedVaults[i].wasActiveAt(timestamp)) {
                continue;
            }

            vaults[len++] = sharedVaults[i].getAddress();
        }

        for (uint256 i; i < operatorVaults[operator].length; ++i) {
            if (!operatorVaults[operator][i].wasActiveAt(timestamp)) {
                continue;
            }

            vaults[len++] = operatorVaults[operator][i].getAddress();
        }

        // shrink array to skip unused slots
        /// @solidity memory-safe-assembly
        assembly {
            mstore(vaults, len)
        }

        return vaults;
    }

    function setSubnetworks(uint256 _subnetworks) external onlyOwner {
        if (subnetworks >= _subnetworks) {
            revert InvalidSubnetworksCnt();
        }

        subnetworks = _subnetworks;
    }

    function registerSharedVault(address vault) external onlyOwner {
        if (vaultPositions[vault] != 0) {
            revert VaultAlreadyRegistred();
        }

        _checkVault(vault);

        uint256 pos = sharedVaults.length;
        sharedVaults.push();
        sharedVaults[pos].set(vault);
        vaultPositions[vault] = pos + 1;
    }

    function registerOperatorVault(address vault, address operator) external onlyOwner {
        if (vaultPositions[vault] != 0) {
            revert VaultAlreadyRegistred();
        }

        _checkVault(vault);

        uint256 pos = operatorVaults[operator].length;
        operatorVaults[operator].push();
        operatorVaults[operator][pos].set(vault);
        vaultPositions[vault] = pos + 1;
    }

    function pauseSharedVault(address vault) external onlyOwner {
        if (vaultPositions[vault] == 0) {
            revert VaultNotRegistered();
        }

        sharedVaults[vaultPositions[vault] - 1].disable();
    }

    function unpauseSharedVault(address vault) external onlyOwner {
        if (vaultPositions[vault] == 0) {
            revert VaultNotRegistered();
        }

        sharedVaults[vaultPositions[vault] - 1].checkUnpause(SLASHING_WINDOW);
        sharedVaults[vaultPositions[vault] - 1].enable();
    }

    function pauseOperatorVault(address vault) external onlyOwner {
        if (vaultPositions[vault] == 0) {
            revert VaultNotRegistered();
        }

        sharedVaults[vaultPositions[vault] - 1].disable();
    }

    function unpauseOperatorVault(address operator, address vault) external onlyOwner {
        if (vaultPositions[vault] == 0) {
            revert VaultNotRegistered();
        }

        operatorVaults[operator][vaultPositions[vault] - 1].checkUnpause(SLASHING_WINDOW);
        operatorVaults[operator][vaultPositions[vault] - 1].enable();
    }

    function unregisterSharedVault(address vault) external onlyOwner {
        if (vaultPositions[vault] == 0) {
            revert VaultNotRegistered();
        }

        uint256 pos = vaultPositions[vault] - 1;
        sharedVaults[pos].checkUnregister(SLASHING_WINDOW);
        sharedVaults[pos] = sharedVaults[sharedVaults.length - 1];
        sharedVaults.pop();

        delete vaultPositions[vault];
        vaultPositions[sharedVaults[pos].getAddress()] = pos + 1;
    }

    function unregisterOperatorVault(address operator, address vault) external onlyOwner {
        if (vaultPositions[vault] == 0) {
            revert VaultNotRegistered();
        }

        uint256 pos = vaultPositions[vault] - 1;
        operatorVaults[operator][pos].checkUnregister(SLASHING_WINDOW);
        operatorVaults[operator][pos] = operatorVaults[operator][operatorVaults[operator].length - 1];
        operatorVaults[operator].pop();

        delete vaultPositions[vault];
        vaultPositions[operatorVaults[operator][pos].getAddress()] = pos + 1;
    }

    function getOperatorStake(address operator, uint48 timestamp) public view returns (uint256 stake) {
        address[] memory vaults = activeVaults(operator, timestamp);

        for (uint256 i; i < vaults.length; ++i) {
            address vault = vaults[i];
            for (uint96 subnet = 0; subnet < subnetworks; ++subnet) {
                bytes32 subnetwork = NETWORK.subnetwork(subnet);
                stake += IBaseDelegator(IVault(vault).delegator()).stakeAt(subnetwork, operator, timestamp, "");
            }
        }

        return stake;
    }

    function calcTotalStake(uint48 timestamp, address[] memory operators) external view returns (uint256 totalStake) {
        if (timestamp < Time.timestamp() - SLASHING_WINDOW) {
            revert TooOldEpoch();
        }

        if (timestamp > Time.timestamp()) {
            revert InvalidEpoch();
        }

        for (uint256 i; i < operators.length; ++i) {
            uint256 operatorStake = getOperatorStake(operators[i], timestamp);
            totalStake += operatorStake;
        }
    }

    // ONYL DELEGATECALL FROM MIDDLEWARE
    function slashVault(uint48 timestamp, address vault, bytes32 subnetwork, address operator, uint256 amount)
        external
    {
        address slasher = IVault(vault).slasher();
        uint256 slasherType = IEntity(slasher).TYPE();
        if (slasherType == INSTANT_SLASHER_TYPE) {
            ISlasher(slasher).slash(subnetwork, operator, amount, timestamp, new bytes(0));
        } else if (slasherType == VETO_SLASHER_TYPE) {
            IVetoSlasher(slasher).requestSlash(subnetwork, operator, amount, timestamp, new bytes(0));
        } else {
            revert UnknownSlasherType();
        }
    }

    function _checkVault(address vault) private view {
        if (!IRegistry(VAULT_REGISTRY).isEntity(vault)) {
            revert NotVault();
        }

        uint48 vaultEpoch = IVault(vault).epochDuration();

        address slasher = IVault(vault).slasher();
        if (slasher != address(0) && IEntity(slasher).TYPE() == VETO_SLASHER_TYPE) {
            vaultEpoch -= IVetoSlasher(slasher).vetoDuration();
        }

        if (vaultEpoch < SLASHING_WINDOW) {
            revert VaultEpochTooShort();
        }
    }
}

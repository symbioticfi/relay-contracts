// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IStakerRewards} from "@symbioticfi/rewards/src/interfaces/stakerRewards/IStakerRewards.sol";
import {IDefaultOperatorRewards} from
    "@symbioticfi/rewards/src/interfaces/defaultOperatorRewards/IDefaultOperatorRewards.sol";

import {IBaseRewards} from "../../../interfaces/modules/voting-power/IBaseRewards.sol";
import {VotingPowerProvider} from "./VotingPowerProvider.sol";

abstract contract BaseRewards is VotingPowerProvider, IBaseRewards {
    /**
     * @inheritdoc IBaseRewards
     */
    uint64 public constant BaseRewards_VERSION = 1;

    modifier onlyRewarder() {
        if (msg.sender != getRewarder()) {
            revert BaseRewards_NotRewarder();
        }
        _;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.BaseRewards")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BaseRewardsStorageLocation =
        0xbda599e6417b60ef01d2592ea6468e27d9dc233383dcd1f33c49128d08d88b00;

    function _getBaseRewardsStorage() internal pure returns (IBaseRewards.BaseRewardsStorage storage $) {
        bytes32 location = BaseRewardsStorageLocation;
        assembly {
            $.slot := location
        }
    }

    function __BaseRewards_init(
        BaseRewardsInitParams memory initParams
    ) internal virtual onlyInitializing {
        _setRewarder(initParams.rewarder);
    }

    /**
     * @inheritdoc IBaseRewards
     */
    function getRewarder() public view virtual returns (address) {
        return _getBaseRewardsStorage()._rewarder;
    }

    /**
     * @inheritdoc IBaseRewards
     */
    function setRewarder(
        address rewarder
    ) public virtual checkPermission {
        _setRewarder(rewarder);
    }

    /**
     * @inheritdoc IBaseRewards
     */
    function distributeStakerRewards(
        address stakerRewards,
        address token,
        uint256 amount,
        bytes memory data
    ) public virtual onlyRewarder {
        _distributeStakerRewards(stakerRewards, token, amount, data);
    }

    /**
     * @inheritdoc IBaseRewards
     */
    function distributeOperatorRewards(
        address operatorRewards,
        address token,
        uint256 amount,
        bytes32 root
    ) public virtual onlyRewarder {
        _distributeOperatorRewards(operatorRewards, token, amount, root);
    }

    function _setRewarder(
        address rewarder
    ) internal virtual {
        _getBaseRewardsStorage()._rewarder = rewarder;
        emit SetRewarder(rewarder);
    }

    function _distributeStakerRewards(
        address stakerRewards,
        address token,
        uint256 amount,
        bytes memory data
    ) internal virtual {
        IStakerRewards(stakerRewards).distributeRewards(NETWORK(), token, amount, data);
        emit DistributeStakerRewards(stakerRewards, token, amount, data);
    }

    function _distributeOperatorRewards(
        address operatorRewards,
        address token,
        uint256 amount,
        bytes32 root
    ) internal virtual {
        IDefaultOperatorRewards(operatorRewards).distributeRewards(NETWORK(), token, amount, root);
        emit DistributeOperatorRewards(operatorRewards, token, amount, root);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IValSetManager} from "../../../interfaces/IValSetManager.sol";

library QuickSorts {
    function sortVaultsWithVotingPowersAsc(address[] memory arr1, uint256[] memory arr2) public pure {
        if (arr1.length != arr2.length) {
            revert("Arrays must have the same length");
        }
        if (arr1.length > 1) {
            _quickSortVaultsWithVotingPowersAsc(arr1, arr2, 0, arr1.length - 1);
        }
    }

    function _quickSortVaultsWithVotingPowersAsc(
        address[] memory arr1,
        uint256[] memory arr2,
        uint256 left,
        uint256 right
    ) internal pure {
        if (left < right) {
            uint256 pivotIndex = _partitionVaultsWithVotingPowersAsc(arr1, arr2, left, right);
            if (pivotIndex > 0 && pivotIndex > left) {
                _quickSortVaultsWithVotingPowersAsc(arr1, arr2, left, pivotIndex - 1);
            }
            if (pivotIndex < right) {
                _quickSortVaultsWithVotingPowersAsc(arr1, arr2, pivotIndex + 1, right);
            }
        }
    }

    function _partitionVaultsWithVotingPowersAsc(
        address[] memory arr1,
        uint256[] memory arr2,
        uint256 left,
        uint256 right
    ) internal pure returns (uint256 pivotIndex) {
        address pivot = arr1[right];
        pivotIndex = left;
        for (uint256 i = left; i < right; ++i) {
            if (arr1[i] < pivot) {
                _swapVaults(arr1, arr2, i, pivotIndex);
                ++pivotIndex;
            }
        }
        _swapVaults(arr1, arr2, pivotIndex, right);
    }

    function _swapVaults(address[] memory arr1, uint256[] memory arr2, uint256 i, uint256 j) internal pure {
        if (i == j) return;
        (arr1[i], arr1[j]) = (arr1[j], arr1[i]);
        (arr2[i], arr2[j]) = (arr2[j], arr2[i]);
    }

    function sortValidatorsByVotingPowerDesc(
        IValSetManager.Validator[] memory validators
    ) public pure {
        if (validators.length > 1) {
            _quickSortValidatorsByVotingPowerDesc(validators, 0, validators.length - 1);
        }
    }

    function _quickSortValidatorsByVotingPowerDesc(
        IValSetManager.Validator[] memory validators,
        uint256 left,
        uint256 right
    ) internal pure {
        if (left < right) {
            uint256 pivotIndex = _partitionValidatorsByVotingPowerDesc(validators, left, right);
            if (pivotIndex > 0 && pivotIndex > left) {
                _quickSortValidatorsByVotingPowerDesc(validators, left, pivotIndex - 1);
            }
            if (pivotIndex < right) {
                _quickSortValidatorsByVotingPowerDesc(validators, pivotIndex + 1, right);
            }
        }
    }

    function _partitionValidatorsByVotingPowerDesc(
        IValSetManager.Validator[] memory arr,
        uint256 left,
        uint256 right
    ) internal pure returns (uint256 pivotIndex) {
        uint256 pivot = arr[right].votingPower;
        pivotIndex = left;
        for (uint256 i = left; i < right; ++i) {
            if (arr[i].votingPower > pivot) {
                _swapValidators(arr, i, pivotIndex);
                ++pivotIndex;
            }
        }
        _swapValidators(arr, pivotIndex, right);
    }

    function _swapValidators(IValSetManager.Validator[] memory arr, uint256 i, uint256 j) internal pure {
        if (i == j) return;
        (arr[i], arr[j]) = (arr[j], arr[i]);
    }

    function sortValidatorsByAddressAsc(
        IValSetManager.Validator[] memory validators
    ) public pure {
        if (validators.length > 1) {
            _quickSortValidatorsByAddressAsc(validators, 0, validators.length - 1);
        }
    }

    function _quickSortValidatorsByAddressAsc(
        IValSetManager.Validator[] memory validators,
        uint256 left,
        uint256 right
    ) internal pure {
        if (left < right) {
            uint256 pivotIndex = _partitionValidatorsByAddressAsc(validators, left, right);
            if (pivotIndex > 0 && pivotIndex > left) {
                _quickSortValidatorsByAddressAsc(validators, left, pivotIndex - 1);
            }
            if (pivotIndex < right) {
                _quickSortValidatorsByAddressAsc(validators, pivotIndex + 1, right);
            }
        }
    }

    function _partitionValidatorsByAddressAsc(
        IValSetManager.Validator[] memory arr,
        uint256 left,
        uint256 right
    ) internal pure returns (uint256 pivotIndex) {
        address pivot = arr[right].operator;
        pivotIndex = left;
        for (uint256 i = left; i < right; ++i) {
            if (arr[i].operator < pivot) {
                _swapValidators(arr, i, pivotIndex);
                ++pivotIndex;
            }
        }
        _swapValidators(arr, pivotIndex, right);
    }
}

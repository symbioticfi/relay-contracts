// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {UpdatableEnumerableSet} from "./UpdatableEnumerableSet.sol";

library Updatable {
    modifier checkTimepoints(uint48 currentTimepoint, uint48 nextValueTimepoint) {
        if (nextValueTimepoint <= currentTimepoint) {
            revert("Next timepoint must be greater than current timepoint");
        }
        _;
    }

    struct Uint48Value {
        uint48 value;
        uint48 nextValue;
        uint48 nextValueTimepoint;
    }

    function set(
        Uint48Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        uint48 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.value = self.nextValue;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }

        if (self.value == value) {
            if (self.nextValueTimepoint == 0) {
                return false;
            }
            delete self.nextValue;
            delete self.nextValueTimepoint;
            return true;
        }

        self.nextValue = value;
        self.nextValueTimepoint = nextValueTimepoint;
        return true;
    }

    function get(Uint48Value storage self, uint48 currentTimepoint) internal view returns (uint48) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        return self.value;
    }

    struct Uint256Value {
        uint256 value;
        uint256 nextValue;
        uint48 nextValueTimepoint;
    }

    function set(
        Uint256Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        uint256 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.value = self.nextValue;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }

        if (self.value == value) {
            if (self.nextValueTimepoint == 0) {
                return false;
            }
            delete self.nextValue;
            delete self.nextValueTimepoint;
            return true;
        }

        self.nextValue = value;
        self.nextValueTimepoint = nextValueTimepoint;
        return true;
    }

    function get(Uint256Value storage self, uint48 currentTimepoint) internal view returns (uint256) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        return self.value;
    }

    struct Bytes32Value {
        bytes32 value;
        bytes32 nextValue;
        uint48 nextValueTimepoint;
    }

    function set(
        Bytes32Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        bytes32 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.value = self.nextValue;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }

        if (self.value == value) {
            if (self.nextValueTimepoint == 0) {
                return false;
            }
            delete self.nextValue;
            delete self.nextValueTimepoint;
            return true;
        }

        self.nextValue = value;
        self.nextValueTimepoint = nextValueTimepoint;
        return true;
    }

    function get(Bytes32Value storage self, uint48 currentTimepoint) internal view returns (bytes32) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        return self.value;
    }

    struct BoolValue {
        bool value;
        bool nextValue;
        uint48 nextValueTimepoint;
    }

    function set(
        BoolValue storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        bool value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.value = self.nextValue;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }

        if (self.value == value) {
            if (self.nextValueTimepoint == 0) {
                return false;
            }
            delete self.nextValue;
            delete self.nextValueTimepoint;
            return true;
        }

        self.nextValue = value;
        self.nextValueTimepoint = nextValueTimepoint;
        return true;
    }

    function get(BoolValue storage self, uint48 currentTimepoint) internal view returns (bool) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        return self.value;
    }

    struct AddressValue {
        address value;
        address nextValue;
        uint48 nextValueTimepoint;
    }

    function set(
        AddressValue storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        address value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.value = self.nextValue;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }

        if (self.value == value) {
            if (self.nextValueTimepoint == 0) {
                return false;
            }
            delete self.nextValue;
            delete self.nextValueTimepoint;
            return true;
        }

        self.nextValue = value;
        self.nextValueTimepoint = nextValueTimepoint;
        return true;
    }

    function get(AddressValue storage self, uint48 currentTimepoint) internal view returns (address) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        return self.value;
    }

    struct Uint208Value {
        uint208 value;
        uint208 nextValue;
        uint48 nextValueTimepoint;
    }

    function set(
        Uint208Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        uint208 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.value = self.nextValue;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }

        if (self.value == value) {
            if (self.nextValueTimepoint == 0) {
                return false;
            }
            delete self.nextValue;
            delete self.nextValueTimepoint;
            return true;
        }

        self.nextValue = value;
        self.nextValueTimepoint = nextValueTimepoint;
        return true;
    }

    function get(Uint208Value storage self, uint48 currentTimepoint) internal view returns (uint208) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        return self.value;
    }

    function set(
        UpdatableEnumerableSet.AddressInner storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        bool isIncluded
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        if (self.nextIsIncludedTimepoint != 0 && self.nextIsIncludedTimepoint <= currentTimepoint) {
            self.isIncluded = self.nextIsIncluded;
            delete self.nextIsIncluded;
            delete self.nextIsIncludedTimepoint;
        }

        if (self.isIncluded == isIncluded) {
            if (self.nextIsIncludedTimepoint == 0) {
                return false;
            }
            delete self.nextIsIncluded;
            delete self.nextIsIncludedTimepoint;
            return true;
        }

        self.nextIsIncluded = isIncluded;
        self.nextIsIncludedTimepoint = nextValueTimepoint;
        return true;
    }

    function get(
        UpdatableEnumerableSet.AddressInner storage self,
        uint48 currentTimepoint
    ) internal view returns (bool) {
        if (self.nextIsIncludedTimepoint != 0 && self.nextIsIncludedTimepoint <= currentTimepoint) {
            return self.nextIsIncluded;
        }
        return self.isIncluded;
    }
}

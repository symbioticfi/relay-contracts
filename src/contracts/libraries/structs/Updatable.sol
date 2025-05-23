// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library Updatable {
    modifier checkTimepoints(uint48 currentTimepoint, uint48 nextValueTimepoint) {
        if (nextValueTimepoint <= currentTimepoint) {
            revert("Next timepoint must be greater than current timepoint");
        }
        _;
    }

    struct Uint104Value {
        uint104 value;
        uint104 nextValue;
        uint48 nextValueTimepoint;
    }

    function set(
        Uint104Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        uint104 value
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

        if (self.nextValueTimepoint == nextValueTimepoint && self.nextValue == value) {
            return false;
        }

        self.nextValue = value;
        self.nextValueTimepoint = nextValueTimepoint;
        return true;
    }

    function get(Uint104Value storage self, uint48 currentTimepoint) internal view returns (uint104) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        return self.value;
    }

    function clear(
        Uint104Value storage self
    ) internal {
        delete self.value;
        delete self.nextValue;
        delete self.nextValueTimepoint;
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

        if (self.nextValueTimepoint == nextValueTimepoint && self.nextValue == value) {
            return false;
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

    function clear(
        Uint208Value storage self
    ) internal {
        delete self.value;
        delete self.nextValue;
        delete self.nextValueTimepoint;
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

        if (self.nextValueTimepoint == nextValueTimepoint && self.nextValue == value) {
            return false;
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

    function clear(
        Bytes32Value storage self
    ) internal {
        delete self.value;
        delete self.nextValue;
        delete self.nextValueTimepoint;
    }
}

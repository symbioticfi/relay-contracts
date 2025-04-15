// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library Updatable {
    modifier checkTimepoints(uint48 currentTimepoint, uint48 nextValueTimepoint) {
        if (nextValueTimepoint <= currentTimepoint) {
            revert("Next timepoint must be greater than current timepoint");
        }
        _;
    }

    struct Uint48Value {
        uint48 value;
        uint48 valueTimepoint;
        uint48 nextValue;
        uint48 nextValueTimepoint;
        uint48 prevValue;
    }

    function set(Uint48Value storage self, uint48 valueTimepoint, uint48 value) internal {
        clear(self);
        self.value = value;
        self.valueTimepoint = valueTimepoint;
    }

    function sync(Uint48Value storage self, uint48 currentTimepoint) internal {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.prevValue = self.value;
            self.value = self.nextValue;
            self.valueTimepoint = self.nextValueTimepoint;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }
    }

    function set(
        Uint48Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        uint48 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        sync(self, currentTimepoint);

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

    // @dev Returns invalid value for too old timepoint
    function get(Uint48Value storage self, uint48 currentTimepoint) internal view returns (uint48) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        if (self.valueTimepoint <= currentTimepoint) {
            return self.value;
        }
        return self.prevValue;
    }

    function getWithTimepoint(
        Uint48Value storage self,
        uint48 currentTimepoint
    ) internal view returns (uint48, uint48) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return (self.nextValueTimepoint, self.nextValue);
        }
        if (self.valueTimepoint <= currentTimepoint) {
            return (self.valueTimepoint, self.value);
        }
        return (0, self.prevValue);
    }

    function getCurrent(
        Uint48Value storage self
    ) internal view returns (uint48, uint48) {
        return (self.valueTimepoint, self.value);
    }

    function getNext(
        Uint48Value storage self
    ) internal view returns (uint48, uint48) {
        return (self.nextValueTimepoint, self.nextValue);
    }

    function clear(
        Uint48Value storage self
    ) internal {
        delete self.value;
        delete self.valueTimepoint;
        delete self.nextValue;
        delete self.nextValueTimepoint;
        delete self.prevValue;
    }

    struct Uint128Value {
        uint128 value;
        uint48 valueTimepoint;
        uint128 nextValue;
        uint48 nextValueTimepoint;
        uint128 prevValue;
    }

    function set(Uint128Value storage self, uint48 valueTimepoint, uint128 value) internal {
        clear(self);
        self.value = value;
        self.valueTimepoint = valueTimepoint;
    }

    function sync(Uint128Value storage self, uint48 currentTimepoint) internal {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.prevValue = self.value;
            self.value = self.nextValue;
            self.valueTimepoint = self.nextValueTimepoint;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }
    }

    function set(
        Uint128Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        uint128 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        sync(self, currentTimepoint);

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

    function get(Uint128Value storage self, uint48 currentTimepoint) internal view returns (uint128) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return self.nextValue;
        }
        if (self.valueTimepoint <= currentTimepoint) {
            return self.value;
        }
        return self.prevValue;
    }

    function getWithTimepoint(
        Uint128Value storage self,
        uint48 currentTimepoint
    ) internal view returns (uint48, uint128) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return (self.nextValueTimepoint, self.nextValue);
        }
        if (self.valueTimepoint <= currentTimepoint) {
            return (self.valueTimepoint, self.value);
        }
        return (0, self.prevValue);
    }

    function getCurrent(
        Uint128Value storage self
    ) internal view returns (uint48, uint128) {
        return (self.valueTimepoint, self.value);
    }

    function getNext(
        Uint128Value storage self
    ) internal view returns (uint48, uint128) {
        return (self.nextValueTimepoint, self.nextValue);
    }

    function clear(
        Uint128Value storage self
    ) internal {
        delete self.value;
        delete self.valueTimepoint;
        delete self.nextValue;
        delete self.nextValueTimepoint;
        delete self.prevValue;
    }

    struct Uint208Value {
        uint208 value;
        uint48 valueTimepoint;
        uint208 nextValue;
        uint48 nextValueTimepoint;
        uint208 prevValue;
    }

    function set(Uint208Value storage self, uint48 valueTimepoint, uint208 value) internal {
        clear(self);
        self.value = value;
        self.valueTimepoint = valueTimepoint;
    }

    function sync(Uint208Value storage self, uint48 currentTimepoint) internal {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.prevValue = self.value;
            self.value = self.nextValue;
            self.valueTimepoint = self.nextValueTimepoint;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }
    }

    function set(
        Uint208Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        uint208 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        sync(self, currentTimepoint);

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
        if (self.valueTimepoint <= currentTimepoint) {
            return self.value;
        }
        return self.prevValue;
    }

    function getWithTimepoint(
        Uint208Value storage self,
        uint48 currentTimepoint
    ) internal view returns (uint48, uint208) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return (self.nextValueTimepoint, self.nextValue);
        }
        if (self.valueTimepoint <= currentTimepoint) {
            return (self.valueTimepoint, self.value);
        }
        return (0, self.prevValue);
    }

    function getCurrent(
        Uint208Value storage self
    ) internal view returns (uint48, uint208) {
        return (self.valueTimepoint, self.value);
    }

    function getNext(
        Uint208Value storage self
    ) internal view returns (uint48, uint208) {
        return (self.nextValueTimepoint, self.nextValue);
    }

    function clear(
        Uint208Value storage self
    ) internal {
        delete self.value;
        delete self.valueTimepoint;
        delete self.nextValue;
        delete self.nextValueTimepoint;
        delete self.prevValue;
    }

    struct Bytes32Value {
        bytes32 value;
        bytes32 nextValue;
        bytes32 prevValue;
        uint48 valueTimepoint;
        uint48 nextValueTimepoint;
    }

    function set(Bytes32Value storage self, uint48 valueTimepoint, bytes32 value) internal {
        clear(self);
        self.value = value;
        self.valueTimepoint = valueTimepoint;
    }

    function sync(Bytes32Value storage self, uint48 currentTimepoint) internal {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            self.prevValue = self.value;
            self.value = self.nextValue;
            self.valueTimepoint = self.nextValueTimepoint;
            delete self.nextValue;
            delete self.nextValueTimepoint;
        }
    }

    function set(
        Bytes32Value storage self,
        uint48 currentTimepoint,
        uint48 nextValueTimepoint,
        bytes32 value
    ) internal checkTimepoints(currentTimepoint, nextValueTimepoint) returns (bool) {
        sync(self, currentTimepoint);

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
        if (self.valueTimepoint != 0 && self.valueTimepoint <= currentTimepoint) {
            return self.value;
        }
        return self.prevValue;
    }

    function getWithTimepoint(
        Bytes32Value storage self,
        uint48 currentTimepoint
    ) internal view returns (uint48, bytes32) {
        if (self.nextValueTimepoint != 0 && self.nextValueTimepoint <= currentTimepoint) {
            return (self.nextValueTimepoint, self.nextValue);
        }
        if (self.valueTimepoint != 0 && self.valueTimepoint <= currentTimepoint) {
            return (self.valueTimepoint, self.value);
        }
        return (0, self.prevValue);
    }

    function getCurrent(
        Bytes32Value storage self
    ) internal view returns (uint48, bytes32) {
        return (self.valueTimepoint, self.value);
    }

    function getNext(
        Bytes32Value storage self
    ) internal view returns (uint48, bytes32) {
        return (self.nextValueTimepoint, self.nextValue);
    }

    function clear(
        Bytes32Value storage self
    ) internal {
        delete self.value;
        delete self.nextValue;
        delete self.nextValueTimepoint;
        delete self.prevValue;
        delete self.valueTimepoint;
    }
}

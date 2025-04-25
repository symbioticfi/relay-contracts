// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IOzEIP712} from "../../../interfaces/base/common/IOzEIP712.sol";

import {EIP712Upgradeable} from "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";

abstract contract OzEIP712 is EIP712Upgradeable, IOzEIP712 {
    /**
     * @inheritdoc IOzEIP712
     */
    uint64 public constant OzEIP712_VERSION = 1;

    function __OzEIP712_init(
        OzEIP712InitParams memory initParams
    ) internal virtual onlyInitializing {
        __EIP712_init(initParams.name, initParams.version);
    }

    /**
     * @inheritdoc IOzEIP712
     */
    function hashTypedDataV4(
        bytes32 structHash
    ) public view virtual returns (bytes32) {
        return _hashTypedDataV4(structHash);
    }
}

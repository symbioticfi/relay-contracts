// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {OzEIP712Logic} from "./logic/OzEIP712Logic.sol";

import {IOzEIP712} from "../../../interfaces/base/common/IOzEIP712.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {IERC5267} from "@openzeppelin/contracts/interfaces/IERC5267.sol";

abstract contract OzEIP712 is Initializable, IOzEIP712 {
    /**
     * @inheritdoc IOzEIP712
     */
    uint64 public constant OzEIP712_VERSION = 1;

    function __OzEIP712_init(
        OzEIP712InitParams memory initParams
    ) internal virtual onlyInitializing {
        OzEIP712Logic.initialize(initParams);
    }

    /**
     * @inheritdoc IOzEIP712
     */
    function hashTypedDataV4(
        bytes32 structHash
    ) public view virtual returns (bytes32) {
        return OzEIP712Logic.hashTypedDataV4(structHash);
    }

    /**
     * @inheritdoc IOzEIP712
     */
    function hashTypedDataV4Multichain(
        bytes32 structHash
    ) public view virtual returns (bytes32) {
        return OzEIP712Logic.hashTypedDataV4Multichain(structHash);
    }

    /**
     * @inheritdoc IERC5267
     */
    function eip712Domain()
        public
        view
        virtual
        returns (
            bytes1 fields,
            string memory name,
            string memory version,
            uint256 chainId,
            address verifyingContract,
            bytes32 salt,
            uint256[] memory extensions
        )
    {
        return OzEIP712Logic.eip712Domain();
    }
}

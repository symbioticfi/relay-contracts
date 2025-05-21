// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IOzEIP712} from "../../../../interfaces/base/common/IOzEIP712.sol";

import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

library OzEIP712Logic {
    uint64 internal constant OzEIP712_VERSION = 1;

    bytes32 private constant TYPE_HASH =
        keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)");

    bytes32 private constant MULTICHAIN_TYPE_HASH = keccak256("EIP712Domain(string name,string version)");

    /// @custom:storage-location erc7201:openzeppelin.storage.OzEIP712
    struct OzEIP712Storage {
        /// @custom:oz-renamed-from _HASHED_NAME
        bytes32 _hashedName;
        /// @custom:oz-renamed-from _HASHED_VERSION
        bytes32 _hashedVersion;
        string _name;
        string _version;
    }

    // keccak256(abi.encode(uint256(keccak256("symbiotic.storage.OzEIP712")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant OzEIP712StorageLocation =
        0x3d2c0ff50cfdbe7dfc45916875eb036a27b4a0034db93b35219dc0d930df1e00;

    function _getOzEIP712Storage() private pure returns (OzEIP712Storage storage $) {
        assembly {
            $.slot := OzEIP712StorageLocation
        }
    }

    /**
     * @dev Initializes the domain separator and parameter caches.
     *
     * The meaning of `name` and `version` is specified in
     * https://eips.ethereum.org/EIPS/eip-712#definition-of-domainseparator[EIP-712]:
     *
     * - `name`: the user readable name of the signing domain, i.e. the name of the DApp or the protocol.
     * - `version`: the current major version of the signing domain.
     *
     * NOTE: These parameters cannot be changed except through a xref:learn::upgrading-smart-contracts.adoc[smart
     * contract upgrade].
     */
    function initialize(
        IOzEIP712.OzEIP712InitParams memory initParams
    ) public {
        OzEIP712Storage storage $ = _getOzEIP712Storage();
        $._name = initParams.name;
        $._version = initParams.version;

        // Reset prior values in storage if upgrading
        $._hashedName = 0;
        $._hashedVersion = 0;
    }

    /**
     * @dev Given an already https://eips.ethereum.org/EIPS/eip-712#definition-of-hashstruct[hashed struct], this
     * function returns the hash of the fully encoded EIP712 message for this domain.
     *
     * This hash can be used together with {ECDSA-recover} to obtain the signer of a message. For example:
     *
     * ```solidity
     * bytes32 digest = _hashTypedDataV4(keccak256(abi.encode(
     *     keccak256("Mail(address to,string contents)"),
     *     mailTo,
     *     keccak256(bytes(mailContents))
     * )));
     * address signer = ECDSA.recover(digest, signature);
     * ```
     */
    function hashTypedDataV4(
        bytes32 structHash
    ) public view returns (bytes32) {
        return MessageHashUtils.toTypedDataHash(
            keccak256(abi.encode(TYPE_HASH, _EIP712NameHash(), _EIP712VersionHash(), block.chainid, address(this))),
            structHash
        );
    }

    function hashTypedDataV4CrossChain(
        bytes32 structHash
    ) public view returns (bytes32) {
        return MessageHashUtils.toTypedDataHash(
            keccak256(abi.encode(MULTICHAIN_TYPE_HASH, _EIP712NameHash(), _EIP712VersionHash())), structHash
        );
    }

    /**
     * @dev See {IERC-5267}.
     */
    function eip712Domain()
        public
        view
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
        OzEIP712Storage storage $ = _getOzEIP712Storage();
        // If the hashed name and version in storage are non-zero, the contract hasn't been properly initialized
        // and the EIP712 domain is not reliable, as it will be missing name and version.
        require($._hashedName == 0 && $._hashedVersion == 0, "EIP712: Uninitialized");

        return (
            hex"0f", // 01111
            _EIP712Name(),
            _EIP712Version(),
            block.chainid,
            address(this),
            bytes32(0),
            new uint256[](0)
        );
    }

    /**
     * @dev The name parameter for the EIP712 domain.
     *
     * NOTE: This function reads from storage by default, but can be redefined to return a constant value if gas costs
     * are a concern.
     */
    function _EIP712Name() internal view returns (string memory) {
        OzEIP712Storage storage $ = _getOzEIP712Storage();
        return $._name;
    }

    /**
     * @dev The version parameter for the EIP712 domain.
     *
     * NOTE: This function reads from storage by default, but can be redefined to return a constant value if gas costs
     * are a concern.
     */
    function _EIP712Version() internal view returns (string memory) {
        OzEIP712Storage storage $ = _getOzEIP712Storage();
        return $._version;
    }

    /**
     * @dev The hash of the name parameter for the EIP712 domain.
     *
     * NOTE: In previous versions this function was . In this version you should override `_EIP712Name` instead.
     */
    function _EIP712NameHash() public view returns (bytes32) {
        OzEIP712Storage storage $ = _getOzEIP712Storage();
        string memory name = _EIP712Name();
        if (bytes(name).length > 0) {
            return keccak256(bytes(name));
        } else {
            // If the name is empty, the contract may have been upgraded without initializing the new storage.
            // We return the name hash in storage if non-zero, otherwise we assume the name is empty by design.
            bytes32 hashedName = $._hashedName;
            if (hashedName != 0) {
                return hashedName;
            } else {
                return keccak256("");
            }
        }
    }

    /**
     * @dev The hash of the version parameter for the EIP712 domain.
     *
     * NOTE: In previous versions this function was . In this version you should override `_EIP712Version` instead.
     */
    function _EIP712VersionHash() public view returns (bytes32) {
        OzEIP712Storage storage $ = _getOzEIP712Storage();
        string memory version = _EIP712Version();
        if (bytes(version).length > 0) {
            return keccak256(bytes(version));
        } else {
            // If the version is empty, the contract may have been upgraded without initializing the new storage.
            // We return the version hash in storage if non-zero, otherwise we assume the version is empty by design.
            bytes32 hashedVersion = $._hashedVersion;
            if (hashedVersion != 0) {
                return hashedVersion;
            } else {
                return keccak256("");
            }
        }
    }
}

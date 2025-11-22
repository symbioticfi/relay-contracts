// Code generated - DO NOT EDIT.
// This file is a generated binding and any manual changes will be lost.

package relaycontracts

import (
	"errors"
	"math/big"
	"strings"

	ethereum "github.com/ethereum/go-ethereum"
	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/event"
)

// Reference imports to suppress errors if they are not otherwise used.
var (
	_ = errors.New
	_ = big.NewInt
	_ = strings.NewReader
	_ = ethereum.NotFound
	_ = bind.Bind
	_ = common.Big1
	_ = types.BloomLookup
	_ = event.NewSubscription
	_ = abi.ConvertType
)

// ISigVerifierBlsBn254ZKMetaData contains all meta data concerning the ISigVerifierBlsBn254ZK contract.
var ISigVerifierBlsBn254ZKMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"TOTAL_ACTIVE_VALIDATORS_HASH\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VALIDATOR_SET_HASH_MIMC_HASH\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VERIFICATION_TYPE\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"maxValidators\",\"inputs\":[{\"name\":\"index\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"verifiers\",\"inputs\":[{\"name\":\"index\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"verifyQuorumSig\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"message\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidLength\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidMaxValidators\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidMaxValidatorsOrder\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidMessageLength\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidProofLength\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidProofOffset\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidTotalActiveValidators\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_InvalidVerifier\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254ZK_UnsupportedKeyTag\",\"inputs\":[]}]",
}

// ISigVerifierBlsBn254ZKABI is the input ABI used to generate the binding from.
// Deprecated: Use ISigVerifierBlsBn254ZKMetaData.ABI instead.
var ISigVerifierBlsBn254ZKABI = ISigVerifierBlsBn254ZKMetaData.ABI

// ISigVerifierBlsBn254ZK is an auto generated Go binding around an Ethereum contract.
type ISigVerifierBlsBn254ZK struct {
	ISigVerifierBlsBn254ZKCaller     // Read-only binding to the contract
	ISigVerifierBlsBn254ZKTransactor // Write-only binding to the contract
	ISigVerifierBlsBn254ZKFilterer   // Log filterer for contract events
}

// ISigVerifierBlsBn254ZKCaller is an auto generated read-only Go binding around an Ethereum contract.
type ISigVerifierBlsBn254ZKCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISigVerifierBlsBn254ZKTransactor is an auto generated write-only Go binding around an Ethereum contract.
type ISigVerifierBlsBn254ZKTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISigVerifierBlsBn254ZKFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type ISigVerifierBlsBn254ZKFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISigVerifierBlsBn254ZKSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type ISigVerifierBlsBn254ZKSession struct {
	Contract     *ISigVerifierBlsBn254ZK // Generic contract binding to set the session for
	CallOpts     bind.CallOpts           // Call options to use throughout this session
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// ISigVerifierBlsBn254ZKCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type ISigVerifierBlsBn254ZKCallerSession struct {
	Contract *ISigVerifierBlsBn254ZKCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                 // Call options to use throughout this session
}

// ISigVerifierBlsBn254ZKTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type ISigVerifierBlsBn254ZKTransactorSession struct {
	Contract     *ISigVerifierBlsBn254ZKTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                 // Transaction auth options to use throughout this session
}

// ISigVerifierBlsBn254ZKRaw is an auto generated low-level Go binding around an Ethereum contract.
type ISigVerifierBlsBn254ZKRaw struct {
	Contract *ISigVerifierBlsBn254ZK // Generic contract binding to access the raw methods on
}

// ISigVerifierBlsBn254ZKCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type ISigVerifierBlsBn254ZKCallerRaw struct {
	Contract *ISigVerifierBlsBn254ZKCaller // Generic read-only contract binding to access the raw methods on
}

// ISigVerifierBlsBn254ZKTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type ISigVerifierBlsBn254ZKTransactorRaw struct {
	Contract *ISigVerifierBlsBn254ZKTransactor // Generic write-only contract binding to access the raw methods on
}

// NewISigVerifierBlsBn254ZK creates a new instance of ISigVerifierBlsBn254ZK, bound to a specific deployed contract.
func NewISigVerifierBlsBn254ZK(address common.Address, backend bind.ContractBackend) (*ISigVerifierBlsBn254ZK, error) {
	contract, err := bindISigVerifierBlsBn254ZK(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &ISigVerifierBlsBn254ZK{ISigVerifierBlsBn254ZKCaller: ISigVerifierBlsBn254ZKCaller{contract: contract}, ISigVerifierBlsBn254ZKTransactor: ISigVerifierBlsBn254ZKTransactor{contract: contract}, ISigVerifierBlsBn254ZKFilterer: ISigVerifierBlsBn254ZKFilterer{contract: contract}}, nil
}

// NewISigVerifierBlsBn254ZKCaller creates a new read-only instance of ISigVerifierBlsBn254ZK, bound to a specific deployed contract.
func NewISigVerifierBlsBn254ZKCaller(address common.Address, caller bind.ContractCaller) (*ISigVerifierBlsBn254ZKCaller, error) {
	contract, err := bindISigVerifierBlsBn254ZK(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &ISigVerifierBlsBn254ZKCaller{contract: contract}, nil
}

// NewISigVerifierBlsBn254ZKTransactor creates a new write-only instance of ISigVerifierBlsBn254ZK, bound to a specific deployed contract.
func NewISigVerifierBlsBn254ZKTransactor(address common.Address, transactor bind.ContractTransactor) (*ISigVerifierBlsBn254ZKTransactor, error) {
	contract, err := bindISigVerifierBlsBn254ZK(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &ISigVerifierBlsBn254ZKTransactor{contract: contract}, nil
}

// NewISigVerifierBlsBn254ZKFilterer creates a new log filterer instance of ISigVerifierBlsBn254ZK, bound to a specific deployed contract.
func NewISigVerifierBlsBn254ZKFilterer(address common.Address, filterer bind.ContractFilterer) (*ISigVerifierBlsBn254ZKFilterer, error) {
	contract, err := bindISigVerifierBlsBn254ZK(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &ISigVerifierBlsBn254ZKFilterer{contract: contract}, nil
}

// bindISigVerifierBlsBn254ZK binds a generic wrapper to an already deployed contract.
func bindISigVerifierBlsBn254ZK(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := ISigVerifierBlsBn254ZKMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISigVerifierBlsBn254ZK.Contract.ISigVerifierBlsBn254ZKCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISigVerifierBlsBn254ZK.Contract.ISigVerifierBlsBn254ZKTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISigVerifierBlsBn254ZK.Contract.ISigVerifierBlsBn254ZKTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISigVerifierBlsBn254ZK.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISigVerifierBlsBn254ZK.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISigVerifierBlsBn254ZK.Contract.contract.Transact(opts, method, params...)
}

// TOTALACTIVEVALIDATORSHASH is a free data retrieval call binding the contract method 0xc494ef93.
//
// Solidity: function TOTAL_ACTIVE_VALIDATORS_HASH() view returns(bytes32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCaller) TOTALACTIVEVALIDATORSHASH(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _ISigVerifierBlsBn254ZK.contract.Call(opts, &out, "TOTAL_ACTIVE_VALIDATORS_HASH")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// TOTALACTIVEVALIDATORSHASH is a free data retrieval call binding the contract method 0xc494ef93.
//
// Solidity: function TOTAL_ACTIVE_VALIDATORS_HASH() view returns(bytes32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKSession) TOTALACTIVEVALIDATORSHASH() ([32]byte, error) {
	return _ISigVerifierBlsBn254ZK.Contract.TOTALACTIVEVALIDATORSHASH(&_ISigVerifierBlsBn254ZK.CallOpts)
}

// TOTALACTIVEVALIDATORSHASH is a free data retrieval call binding the contract method 0xc494ef93.
//
// Solidity: function TOTAL_ACTIVE_VALIDATORS_HASH() view returns(bytes32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCallerSession) TOTALACTIVEVALIDATORSHASH() ([32]byte, error) {
	return _ISigVerifierBlsBn254ZK.Contract.TOTALACTIVEVALIDATORSHASH(&_ISigVerifierBlsBn254ZK.CallOpts)
}

// VALIDATORSETHASHMIMCHASH is a free data retrieval call binding the contract method 0xd1638abe.
//
// Solidity: function VALIDATOR_SET_HASH_MIMC_HASH() view returns(bytes32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCaller) VALIDATORSETHASHMIMCHASH(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _ISigVerifierBlsBn254ZK.contract.Call(opts, &out, "VALIDATOR_SET_HASH_MIMC_HASH")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// VALIDATORSETHASHMIMCHASH is a free data retrieval call binding the contract method 0xd1638abe.
//
// Solidity: function VALIDATOR_SET_HASH_MIMC_HASH() view returns(bytes32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKSession) VALIDATORSETHASHMIMCHASH() ([32]byte, error) {
	return _ISigVerifierBlsBn254ZK.Contract.VALIDATORSETHASHMIMCHASH(&_ISigVerifierBlsBn254ZK.CallOpts)
}

// VALIDATORSETHASHMIMCHASH is a free data retrieval call binding the contract method 0xd1638abe.
//
// Solidity: function VALIDATOR_SET_HASH_MIMC_HASH() view returns(bytes32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCallerSession) VALIDATORSETHASHMIMCHASH() ([32]byte, error) {
	return _ISigVerifierBlsBn254ZK.Contract.VALIDATORSETHASHMIMCHASH(&_ISigVerifierBlsBn254ZK.CallOpts)
}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCaller) VERIFICATIONTYPE(opts *bind.CallOpts) (uint32, error) {
	var out []interface{}
	err := _ISigVerifierBlsBn254ZK.contract.Call(opts, &out, "VERIFICATION_TYPE")

	if err != nil {
		return *new(uint32), err
	}

	out0 := *abi.ConvertType(out[0], new(uint32)).(*uint32)

	return out0, err

}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKSession) VERIFICATIONTYPE() (uint32, error) {
	return _ISigVerifierBlsBn254ZK.Contract.VERIFICATIONTYPE(&_ISigVerifierBlsBn254ZK.CallOpts)
}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCallerSession) VERIFICATIONTYPE() (uint32, error) {
	return _ISigVerifierBlsBn254ZK.Contract.VERIFICATIONTYPE(&_ISigVerifierBlsBn254ZK.CallOpts)
}

// MaxValidators is a free data retrieval call binding the contract method 0x1524c70f.
//
// Solidity: function maxValidators(uint256 index) view returns(uint256)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCaller) MaxValidators(opts *bind.CallOpts, index *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ISigVerifierBlsBn254ZK.contract.Call(opts, &out, "maxValidators", index)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// MaxValidators is a free data retrieval call binding the contract method 0x1524c70f.
//
// Solidity: function maxValidators(uint256 index) view returns(uint256)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKSession) MaxValidators(index *big.Int) (*big.Int, error) {
	return _ISigVerifierBlsBn254ZK.Contract.MaxValidators(&_ISigVerifierBlsBn254ZK.CallOpts, index)
}

// MaxValidators is a free data retrieval call binding the contract method 0x1524c70f.
//
// Solidity: function maxValidators(uint256 index) view returns(uint256)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCallerSession) MaxValidators(index *big.Int) (*big.Int, error) {
	return _ISigVerifierBlsBn254ZK.Contract.MaxValidators(&_ISigVerifierBlsBn254ZK.CallOpts, index)
}

// Verifiers is a free data retrieval call binding the contract method 0xac1eff68.
//
// Solidity: function verifiers(uint256 index) view returns(address)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCaller) Verifiers(opts *bind.CallOpts, index *big.Int) (common.Address, error) {
	var out []interface{}
	err := _ISigVerifierBlsBn254ZK.contract.Call(opts, &out, "verifiers", index)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// Verifiers is a free data retrieval call binding the contract method 0xac1eff68.
//
// Solidity: function verifiers(uint256 index) view returns(address)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKSession) Verifiers(index *big.Int) (common.Address, error) {
	return _ISigVerifierBlsBn254ZK.Contract.Verifiers(&_ISigVerifierBlsBn254ZK.CallOpts, index)
}

// Verifiers is a free data retrieval call binding the contract method 0xac1eff68.
//
// Solidity: function verifiers(uint256 index) view returns(address)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCallerSession) Verifiers(index *big.Int) (common.Address, error) {
	return _ISigVerifierBlsBn254ZK.Contract.Verifiers(&_ISigVerifierBlsBn254ZK.CallOpts, index)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCaller) VerifyQuorumSig(opts *bind.CallOpts, settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	var out []interface{}
	err := _ISigVerifierBlsBn254ZK.contract.Call(opts, &out, "verifyQuorumSig", settlement, epoch, message, keyTag, quorumThreshold, proof)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKSession) VerifyQuorumSig(settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _ISigVerifierBlsBn254ZK.Contract.VerifyQuorumSig(&_ISigVerifierBlsBn254ZK.CallOpts, settlement, epoch, message, keyTag, quorumThreshold, proof)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISigVerifierBlsBn254ZK *ISigVerifierBlsBn254ZKCallerSession) VerifyQuorumSig(settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _ISigVerifierBlsBn254ZK.Contract.VerifyQuorumSig(&_ISigVerifierBlsBn254ZK.CallOpts, settlement, epoch, message, keyTag, quorumThreshold, proof)
}

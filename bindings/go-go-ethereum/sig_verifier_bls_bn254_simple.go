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

// SigVerifierBlsBn254SimpleMetaData contains all meta data concerning the SigVerifierBlsBn254Simple contract.
var SigVerifierBlsBn254SimpleMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"AGGREGATED_PUBLIC_KEY_G1_HASH\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"MAX_VALIDATORS\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VALIDATOR_SET_HASH_KECCAK256_HASH\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VERIFICATION_TYPE\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"verifyQuorumSig\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"message\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"error\",\"name\":\"InvalidKeyTag\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254Simple_InvalidMessageLength\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254Simple_InvalidNonSignerIndex\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254Simple_InvalidNonSignersOrder\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254Simple_InvalidProofLength\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254Simple_InvalidProofOffset\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254Simple_TooManyValidators\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"SigVerifierBlsBn254Simple_UnsupportedKeyTag\",\"inputs\":[]}]",
}

// SigVerifierBlsBn254SimpleABI is the input ABI used to generate the binding from.
// Deprecated: Use SigVerifierBlsBn254SimpleMetaData.ABI instead.
var SigVerifierBlsBn254SimpleABI = SigVerifierBlsBn254SimpleMetaData.ABI

// SigVerifierBlsBn254Simple is an auto generated Go binding around an Ethereum contract.
type SigVerifierBlsBn254Simple struct {
	SigVerifierBlsBn254SimpleCaller     // Read-only binding to the contract
	SigVerifierBlsBn254SimpleTransactor // Write-only binding to the contract
	SigVerifierBlsBn254SimpleFilterer   // Log filterer for contract events
}

// SigVerifierBlsBn254SimpleCaller is an auto generated read-only Go binding around an Ethereum contract.
type SigVerifierBlsBn254SimpleCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// SigVerifierBlsBn254SimpleTransactor is an auto generated write-only Go binding around an Ethereum contract.
type SigVerifierBlsBn254SimpleTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// SigVerifierBlsBn254SimpleFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type SigVerifierBlsBn254SimpleFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// SigVerifierBlsBn254SimpleSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type SigVerifierBlsBn254SimpleSession struct {
	Contract     *SigVerifierBlsBn254Simple // Generic contract binding to set the session for
	CallOpts     bind.CallOpts              // Call options to use throughout this session
	TransactOpts bind.TransactOpts          // Transaction auth options to use throughout this session
}

// SigVerifierBlsBn254SimpleCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type SigVerifierBlsBn254SimpleCallerSession struct {
	Contract *SigVerifierBlsBn254SimpleCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                    // Call options to use throughout this session
}

// SigVerifierBlsBn254SimpleTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type SigVerifierBlsBn254SimpleTransactorSession struct {
	Contract     *SigVerifierBlsBn254SimpleTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                    // Transaction auth options to use throughout this session
}

// SigVerifierBlsBn254SimpleRaw is an auto generated low-level Go binding around an Ethereum contract.
type SigVerifierBlsBn254SimpleRaw struct {
	Contract *SigVerifierBlsBn254Simple // Generic contract binding to access the raw methods on
}

// SigVerifierBlsBn254SimpleCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type SigVerifierBlsBn254SimpleCallerRaw struct {
	Contract *SigVerifierBlsBn254SimpleCaller // Generic read-only contract binding to access the raw methods on
}

// SigVerifierBlsBn254SimpleTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type SigVerifierBlsBn254SimpleTransactorRaw struct {
	Contract *SigVerifierBlsBn254SimpleTransactor // Generic write-only contract binding to access the raw methods on
}

// NewSigVerifierBlsBn254Simple creates a new instance of SigVerifierBlsBn254Simple, bound to a specific deployed contract.
func NewSigVerifierBlsBn254Simple(address common.Address, backend bind.ContractBackend) (*SigVerifierBlsBn254Simple, error) {
	contract, err := bindSigVerifierBlsBn254Simple(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &SigVerifierBlsBn254Simple{SigVerifierBlsBn254SimpleCaller: SigVerifierBlsBn254SimpleCaller{contract: contract}, SigVerifierBlsBn254SimpleTransactor: SigVerifierBlsBn254SimpleTransactor{contract: contract}, SigVerifierBlsBn254SimpleFilterer: SigVerifierBlsBn254SimpleFilterer{contract: contract}}, nil
}

// NewSigVerifierBlsBn254SimpleCaller creates a new read-only instance of SigVerifierBlsBn254Simple, bound to a specific deployed contract.
func NewSigVerifierBlsBn254SimpleCaller(address common.Address, caller bind.ContractCaller) (*SigVerifierBlsBn254SimpleCaller, error) {
	contract, err := bindSigVerifierBlsBn254Simple(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &SigVerifierBlsBn254SimpleCaller{contract: contract}, nil
}

// NewSigVerifierBlsBn254SimpleTransactor creates a new write-only instance of SigVerifierBlsBn254Simple, bound to a specific deployed contract.
func NewSigVerifierBlsBn254SimpleTransactor(address common.Address, transactor bind.ContractTransactor) (*SigVerifierBlsBn254SimpleTransactor, error) {
	contract, err := bindSigVerifierBlsBn254Simple(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &SigVerifierBlsBn254SimpleTransactor{contract: contract}, nil
}

// NewSigVerifierBlsBn254SimpleFilterer creates a new log filterer instance of SigVerifierBlsBn254Simple, bound to a specific deployed contract.
func NewSigVerifierBlsBn254SimpleFilterer(address common.Address, filterer bind.ContractFilterer) (*SigVerifierBlsBn254SimpleFilterer, error) {
	contract, err := bindSigVerifierBlsBn254Simple(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &SigVerifierBlsBn254SimpleFilterer{contract: contract}, nil
}

// bindSigVerifierBlsBn254Simple binds a generic wrapper to an already deployed contract.
func bindSigVerifierBlsBn254Simple(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := SigVerifierBlsBn254SimpleMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _SigVerifierBlsBn254Simple.Contract.SigVerifierBlsBn254SimpleCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _SigVerifierBlsBn254Simple.Contract.SigVerifierBlsBn254SimpleTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _SigVerifierBlsBn254Simple.Contract.SigVerifierBlsBn254SimpleTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _SigVerifierBlsBn254Simple.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _SigVerifierBlsBn254Simple.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _SigVerifierBlsBn254Simple.Contract.contract.Transact(opts, method, params...)
}

// AGGREGATEDPUBLICKEYG1HASH is a free data retrieval call binding the contract method 0x3e023e57.
//
// Solidity: function AGGREGATED_PUBLIC_KEY_G1_HASH() view returns(bytes32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCaller) AGGREGATEDPUBLICKEYG1HASH(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _SigVerifierBlsBn254Simple.contract.Call(opts, &out, "AGGREGATED_PUBLIC_KEY_G1_HASH")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// AGGREGATEDPUBLICKEYG1HASH is a free data retrieval call binding the contract method 0x3e023e57.
//
// Solidity: function AGGREGATED_PUBLIC_KEY_G1_HASH() view returns(bytes32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleSession) AGGREGATEDPUBLICKEYG1HASH() ([32]byte, error) {
	return _SigVerifierBlsBn254Simple.Contract.AGGREGATEDPUBLICKEYG1HASH(&_SigVerifierBlsBn254Simple.CallOpts)
}

// AGGREGATEDPUBLICKEYG1HASH is a free data retrieval call binding the contract method 0x3e023e57.
//
// Solidity: function AGGREGATED_PUBLIC_KEY_G1_HASH() view returns(bytes32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCallerSession) AGGREGATEDPUBLICKEYG1HASH() ([32]byte, error) {
	return _SigVerifierBlsBn254Simple.Contract.AGGREGATEDPUBLICKEYG1HASH(&_SigVerifierBlsBn254Simple.CallOpts)
}

// MAXVALIDATORS is a free data retrieval call binding the contract method 0x714897df.
//
// Solidity: function MAX_VALIDATORS() view returns(uint256)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCaller) MAXVALIDATORS(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _SigVerifierBlsBn254Simple.contract.Call(opts, &out, "MAX_VALIDATORS")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// MAXVALIDATORS is a free data retrieval call binding the contract method 0x714897df.
//
// Solidity: function MAX_VALIDATORS() view returns(uint256)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleSession) MAXVALIDATORS() (*big.Int, error) {
	return _SigVerifierBlsBn254Simple.Contract.MAXVALIDATORS(&_SigVerifierBlsBn254Simple.CallOpts)
}

// MAXVALIDATORS is a free data retrieval call binding the contract method 0x714897df.
//
// Solidity: function MAX_VALIDATORS() view returns(uint256)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCallerSession) MAXVALIDATORS() (*big.Int, error) {
	return _SigVerifierBlsBn254Simple.Contract.MAXVALIDATORS(&_SigVerifierBlsBn254Simple.CallOpts)
}

// VALIDATORSETHASHKECCAK256HASH is a free data retrieval call binding the contract method 0x5bb3e57b.
//
// Solidity: function VALIDATOR_SET_HASH_KECCAK256_HASH() view returns(bytes32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCaller) VALIDATORSETHASHKECCAK256HASH(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _SigVerifierBlsBn254Simple.contract.Call(opts, &out, "VALIDATOR_SET_HASH_KECCAK256_HASH")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// VALIDATORSETHASHKECCAK256HASH is a free data retrieval call binding the contract method 0x5bb3e57b.
//
// Solidity: function VALIDATOR_SET_HASH_KECCAK256_HASH() view returns(bytes32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleSession) VALIDATORSETHASHKECCAK256HASH() ([32]byte, error) {
	return _SigVerifierBlsBn254Simple.Contract.VALIDATORSETHASHKECCAK256HASH(&_SigVerifierBlsBn254Simple.CallOpts)
}

// VALIDATORSETHASHKECCAK256HASH is a free data retrieval call binding the contract method 0x5bb3e57b.
//
// Solidity: function VALIDATOR_SET_HASH_KECCAK256_HASH() view returns(bytes32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCallerSession) VALIDATORSETHASHKECCAK256HASH() ([32]byte, error) {
	return _SigVerifierBlsBn254Simple.Contract.VALIDATORSETHASHKECCAK256HASH(&_SigVerifierBlsBn254Simple.CallOpts)
}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCaller) VERIFICATIONTYPE(opts *bind.CallOpts) (uint32, error) {
	var out []interface{}
	err := _SigVerifierBlsBn254Simple.contract.Call(opts, &out, "VERIFICATION_TYPE")

	if err != nil {
		return *new(uint32), err
	}

	out0 := *abi.ConvertType(out[0], new(uint32)).(*uint32)

	return out0, err

}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleSession) VERIFICATIONTYPE() (uint32, error) {
	return _SigVerifierBlsBn254Simple.Contract.VERIFICATIONTYPE(&_SigVerifierBlsBn254Simple.CallOpts)
}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCallerSession) VERIFICATIONTYPE() (uint32, error) {
	return _SigVerifierBlsBn254Simple.Contract.VERIFICATIONTYPE(&_SigVerifierBlsBn254Simple.CallOpts)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCaller) VerifyQuorumSig(opts *bind.CallOpts, settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	var out []interface{}
	err := _SigVerifierBlsBn254Simple.contract.Call(opts, &out, "verifyQuorumSig", settlement, epoch, message, keyTag, quorumThreshold, proof)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleSession) VerifyQuorumSig(settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _SigVerifierBlsBn254Simple.Contract.VerifyQuorumSig(&_SigVerifierBlsBn254Simple.CallOpts, settlement, epoch, message, keyTag, quorumThreshold, proof)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_SigVerifierBlsBn254Simple *SigVerifierBlsBn254SimpleCallerSession) VerifyQuorumSig(settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _SigVerifierBlsBn254Simple.Contract.VerifyQuorumSig(&_SigVerifierBlsBn254Simple.CallOpts, settlement, epoch, message, keyTag, quorumThreshold, proof)
}

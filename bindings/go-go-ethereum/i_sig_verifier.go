// Code generated - DO NOT EDIT.
// This file is a generated binding and any manual changes will be lost.

package relaycontracts

import (
	"context"
	"errors"
	"math/big"
	"strings"
	"time"

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
	_ = time.Tick
	_ = context.Background
)

// ISigVerifierMetaData contains all meta data concerning the ISigVerifier contract.
var ISigVerifierMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"VERIFICATION_TYPE\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"verifyQuorumSig\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"message\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"}]",
}

// ISigVerifierABI is the input ABI used to generate the binding from.
// Deprecated: Use ISigVerifierMetaData.ABI instead.
var ISigVerifierABI = ISigVerifierMetaData.ABI

// ISigVerifier is an auto generated Go binding around an Ethereum contract.
type ISigVerifier struct {
	ISigVerifierCaller     // Read-only binding to the contract
	ISigVerifierTransactor // Write-only binding to the contract
	ISigVerifierFilterer   // Log filterer for contract events
}

// ISigVerifierCaller is an auto generated read-only Go binding around an Ethereum contract.
type ISigVerifierCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISigVerifierTransactor is an auto generated write-only Go binding around an Ethereum contract.
type ISigVerifierTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISigVerifierFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type ISigVerifierFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISigVerifierSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type ISigVerifierSession struct {
	Contract     *ISigVerifier     // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// ISigVerifierCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type ISigVerifierCallerSession struct {
	Contract *ISigVerifierCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts       // Call options to use throughout this session
}

// ISigVerifierTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type ISigVerifierTransactorSession struct {
	Contract     *ISigVerifierTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// ISigVerifierRaw is an auto generated low-level Go binding around an Ethereum contract.
type ISigVerifierRaw struct {
	Contract *ISigVerifier // Generic contract binding to access the raw methods on
}

// ISigVerifierCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type ISigVerifierCallerRaw struct {
	Contract *ISigVerifierCaller // Generic read-only contract binding to access the raw methods on
}

// ISigVerifierTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type ISigVerifierTransactorRaw struct {
	Contract *ISigVerifierTransactor // Generic write-only contract binding to access the raw methods on
}

// NewISigVerifier creates a new instance of ISigVerifier, bound to a specific deployed contract.
func NewISigVerifier(address common.Address, backend bind.ContractBackend) (*ISigVerifier, error) {
	contract, err := bindISigVerifier(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &ISigVerifier{ISigVerifierCaller: ISigVerifierCaller{contract: contract}, ISigVerifierTransactor: ISigVerifierTransactor{contract: contract}, ISigVerifierFilterer: ISigVerifierFilterer{contract: contract}}, nil
}

// NewISigVerifierCaller creates a new read-only instance of ISigVerifier, bound to a specific deployed contract.
func NewISigVerifierCaller(address common.Address, caller bind.ContractCaller) (*ISigVerifierCaller, error) {
	contract, err := bindISigVerifier(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &ISigVerifierCaller{contract: contract}, nil
}

// NewISigVerifierTransactor creates a new write-only instance of ISigVerifier, bound to a specific deployed contract.
func NewISigVerifierTransactor(address common.Address, transactor bind.ContractTransactor) (*ISigVerifierTransactor, error) {
	contract, err := bindISigVerifier(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &ISigVerifierTransactor{contract: contract}, nil
}

// NewISigVerifierFilterer creates a new log filterer instance of ISigVerifier, bound to a specific deployed contract.
func NewISigVerifierFilterer(address common.Address, filterer bind.ContractFilterer) (*ISigVerifierFilterer, error) {
	contract, err := bindISigVerifier(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &ISigVerifierFilterer{contract: contract}, nil
}

// bindISigVerifier binds a generic wrapper to an already deployed contract.
func bindISigVerifier(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := ISigVerifierMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISigVerifier *ISigVerifierRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISigVerifier.Contract.ISigVerifierCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISigVerifier *ISigVerifierRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISigVerifier.Contract.ISigVerifierTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISigVerifier *ISigVerifierRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISigVerifier.Contract.ISigVerifierTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISigVerifier *ISigVerifierCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISigVerifier.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISigVerifier *ISigVerifierTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISigVerifier.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISigVerifier *ISigVerifierTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISigVerifier.Contract.contract.Transact(opts, method, params...)
}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_ISigVerifier *ISigVerifierCaller) VERIFICATIONTYPE(opts *bind.CallOpts) (uint32, error) {
	var out []interface{}
	err := _ISigVerifier.contract.Call(opts, &out, "VERIFICATION_TYPE")

	if err != nil {
		return *new(uint32), err
	}

	out0 := *abi.ConvertType(out[0], new(uint32)).(*uint32)

	return out0, err

}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_ISigVerifier *ISigVerifierSession) VERIFICATIONTYPE() (uint32, error) {
	return _ISigVerifier.Contract.VERIFICATIONTYPE(&_ISigVerifier.CallOpts)
}

// VERIFICATIONTYPE is a free data retrieval call binding the contract method 0xd916d4e2.
//
// Solidity: function VERIFICATION_TYPE() view returns(uint32)
func (_ISigVerifier *ISigVerifierCallerSession) VERIFICATIONTYPE() (uint32, error) {
	return _ISigVerifier.Contract.VERIFICATIONTYPE(&_ISigVerifier.CallOpts)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISigVerifier *ISigVerifierCaller) VerifyQuorumSig(opts *bind.CallOpts, settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	var out []interface{}
	err := _ISigVerifier.contract.Call(opts, &out, "verifyQuorumSig", settlement, epoch, message, keyTag, quorumThreshold, proof)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISigVerifier *ISigVerifierSession) VerifyQuorumSig(settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _ISigVerifier.Contract.VerifyQuorumSig(&_ISigVerifier.CallOpts, settlement, epoch, message, keyTag, quorumThreshold, proof)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0xed273934.
//
// Solidity: function verifyQuorumSig(address settlement, uint48 epoch, bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISigVerifier *ISigVerifierCallerSession) VerifyQuorumSig(settlement common.Address, epoch *big.Int, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _ISigVerifier.Contract.VerifyQuorumSig(&_ISigVerifier.CallOpts, settlement, epoch, message, keyTag, quorumThreshold, proof)
}

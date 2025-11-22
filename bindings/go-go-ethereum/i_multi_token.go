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

// IMultiTokenMetaData contains all meta data concerning the IMultiToken contract.
var IMultiTokenMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"registerToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"}]",
}

// IMultiTokenABI is the input ABI used to generate the binding from.
// Deprecated: Use IMultiTokenMetaData.ABI instead.
var IMultiTokenABI = IMultiTokenMetaData.ABI

// IMultiToken is an auto generated Go binding around an Ethereum contract.
type IMultiToken struct {
	IMultiTokenCaller     // Read-only binding to the contract
	IMultiTokenTransactor // Write-only binding to the contract
	IMultiTokenFilterer   // Log filterer for contract events
}

// IMultiTokenCaller is an auto generated read-only Go binding around an Ethereum contract.
type IMultiTokenCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IMultiTokenTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IMultiTokenTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IMultiTokenFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IMultiTokenFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IMultiTokenSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IMultiTokenSession struct {
	Contract     *IMultiToken      // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IMultiTokenCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IMultiTokenCallerSession struct {
	Contract *IMultiTokenCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts      // Call options to use throughout this session
}

// IMultiTokenTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IMultiTokenTransactorSession struct {
	Contract     *IMultiTokenTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// IMultiTokenRaw is an auto generated low-level Go binding around an Ethereum contract.
type IMultiTokenRaw struct {
	Contract *IMultiToken // Generic contract binding to access the raw methods on
}

// IMultiTokenCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IMultiTokenCallerRaw struct {
	Contract *IMultiTokenCaller // Generic read-only contract binding to access the raw methods on
}

// IMultiTokenTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IMultiTokenTransactorRaw struct {
	Contract *IMultiTokenTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIMultiToken creates a new instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiToken(address common.Address, backend bind.ContractBackend) (*IMultiToken, error) {
	contract, err := bindIMultiToken(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IMultiToken{IMultiTokenCaller: IMultiTokenCaller{contract: contract}, IMultiTokenTransactor: IMultiTokenTransactor{contract: contract}, IMultiTokenFilterer: IMultiTokenFilterer{contract: contract}}, nil
}

// NewIMultiTokenCaller creates a new read-only instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiTokenCaller(address common.Address, caller bind.ContractCaller) (*IMultiTokenCaller, error) {
	contract, err := bindIMultiToken(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenCaller{contract: contract}, nil
}

// NewIMultiTokenTransactor creates a new write-only instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiTokenTransactor(address common.Address, transactor bind.ContractTransactor) (*IMultiTokenTransactor, error) {
	contract, err := bindIMultiToken(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenTransactor{contract: contract}, nil
}

// NewIMultiTokenFilterer creates a new log filterer instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiTokenFilterer(address common.Address, filterer bind.ContractFilterer) (*IMultiTokenFilterer, error) {
	contract, err := bindIMultiToken(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenFilterer{contract: contract}, nil
}

// bindIMultiToken binds a generic wrapper to an already deployed contract.
func bindIMultiToken(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IMultiTokenMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IMultiToken *IMultiTokenRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IMultiToken.Contract.IMultiTokenCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IMultiToken *IMultiTokenRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IMultiToken.Contract.IMultiTokenTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IMultiToken *IMultiTokenRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IMultiToken.Contract.IMultiTokenTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IMultiToken *IMultiTokenCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IMultiToken.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IMultiToken *IMultiTokenTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IMultiToken.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IMultiToken *IMultiTokenTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IMultiToken.Contract.contract.Transact(opts, method, params...)
}

// RegisterToken is a paid mutator transaction binding the contract method 0x09824a80.
//
// Solidity: function registerToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactor) RegisterToken(opts *bind.TransactOpts, token common.Address) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "registerToken", token)
}

// RegisterToken is a paid mutator transaction binding the contract method 0x09824a80.
//
// Solidity: function registerToken(address token) returns()
func (_IMultiToken *IMultiTokenSession) RegisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterToken(&_IMultiToken.TransactOpts, token)
}

// RegisterToken is a paid mutator transaction binding the contract method 0x09824a80.
//
// Solidity: function registerToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactorSession) RegisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterToken(&_IMultiToken.TransactOpts, token)
}

// UnregisterToken is a paid mutator transaction binding the contract method 0x77860cdd.
//
// Solidity: function unregisterToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactor) UnregisterToken(opts *bind.TransactOpts, token common.Address) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "unregisterToken", token)
}

// UnregisterToken is a paid mutator transaction binding the contract method 0x77860cdd.
//
// Solidity: function unregisterToken(address token) returns()
func (_IMultiToken *IMultiTokenSession) UnregisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterToken(&_IMultiToken.TransactOpts, token)
}

// UnregisterToken is a paid mutator transaction binding the contract method 0x77860cdd.
//
// Solidity: function unregisterToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactorSession) UnregisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterToken(&_IMultiToken.TransactOpts, token)
}

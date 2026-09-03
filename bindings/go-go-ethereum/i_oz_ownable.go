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

// IOzOwnableMetaData contains all meta data concerning the IOzOwnable contract.
var IOzOwnableMetaData = &bind.MetaData{
	ABI: "[]",
}

// IOzOwnableABI is the input ABI used to generate the binding from.
// Deprecated: Use IOzOwnableMetaData.ABI instead.
var IOzOwnableABI = IOzOwnableMetaData.ABI

// IOzOwnable is an auto generated Go binding around an Ethereum contract.
type IOzOwnable struct {
	IOzOwnableCaller     // Read-only binding to the contract
	IOzOwnableTransactor // Write-only binding to the contract
	IOzOwnableFilterer   // Log filterer for contract events
}

// IOzOwnableCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOzOwnableCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzOwnableTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOzOwnableTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzOwnableFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOzOwnableFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzOwnableSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOzOwnableSession struct {
	Contract     *IOzOwnable       // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IOzOwnableCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOzOwnableCallerSession struct {
	Contract *IOzOwnableCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts     // Call options to use throughout this session
}

// IOzOwnableTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOzOwnableTransactorSession struct {
	Contract     *IOzOwnableTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts     // Transaction auth options to use throughout this session
}

// IOzOwnableRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOzOwnableRaw struct {
	Contract *IOzOwnable // Generic contract binding to access the raw methods on
}

// IOzOwnableCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOzOwnableCallerRaw struct {
	Contract *IOzOwnableCaller // Generic read-only contract binding to access the raw methods on
}

// IOzOwnableTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOzOwnableTransactorRaw struct {
	Contract *IOzOwnableTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOzOwnable creates a new instance of IOzOwnable, bound to a specific deployed contract.
func NewIOzOwnable(address common.Address, backend bind.ContractBackend) (*IOzOwnable, error) {
	contract, err := bindIOzOwnable(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOzOwnable{IOzOwnableCaller: IOzOwnableCaller{contract: contract}, IOzOwnableTransactor: IOzOwnableTransactor{contract: contract}, IOzOwnableFilterer: IOzOwnableFilterer{contract: contract}}, nil
}

// NewIOzOwnableCaller creates a new read-only instance of IOzOwnable, bound to a specific deployed contract.
func NewIOzOwnableCaller(address common.Address, caller bind.ContractCaller) (*IOzOwnableCaller, error) {
	contract, err := bindIOzOwnable(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOzOwnableCaller{contract: contract}, nil
}

// NewIOzOwnableTransactor creates a new write-only instance of IOzOwnable, bound to a specific deployed contract.
func NewIOzOwnableTransactor(address common.Address, transactor bind.ContractTransactor) (*IOzOwnableTransactor, error) {
	contract, err := bindIOzOwnable(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOzOwnableTransactor{contract: contract}, nil
}

// NewIOzOwnableFilterer creates a new log filterer instance of IOzOwnable, bound to a specific deployed contract.
func NewIOzOwnableFilterer(address common.Address, filterer bind.ContractFilterer) (*IOzOwnableFilterer, error) {
	contract, err := bindIOzOwnable(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOzOwnableFilterer{contract: contract}, nil
}

// bindIOzOwnable binds a generic wrapper to an already deployed contract.
func bindIOzOwnable(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOzOwnableMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzOwnable *IOzOwnableRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzOwnable.Contract.IOzOwnableCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzOwnable *IOzOwnableRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzOwnable.Contract.IOzOwnableTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzOwnable *IOzOwnableRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzOwnable.Contract.IOzOwnableTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzOwnable *IOzOwnableCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzOwnable.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzOwnable *IOzOwnableTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzOwnable.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzOwnable *IOzOwnableTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzOwnable.Contract.contract.Transact(opts, method, params...)
}

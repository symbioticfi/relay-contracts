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

// IOzAccessManagedMetaData contains all meta data concerning the IOzAccessManaged contract.
var IOzAccessManagedMetaData = &bind.MetaData{
	ABI: "[]",
}

// IOzAccessManagedABI is the input ABI used to generate the binding from.
// Deprecated: Use IOzAccessManagedMetaData.ABI instead.
var IOzAccessManagedABI = IOzAccessManagedMetaData.ABI

// IOzAccessManaged is an auto generated Go binding around an Ethereum contract.
type IOzAccessManaged struct {
	IOzAccessManagedCaller     // Read-only binding to the contract
	IOzAccessManagedTransactor // Write-only binding to the contract
	IOzAccessManagedFilterer   // Log filterer for contract events
}

// IOzAccessManagedCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOzAccessManagedCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzAccessManagedTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOzAccessManagedTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzAccessManagedFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOzAccessManagedFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOzAccessManagedSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOzAccessManagedSession struct {
	Contract     *IOzAccessManaged // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IOzAccessManagedCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOzAccessManagedCallerSession struct {
	Contract *IOzAccessManagedCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts           // Call options to use throughout this session
}

// IOzAccessManagedTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOzAccessManagedTransactorSession struct {
	Contract     *IOzAccessManagedTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts           // Transaction auth options to use throughout this session
}

// IOzAccessManagedRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOzAccessManagedRaw struct {
	Contract *IOzAccessManaged // Generic contract binding to access the raw methods on
}

// IOzAccessManagedCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOzAccessManagedCallerRaw struct {
	Contract *IOzAccessManagedCaller // Generic read-only contract binding to access the raw methods on
}

// IOzAccessManagedTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOzAccessManagedTransactorRaw struct {
	Contract *IOzAccessManagedTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOzAccessManaged creates a new instance of IOzAccessManaged, bound to a specific deployed contract.
func NewIOzAccessManaged(address common.Address, backend bind.ContractBackend) (*IOzAccessManaged, error) {
	contract, err := bindIOzAccessManaged(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOzAccessManaged{IOzAccessManagedCaller: IOzAccessManagedCaller{contract: contract}, IOzAccessManagedTransactor: IOzAccessManagedTransactor{contract: contract}, IOzAccessManagedFilterer: IOzAccessManagedFilterer{contract: contract}}, nil
}

// NewIOzAccessManagedCaller creates a new read-only instance of IOzAccessManaged, bound to a specific deployed contract.
func NewIOzAccessManagedCaller(address common.Address, caller bind.ContractCaller) (*IOzAccessManagedCaller, error) {
	contract, err := bindIOzAccessManaged(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOzAccessManagedCaller{contract: contract}, nil
}

// NewIOzAccessManagedTransactor creates a new write-only instance of IOzAccessManaged, bound to a specific deployed contract.
func NewIOzAccessManagedTransactor(address common.Address, transactor bind.ContractTransactor) (*IOzAccessManagedTransactor, error) {
	contract, err := bindIOzAccessManaged(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOzAccessManagedTransactor{contract: contract}, nil
}

// NewIOzAccessManagedFilterer creates a new log filterer instance of IOzAccessManaged, bound to a specific deployed contract.
func NewIOzAccessManagedFilterer(address common.Address, filterer bind.ContractFilterer) (*IOzAccessManagedFilterer, error) {
	contract, err := bindIOzAccessManaged(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOzAccessManagedFilterer{contract: contract}, nil
}

// bindIOzAccessManaged binds a generic wrapper to an already deployed contract.
func bindIOzAccessManaged(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOzAccessManagedMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzAccessManaged *IOzAccessManagedRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzAccessManaged.Contract.IOzAccessManagedCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzAccessManaged *IOzAccessManagedRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzAccessManaged.Contract.IOzAccessManagedTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzAccessManaged *IOzAccessManagedRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzAccessManaged.Contract.IOzAccessManagedTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOzAccessManaged *IOzAccessManagedCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOzAccessManaged.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOzAccessManaged *IOzAccessManagedTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOzAccessManaged.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOzAccessManaged *IOzAccessManagedTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOzAccessManaged.Contract.contract.Transact(opts, method, params...)
}

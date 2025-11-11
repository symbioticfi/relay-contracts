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

// EpochManagerMetaData contains all meta data concerning the EpochManager contract.
var EpochManagerMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getCurrentEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCurrentEpochDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCurrentEpochStart\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochDuration\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochIndex\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochStart\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpochDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpochStart\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"InitEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"},{\"name\":\"epochDurationTimestamp\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"CheckpointUnorderedInsertion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_InvalidEpochDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_InvalidEpochDurationTimestamp\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_TooOldTimestamp\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]}]",
}

// EpochManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use EpochManagerMetaData.ABI instead.
var EpochManagerABI = EpochManagerMetaData.ABI

// EpochManager is an auto generated Go binding around an Ethereum contract.
type EpochManager struct {
	EpochManagerCaller     // Read-only binding to the contract
	EpochManagerTransactor // Write-only binding to the contract
	EpochManagerFilterer   // Log filterer for contract events
}

// EpochManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type EpochManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// EpochManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type EpochManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// EpochManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type EpochManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// EpochManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type EpochManagerSession struct {
	Contract     *EpochManager     // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// EpochManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type EpochManagerCallerSession struct {
	Contract *EpochManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts       // Call options to use throughout this session
}

// EpochManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type EpochManagerTransactorSession struct {
	Contract     *EpochManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// EpochManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type EpochManagerRaw struct {
	Contract *EpochManager // Generic contract binding to access the raw methods on
}

// EpochManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type EpochManagerCallerRaw struct {
	Contract *EpochManagerCaller // Generic read-only contract binding to access the raw methods on
}

// EpochManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type EpochManagerTransactorRaw struct {
	Contract *EpochManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewEpochManager creates a new instance of EpochManager, bound to a specific deployed contract.
func NewEpochManager(address common.Address, backend bind.ContractBackend) (*EpochManager, error) {
	contract, err := bindEpochManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &EpochManager{EpochManagerCaller: EpochManagerCaller{contract: contract}, EpochManagerTransactor: EpochManagerTransactor{contract: contract}, EpochManagerFilterer: EpochManagerFilterer{contract: contract}}, nil
}

// NewEpochManagerCaller creates a new read-only instance of EpochManager, bound to a specific deployed contract.
func NewEpochManagerCaller(address common.Address, caller bind.ContractCaller) (*EpochManagerCaller, error) {
	contract, err := bindEpochManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &EpochManagerCaller{contract: contract}, nil
}

// NewEpochManagerTransactor creates a new write-only instance of EpochManager, bound to a specific deployed contract.
func NewEpochManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*EpochManagerTransactor, error) {
	contract, err := bindEpochManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &EpochManagerTransactor{contract: contract}, nil
}

// NewEpochManagerFilterer creates a new log filterer instance of EpochManager, bound to a specific deployed contract.
func NewEpochManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*EpochManagerFilterer, error) {
	contract, err := bindEpochManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &EpochManagerFilterer{contract: contract}, nil
}

// bindEpochManager binds a generic wrapper to an already deployed contract.
func bindEpochManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := EpochManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_EpochManager *EpochManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _EpochManager.Contract.EpochManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_EpochManager *EpochManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _EpochManager.Contract.EpochManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_EpochManager *EpochManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _EpochManager.Contract.EpochManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_EpochManager *EpochManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _EpochManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_EpochManager *EpochManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _EpochManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_EpochManager *EpochManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _EpochManager.Contract.contract.Transact(opts, method, params...)
}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_EpochManager *EpochManagerCaller) GetCurrentEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getCurrentEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_EpochManager *EpochManagerSession) GetCurrentEpoch() (*big.Int, error) {
	return _EpochManager.Contract.GetCurrentEpoch(&_EpochManager.CallOpts)
}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_EpochManager *EpochManagerCallerSession) GetCurrentEpoch() (*big.Int, error) {
	return _EpochManager.Contract.GetCurrentEpoch(&_EpochManager.CallOpts)
}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48 epochDuration)
func (_EpochManager *EpochManagerCaller) GetCurrentEpochDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getCurrentEpochDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48 epochDuration)
func (_EpochManager *EpochManagerSession) GetCurrentEpochDuration() (*big.Int, error) {
	return _EpochManager.Contract.GetCurrentEpochDuration(&_EpochManager.CallOpts)
}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48 epochDuration)
func (_EpochManager *EpochManagerCallerSession) GetCurrentEpochDuration() (*big.Int, error) {
	return _EpochManager.Contract.GetCurrentEpochDuration(&_EpochManager.CallOpts)
}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_EpochManager *EpochManagerCaller) GetCurrentEpochStart(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getCurrentEpochStart")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_EpochManager *EpochManagerSession) GetCurrentEpochStart() (*big.Int, error) {
	return _EpochManager.Contract.GetCurrentEpochStart(&_EpochManager.CallOpts)
}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_EpochManager *EpochManagerCallerSession) GetCurrentEpochStart() (*big.Int, error) {
	return _EpochManager.Contract.GetCurrentEpochStart(&_EpochManager.CallOpts)
}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48 epochDuration)
func (_EpochManager *EpochManagerCaller) GetEpochDuration(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getEpochDuration", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48 epochDuration)
func (_EpochManager *EpochManagerSession) GetEpochDuration(epoch *big.Int) (*big.Int, error) {
	return _EpochManager.Contract.GetEpochDuration(&_EpochManager.CallOpts, epoch)
}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48 epochDuration)
func (_EpochManager *EpochManagerCallerSession) GetEpochDuration(epoch *big.Int) (*big.Int, error) {
	return _EpochManager.Contract.GetEpochDuration(&_EpochManager.CallOpts, epoch)
}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_EpochManager *EpochManagerCaller) GetEpochIndex(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getEpochIndex", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_EpochManager *EpochManagerSession) GetEpochIndex(timestamp *big.Int) (*big.Int, error) {
	return _EpochManager.Contract.GetEpochIndex(&_EpochManager.CallOpts, timestamp)
}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_EpochManager *EpochManagerCallerSession) GetEpochIndex(timestamp *big.Int) (*big.Int, error) {
	return _EpochManager.Contract.GetEpochIndex(&_EpochManager.CallOpts, timestamp)
}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_EpochManager *EpochManagerCaller) GetEpochStart(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getEpochStart", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_EpochManager *EpochManagerSession) GetEpochStart(epoch *big.Int) (*big.Int, error) {
	return _EpochManager.Contract.GetEpochStart(&_EpochManager.CallOpts, epoch)
}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_EpochManager *EpochManagerCallerSession) GetEpochStart(epoch *big.Int) (*big.Int, error) {
	return _EpochManager.Contract.GetEpochStart(&_EpochManager.CallOpts, epoch)
}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_EpochManager *EpochManagerCaller) GetNextEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getNextEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_EpochManager *EpochManagerSession) GetNextEpoch() (*big.Int, error) {
	return _EpochManager.Contract.GetNextEpoch(&_EpochManager.CallOpts)
}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_EpochManager *EpochManagerCallerSession) GetNextEpoch() (*big.Int, error) {
	return _EpochManager.Contract.GetNextEpoch(&_EpochManager.CallOpts)
}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_EpochManager *EpochManagerCaller) GetNextEpochDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getNextEpochDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_EpochManager *EpochManagerSession) GetNextEpochDuration() (*big.Int, error) {
	return _EpochManager.Contract.GetNextEpochDuration(&_EpochManager.CallOpts)
}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_EpochManager *EpochManagerCallerSession) GetNextEpochDuration() (*big.Int, error) {
	return _EpochManager.Contract.GetNextEpochDuration(&_EpochManager.CallOpts)
}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_EpochManager *EpochManagerCaller) GetNextEpochStart(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _EpochManager.contract.Call(opts, &out, "getNextEpochStart")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_EpochManager *EpochManagerSession) GetNextEpochStart() (*big.Int, error) {
	return _EpochManager.Contract.GetNextEpochStart(&_EpochManager.CallOpts)
}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_EpochManager *EpochManagerCallerSession) GetNextEpochStart() (*big.Int, error) {
	return _EpochManager.Contract.GetNextEpochStart(&_EpochManager.CallOpts)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_EpochManager *EpochManagerTransactor) SetEpochDuration(opts *bind.TransactOpts, epochDuration *big.Int) (*types.Transaction, error) {
	return _EpochManager.contract.Transact(opts, "setEpochDuration", epochDuration)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_EpochManager *EpochManagerSession) SetEpochDuration(epochDuration *big.Int) (*types.Transaction, error) {
	return _EpochManager.Contract.SetEpochDuration(&_EpochManager.TransactOpts, epochDuration)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_EpochManager *EpochManagerTransactorSession) SetEpochDuration(epochDuration *big.Int) (*types.Transaction, error) {
	return _EpochManager.Contract.SetEpochDuration(&_EpochManager.TransactOpts, epochDuration)
}

// EpochManagerInitEpochDurationIterator is returned from FilterInitEpochDuration and is used to iterate over the raw logs and unpacked data for InitEpochDuration events raised by the EpochManager contract.
type EpochManagerInitEpochDurationIterator struct {
	Event *EpochManagerInitEpochDuration // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *EpochManagerInitEpochDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(EpochManagerInitEpochDuration)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(EpochManagerInitEpochDuration)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *EpochManagerInitEpochDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *EpochManagerInitEpochDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// EpochManagerInitEpochDuration represents a InitEpochDuration event raised by the EpochManager contract.
type EpochManagerInitEpochDuration struct {
	EpochDuration          *big.Int
	EpochDurationTimestamp *big.Int
	Raw                    types.Log // Blockchain specific contextual infos
}

// FilterInitEpochDuration is a free log retrieval operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_EpochManager *EpochManagerFilterer) FilterInitEpochDuration(opts *bind.FilterOpts) (*EpochManagerInitEpochDurationIterator, error) {

	logs, sub, err := _EpochManager.contract.FilterLogs(opts, "InitEpochDuration")
	if err != nil {
		return nil, err
	}
	return &EpochManagerInitEpochDurationIterator{contract: _EpochManager.contract, event: "InitEpochDuration", logs: logs, sub: sub}, nil
}

// WatchInitEpochDuration is a free log subscription operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_EpochManager *EpochManagerFilterer) WatchInitEpochDuration(opts *bind.WatchOpts, sink chan<- *EpochManagerInitEpochDuration) (event.Subscription, error) {

	logs, sub, err := _EpochManager.contract.WatchLogs(opts, "InitEpochDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(EpochManagerInitEpochDuration)
				if err := _EpochManager.contract.UnpackLog(event, "InitEpochDuration", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseInitEpochDuration is a log parse operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_EpochManager *EpochManagerFilterer) ParseInitEpochDuration(log types.Log) (*EpochManagerInitEpochDuration, error) {
	event := new(EpochManagerInitEpochDuration)
	if err := _EpochManager.contract.UnpackLog(event, "InitEpochDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// EpochManagerInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the EpochManager contract.
type EpochManagerInitializedIterator struct {
	Event *EpochManagerInitialized // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *EpochManagerInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(EpochManagerInitialized)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(EpochManagerInitialized)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *EpochManagerInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *EpochManagerInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// EpochManagerInitialized represents a Initialized event raised by the EpochManager contract.
type EpochManagerInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_EpochManager *EpochManagerFilterer) FilterInitialized(opts *bind.FilterOpts) (*EpochManagerInitializedIterator, error) {

	logs, sub, err := _EpochManager.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &EpochManagerInitializedIterator{contract: _EpochManager.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_EpochManager *EpochManagerFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *EpochManagerInitialized) (event.Subscription, error) {

	logs, sub, err := _EpochManager.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(EpochManagerInitialized)
				if err := _EpochManager.contract.UnpackLog(event, "Initialized", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseInitialized is a log parse operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_EpochManager *EpochManagerFilterer) ParseInitialized(log types.Log) (*EpochManagerInitialized, error) {
	event := new(EpochManagerInitialized)
	if err := _EpochManager.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// EpochManagerSetEpochDurationIterator is returned from FilterSetEpochDuration and is used to iterate over the raw logs and unpacked data for SetEpochDuration events raised by the EpochManager contract.
type EpochManagerSetEpochDurationIterator struct {
	Event *EpochManagerSetEpochDuration // Event containing the contract specifics and raw log

	contract *bind.BoundContract // Generic contract to use for unpacking event data
	event    string              // Event name to use for unpacking event data

	logs chan types.Log        // Log channel receiving the found contract events
	sub  ethereum.Subscription // Subscription for errors, completion and termination
	done bool                  // Whether the subscription completed delivering logs
	fail error                 // Occurred error to stop iteration
}

// Next advances the iterator to the subsequent event, returning whether there
// are any more events found. In case of a retrieval or parsing error, false is
// returned and Error() can be queried for the exact failure.
func (it *EpochManagerSetEpochDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(EpochManagerSetEpochDuration)
			if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
				it.fail = err
				return false
			}
			it.Event.Raw = log
			return true

		default:
			return false
		}
	}
	// Iterator still in progress, wait for either a data or an error event
	select {
	case log := <-it.logs:
		it.Event = new(EpochManagerSetEpochDuration)
		if err := it.contract.UnpackLog(it.Event, it.event, log); err != nil {
			it.fail = err
			return false
		}
		it.Event.Raw = log
		return true

	case err := <-it.sub.Err():
		it.done = true
		it.fail = err
		return it.Next()
	}
}

// Error returns any retrieval or parsing error occurred during filtering.
func (it *EpochManagerSetEpochDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *EpochManagerSetEpochDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// EpochManagerSetEpochDuration represents a SetEpochDuration event raised by the EpochManager contract.
type EpochManagerSetEpochDuration struct {
	EpochDuration *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterSetEpochDuration is a free log retrieval operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_EpochManager *EpochManagerFilterer) FilterSetEpochDuration(opts *bind.FilterOpts) (*EpochManagerSetEpochDurationIterator, error) {

	logs, sub, err := _EpochManager.contract.FilterLogs(opts, "SetEpochDuration")
	if err != nil {
		return nil, err
	}
	return &EpochManagerSetEpochDurationIterator{contract: _EpochManager.contract, event: "SetEpochDuration", logs: logs, sub: sub}, nil
}

// WatchSetEpochDuration is a free log subscription operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_EpochManager *EpochManagerFilterer) WatchSetEpochDuration(opts *bind.WatchOpts, sink chan<- *EpochManagerSetEpochDuration) (event.Subscription, error) {

	logs, sub, err := _EpochManager.contract.WatchLogs(opts, "SetEpochDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(EpochManagerSetEpochDuration)
				if err := _EpochManager.contract.UnpackLog(event, "SetEpochDuration", log); err != nil {
					return err
				}
				event.Raw = log

				select {
				case sink <- event:
				case err := <-sub.Err():
					return err
				case <-quit:
					return nil
				}
			case err := <-sub.Err():
				return err
			case <-quit:
				return nil
			}
		}
	}), nil
}

// ParseSetEpochDuration is a log parse operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_EpochManager *EpochManagerFilterer) ParseSetEpochDuration(log types.Log) (*EpochManagerSetEpochDuration, error) {
	event := new(EpochManagerSetEpochDuration)
	if err := _EpochManager.contract.UnpackLog(event, "SetEpochDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

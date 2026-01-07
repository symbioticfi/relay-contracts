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

// IEpochManagerMetaData contains all meta data concerning the IEpochManager contract.
var IEpochManagerMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getCurrentEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCurrentEpochDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCurrentEpochStart\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochDuration\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochIndex\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochStart\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpochDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpochStart\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"InitEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"},{\"name\":\"epochDurationTimestamp\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"EpochManager_InvalidEpochDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_InvalidEpochDurationTimestamp\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_TooOldTimestamp\",\"inputs\":[]}]",
}

// IEpochManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use IEpochManagerMetaData.ABI instead.
var IEpochManagerABI = IEpochManagerMetaData.ABI

// IEpochManager is an auto generated Go binding around an Ethereum contract.
type IEpochManager struct {
	IEpochManagerCaller     // Read-only binding to the contract
	IEpochManagerTransactor // Write-only binding to the contract
	IEpochManagerFilterer   // Log filterer for contract events
}

// IEpochManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type IEpochManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IEpochManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IEpochManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IEpochManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IEpochManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IEpochManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IEpochManagerSession struct {
	Contract     *IEpochManager    // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IEpochManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IEpochManagerCallerSession struct {
	Contract *IEpochManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts        // Call options to use throughout this session
}

// IEpochManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IEpochManagerTransactorSession struct {
	Contract     *IEpochManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts        // Transaction auth options to use throughout this session
}

// IEpochManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type IEpochManagerRaw struct {
	Contract *IEpochManager // Generic contract binding to access the raw methods on
}

// IEpochManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IEpochManagerCallerRaw struct {
	Contract *IEpochManagerCaller // Generic read-only contract binding to access the raw methods on
}

// IEpochManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IEpochManagerTransactorRaw struct {
	Contract *IEpochManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIEpochManager creates a new instance of IEpochManager, bound to a specific deployed contract.
func NewIEpochManager(address common.Address, backend bind.ContractBackend) (*IEpochManager, error) {
	contract, err := bindIEpochManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IEpochManager{IEpochManagerCaller: IEpochManagerCaller{contract: contract}, IEpochManagerTransactor: IEpochManagerTransactor{contract: contract}, IEpochManagerFilterer: IEpochManagerFilterer{contract: contract}}, nil
}

// NewIEpochManagerCaller creates a new read-only instance of IEpochManager, bound to a specific deployed contract.
func NewIEpochManagerCaller(address common.Address, caller bind.ContractCaller) (*IEpochManagerCaller, error) {
	contract, err := bindIEpochManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IEpochManagerCaller{contract: contract}, nil
}

// NewIEpochManagerTransactor creates a new write-only instance of IEpochManager, bound to a specific deployed contract.
func NewIEpochManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*IEpochManagerTransactor, error) {
	contract, err := bindIEpochManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IEpochManagerTransactor{contract: contract}, nil
}

// NewIEpochManagerFilterer creates a new log filterer instance of IEpochManager, bound to a specific deployed contract.
func NewIEpochManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*IEpochManagerFilterer, error) {
	contract, err := bindIEpochManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IEpochManagerFilterer{contract: contract}, nil
}

// bindIEpochManager binds a generic wrapper to an already deployed contract.
func bindIEpochManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IEpochManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IEpochManager *IEpochManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IEpochManager.Contract.IEpochManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IEpochManager *IEpochManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IEpochManager.Contract.IEpochManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IEpochManager *IEpochManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IEpochManager.Contract.IEpochManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IEpochManager *IEpochManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IEpochManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IEpochManager *IEpochManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IEpochManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IEpochManager *IEpochManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IEpochManager.Contract.contract.Transact(opts, method, params...)
}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetCurrentEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getCurrentEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetCurrentEpoch() (*big.Int, error) {
	return _IEpochManager.Contract.GetCurrentEpoch(&_IEpochManager.CallOpts)
}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetCurrentEpoch() (*big.Int, error) {
	return _IEpochManager.Contract.GetCurrentEpoch(&_IEpochManager.CallOpts)
}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetCurrentEpochDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getCurrentEpochDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetCurrentEpochDuration() (*big.Int, error) {
	return _IEpochManager.Contract.GetCurrentEpochDuration(&_IEpochManager.CallOpts)
}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetCurrentEpochDuration() (*big.Int, error) {
	return _IEpochManager.Contract.GetCurrentEpochDuration(&_IEpochManager.CallOpts)
}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetCurrentEpochStart(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getCurrentEpochStart")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetCurrentEpochStart() (*big.Int, error) {
	return _IEpochManager.Contract.GetCurrentEpochStart(&_IEpochManager.CallOpts)
}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetCurrentEpochStart() (*big.Int, error) {
	return _IEpochManager.Contract.GetCurrentEpochStart(&_IEpochManager.CallOpts)
}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetEpochDuration(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getEpochDuration", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetEpochDuration(epoch *big.Int) (*big.Int, error) {
	return _IEpochManager.Contract.GetEpochDuration(&_IEpochManager.CallOpts, epoch)
}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetEpochDuration(epoch *big.Int) (*big.Int, error) {
	return _IEpochManager.Contract.GetEpochDuration(&_IEpochManager.CallOpts, epoch)
}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetEpochIndex(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getEpochIndex", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetEpochIndex(timestamp *big.Int) (*big.Int, error) {
	return _IEpochManager.Contract.GetEpochIndex(&_IEpochManager.CallOpts, timestamp)
}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetEpochIndex(timestamp *big.Int) (*big.Int, error) {
	return _IEpochManager.Contract.GetEpochIndex(&_IEpochManager.CallOpts, timestamp)
}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetEpochStart(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getEpochStart", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetEpochStart(epoch *big.Int) (*big.Int, error) {
	return _IEpochManager.Contract.GetEpochStart(&_IEpochManager.CallOpts, epoch)
}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetEpochStart(epoch *big.Int) (*big.Int, error) {
	return _IEpochManager.Contract.GetEpochStart(&_IEpochManager.CallOpts, epoch)
}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetNextEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getNextEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetNextEpoch() (*big.Int, error) {
	return _IEpochManager.Contract.GetNextEpoch(&_IEpochManager.CallOpts)
}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetNextEpoch() (*big.Int, error) {
	return _IEpochManager.Contract.GetNextEpoch(&_IEpochManager.CallOpts)
}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetNextEpochDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getNextEpochDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetNextEpochDuration() (*big.Int, error) {
	return _IEpochManager.Contract.GetNextEpochDuration(&_IEpochManager.CallOpts)
}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetNextEpochDuration() (*big.Int, error) {
	return _IEpochManager.Contract.GetNextEpochDuration(&_IEpochManager.CallOpts)
}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_IEpochManager *IEpochManagerCaller) GetNextEpochStart(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IEpochManager.contract.Call(opts, &out, "getNextEpochStart")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_IEpochManager *IEpochManagerSession) GetNextEpochStart() (*big.Int, error) {
	return _IEpochManager.Contract.GetNextEpochStart(&_IEpochManager.CallOpts)
}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_IEpochManager *IEpochManagerCallerSession) GetNextEpochStart() (*big.Int, error) {
	return _IEpochManager.Contract.GetNextEpochStart(&_IEpochManager.CallOpts)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_IEpochManager *IEpochManagerTransactor) SetEpochDuration(opts *bind.TransactOpts, epochDuration *big.Int) (*types.Transaction, error) {
	return _IEpochManager.contract.Transact(opts, "setEpochDuration", epochDuration)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_IEpochManager *IEpochManagerSession) SetEpochDuration(epochDuration *big.Int) (*types.Transaction, error) {
	return _IEpochManager.Contract.SetEpochDuration(&_IEpochManager.TransactOpts, epochDuration)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_IEpochManager *IEpochManagerTransactorSession) SetEpochDuration(epochDuration *big.Int) (*types.Transaction, error) {
	return _IEpochManager.Contract.SetEpochDuration(&_IEpochManager.TransactOpts, epochDuration)
}

// IEpochManagerInitEpochDurationIterator is returned from FilterInitEpochDuration and is used to iterate over the raw logs and unpacked data for InitEpochDuration events raised by the IEpochManager contract.
type IEpochManagerInitEpochDurationIterator struct {
	Event *IEpochManagerInitEpochDuration // Event containing the contract specifics and raw log

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
func (it *IEpochManagerInitEpochDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IEpochManagerInitEpochDuration)
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
		it.Event = new(IEpochManagerInitEpochDuration)
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
func (it *IEpochManagerInitEpochDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IEpochManagerInitEpochDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IEpochManagerInitEpochDuration represents a InitEpochDuration event raised by the IEpochManager contract.
type IEpochManagerInitEpochDuration struct {
	EpochDuration          *big.Int
	EpochDurationTimestamp *big.Int
	Raw                    types.Log // Blockchain specific contextual infos
}

// FilterInitEpochDuration is a free log retrieval operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_IEpochManager *IEpochManagerFilterer) FilterInitEpochDuration(opts *bind.FilterOpts) (*IEpochManagerInitEpochDurationIterator, error) {

	logs, sub, err := _IEpochManager.contract.FilterLogs(opts, "InitEpochDuration")
	if err != nil {
		return nil, err
	}
	return &IEpochManagerInitEpochDurationIterator{contract: _IEpochManager.contract, event: "InitEpochDuration", logs: logs, sub: sub}, nil
}

// WatchInitEpochDuration is a free log subscription operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_IEpochManager *IEpochManagerFilterer) WatchInitEpochDuration(opts *bind.WatchOpts, sink chan<- *IEpochManagerInitEpochDuration) (event.Subscription, error) {

	logs, sub, err := _IEpochManager.contract.WatchLogs(opts, "InitEpochDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IEpochManagerInitEpochDuration)
				if err := _IEpochManager.contract.UnpackLog(event, "InitEpochDuration", log); err != nil {
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
func (_IEpochManager *IEpochManagerFilterer) ParseInitEpochDuration(log types.Log) (*IEpochManagerInitEpochDuration, error) {
	event := new(IEpochManagerInitEpochDuration)
	if err := _IEpochManager.contract.UnpackLog(event, "InitEpochDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IEpochManagerSetEpochDurationIterator is returned from FilterSetEpochDuration and is used to iterate over the raw logs and unpacked data for SetEpochDuration events raised by the IEpochManager contract.
type IEpochManagerSetEpochDurationIterator struct {
	Event *IEpochManagerSetEpochDuration // Event containing the contract specifics and raw log

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
func (it *IEpochManagerSetEpochDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IEpochManagerSetEpochDuration)
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
		it.Event = new(IEpochManagerSetEpochDuration)
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
func (it *IEpochManagerSetEpochDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IEpochManagerSetEpochDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IEpochManagerSetEpochDuration represents a SetEpochDuration event raised by the IEpochManager contract.
type IEpochManagerSetEpochDuration struct {
	EpochDuration *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterSetEpochDuration is a free log retrieval operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_IEpochManager *IEpochManagerFilterer) FilterSetEpochDuration(opts *bind.FilterOpts) (*IEpochManagerSetEpochDurationIterator, error) {

	logs, sub, err := _IEpochManager.contract.FilterLogs(opts, "SetEpochDuration")
	if err != nil {
		return nil, err
	}
	return &IEpochManagerSetEpochDurationIterator{contract: _IEpochManager.contract, event: "SetEpochDuration", logs: logs, sub: sub}, nil
}

// WatchSetEpochDuration is a free log subscription operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_IEpochManager *IEpochManagerFilterer) WatchSetEpochDuration(opts *bind.WatchOpts, sink chan<- *IEpochManagerSetEpochDuration) (event.Subscription, error) {

	logs, sub, err := _IEpochManager.contract.WatchLogs(opts, "SetEpochDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IEpochManagerSetEpochDuration)
				if err := _IEpochManager.contract.UnpackLog(event, "SetEpochDuration", log); err != nil {
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
func (_IEpochManager *IEpochManagerFilterer) ParseSetEpochDuration(log types.Log) (*IEpochManagerSetEpochDuration, error) {
	event := new(IEpochManagerSetEpochDuration)
	if err := _IEpochManager.contract.UnpackLog(event, "SetEpochDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

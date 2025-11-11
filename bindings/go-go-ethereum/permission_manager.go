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

// PermissionManagerMetaData contains all meta data concerning the PermissionManager contract.
var PermissionManagerMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]}]",
}

// PermissionManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use PermissionManagerMetaData.ABI instead.
var PermissionManagerABI = PermissionManagerMetaData.ABI

// PermissionManager is an auto generated Go binding around an Ethereum contract.
type PermissionManager struct {
	PermissionManagerCaller     // Read-only binding to the contract
	PermissionManagerTransactor // Write-only binding to the contract
	PermissionManagerFilterer   // Log filterer for contract events
}

// PermissionManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type PermissionManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// PermissionManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type PermissionManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// PermissionManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type PermissionManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// PermissionManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type PermissionManagerSession struct {
	Contract     *PermissionManager // Generic contract binding to set the session for
	CallOpts     bind.CallOpts      // Call options to use throughout this session
	TransactOpts bind.TransactOpts  // Transaction auth options to use throughout this session
}

// PermissionManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type PermissionManagerCallerSession struct {
	Contract *PermissionManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts            // Call options to use throughout this session
}

// PermissionManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type PermissionManagerTransactorSession struct {
	Contract     *PermissionManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts            // Transaction auth options to use throughout this session
}

// PermissionManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type PermissionManagerRaw struct {
	Contract *PermissionManager // Generic contract binding to access the raw methods on
}

// PermissionManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type PermissionManagerCallerRaw struct {
	Contract *PermissionManagerCaller // Generic read-only contract binding to access the raw methods on
}

// PermissionManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type PermissionManagerTransactorRaw struct {
	Contract *PermissionManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewPermissionManager creates a new instance of PermissionManager, bound to a specific deployed contract.
func NewPermissionManager(address common.Address, backend bind.ContractBackend) (*PermissionManager, error) {
	contract, err := bindPermissionManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &PermissionManager{PermissionManagerCaller: PermissionManagerCaller{contract: contract}, PermissionManagerTransactor: PermissionManagerTransactor{contract: contract}, PermissionManagerFilterer: PermissionManagerFilterer{contract: contract}}, nil
}

// NewPermissionManagerCaller creates a new read-only instance of PermissionManager, bound to a specific deployed contract.
func NewPermissionManagerCaller(address common.Address, caller bind.ContractCaller) (*PermissionManagerCaller, error) {
	contract, err := bindPermissionManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &PermissionManagerCaller{contract: contract}, nil
}

// NewPermissionManagerTransactor creates a new write-only instance of PermissionManager, bound to a specific deployed contract.
func NewPermissionManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*PermissionManagerTransactor, error) {
	contract, err := bindPermissionManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &PermissionManagerTransactor{contract: contract}, nil
}

// NewPermissionManagerFilterer creates a new log filterer instance of PermissionManager, bound to a specific deployed contract.
func NewPermissionManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*PermissionManagerFilterer, error) {
	contract, err := bindPermissionManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &PermissionManagerFilterer{contract: contract}, nil
}

// bindPermissionManager binds a generic wrapper to an already deployed contract.
func bindPermissionManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := PermissionManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_PermissionManager *PermissionManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _PermissionManager.Contract.PermissionManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_PermissionManager *PermissionManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _PermissionManager.Contract.PermissionManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_PermissionManager *PermissionManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _PermissionManager.Contract.PermissionManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_PermissionManager *PermissionManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _PermissionManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_PermissionManager *PermissionManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _PermissionManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_PermissionManager *PermissionManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _PermissionManager.Contract.contract.Transact(opts, method, params...)
}

// PermissionManagerInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the PermissionManager contract.
type PermissionManagerInitializedIterator struct {
	Event *PermissionManagerInitialized // Event containing the contract specifics and raw log

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
func (it *PermissionManagerInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(PermissionManagerInitialized)
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
		it.Event = new(PermissionManagerInitialized)
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
func (it *PermissionManagerInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *PermissionManagerInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// PermissionManagerInitialized represents a Initialized event raised by the PermissionManager contract.
type PermissionManagerInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_PermissionManager *PermissionManagerFilterer) FilterInitialized(opts *bind.FilterOpts) (*PermissionManagerInitializedIterator, error) {

	logs, sub, err := _PermissionManager.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &PermissionManagerInitializedIterator{contract: _PermissionManager.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_PermissionManager *PermissionManagerFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *PermissionManagerInitialized) (event.Subscription, error) {

	logs, sub, err := _PermissionManager.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(PermissionManagerInitialized)
				if err := _PermissionManager.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_PermissionManager *PermissionManagerFilterer) ParseInitialized(log types.Log) (*PermissionManagerInitialized, error) {
	event := new(PermissionManagerInitialized)
	if err := _PermissionManager.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

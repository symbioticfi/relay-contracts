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

// INetworkManagerMetaData contains all meta data concerning the INetworkManager contract.
var INetworkManagerMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"NETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK_IDENTIFIER\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint96\",\"internalType\":\"uint96\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"staticDelegateCall\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"data\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"InitSubnetwork\",\"inputs\":[{\"name\":\"network\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"},{\"name\":\"subnetworkId\",\"type\":\"uint96\",\"indexed\":false,\"internalType\":\"uint96\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"NetworkManager_InvalidNetwork\",\"inputs\":[]}]",
}

// INetworkManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use INetworkManagerMetaData.ABI instead.
var INetworkManagerABI = INetworkManagerMetaData.ABI

// INetworkManager is an auto generated Go binding around an Ethereum contract.
type INetworkManager struct {
	INetworkManagerCaller     // Read-only binding to the contract
	INetworkManagerTransactor // Write-only binding to the contract
	INetworkManagerFilterer   // Log filterer for contract events
}

// INetworkManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type INetworkManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// INetworkManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type INetworkManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// INetworkManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type INetworkManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// INetworkManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type INetworkManagerSession struct {
	Contract     *INetworkManager  // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// INetworkManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type INetworkManagerCallerSession struct {
	Contract *INetworkManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts          // Call options to use throughout this session
}

// INetworkManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type INetworkManagerTransactorSession struct {
	Contract     *INetworkManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts          // Transaction auth options to use throughout this session
}

// INetworkManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type INetworkManagerRaw struct {
	Contract *INetworkManager // Generic contract binding to access the raw methods on
}

// INetworkManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type INetworkManagerCallerRaw struct {
	Contract *INetworkManagerCaller // Generic read-only contract binding to access the raw methods on
}

// INetworkManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type INetworkManagerTransactorRaw struct {
	Contract *INetworkManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewINetworkManager creates a new instance of INetworkManager, bound to a specific deployed contract.
func NewINetworkManager(address common.Address, backend bind.ContractBackend) (*INetworkManager, error) {
	contract, err := bindINetworkManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &INetworkManager{INetworkManagerCaller: INetworkManagerCaller{contract: contract}, INetworkManagerTransactor: INetworkManagerTransactor{contract: contract}, INetworkManagerFilterer: INetworkManagerFilterer{contract: contract}}, nil
}

// NewINetworkManagerCaller creates a new read-only instance of INetworkManager, bound to a specific deployed contract.
func NewINetworkManagerCaller(address common.Address, caller bind.ContractCaller) (*INetworkManagerCaller, error) {
	contract, err := bindINetworkManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &INetworkManagerCaller{contract: contract}, nil
}

// NewINetworkManagerTransactor creates a new write-only instance of INetworkManager, bound to a specific deployed contract.
func NewINetworkManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*INetworkManagerTransactor, error) {
	contract, err := bindINetworkManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &INetworkManagerTransactor{contract: contract}, nil
}

// NewINetworkManagerFilterer creates a new log filterer instance of INetworkManager, bound to a specific deployed contract.
func NewINetworkManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*INetworkManagerFilterer, error) {
	contract, err := bindINetworkManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &INetworkManagerFilterer{contract: contract}, nil
}

// bindINetworkManager binds a generic wrapper to an already deployed contract.
func bindINetworkManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := INetworkManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_INetworkManager *INetworkManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _INetworkManager.Contract.INetworkManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_INetworkManager *INetworkManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _INetworkManager.Contract.INetworkManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_INetworkManager *INetworkManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _INetworkManager.Contract.INetworkManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_INetworkManager *INetworkManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _INetworkManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_INetworkManager *INetworkManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _INetworkManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_INetworkManager *INetworkManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _INetworkManager.Contract.contract.Transact(opts, method, params...)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_INetworkManager *INetworkManagerCaller) NETWORK(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _INetworkManager.contract.Call(opts, &out, "NETWORK")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_INetworkManager *INetworkManagerSession) NETWORK() (common.Address, error) {
	return _INetworkManager.Contract.NETWORK(&_INetworkManager.CallOpts)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_INetworkManager *INetworkManagerCallerSession) NETWORK() (common.Address, error) {
	return _INetworkManager.Contract.NETWORK(&_INetworkManager.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_INetworkManager *INetworkManagerCaller) SUBNETWORK(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _INetworkManager.contract.Call(opts, &out, "SUBNETWORK")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_INetworkManager *INetworkManagerSession) SUBNETWORK() ([32]byte, error) {
	return _INetworkManager.Contract.SUBNETWORK(&_INetworkManager.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_INetworkManager *INetworkManagerCallerSession) SUBNETWORK() ([32]byte, error) {
	return _INetworkManager.Contract.SUBNETWORK(&_INetworkManager.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_INetworkManager *INetworkManagerCaller) SUBNETWORKIDENTIFIER(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _INetworkManager.contract.Call(opts, &out, "SUBNETWORK_IDENTIFIER")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_INetworkManager *INetworkManagerSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _INetworkManager.Contract.SUBNETWORKIDENTIFIER(&_INetworkManager.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_INetworkManager *INetworkManagerCallerSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _INetworkManager.Contract.SUBNETWORKIDENTIFIER(&_INetworkManager.CallOpts)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_INetworkManager *INetworkManagerTransactor) StaticDelegateCall(opts *bind.TransactOpts, target common.Address, data []byte) (*types.Transaction, error) {
	return _INetworkManager.contract.Transact(opts, "staticDelegateCall", target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_INetworkManager *INetworkManagerSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _INetworkManager.Contract.StaticDelegateCall(&_INetworkManager.TransactOpts, target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_INetworkManager *INetworkManagerTransactorSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _INetworkManager.Contract.StaticDelegateCall(&_INetworkManager.TransactOpts, target, data)
}

// INetworkManagerInitSubnetworkIterator is returned from FilterInitSubnetwork and is used to iterate over the raw logs and unpacked data for InitSubnetwork events raised by the INetworkManager contract.
type INetworkManagerInitSubnetworkIterator struct {
	Event *INetworkManagerInitSubnetwork // Event containing the contract specifics and raw log

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
func (it *INetworkManagerInitSubnetworkIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(INetworkManagerInitSubnetwork)
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
		it.Event = new(INetworkManagerInitSubnetwork)
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
func (it *INetworkManagerInitSubnetworkIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *INetworkManagerInitSubnetworkIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// INetworkManagerInitSubnetwork represents a InitSubnetwork event raised by the INetworkManager contract.
type INetworkManagerInitSubnetwork struct {
	Network      common.Address
	SubnetworkId *big.Int
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterInitSubnetwork is a free log retrieval operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_INetworkManager *INetworkManagerFilterer) FilterInitSubnetwork(opts *bind.FilterOpts) (*INetworkManagerInitSubnetworkIterator, error) {

	logs, sub, err := _INetworkManager.contract.FilterLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return &INetworkManagerInitSubnetworkIterator{contract: _INetworkManager.contract, event: "InitSubnetwork", logs: logs, sub: sub}, nil
}

// WatchInitSubnetwork is a free log subscription operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_INetworkManager *INetworkManagerFilterer) WatchInitSubnetwork(opts *bind.WatchOpts, sink chan<- *INetworkManagerInitSubnetwork) (event.Subscription, error) {

	logs, sub, err := _INetworkManager.contract.WatchLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(INetworkManagerInitSubnetwork)
				if err := _INetworkManager.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
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

// ParseInitSubnetwork is a log parse operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_INetworkManager *INetworkManagerFilterer) ParseInitSubnetwork(log types.Log) (*INetworkManagerInitSubnetwork, error) {
	event := new(INetworkManagerInitSubnetwork)
	if err := _INetworkManager.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

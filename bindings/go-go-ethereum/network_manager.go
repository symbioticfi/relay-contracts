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

// NetworkManagerMetaData contains all meta data concerning the NetworkManager contract.
var NetworkManagerMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"NETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK_IDENTIFIER\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint96\",\"internalType\":\"uint96\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"staticDelegateCall\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"data\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"InitSubnetwork\",\"inputs\":[{\"name\":\"network\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"},{\"name\":\"subnetworkId\",\"type\":\"uint96\",\"indexed\":false,\"internalType\":\"uint96\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NetworkManager_InvalidNetwork\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]}]",
}

// NetworkManagerABI is the input ABI used to generate the binding from.
// Deprecated: Use NetworkManagerMetaData.ABI instead.
var NetworkManagerABI = NetworkManagerMetaData.ABI

// NetworkManager is an auto generated Go binding around an Ethereum contract.
type NetworkManager struct {
	NetworkManagerCaller     // Read-only binding to the contract
	NetworkManagerTransactor // Write-only binding to the contract
	NetworkManagerFilterer   // Log filterer for contract events
}

// NetworkManagerCaller is an auto generated read-only Go binding around an Ethereum contract.
type NetworkManagerCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// NetworkManagerTransactor is an auto generated write-only Go binding around an Ethereum contract.
type NetworkManagerTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// NetworkManagerFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type NetworkManagerFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// NetworkManagerSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type NetworkManagerSession struct {
	Contract     *NetworkManager   // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// NetworkManagerCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type NetworkManagerCallerSession struct {
	Contract *NetworkManagerCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts         // Call options to use throughout this session
}

// NetworkManagerTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type NetworkManagerTransactorSession struct {
	Contract     *NetworkManagerTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts         // Transaction auth options to use throughout this session
}

// NetworkManagerRaw is an auto generated low-level Go binding around an Ethereum contract.
type NetworkManagerRaw struct {
	Contract *NetworkManager // Generic contract binding to access the raw methods on
}

// NetworkManagerCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type NetworkManagerCallerRaw struct {
	Contract *NetworkManagerCaller // Generic read-only contract binding to access the raw methods on
}

// NetworkManagerTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type NetworkManagerTransactorRaw struct {
	Contract *NetworkManagerTransactor // Generic write-only contract binding to access the raw methods on
}

// NewNetworkManager creates a new instance of NetworkManager, bound to a specific deployed contract.
func NewNetworkManager(address common.Address, backend bind.ContractBackend) (*NetworkManager, error) {
	contract, err := bindNetworkManager(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &NetworkManager{NetworkManagerCaller: NetworkManagerCaller{contract: contract}, NetworkManagerTransactor: NetworkManagerTransactor{contract: contract}, NetworkManagerFilterer: NetworkManagerFilterer{contract: contract}}, nil
}

// NewNetworkManagerCaller creates a new read-only instance of NetworkManager, bound to a specific deployed contract.
func NewNetworkManagerCaller(address common.Address, caller bind.ContractCaller) (*NetworkManagerCaller, error) {
	contract, err := bindNetworkManager(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &NetworkManagerCaller{contract: contract}, nil
}

// NewNetworkManagerTransactor creates a new write-only instance of NetworkManager, bound to a specific deployed contract.
func NewNetworkManagerTransactor(address common.Address, transactor bind.ContractTransactor) (*NetworkManagerTransactor, error) {
	contract, err := bindNetworkManager(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &NetworkManagerTransactor{contract: contract}, nil
}

// NewNetworkManagerFilterer creates a new log filterer instance of NetworkManager, bound to a specific deployed contract.
func NewNetworkManagerFilterer(address common.Address, filterer bind.ContractFilterer) (*NetworkManagerFilterer, error) {
	contract, err := bindNetworkManager(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &NetworkManagerFilterer{contract: contract}, nil
}

// bindNetworkManager binds a generic wrapper to an already deployed contract.
func bindNetworkManager(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := NetworkManagerMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_NetworkManager *NetworkManagerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _NetworkManager.Contract.NetworkManagerCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_NetworkManager *NetworkManagerRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _NetworkManager.Contract.NetworkManagerTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_NetworkManager *NetworkManagerRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _NetworkManager.Contract.NetworkManagerTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_NetworkManager *NetworkManagerCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _NetworkManager.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_NetworkManager *NetworkManagerTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _NetworkManager.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_NetworkManager *NetworkManagerTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _NetworkManager.Contract.contract.Transact(opts, method, params...)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_NetworkManager *NetworkManagerCaller) NETWORK(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _NetworkManager.contract.Call(opts, &out, "NETWORK")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_NetworkManager *NetworkManagerSession) NETWORK() (common.Address, error) {
	return _NetworkManager.Contract.NETWORK(&_NetworkManager.CallOpts)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_NetworkManager *NetworkManagerCallerSession) NETWORK() (common.Address, error) {
	return _NetworkManager.Contract.NETWORK(&_NetworkManager.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_NetworkManager *NetworkManagerCaller) SUBNETWORK(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _NetworkManager.contract.Call(opts, &out, "SUBNETWORK")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_NetworkManager *NetworkManagerSession) SUBNETWORK() ([32]byte, error) {
	return _NetworkManager.Contract.SUBNETWORK(&_NetworkManager.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_NetworkManager *NetworkManagerCallerSession) SUBNETWORK() ([32]byte, error) {
	return _NetworkManager.Contract.SUBNETWORK(&_NetworkManager.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_NetworkManager *NetworkManagerCaller) SUBNETWORKIDENTIFIER(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _NetworkManager.contract.Call(opts, &out, "SUBNETWORK_IDENTIFIER")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_NetworkManager *NetworkManagerSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _NetworkManager.Contract.SUBNETWORKIDENTIFIER(&_NetworkManager.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_NetworkManager *NetworkManagerCallerSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _NetworkManager.Contract.SUBNETWORKIDENTIFIER(&_NetworkManager.CallOpts)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_NetworkManager *NetworkManagerTransactor) StaticDelegateCall(opts *bind.TransactOpts, target common.Address, data []byte) (*types.Transaction, error) {
	return _NetworkManager.contract.Transact(opts, "staticDelegateCall", target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_NetworkManager *NetworkManagerSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _NetworkManager.Contract.StaticDelegateCall(&_NetworkManager.TransactOpts, target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_NetworkManager *NetworkManagerTransactorSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _NetworkManager.Contract.StaticDelegateCall(&_NetworkManager.TransactOpts, target, data)
}

// NetworkManagerInitSubnetworkIterator is returned from FilterInitSubnetwork and is used to iterate over the raw logs and unpacked data for InitSubnetwork events raised by the NetworkManager contract.
type NetworkManagerInitSubnetworkIterator struct {
	Event *NetworkManagerInitSubnetwork // Event containing the contract specifics and raw log

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
func (it *NetworkManagerInitSubnetworkIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(NetworkManagerInitSubnetwork)
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
		it.Event = new(NetworkManagerInitSubnetwork)
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
func (it *NetworkManagerInitSubnetworkIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *NetworkManagerInitSubnetworkIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// NetworkManagerInitSubnetwork represents a InitSubnetwork event raised by the NetworkManager contract.
type NetworkManagerInitSubnetwork struct {
	Network      common.Address
	SubnetworkId *big.Int
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterInitSubnetwork is a free log retrieval operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_NetworkManager *NetworkManagerFilterer) FilterInitSubnetwork(opts *bind.FilterOpts) (*NetworkManagerInitSubnetworkIterator, error) {

	logs, sub, err := _NetworkManager.contract.FilterLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return &NetworkManagerInitSubnetworkIterator{contract: _NetworkManager.contract, event: "InitSubnetwork", logs: logs, sub: sub}, nil
}

// WatchInitSubnetwork is a free log subscription operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_NetworkManager *NetworkManagerFilterer) WatchInitSubnetwork(opts *bind.WatchOpts, sink chan<- *NetworkManagerInitSubnetwork) (event.Subscription, error) {

	logs, sub, err := _NetworkManager.contract.WatchLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(NetworkManagerInitSubnetwork)
				if err := _NetworkManager.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
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
func (_NetworkManager *NetworkManagerFilterer) ParseInitSubnetwork(log types.Log) (*NetworkManagerInitSubnetwork, error) {
	event := new(NetworkManagerInitSubnetwork)
	if err := _NetworkManager.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// NetworkManagerInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the NetworkManager contract.
type NetworkManagerInitializedIterator struct {
	Event *NetworkManagerInitialized // Event containing the contract specifics and raw log

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
func (it *NetworkManagerInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(NetworkManagerInitialized)
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
		it.Event = new(NetworkManagerInitialized)
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
func (it *NetworkManagerInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *NetworkManagerInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// NetworkManagerInitialized represents a Initialized event raised by the NetworkManager contract.
type NetworkManagerInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_NetworkManager *NetworkManagerFilterer) FilterInitialized(opts *bind.FilterOpts) (*NetworkManagerInitializedIterator, error) {

	logs, sub, err := _NetworkManager.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &NetworkManagerInitializedIterator{contract: _NetworkManager.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_NetworkManager *NetworkManagerFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *NetworkManagerInitialized) (event.Subscription, error) {

	logs, sub, err := _NetworkManager.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(NetworkManagerInitialized)
				if err := _NetworkManager.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_NetworkManager *NetworkManagerFilterer) ParseInitialized(log types.Log) (*NetworkManagerInitialized, error) {
	event := new(NetworkManagerInitialized)
	if err := _NetworkManager.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

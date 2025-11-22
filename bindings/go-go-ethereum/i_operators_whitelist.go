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

// IOperatorsWhitelistMetaData contains all meta data concerning the IOperatorsWhitelist contract.
var IOperatorsWhitelistMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"isOperatorWhitelisted\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isWhitelistEnabled\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setWhitelistStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unwhitelistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"whitelistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"SetWhitelistStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnwhitelistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"WhitelistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"OperatorsWhitelist_OperatorNotWhitelisted\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OperatorsWhitelist_OperatorWhitelisted\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OperatorsWhitelist_StatusAlreadySet\",\"inputs\":[]}]",
}

// IOperatorsWhitelistABI is the input ABI used to generate the binding from.
// Deprecated: Use IOperatorsWhitelistMetaData.ABI instead.
var IOperatorsWhitelistABI = IOperatorsWhitelistMetaData.ABI

// IOperatorsWhitelist is an auto generated Go binding around an Ethereum contract.
type IOperatorsWhitelist struct {
	IOperatorsWhitelistCaller     // Read-only binding to the contract
	IOperatorsWhitelistTransactor // Write-only binding to the contract
	IOperatorsWhitelistFilterer   // Log filterer for contract events
}

// IOperatorsWhitelistCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOperatorsWhitelistCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsWhitelistTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOperatorsWhitelistTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsWhitelistFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOperatorsWhitelistFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsWhitelistSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOperatorsWhitelistSession struct {
	Contract     *IOperatorsWhitelist // Generic contract binding to set the session for
	CallOpts     bind.CallOpts        // Call options to use throughout this session
	TransactOpts bind.TransactOpts    // Transaction auth options to use throughout this session
}

// IOperatorsWhitelistCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOperatorsWhitelistCallerSession struct {
	Contract *IOperatorsWhitelistCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts              // Call options to use throughout this session
}

// IOperatorsWhitelistTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOperatorsWhitelistTransactorSession struct {
	Contract     *IOperatorsWhitelistTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts              // Transaction auth options to use throughout this session
}

// IOperatorsWhitelistRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOperatorsWhitelistRaw struct {
	Contract *IOperatorsWhitelist // Generic contract binding to access the raw methods on
}

// IOperatorsWhitelistCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOperatorsWhitelistCallerRaw struct {
	Contract *IOperatorsWhitelistCaller // Generic read-only contract binding to access the raw methods on
}

// IOperatorsWhitelistTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOperatorsWhitelistTransactorRaw struct {
	Contract *IOperatorsWhitelistTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOperatorsWhitelist creates a new instance of IOperatorsWhitelist, bound to a specific deployed contract.
func NewIOperatorsWhitelist(address common.Address, backend bind.ContractBackend) (*IOperatorsWhitelist, error) {
	contract, err := bindIOperatorsWhitelist(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOperatorsWhitelist{IOperatorsWhitelistCaller: IOperatorsWhitelistCaller{contract: contract}, IOperatorsWhitelistTransactor: IOperatorsWhitelistTransactor{contract: contract}, IOperatorsWhitelistFilterer: IOperatorsWhitelistFilterer{contract: contract}}, nil
}

// NewIOperatorsWhitelistCaller creates a new read-only instance of IOperatorsWhitelist, bound to a specific deployed contract.
func NewIOperatorsWhitelistCaller(address common.Address, caller bind.ContractCaller) (*IOperatorsWhitelistCaller, error) {
	contract, err := bindIOperatorsWhitelist(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsWhitelistCaller{contract: contract}, nil
}

// NewIOperatorsWhitelistTransactor creates a new write-only instance of IOperatorsWhitelist, bound to a specific deployed contract.
func NewIOperatorsWhitelistTransactor(address common.Address, transactor bind.ContractTransactor) (*IOperatorsWhitelistTransactor, error) {
	contract, err := bindIOperatorsWhitelist(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsWhitelistTransactor{contract: contract}, nil
}

// NewIOperatorsWhitelistFilterer creates a new log filterer instance of IOperatorsWhitelist, bound to a specific deployed contract.
func NewIOperatorsWhitelistFilterer(address common.Address, filterer bind.ContractFilterer) (*IOperatorsWhitelistFilterer, error) {
	contract, err := bindIOperatorsWhitelist(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOperatorsWhitelistFilterer{contract: contract}, nil
}

// bindIOperatorsWhitelist binds a generic wrapper to an already deployed contract.
func bindIOperatorsWhitelist(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOperatorsWhitelistMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsWhitelist *IOperatorsWhitelistRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsWhitelist.Contract.IOperatorsWhitelistCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsWhitelist *IOperatorsWhitelistRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.IOperatorsWhitelistTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsWhitelist *IOperatorsWhitelistRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.IOperatorsWhitelistTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsWhitelist *IOperatorsWhitelistCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsWhitelist.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.contract.Transact(opts, method, params...)
}

// IsOperatorWhitelisted is a free data retrieval call binding the contract method 0x2e8da829.
//
// Solidity: function isOperatorWhitelisted(address operator) view returns(bool)
func (_IOperatorsWhitelist *IOperatorsWhitelistCaller) IsOperatorWhitelisted(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsWhitelist.contract.Call(opts, &out, "isOperatorWhitelisted", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorWhitelisted is a free data retrieval call binding the contract method 0x2e8da829.
//
// Solidity: function isOperatorWhitelisted(address operator) view returns(bool)
func (_IOperatorsWhitelist *IOperatorsWhitelistSession) IsOperatorWhitelisted(operator common.Address) (bool, error) {
	return _IOperatorsWhitelist.Contract.IsOperatorWhitelisted(&_IOperatorsWhitelist.CallOpts, operator)
}

// IsOperatorWhitelisted is a free data retrieval call binding the contract method 0x2e8da829.
//
// Solidity: function isOperatorWhitelisted(address operator) view returns(bool)
func (_IOperatorsWhitelist *IOperatorsWhitelistCallerSession) IsOperatorWhitelisted(operator common.Address) (bool, error) {
	return _IOperatorsWhitelist.Contract.IsOperatorWhitelisted(&_IOperatorsWhitelist.CallOpts, operator)
}

// IsWhitelistEnabled is a free data retrieval call binding the contract method 0x184d69ab.
//
// Solidity: function isWhitelistEnabled() view returns(bool)
func (_IOperatorsWhitelist *IOperatorsWhitelistCaller) IsWhitelistEnabled(opts *bind.CallOpts) (bool, error) {
	var out []interface{}
	err := _IOperatorsWhitelist.contract.Call(opts, &out, "isWhitelistEnabled")

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsWhitelistEnabled is a free data retrieval call binding the contract method 0x184d69ab.
//
// Solidity: function isWhitelistEnabled() view returns(bool)
func (_IOperatorsWhitelist *IOperatorsWhitelistSession) IsWhitelistEnabled() (bool, error) {
	return _IOperatorsWhitelist.Contract.IsWhitelistEnabled(&_IOperatorsWhitelist.CallOpts)
}

// IsWhitelistEnabled is a free data retrieval call binding the contract method 0x184d69ab.
//
// Solidity: function isWhitelistEnabled() view returns(bool)
func (_IOperatorsWhitelist *IOperatorsWhitelistCallerSession) IsWhitelistEnabled() (bool, error) {
	return _IOperatorsWhitelist.Contract.IsWhitelistEnabled(&_IOperatorsWhitelist.CallOpts)
}

// SetWhitelistStatus is a paid mutator transaction binding the contract method 0x4a999118.
//
// Solidity: function setWhitelistStatus(bool status) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactor) SetWhitelistStatus(opts *bind.TransactOpts, status bool) (*types.Transaction, error) {
	return _IOperatorsWhitelist.contract.Transact(opts, "setWhitelistStatus", status)
}

// SetWhitelistStatus is a paid mutator transaction binding the contract method 0x4a999118.
//
// Solidity: function setWhitelistStatus(bool status) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistSession) SetWhitelistStatus(status bool) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.SetWhitelistStatus(&_IOperatorsWhitelist.TransactOpts, status)
}

// SetWhitelistStatus is a paid mutator transaction binding the contract method 0x4a999118.
//
// Solidity: function setWhitelistStatus(bool status) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactorSession) SetWhitelistStatus(status bool) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.SetWhitelistStatus(&_IOperatorsWhitelist.TransactOpts, status)
}

// UnwhitelistOperator is a paid mutator transaction binding the contract method 0x6f519c71.
//
// Solidity: function unwhitelistOperator(address operator) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactor) UnwhitelistOperator(opts *bind.TransactOpts, operator common.Address) (*types.Transaction, error) {
	return _IOperatorsWhitelist.contract.Transact(opts, "unwhitelistOperator", operator)
}

// UnwhitelistOperator is a paid mutator transaction binding the contract method 0x6f519c71.
//
// Solidity: function unwhitelistOperator(address operator) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistSession) UnwhitelistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.UnwhitelistOperator(&_IOperatorsWhitelist.TransactOpts, operator)
}

// UnwhitelistOperator is a paid mutator transaction binding the contract method 0x6f519c71.
//
// Solidity: function unwhitelistOperator(address operator) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactorSession) UnwhitelistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.UnwhitelistOperator(&_IOperatorsWhitelist.TransactOpts, operator)
}

// WhitelistOperator is a paid mutator transaction binding the contract method 0x2a2b0bcd.
//
// Solidity: function whitelistOperator(address operator) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactor) WhitelistOperator(opts *bind.TransactOpts, operator common.Address) (*types.Transaction, error) {
	return _IOperatorsWhitelist.contract.Transact(opts, "whitelistOperator", operator)
}

// WhitelistOperator is a paid mutator transaction binding the contract method 0x2a2b0bcd.
//
// Solidity: function whitelistOperator(address operator) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistSession) WhitelistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.WhitelistOperator(&_IOperatorsWhitelist.TransactOpts, operator)
}

// WhitelistOperator is a paid mutator transaction binding the contract method 0x2a2b0bcd.
//
// Solidity: function whitelistOperator(address operator) returns()
func (_IOperatorsWhitelist *IOperatorsWhitelistTransactorSession) WhitelistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsWhitelist.Contract.WhitelistOperator(&_IOperatorsWhitelist.TransactOpts, operator)
}

// IOperatorsWhitelistSetWhitelistStatusIterator is returned from FilterSetWhitelistStatus and is used to iterate over the raw logs and unpacked data for SetWhitelistStatus events raised by the IOperatorsWhitelist contract.
type IOperatorsWhitelistSetWhitelistStatusIterator struct {
	Event *IOperatorsWhitelistSetWhitelistStatus // Event containing the contract specifics and raw log

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
func (it *IOperatorsWhitelistSetWhitelistStatusIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsWhitelistSetWhitelistStatus)
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
		it.Event = new(IOperatorsWhitelistSetWhitelistStatus)
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
func (it *IOperatorsWhitelistSetWhitelistStatusIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsWhitelistSetWhitelistStatusIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsWhitelistSetWhitelistStatus represents a SetWhitelistStatus event raised by the IOperatorsWhitelist contract.
type IOperatorsWhitelistSetWhitelistStatus struct {
	Status bool
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetWhitelistStatus is a free log retrieval operation binding the contract event 0x94e676021db545957660e6c8f2c46a6f5974b684af4451fdeefd9b097cc13b90.
//
// Solidity: event SetWhitelistStatus(bool status)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) FilterSetWhitelistStatus(opts *bind.FilterOpts) (*IOperatorsWhitelistSetWhitelistStatusIterator, error) {

	logs, sub, err := _IOperatorsWhitelist.contract.FilterLogs(opts, "SetWhitelistStatus")
	if err != nil {
		return nil, err
	}
	return &IOperatorsWhitelistSetWhitelistStatusIterator{contract: _IOperatorsWhitelist.contract, event: "SetWhitelistStatus", logs: logs, sub: sub}, nil
}

// WatchSetWhitelistStatus is a free log subscription operation binding the contract event 0x94e676021db545957660e6c8f2c46a6f5974b684af4451fdeefd9b097cc13b90.
//
// Solidity: event SetWhitelistStatus(bool status)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) WatchSetWhitelistStatus(opts *bind.WatchOpts, sink chan<- *IOperatorsWhitelistSetWhitelistStatus) (event.Subscription, error) {

	logs, sub, err := _IOperatorsWhitelist.contract.WatchLogs(opts, "SetWhitelistStatus")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsWhitelistSetWhitelistStatus)
				if err := _IOperatorsWhitelist.contract.UnpackLog(event, "SetWhitelistStatus", log); err != nil {
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

// ParseSetWhitelistStatus is a log parse operation binding the contract event 0x94e676021db545957660e6c8f2c46a6f5974b684af4451fdeefd9b097cc13b90.
//
// Solidity: event SetWhitelistStatus(bool status)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) ParseSetWhitelistStatus(log types.Log) (*IOperatorsWhitelistSetWhitelistStatus, error) {
	event := new(IOperatorsWhitelistSetWhitelistStatus)
	if err := _IOperatorsWhitelist.contract.UnpackLog(event, "SetWhitelistStatus", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsWhitelistUnwhitelistOperatorIterator is returned from FilterUnwhitelistOperator and is used to iterate over the raw logs and unpacked data for UnwhitelistOperator events raised by the IOperatorsWhitelist contract.
type IOperatorsWhitelistUnwhitelistOperatorIterator struct {
	Event *IOperatorsWhitelistUnwhitelistOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsWhitelistUnwhitelistOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsWhitelistUnwhitelistOperator)
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
		it.Event = new(IOperatorsWhitelistUnwhitelistOperator)
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
func (it *IOperatorsWhitelistUnwhitelistOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsWhitelistUnwhitelistOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsWhitelistUnwhitelistOperator represents a UnwhitelistOperator event raised by the IOperatorsWhitelist contract.
type IOperatorsWhitelistUnwhitelistOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnwhitelistOperator is a free log retrieval operation binding the contract event 0xe0ffe88e5be7a205a05ebc18ac63f30994dfad4e26971d2204fc099dd0bb31ff.
//
// Solidity: event UnwhitelistOperator(address indexed operator)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) FilterUnwhitelistOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsWhitelistUnwhitelistOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsWhitelist.contract.FilterLogs(opts, "UnwhitelistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsWhitelistUnwhitelistOperatorIterator{contract: _IOperatorsWhitelist.contract, event: "UnwhitelistOperator", logs: logs, sub: sub}, nil
}

// WatchUnwhitelistOperator is a free log subscription operation binding the contract event 0xe0ffe88e5be7a205a05ebc18ac63f30994dfad4e26971d2204fc099dd0bb31ff.
//
// Solidity: event UnwhitelistOperator(address indexed operator)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) WatchUnwhitelistOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsWhitelistUnwhitelistOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsWhitelist.contract.WatchLogs(opts, "UnwhitelistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsWhitelistUnwhitelistOperator)
				if err := _IOperatorsWhitelist.contract.UnpackLog(event, "UnwhitelistOperator", log); err != nil {
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

// ParseUnwhitelistOperator is a log parse operation binding the contract event 0xe0ffe88e5be7a205a05ebc18ac63f30994dfad4e26971d2204fc099dd0bb31ff.
//
// Solidity: event UnwhitelistOperator(address indexed operator)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) ParseUnwhitelistOperator(log types.Log) (*IOperatorsWhitelistUnwhitelistOperator, error) {
	event := new(IOperatorsWhitelistUnwhitelistOperator)
	if err := _IOperatorsWhitelist.contract.UnpackLog(event, "UnwhitelistOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsWhitelistWhitelistOperatorIterator is returned from FilterWhitelistOperator and is used to iterate over the raw logs and unpacked data for WhitelistOperator events raised by the IOperatorsWhitelist contract.
type IOperatorsWhitelistWhitelistOperatorIterator struct {
	Event *IOperatorsWhitelistWhitelistOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsWhitelistWhitelistOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsWhitelistWhitelistOperator)
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
		it.Event = new(IOperatorsWhitelistWhitelistOperator)
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
func (it *IOperatorsWhitelistWhitelistOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsWhitelistWhitelistOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsWhitelistWhitelistOperator represents a WhitelistOperator event raised by the IOperatorsWhitelist contract.
type IOperatorsWhitelistWhitelistOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterWhitelistOperator is a free log retrieval operation binding the contract event 0xed036e28db67873206c5a88f4e8fa5e5c6a16131b4372be1baf893ab4d903641.
//
// Solidity: event WhitelistOperator(address indexed operator)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) FilterWhitelistOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsWhitelistWhitelistOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsWhitelist.contract.FilterLogs(opts, "WhitelistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsWhitelistWhitelistOperatorIterator{contract: _IOperatorsWhitelist.contract, event: "WhitelistOperator", logs: logs, sub: sub}, nil
}

// WatchWhitelistOperator is a free log subscription operation binding the contract event 0xed036e28db67873206c5a88f4e8fa5e5c6a16131b4372be1baf893ab4d903641.
//
// Solidity: event WhitelistOperator(address indexed operator)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) WatchWhitelistOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsWhitelistWhitelistOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsWhitelist.contract.WatchLogs(opts, "WhitelistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsWhitelistWhitelistOperator)
				if err := _IOperatorsWhitelist.contract.UnpackLog(event, "WhitelistOperator", log); err != nil {
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

// ParseWhitelistOperator is a log parse operation binding the contract event 0xed036e28db67873206c5a88f4e8fa5e5c6a16131b4372be1baf893ab4d903641.
//
// Solidity: event WhitelistOperator(address indexed operator)
func (_IOperatorsWhitelist *IOperatorsWhitelistFilterer) ParseWhitelistOperator(log types.Log) (*IOperatorsWhitelistWhitelistOperator, error) {
	event := new(IOperatorsWhitelistWhitelistOperator)
	if err := _IOperatorsWhitelist.contract.UnpackLog(event, "WhitelistOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

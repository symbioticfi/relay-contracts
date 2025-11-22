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

// IOperatorsBlacklistMetaData contains all meta data concerning the IOperatorsBlacklist contract.
var IOperatorsBlacklistMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"blacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"isOperatorBlacklisted\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"unblacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"BlacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnblacklistOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"OperatorsBlacklist_OperatorBlacklisted\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OperatorsBlacklist_OperatorNotBlacklisted\",\"inputs\":[]}]",
}

// IOperatorsBlacklistABI is the input ABI used to generate the binding from.
// Deprecated: Use IOperatorsBlacklistMetaData.ABI instead.
var IOperatorsBlacklistABI = IOperatorsBlacklistMetaData.ABI

// IOperatorsBlacklist is an auto generated Go binding around an Ethereum contract.
type IOperatorsBlacklist struct {
	IOperatorsBlacklistCaller     // Read-only binding to the contract
	IOperatorsBlacklistTransactor // Write-only binding to the contract
	IOperatorsBlacklistFilterer   // Log filterer for contract events
}

// IOperatorsBlacklistCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOperatorsBlacklistCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsBlacklistTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOperatorsBlacklistTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsBlacklistFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOperatorsBlacklistFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOperatorsBlacklistSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOperatorsBlacklistSession struct {
	Contract     *IOperatorsBlacklist // Generic contract binding to set the session for
	CallOpts     bind.CallOpts        // Call options to use throughout this session
	TransactOpts bind.TransactOpts    // Transaction auth options to use throughout this session
}

// IOperatorsBlacklistCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOperatorsBlacklistCallerSession struct {
	Contract *IOperatorsBlacklistCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts              // Call options to use throughout this session
}

// IOperatorsBlacklistTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOperatorsBlacklistTransactorSession struct {
	Contract     *IOperatorsBlacklistTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts              // Transaction auth options to use throughout this session
}

// IOperatorsBlacklistRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOperatorsBlacklistRaw struct {
	Contract *IOperatorsBlacklist // Generic contract binding to access the raw methods on
}

// IOperatorsBlacklistCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOperatorsBlacklistCallerRaw struct {
	Contract *IOperatorsBlacklistCaller // Generic read-only contract binding to access the raw methods on
}

// IOperatorsBlacklistTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOperatorsBlacklistTransactorRaw struct {
	Contract *IOperatorsBlacklistTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOperatorsBlacklist creates a new instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklist(address common.Address, backend bind.ContractBackend) (*IOperatorsBlacklist, error) {
	contract, err := bindIOperatorsBlacklist(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklist{IOperatorsBlacklistCaller: IOperatorsBlacklistCaller{contract: contract}, IOperatorsBlacklistTransactor: IOperatorsBlacklistTransactor{contract: contract}, IOperatorsBlacklistFilterer: IOperatorsBlacklistFilterer{contract: contract}}, nil
}

// NewIOperatorsBlacklistCaller creates a new read-only instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklistCaller(address common.Address, caller bind.ContractCaller) (*IOperatorsBlacklistCaller, error) {
	contract, err := bindIOperatorsBlacklist(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistCaller{contract: contract}, nil
}

// NewIOperatorsBlacklistTransactor creates a new write-only instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklistTransactor(address common.Address, transactor bind.ContractTransactor) (*IOperatorsBlacklistTransactor, error) {
	contract, err := bindIOperatorsBlacklist(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistTransactor{contract: contract}, nil
}

// NewIOperatorsBlacklistFilterer creates a new log filterer instance of IOperatorsBlacklist, bound to a specific deployed contract.
func NewIOperatorsBlacklistFilterer(address common.Address, filterer bind.ContractFilterer) (*IOperatorsBlacklistFilterer, error) {
	contract, err := bindIOperatorsBlacklist(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistFilterer{contract: contract}, nil
}

// bindIOperatorsBlacklist binds a generic wrapper to an already deployed contract.
func bindIOperatorsBlacklist(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOperatorsBlacklistMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsBlacklist *IOperatorsBlacklistRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsBlacklist.Contract.IOperatorsBlacklistCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsBlacklist *IOperatorsBlacklistRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.IOperatorsBlacklistTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsBlacklist *IOperatorsBlacklistRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.IOperatorsBlacklistTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOperatorsBlacklist.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.contract.Transact(opts, method, params...)
}

// IsOperatorBlacklisted is a free data retrieval call binding the contract method 0xb9b6be97.
//
// Solidity: function isOperatorBlacklisted(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCaller) IsOperatorBlacklisted(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IOperatorsBlacklist.contract.Call(opts, &out, "isOperatorBlacklisted", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorBlacklisted is a free data retrieval call binding the contract method 0xb9b6be97.
//
// Solidity: function isOperatorBlacklisted(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) IsOperatorBlacklisted(operator common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorBlacklisted(&_IOperatorsBlacklist.CallOpts, operator)
}

// IsOperatorBlacklisted is a free data retrieval call binding the contract method 0xb9b6be97.
//
// Solidity: function isOperatorBlacklisted(address operator) view returns(bool)
func (_IOperatorsBlacklist *IOperatorsBlacklistCallerSession) IsOperatorBlacklisted(operator common.Address) (bool, error) {
	return _IOperatorsBlacklist.Contract.IsOperatorBlacklisted(&_IOperatorsBlacklist.CallOpts, operator)
}

// BlacklistOperator is a paid mutator transaction binding the contract method 0xb4492ecc.
//
// Solidity: function blacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) BlacklistOperator(opts *bind.TransactOpts, operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "blacklistOperator", operator)
}

// BlacklistOperator is a paid mutator transaction binding the contract method 0xb4492ecc.
//
// Solidity: function blacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) BlacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.BlacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// BlacklistOperator is a paid mutator transaction binding the contract method 0xb4492ecc.
//
// Solidity: function blacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) BlacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.BlacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// UnblacklistOperator is a paid mutator transaction binding the contract method 0xd94f2692.
//
// Solidity: function unblacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactor) UnblacklistOperator(opts *bind.TransactOpts, operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.contract.Transact(opts, "unblacklistOperator", operator)
}

// UnblacklistOperator is a paid mutator transaction binding the contract method 0xd94f2692.
//
// Solidity: function unblacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistSession) UnblacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnblacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// UnblacklistOperator is a paid mutator transaction binding the contract method 0xd94f2692.
//
// Solidity: function unblacklistOperator(address operator) returns()
func (_IOperatorsBlacklist *IOperatorsBlacklistTransactorSession) UnblacklistOperator(operator common.Address) (*types.Transaction, error) {
	return _IOperatorsBlacklist.Contract.UnblacklistOperator(&_IOperatorsBlacklist.TransactOpts, operator)
}

// IOperatorsBlacklistBlacklistOperatorIterator is returned from FilterBlacklistOperator and is used to iterate over the raw logs and unpacked data for BlacklistOperator events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistBlacklistOperatorIterator struct {
	Event *IOperatorsBlacklistBlacklistOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistBlacklistOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistBlacklistOperator)
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
		it.Event = new(IOperatorsBlacklistBlacklistOperator)
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
func (it *IOperatorsBlacklistBlacklistOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistBlacklistOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistBlacklistOperator represents a BlacklistOperator event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistBlacklistOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterBlacklistOperator is a free log retrieval operation binding the contract event 0xa2f2b21af6bc9ffdbeee793f463ab6dae1e9834763f7367ed293450777323839.
//
// Solidity: event BlacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterBlacklistOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsBlacklistBlacklistOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "BlacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistBlacklistOperatorIterator{contract: _IOperatorsBlacklist.contract, event: "BlacklistOperator", logs: logs, sub: sub}, nil
}

// WatchBlacklistOperator is a free log subscription operation binding the contract event 0xa2f2b21af6bc9ffdbeee793f463ab6dae1e9834763f7367ed293450777323839.
//
// Solidity: event BlacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchBlacklistOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistBlacklistOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "BlacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistBlacklistOperator)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "BlacklistOperator", log); err != nil {
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

// ParseBlacklistOperator is a log parse operation binding the contract event 0xa2f2b21af6bc9ffdbeee793f463ab6dae1e9834763f7367ed293450777323839.
//
// Solidity: event BlacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseBlacklistOperator(log types.Log) (*IOperatorsBlacklistBlacklistOperator, error) {
	event := new(IOperatorsBlacklistBlacklistOperator)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "BlacklistOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOperatorsBlacklistUnblacklistOperatorIterator is returned from FilterUnblacklistOperator and is used to iterate over the raw logs and unpacked data for UnblacklistOperator events raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnblacklistOperatorIterator struct {
	Event *IOperatorsBlacklistUnblacklistOperator // Event containing the contract specifics and raw log

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
func (it *IOperatorsBlacklistUnblacklistOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOperatorsBlacklistUnblacklistOperator)
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
		it.Event = new(IOperatorsBlacklistUnblacklistOperator)
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
func (it *IOperatorsBlacklistUnblacklistOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOperatorsBlacklistUnblacklistOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOperatorsBlacklistUnblacklistOperator represents a UnblacklistOperator event raised by the IOperatorsBlacklist contract.
type IOperatorsBlacklistUnblacklistOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnblacklistOperator is a free log retrieval operation binding the contract event 0x8e5976d2355c5ef45f7640d6e5ee278dc35eeb6673b6e12231986c9ffc507b14.
//
// Solidity: event UnblacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) FilterUnblacklistOperator(opts *bind.FilterOpts, operator []common.Address) (*IOperatorsBlacklistUnblacklistOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.FilterLogs(opts, "UnblacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IOperatorsBlacklistUnblacklistOperatorIterator{contract: _IOperatorsBlacklist.contract, event: "UnblacklistOperator", logs: logs, sub: sub}, nil
}

// WatchUnblacklistOperator is a free log subscription operation binding the contract event 0x8e5976d2355c5ef45f7640d6e5ee278dc35eeb6673b6e12231986c9ffc507b14.
//
// Solidity: event UnblacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) WatchUnblacklistOperator(opts *bind.WatchOpts, sink chan<- *IOperatorsBlacklistUnblacklistOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IOperatorsBlacklist.contract.WatchLogs(opts, "UnblacklistOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOperatorsBlacklistUnblacklistOperator)
				if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnblacklistOperator", log); err != nil {
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

// ParseUnblacklistOperator is a log parse operation binding the contract event 0x8e5976d2355c5ef45f7640d6e5ee278dc35eeb6673b6e12231986c9ffc507b14.
//
// Solidity: event UnblacklistOperator(address indexed operator)
func (_IOperatorsBlacklist *IOperatorsBlacklistFilterer) ParseUnblacklistOperator(log types.Log) (*IOperatorsBlacklistUnblacklistOperator, error) {
	event := new(IOperatorsBlacklistUnblacklistOperator)
	if err := _IOperatorsBlacklist.contract.UnpackLog(event, "UnblacklistOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

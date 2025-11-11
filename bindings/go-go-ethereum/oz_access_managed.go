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

// OzAccessManagedMetaData contains all meta data concerning the OzAccessManaged contract.
var OzAccessManagedMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"authority\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isConsumingScheduledOp\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes4\",\"internalType\":\"bytes4\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setAuthority\",\"inputs\":[{\"name\":\"newAuthority\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"AuthorityUpdated\",\"inputs\":[{\"name\":\"authority\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"AccessManagedInvalidAuthority\",\"inputs\":[{\"name\":\"authority\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"type\":\"error\",\"name\":\"AccessManagedRequiredDelay\",\"inputs\":[{\"name\":\"caller\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"delay\",\"type\":\"uint32\",\"internalType\":\"uint32\"}]},{\"type\":\"error\",\"name\":\"AccessManagedUnauthorized\",\"inputs\":[{\"name\":\"caller\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]}]",
}

// OzAccessManagedABI is the input ABI used to generate the binding from.
// Deprecated: Use OzAccessManagedMetaData.ABI instead.
var OzAccessManagedABI = OzAccessManagedMetaData.ABI

// OzAccessManaged is an auto generated Go binding around an Ethereum contract.
type OzAccessManaged struct {
	OzAccessManagedCaller     // Read-only binding to the contract
	OzAccessManagedTransactor // Write-only binding to the contract
	OzAccessManagedFilterer   // Log filterer for contract events
}

// OzAccessManagedCaller is an auto generated read-only Go binding around an Ethereum contract.
type OzAccessManagedCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// OzAccessManagedTransactor is an auto generated write-only Go binding around an Ethereum contract.
type OzAccessManagedTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// OzAccessManagedFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type OzAccessManagedFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// OzAccessManagedSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type OzAccessManagedSession struct {
	Contract     *OzAccessManaged  // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// OzAccessManagedCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type OzAccessManagedCallerSession struct {
	Contract *OzAccessManagedCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts          // Call options to use throughout this session
}

// OzAccessManagedTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type OzAccessManagedTransactorSession struct {
	Contract     *OzAccessManagedTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts          // Transaction auth options to use throughout this session
}

// OzAccessManagedRaw is an auto generated low-level Go binding around an Ethereum contract.
type OzAccessManagedRaw struct {
	Contract *OzAccessManaged // Generic contract binding to access the raw methods on
}

// OzAccessManagedCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type OzAccessManagedCallerRaw struct {
	Contract *OzAccessManagedCaller // Generic read-only contract binding to access the raw methods on
}

// OzAccessManagedTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type OzAccessManagedTransactorRaw struct {
	Contract *OzAccessManagedTransactor // Generic write-only contract binding to access the raw methods on
}

// NewOzAccessManaged creates a new instance of OzAccessManaged, bound to a specific deployed contract.
func NewOzAccessManaged(address common.Address, backend bind.ContractBackend) (*OzAccessManaged, error) {
	contract, err := bindOzAccessManaged(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &OzAccessManaged{OzAccessManagedCaller: OzAccessManagedCaller{contract: contract}, OzAccessManagedTransactor: OzAccessManagedTransactor{contract: contract}, OzAccessManagedFilterer: OzAccessManagedFilterer{contract: contract}}, nil
}

// NewOzAccessManagedCaller creates a new read-only instance of OzAccessManaged, bound to a specific deployed contract.
func NewOzAccessManagedCaller(address common.Address, caller bind.ContractCaller) (*OzAccessManagedCaller, error) {
	contract, err := bindOzAccessManaged(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &OzAccessManagedCaller{contract: contract}, nil
}

// NewOzAccessManagedTransactor creates a new write-only instance of OzAccessManaged, bound to a specific deployed contract.
func NewOzAccessManagedTransactor(address common.Address, transactor bind.ContractTransactor) (*OzAccessManagedTransactor, error) {
	contract, err := bindOzAccessManaged(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &OzAccessManagedTransactor{contract: contract}, nil
}

// NewOzAccessManagedFilterer creates a new log filterer instance of OzAccessManaged, bound to a specific deployed contract.
func NewOzAccessManagedFilterer(address common.Address, filterer bind.ContractFilterer) (*OzAccessManagedFilterer, error) {
	contract, err := bindOzAccessManaged(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &OzAccessManagedFilterer{contract: contract}, nil
}

// bindOzAccessManaged binds a generic wrapper to an already deployed contract.
func bindOzAccessManaged(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := OzAccessManagedMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_OzAccessManaged *OzAccessManagedRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _OzAccessManaged.Contract.OzAccessManagedCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_OzAccessManaged *OzAccessManagedRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _OzAccessManaged.Contract.OzAccessManagedTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_OzAccessManaged *OzAccessManagedRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _OzAccessManaged.Contract.OzAccessManagedTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_OzAccessManaged *OzAccessManagedCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _OzAccessManaged.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_OzAccessManaged *OzAccessManagedTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _OzAccessManaged.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_OzAccessManaged *OzAccessManagedTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _OzAccessManaged.Contract.contract.Transact(opts, method, params...)
}

// Authority is a free data retrieval call binding the contract method 0xbf7e214f.
//
// Solidity: function authority() view returns(address)
func (_OzAccessManaged *OzAccessManagedCaller) Authority(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _OzAccessManaged.contract.Call(opts, &out, "authority")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// Authority is a free data retrieval call binding the contract method 0xbf7e214f.
//
// Solidity: function authority() view returns(address)
func (_OzAccessManaged *OzAccessManagedSession) Authority() (common.Address, error) {
	return _OzAccessManaged.Contract.Authority(&_OzAccessManaged.CallOpts)
}

// Authority is a free data retrieval call binding the contract method 0xbf7e214f.
//
// Solidity: function authority() view returns(address)
func (_OzAccessManaged *OzAccessManagedCallerSession) Authority() (common.Address, error) {
	return _OzAccessManaged.Contract.Authority(&_OzAccessManaged.CallOpts)
}

// IsConsumingScheduledOp is a free data retrieval call binding the contract method 0x8fb36037.
//
// Solidity: function isConsumingScheduledOp() view returns(bytes4)
func (_OzAccessManaged *OzAccessManagedCaller) IsConsumingScheduledOp(opts *bind.CallOpts) ([4]byte, error) {
	var out []interface{}
	err := _OzAccessManaged.contract.Call(opts, &out, "isConsumingScheduledOp")

	if err != nil {
		return *new([4]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([4]byte)).(*[4]byte)

	return out0, err

}

// IsConsumingScheduledOp is a free data retrieval call binding the contract method 0x8fb36037.
//
// Solidity: function isConsumingScheduledOp() view returns(bytes4)
func (_OzAccessManaged *OzAccessManagedSession) IsConsumingScheduledOp() ([4]byte, error) {
	return _OzAccessManaged.Contract.IsConsumingScheduledOp(&_OzAccessManaged.CallOpts)
}

// IsConsumingScheduledOp is a free data retrieval call binding the contract method 0x8fb36037.
//
// Solidity: function isConsumingScheduledOp() view returns(bytes4)
func (_OzAccessManaged *OzAccessManagedCallerSession) IsConsumingScheduledOp() ([4]byte, error) {
	return _OzAccessManaged.Contract.IsConsumingScheduledOp(&_OzAccessManaged.CallOpts)
}

// SetAuthority is a paid mutator transaction binding the contract method 0x7a9e5e4b.
//
// Solidity: function setAuthority(address newAuthority) returns()
func (_OzAccessManaged *OzAccessManagedTransactor) SetAuthority(opts *bind.TransactOpts, newAuthority common.Address) (*types.Transaction, error) {
	return _OzAccessManaged.contract.Transact(opts, "setAuthority", newAuthority)
}

// SetAuthority is a paid mutator transaction binding the contract method 0x7a9e5e4b.
//
// Solidity: function setAuthority(address newAuthority) returns()
func (_OzAccessManaged *OzAccessManagedSession) SetAuthority(newAuthority common.Address) (*types.Transaction, error) {
	return _OzAccessManaged.Contract.SetAuthority(&_OzAccessManaged.TransactOpts, newAuthority)
}

// SetAuthority is a paid mutator transaction binding the contract method 0x7a9e5e4b.
//
// Solidity: function setAuthority(address newAuthority) returns()
func (_OzAccessManaged *OzAccessManagedTransactorSession) SetAuthority(newAuthority common.Address) (*types.Transaction, error) {
	return _OzAccessManaged.Contract.SetAuthority(&_OzAccessManaged.TransactOpts, newAuthority)
}

// OzAccessManagedAuthorityUpdatedIterator is returned from FilterAuthorityUpdated and is used to iterate over the raw logs and unpacked data for AuthorityUpdated events raised by the OzAccessManaged contract.
type OzAccessManagedAuthorityUpdatedIterator struct {
	Event *OzAccessManagedAuthorityUpdated // Event containing the contract specifics and raw log

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
func (it *OzAccessManagedAuthorityUpdatedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OzAccessManagedAuthorityUpdated)
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
		it.Event = new(OzAccessManagedAuthorityUpdated)
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
func (it *OzAccessManagedAuthorityUpdatedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OzAccessManagedAuthorityUpdatedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OzAccessManagedAuthorityUpdated represents a AuthorityUpdated event raised by the OzAccessManaged contract.
type OzAccessManagedAuthorityUpdated struct {
	Authority common.Address
	Raw       types.Log // Blockchain specific contextual infos
}

// FilterAuthorityUpdated is a free log retrieval operation binding the contract event 0x2f658b440c35314f52658ea8a740e05b284cdc84dc9ae01e891f21b8933e7cad.
//
// Solidity: event AuthorityUpdated(address authority)
func (_OzAccessManaged *OzAccessManagedFilterer) FilterAuthorityUpdated(opts *bind.FilterOpts) (*OzAccessManagedAuthorityUpdatedIterator, error) {

	logs, sub, err := _OzAccessManaged.contract.FilterLogs(opts, "AuthorityUpdated")
	if err != nil {
		return nil, err
	}
	return &OzAccessManagedAuthorityUpdatedIterator{contract: _OzAccessManaged.contract, event: "AuthorityUpdated", logs: logs, sub: sub}, nil
}

// WatchAuthorityUpdated is a free log subscription operation binding the contract event 0x2f658b440c35314f52658ea8a740e05b284cdc84dc9ae01e891f21b8933e7cad.
//
// Solidity: event AuthorityUpdated(address authority)
func (_OzAccessManaged *OzAccessManagedFilterer) WatchAuthorityUpdated(opts *bind.WatchOpts, sink chan<- *OzAccessManagedAuthorityUpdated) (event.Subscription, error) {

	logs, sub, err := _OzAccessManaged.contract.WatchLogs(opts, "AuthorityUpdated")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OzAccessManagedAuthorityUpdated)
				if err := _OzAccessManaged.contract.UnpackLog(event, "AuthorityUpdated", log); err != nil {
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

// ParseAuthorityUpdated is a log parse operation binding the contract event 0x2f658b440c35314f52658ea8a740e05b284cdc84dc9ae01e891f21b8933e7cad.
//
// Solidity: event AuthorityUpdated(address authority)
func (_OzAccessManaged *OzAccessManagedFilterer) ParseAuthorityUpdated(log types.Log) (*OzAccessManagedAuthorityUpdated, error) {
	event := new(OzAccessManagedAuthorityUpdated)
	if err := _OzAccessManaged.contract.UnpackLog(event, "AuthorityUpdated", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// OzAccessManagedInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the OzAccessManaged contract.
type OzAccessManagedInitializedIterator struct {
	Event *OzAccessManagedInitialized // Event containing the contract specifics and raw log

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
func (it *OzAccessManagedInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(OzAccessManagedInitialized)
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
		it.Event = new(OzAccessManagedInitialized)
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
func (it *OzAccessManagedInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *OzAccessManagedInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// OzAccessManagedInitialized represents a Initialized event raised by the OzAccessManaged contract.
type OzAccessManagedInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_OzAccessManaged *OzAccessManagedFilterer) FilterInitialized(opts *bind.FilterOpts) (*OzAccessManagedInitializedIterator, error) {

	logs, sub, err := _OzAccessManaged.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &OzAccessManagedInitializedIterator{contract: _OzAccessManaged.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_OzAccessManaged *OzAccessManagedFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *OzAccessManagedInitialized) (event.Subscription, error) {

	logs, sub, err := _OzAccessManaged.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(OzAccessManagedInitialized)
				if err := _OzAccessManaged.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_OzAccessManaged *OzAccessManagedFilterer) ParseInitialized(log types.Log) (*OzAccessManagedInitialized, error) {
	event := new(OzAccessManagedInitialized)
	if err := _OzAccessManaged.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

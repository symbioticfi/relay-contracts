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
	ABI: "[{\"type\":\"function\",\"name\":\"authority\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isConsumingScheduledOp\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes4\",\"internalType\":\"bytes4\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setAuthority\",\"inputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"AuthorityUpdated\",\"inputs\":[{\"name\":\"authority\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"AccessManagedInvalidAuthority\",\"inputs\":[{\"name\":\"authority\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"type\":\"error\",\"name\":\"AccessManagedRequiredDelay\",\"inputs\":[{\"name\":\"caller\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"delay\",\"type\":\"uint32\",\"internalType\":\"uint32\"}]},{\"type\":\"error\",\"name\":\"AccessManagedUnauthorized\",\"inputs\":[{\"name\":\"caller\",\"type\":\"address\",\"internalType\":\"address\"}]}]",
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

// Authority is a free data retrieval call binding the contract method 0xbf7e214f.
//
// Solidity: function authority() view returns(address)
func (_IOzAccessManaged *IOzAccessManagedCaller) Authority(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IOzAccessManaged.contract.Call(opts, &out, "authority")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// Authority is a free data retrieval call binding the contract method 0xbf7e214f.
//
// Solidity: function authority() view returns(address)
func (_IOzAccessManaged *IOzAccessManagedSession) Authority() (common.Address, error) {
	return _IOzAccessManaged.Contract.Authority(&_IOzAccessManaged.CallOpts)
}

// Authority is a free data retrieval call binding the contract method 0xbf7e214f.
//
// Solidity: function authority() view returns(address)
func (_IOzAccessManaged *IOzAccessManagedCallerSession) Authority() (common.Address, error) {
	return _IOzAccessManaged.Contract.Authority(&_IOzAccessManaged.CallOpts)
}

// IsConsumingScheduledOp is a free data retrieval call binding the contract method 0x8fb36037.
//
// Solidity: function isConsumingScheduledOp() view returns(bytes4)
func (_IOzAccessManaged *IOzAccessManagedCaller) IsConsumingScheduledOp(opts *bind.CallOpts) ([4]byte, error) {
	var out []interface{}
	err := _IOzAccessManaged.contract.Call(opts, &out, "isConsumingScheduledOp")

	if err != nil {
		return *new([4]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([4]byte)).(*[4]byte)

	return out0, err

}

// IsConsumingScheduledOp is a free data retrieval call binding the contract method 0x8fb36037.
//
// Solidity: function isConsumingScheduledOp() view returns(bytes4)
func (_IOzAccessManaged *IOzAccessManagedSession) IsConsumingScheduledOp() ([4]byte, error) {
	return _IOzAccessManaged.Contract.IsConsumingScheduledOp(&_IOzAccessManaged.CallOpts)
}

// IsConsumingScheduledOp is a free data retrieval call binding the contract method 0x8fb36037.
//
// Solidity: function isConsumingScheduledOp() view returns(bytes4)
func (_IOzAccessManaged *IOzAccessManagedCallerSession) IsConsumingScheduledOp() ([4]byte, error) {
	return _IOzAccessManaged.Contract.IsConsumingScheduledOp(&_IOzAccessManaged.CallOpts)
}

// SetAuthority is a paid mutator transaction binding the contract method 0x7a9e5e4b.
//
// Solidity: function setAuthority(address ) returns()
func (_IOzAccessManaged *IOzAccessManagedTransactor) SetAuthority(opts *bind.TransactOpts, arg0 common.Address) (*types.Transaction, error) {
	return _IOzAccessManaged.contract.Transact(opts, "setAuthority", arg0)
}

// SetAuthority is a paid mutator transaction binding the contract method 0x7a9e5e4b.
//
// Solidity: function setAuthority(address ) returns()
func (_IOzAccessManaged *IOzAccessManagedSession) SetAuthority(arg0 common.Address) (*types.Transaction, error) {
	return _IOzAccessManaged.Contract.SetAuthority(&_IOzAccessManaged.TransactOpts, arg0)
}

// SetAuthority is a paid mutator transaction binding the contract method 0x7a9e5e4b.
//
// Solidity: function setAuthority(address ) returns()
func (_IOzAccessManaged *IOzAccessManagedTransactorSession) SetAuthority(arg0 common.Address) (*types.Transaction, error) {
	return _IOzAccessManaged.Contract.SetAuthority(&_IOzAccessManaged.TransactOpts, arg0)
}

// IOzAccessManagedAuthorityUpdatedIterator is returned from FilterAuthorityUpdated and is used to iterate over the raw logs and unpacked data for AuthorityUpdated events raised by the IOzAccessManaged contract.
type IOzAccessManagedAuthorityUpdatedIterator struct {
	Event *IOzAccessManagedAuthorityUpdated // Event containing the contract specifics and raw log

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
func (it *IOzAccessManagedAuthorityUpdatedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOzAccessManagedAuthorityUpdated)
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
		it.Event = new(IOzAccessManagedAuthorityUpdated)
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
func (it *IOzAccessManagedAuthorityUpdatedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOzAccessManagedAuthorityUpdatedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOzAccessManagedAuthorityUpdated represents a AuthorityUpdated event raised by the IOzAccessManaged contract.
type IOzAccessManagedAuthorityUpdated struct {
	Authority common.Address
	Raw       types.Log // Blockchain specific contextual infos
}

// FilterAuthorityUpdated is a free log retrieval operation binding the contract event 0x2f658b440c35314f52658ea8a740e05b284cdc84dc9ae01e891f21b8933e7cad.
//
// Solidity: event AuthorityUpdated(address authority)
func (_IOzAccessManaged *IOzAccessManagedFilterer) FilterAuthorityUpdated(opts *bind.FilterOpts) (*IOzAccessManagedAuthorityUpdatedIterator, error) {

	logs, sub, err := _IOzAccessManaged.contract.FilterLogs(opts, "AuthorityUpdated")
	if err != nil {
		return nil, err
	}
	return &IOzAccessManagedAuthorityUpdatedIterator{contract: _IOzAccessManaged.contract, event: "AuthorityUpdated", logs: logs, sub: sub}, nil
}

// WatchAuthorityUpdated is a free log subscription operation binding the contract event 0x2f658b440c35314f52658ea8a740e05b284cdc84dc9ae01e891f21b8933e7cad.
//
// Solidity: event AuthorityUpdated(address authority)
func (_IOzAccessManaged *IOzAccessManagedFilterer) WatchAuthorityUpdated(opts *bind.WatchOpts, sink chan<- *IOzAccessManagedAuthorityUpdated) (event.Subscription, error) {

	logs, sub, err := _IOzAccessManaged.contract.WatchLogs(opts, "AuthorityUpdated")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOzAccessManagedAuthorityUpdated)
				if err := _IOzAccessManaged.contract.UnpackLog(event, "AuthorityUpdated", log); err != nil {
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
func (_IOzAccessManaged *IOzAccessManagedFilterer) ParseAuthorityUpdated(log types.Log) (*IOzAccessManagedAuthorityUpdated, error) {
	event := new(IOzAccessManagedAuthorityUpdated)
	if err := _IOzAccessManaged.contract.UnpackLog(event, "AuthorityUpdated", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

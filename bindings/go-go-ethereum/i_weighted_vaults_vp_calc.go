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

// IWeightedVaultsVPCalcMetaData contains all meta data concerning the IWeightedVaultsVPCalc contract.
var IWeightedVaultsVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getVaultWeight\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVaultWeightAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setVaultWeight\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"SetVaultWeight\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"WeightedVaultsVPCalc_TooLargeWeight\",\"inputs\":[]}]",
}

// IWeightedVaultsVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use IWeightedVaultsVPCalcMetaData.ABI instead.
var IWeightedVaultsVPCalcABI = IWeightedVaultsVPCalcMetaData.ABI

// IWeightedVaultsVPCalc is an auto generated Go binding around an Ethereum contract.
type IWeightedVaultsVPCalc struct {
	IWeightedVaultsVPCalcCaller     // Read-only binding to the contract
	IWeightedVaultsVPCalcTransactor // Write-only binding to the contract
	IWeightedVaultsVPCalcFilterer   // Log filterer for contract events
}

// IWeightedVaultsVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type IWeightedVaultsVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IWeightedVaultsVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IWeightedVaultsVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IWeightedVaultsVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IWeightedVaultsVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IWeightedVaultsVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IWeightedVaultsVPCalcSession struct {
	Contract     *IWeightedVaultsVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts          // Call options to use throughout this session
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// IWeightedVaultsVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IWeightedVaultsVPCalcCallerSession struct {
	Contract *IWeightedVaultsVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                // Call options to use throughout this session
}

// IWeightedVaultsVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IWeightedVaultsVPCalcTransactorSession struct {
	Contract     *IWeightedVaultsVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                // Transaction auth options to use throughout this session
}

// IWeightedVaultsVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type IWeightedVaultsVPCalcRaw struct {
	Contract *IWeightedVaultsVPCalc // Generic contract binding to access the raw methods on
}

// IWeightedVaultsVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IWeightedVaultsVPCalcCallerRaw struct {
	Contract *IWeightedVaultsVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// IWeightedVaultsVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IWeightedVaultsVPCalcTransactorRaw struct {
	Contract *IWeightedVaultsVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIWeightedVaultsVPCalc creates a new instance of IWeightedVaultsVPCalc, bound to a specific deployed contract.
func NewIWeightedVaultsVPCalc(address common.Address, backend bind.ContractBackend) (*IWeightedVaultsVPCalc, error) {
	contract, err := bindIWeightedVaultsVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IWeightedVaultsVPCalc{IWeightedVaultsVPCalcCaller: IWeightedVaultsVPCalcCaller{contract: contract}, IWeightedVaultsVPCalcTransactor: IWeightedVaultsVPCalcTransactor{contract: contract}, IWeightedVaultsVPCalcFilterer: IWeightedVaultsVPCalcFilterer{contract: contract}}, nil
}

// NewIWeightedVaultsVPCalcCaller creates a new read-only instance of IWeightedVaultsVPCalc, bound to a specific deployed contract.
func NewIWeightedVaultsVPCalcCaller(address common.Address, caller bind.ContractCaller) (*IWeightedVaultsVPCalcCaller, error) {
	contract, err := bindIWeightedVaultsVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IWeightedVaultsVPCalcCaller{contract: contract}, nil
}

// NewIWeightedVaultsVPCalcTransactor creates a new write-only instance of IWeightedVaultsVPCalc, bound to a specific deployed contract.
func NewIWeightedVaultsVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*IWeightedVaultsVPCalcTransactor, error) {
	contract, err := bindIWeightedVaultsVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IWeightedVaultsVPCalcTransactor{contract: contract}, nil
}

// NewIWeightedVaultsVPCalcFilterer creates a new log filterer instance of IWeightedVaultsVPCalc, bound to a specific deployed contract.
func NewIWeightedVaultsVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*IWeightedVaultsVPCalcFilterer, error) {
	contract, err := bindIWeightedVaultsVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IWeightedVaultsVPCalcFilterer{contract: contract}, nil
}

// bindIWeightedVaultsVPCalc binds a generic wrapper to an already deployed contract.
func bindIWeightedVaultsVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IWeightedVaultsVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IWeightedVaultsVPCalc.Contract.IWeightedVaultsVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IWeightedVaultsVPCalc.Contract.IWeightedVaultsVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IWeightedVaultsVPCalc.Contract.IWeightedVaultsVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IWeightedVaultsVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IWeightedVaultsVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IWeightedVaultsVPCalc.Contract.contract.Transact(opts, method, params...)
}

// GetVaultWeight is a free data retrieval call binding the contract method 0xac8047d2.
//
// Solidity: function getVaultWeight(address vault) view returns(uint208)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcCaller) GetVaultWeight(opts *bind.CallOpts, vault common.Address) (*big.Int, error) {
	var out []interface{}
	err := _IWeightedVaultsVPCalc.contract.Call(opts, &out, "getVaultWeight", vault)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetVaultWeight is a free data retrieval call binding the contract method 0xac8047d2.
//
// Solidity: function getVaultWeight(address vault) view returns(uint208)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcSession) GetVaultWeight(vault common.Address) (*big.Int, error) {
	return _IWeightedVaultsVPCalc.Contract.GetVaultWeight(&_IWeightedVaultsVPCalc.CallOpts, vault)
}

// GetVaultWeight is a free data retrieval call binding the contract method 0xac8047d2.
//
// Solidity: function getVaultWeight(address vault) view returns(uint208)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcCallerSession) GetVaultWeight(vault common.Address) (*big.Int, error) {
	return _IWeightedVaultsVPCalc.Contract.GetVaultWeight(&_IWeightedVaultsVPCalc.CallOpts, vault)
}

// GetVaultWeightAt is a free data retrieval call binding the contract method 0x83e75620.
//
// Solidity: function getVaultWeightAt(address vault, uint48 timestamp) view returns(uint208)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcCaller) GetVaultWeightAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IWeightedVaultsVPCalc.contract.Call(opts, &out, "getVaultWeightAt", vault, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetVaultWeightAt is a free data retrieval call binding the contract method 0x83e75620.
//
// Solidity: function getVaultWeightAt(address vault, uint48 timestamp) view returns(uint208)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcSession) GetVaultWeightAt(vault common.Address, timestamp *big.Int) (*big.Int, error) {
	return _IWeightedVaultsVPCalc.Contract.GetVaultWeightAt(&_IWeightedVaultsVPCalc.CallOpts, vault, timestamp)
}

// GetVaultWeightAt is a free data retrieval call binding the contract method 0x83e75620.
//
// Solidity: function getVaultWeightAt(address vault, uint48 timestamp) view returns(uint208)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcCallerSession) GetVaultWeightAt(vault common.Address, timestamp *big.Int) (*big.Int, error) {
	return _IWeightedVaultsVPCalc.Contract.GetVaultWeightAt(&_IWeightedVaultsVPCalc.CallOpts, vault, timestamp)
}

// SetVaultWeight is a paid mutator transaction binding the contract method 0x46d27217.
//
// Solidity: function setVaultWeight(address vault, uint208 weight) returns()
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcTransactor) SetVaultWeight(opts *bind.TransactOpts, vault common.Address, weight *big.Int) (*types.Transaction, error) {
	return _IWeightedVaultsVPCalc.contract.Transact(opts, "setVaultWeight", vault, weight)
}

// SetVaultWeight is a paid mutator transaction binding the contract method 0x46d27217.
//
// Solidity: function setVaultWeight(address vault, uint208 weight) returns()
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcSession) SetVaultWeight(vault common.Address, weight *big.Int) (*types.Transaction, error) {
	return _IWeightedVaultsVPCalc.Contract.SetVaultWeight(&_IWeightedVaultsVPCalc.TransactOpts, vault, weight)
}

// SetVaultWeight is a paid mutator transaction binding the contract method 0x46d27217.
//
// Solidity: function setVaultWeight(address vault, uint208 weight) returns()
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcTransactorSession) SetVaultWeight(vault common.Address, weight *big.Int) (*types.Transaction, error) {
	return _IWeightedVaultsVPCalc.Contract.SetVaultWeight(&_IWeightedVaultsVPCalc.TransactOpts, vault, weight)
}

// IWeightedVaultsVPCalcSetVaultWeightIterator is returned from FilterSetVaultWeight and is used to iterate over the raw logs and unpacked data for SetVaultWeight events raised by the IWeightedVaultsVPCalc contract.
type IWeightedVaultsVPCalcSetVaultWeightIterator struct {
	Event *IWeightedVaultsVPCalcSetVaultWeight // Event containing the contract specifics and raw log

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
func (it *IWeightedVaultsVPCalcSetVaultWeightIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IWeightedVaultsVPCalcSetVaultWeight)
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
		it.Event = new(IWeightedVaultsVPCalcSetVaultWeight)
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
func (it *IWeightedVaultsVPCalcSetVaultWeightIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IWeightedVaultsVPCalcSetVaultWeightIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IWeightedVaultsVPCalcSetVaultWeight represents a SetVaultWeight event raised by the IWeightedVaultsVPCalc contract.
type IWeightedVaultsVPCalcSetVaultWeight struct {
	Vault  common.Address
	Weight *big.Int
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetVaultWeight is a free log retrieval operation binding the contract event 0xacf049e96246b51c4c3b4a3346404f9a892478516474929c53ad5298bfe8008e.
//
// Solidity: event SetVaultWeight(address indexed vault, uint208 weight)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcFilterer) FilterSetVaultWeight(opts *bind.FilterOpts, vault []common.Address) (*IWeightedVaultsVPCalcSetVaultWeightIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IWeightedVaultsVPCalc.contract.FilterLogs(opts, "SetVaultWeight", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IWeightedVaultsVPCalcSetVaultWeightIterator{contract: _IWeightedVaultsVPCalc.contract, event: "SetVaultWeight", logs: logs, sub: sub}, nil
}

// WatchSetVaultWeight is a free log subscription operation binding the contract event 0xacf049e96246b51c4c3b4a3346404f9a892478516474929c53ad5298bfe8008e.
//
// Solidity: event SetVaultWeight(address indexed vault, uint208 weight)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcFilterer) WatchSetVaultWeight(opts *bind.WatchOpts, sink chan<- *IWeightedVaultsVPCalcSetVaultWeight, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IWeightedVaultsVPCalc.contract.WatchLogs(opts, "SetVaultWeight", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IWeightedVaultsVPCalcSetVaultWeight)
				if err := _IWeightedVaultsVPCalc.contract.UnpackLog(event, "SetVaultWeight", log); err != nil {
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

// ParseSetVaultWeight is a log parse operation binding the contract event 0xacf049e96246b51c4c3b4a3346404f9a892478516474929c53ad5298bfe8008e.
//
// Solidity: event SetVaultWeight(address indexed vault, uint208 weight)
func (_IWeightedVaultsVPCalc *IWeightedVaultsVPCalcFilterer) ParseSetVaultWeight(log types.Log) (*IWeightedVaultsVPCalcSetVaultWeight, error) {
	event := new(IWeightedVaultsVPCalcSetVaultWeight)
	if err := _IWeightedVaultsVPCalc.contract.UnpackLog(event, "SetVaultWeight", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

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

// WeightedVaultsVPCalcMetaData contains all meta data concerning the WeightedVaultsVPCalc contract.
var WeightedVaultsVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getVaultWeight\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVaultWeightAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setVaultWeight\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetVaultWeight\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"CheckpointUnorderedInsertion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"WeightedVaultsVPCalc_TooLargeWeight\",\"inputs\":[]}]",
}

// WeightedVaultsVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use WeightedVaultsVPCalcMetaData.ABI instead.
var WeightedVaultsVPCalcABI = WeightedVaultsVPCalcMetaData.ABI

// WeightedVaultsVPCalc is an auto generated Go binding around an Ethereum contract.
type WeightedVaultsVPCalc struct {
	WeightedVaultsVPCalcCaller     // Read-only binding to the contract
	WeightedVaultsVPCalcTransactor // Write-only binding to the contract
	WeightedVaultsVPCalcFilterer   // Log filterer for contract events
}

// WeightedVaultsVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type WeightedVaultsVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// WeightedVaultsVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type WeightedVaultsVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// WeightedVaultsVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type WeightedVaultsVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// WeightedVaultsVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type WeightedVaultsVPCalcSession struct {
	Contract     *WeightedVaultsVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts         // Call options to use throughout this session
	TransactOpts bind.TransactOpts     // Transaction auth options to use throughout this session
}

// WeightedVaultsVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type WeightedVaultsVPCalcCallerSession struct {
	Contract *WeightedVaultsVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts               // Call options to use throughout this session
}

// WeightedVaultsVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type WeightedVaultsVPCalcTransactorSession struct {
	Contract     *WeightedVaultsVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts               // Transaction auth options to use throughout this session
}

// WeightedVaultsVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type WeightedVaultsVPCalcRaw struct {
	Contract *WeightedVaultsVPCalc // Generic contract binding to access the raw methods on
}

// WeightedVaultsVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type WeightedVaultsVPCalcCallerRaw struct {
	Contract *WeightedVaultsVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// WeightedVaultsVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type WeightedVaultsVPCalcTransactorRaw struct {
	Contract *WeightedVaultsVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewWeightedVaultsVPCalc creates a new instance of WeightedVaultsVPCalc, bound to a specific deployed contract.
func NewWeightedVaultsVPCalc(address common.Address, backend bind.ContractBackend) (*WeightedVaultsVPCalc, error) {
	contract, err := bindWeightedVaultsVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &WeightedVaultsVPCalc{WeightedVaultsVPCalcCaller: WeightedVaultsVPCalcCaller{contract: contract}, WeightedVaultsVPCalcTransactor: WeightedVaultsVPCalcTransactor{contract: contract}, WeightedVaultsVPCalcFilterer: WeightedVaultsVPCalcFilterer{contract: contract}}, nil
}

// NewWeightedVaultsVPCalcCaller creates a new read-only instance of WeightedVaultsVPCalc, bound to a specific deployed contract.
func NewWeightedVaultsVPCalcCaller(address common.Address, caller bind.ContractCaller) (*WeightedVaultsVPCalcCaller, error) {
	contract, err := bindWeightedVaultsVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &WeightedVaultsVPCalcCaller{contract: contract}, nil
}

// NewWeightedVaultsVPCalcTransactor creates a new write-only instance of WeightedVaultsVPCalc, bound to a specific deployed contract.
func NewWeightedVaultsVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*WeightedVaultsVPCalcTransactor, error) {
	contract, err := bindWeightedVaultsVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &WeightedVaultsVPCalcTransactor{contract: contract}, nil
}

// NewWeightedVaultsVPCalcFilterer creates a new log filterer instance of WeightedVaultsVPCalc, bound to a specific deployed contract.
func NewWeightedVaultsVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*WeightedVaultsVPCalcFilterer, error) {
	contract, err := bindWeightedVaultsVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &WeightedVaultsVPCalcFilterer{contract: contract}, nil
}

// bindWeightedVaultsVPCalc binds a generic wrapper to an already deployed contract.
func bindWeightedVaultsVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := WeightedVaultsVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _WeightedVaultsVPCalc.Contract.WeightedVaultsVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _WeightedVaultsVPCalc.Contract.WeightedVaultsVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _WeightedVaultsVPCalc.Contract.WeightedVaultsVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _WeightedVaultsVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _WeightedVaultsVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _WeightedVaultsVPCalc.Contract.contract.Transact(opts, method, params...)
}

// GetVaultWeight is a free data retrieval call binding the contract method 0xac8047d2.
//
// Solidity: function getVaultWeight(address vault) view returns(uint208)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCaller) GetVaultWeight(opts *bind.CallOpts, vault common.Address) (*big.Int, error) {
	var out []interface{}
	err := _WeightedVaultsVPCalc.contract.Call(opts, &out, "getVaultWeight", vault)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetVaultWeight is a free data retrieval call binding the contract method 0xac8047d2.
//
// Solidity: function getVaultWeight(address vault) view returns(uint208)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcSession) GetVaultWeight(vault common.Address) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.GetVaultWeight(&_WeightedVaultsVPCalc.CallOpts, vault)
}

// GetVaultWeight is a free data retrieval call binding the contract method 0xac8047d2.
//
// Solidity: function getVaultWeight(address vault) view returns(uint208)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCallerSession) GetVaultWeight(vault common.Address) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.GetVaultWeight(&_WeightedVaultsVPCalc.CallOpts, vault)
}

// GetVaultWeightAt is a free data retrieval call binding the contract method 0x83e75620.
//
// Solidity: function getVaultWeightAt(address vault, uint48 timestamp) view returns(uint208)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCaller) GetVaultWeightAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _WeightedVaultsVPCalc.contract.Call(opts, &out, "getVaultWeightAt", vault, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetVaultWeightAt is a free data retrieval call binding the contract method 0x83e75620.
//
// Solidity: function getVaultWeightAt(address vault, uint48 timestamp) view returns(uint208)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcSession) GetVaultWeightAt(vault common.Address, timestamp *big.Int) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.GetVaultWeightAt(&_WeightedVaultsVPCalc.CallOpts, vault, timestamp)
}

// GetVaultWeightAt is a free data retrieval call binding the contract method 0x83e75620.
//
// Solidity: function getVaultWeightAt(address vault, uint48 timestamp) view returns(uint208)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCallerSession) GetVaultWeightAt(vault common.Address, timestamp *big.Int) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.GetVaultWeightAt(&_WeightedVaultsVPCalc.CallOpts, vault, timestamp)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCaller) StakeToVotingPower(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	var out []interface{}
	err := _WeightedVaultsVPCalc.contract.Call(opts, &out, "stakeToVotingPower", vault, stake, extraData)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.StakeToVotingPower(&_WeightedVaultsVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCallerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.StakeToVotingPower(&_WeightedVaultsVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCaller) StakeToVotingPowerAt(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _WeightedVaultsVPCalc.contract.Call(opts, &out, "stakeToVotingPowerAt", vault, stake, extraData, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.StakeToVotingPowerAt(&_WeightedVaultsVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcCallerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _WeightedVaultsVPCalc.Contract.StakeToVotingPowerAt(&_WeightedVaultsVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// SetVaultWeight is a paid mutator transaction binding the contract method 0x46d27217.
//
// Solidity: function setVaultWeight(address vault, uint208 weight) returns()
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcTransactor) SetVaultWeight(opts *bind.TransactOpts, vault common.Address, weight *big.Int) (*types.Transaction, error) {
	return _WeightedVaultsVPCalc.contract.Transact(opts, "setVaultWeight", vault, weight)
}

// SetVaultWeight is a paid mutator transaction binding the contract method 0x46d27217.
//
// Solidity: function setVaultWeight(address vault, uint208 weight) returns()
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcSession) SetVaultWeight(vault common.Address, weight *big.Int) (*types.Transaction, error) {
	return _WeightedVaultsVPCalc.Contract.SetVaultWeight(&_WeightedVaultsVPCalc.TransactOpts, vault, weight)
}

// SetVaultWeight is a paid mutator transaction binding the contract method 0x46d27217.
//
// Solidity: function setVaultWeight(address vault, uint208 weight) returns()
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcTransactorSession) SetVaultWeight(vault common.Address, weight *big.Int) (*types.Transaction, error) {
	return _WeightedVaultsVPCalc.Contract.SetVaultWeight(&_WeightedVaultsVPCalc.TransactOpts, vault, weight)
}

// WeightedVaultsVPCalcInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the WeightedVaultsVPCalc contract.
type WeightedVaultsVPCalcInitializedIterator struct {
	Event *WeightedVaultsVPCalcInitialized // Event containing the contract specifics and raw log

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
func (it *WeightedVaultsVPCalcInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(WeightedVaultsVPCalcInitialized)
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
		it.Event = new(WeightedVaultsVPCalcInitialized)
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
func (it *WeightedVaultsVPCalcInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *WeightedVaultsVPCalcInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// WeightedVaultsVPCalcInitialized represents a Initialized event raised by the WeightedVaultsVPCalc contract.
type WeightedVaultsVPCalcInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcFilterer) FilterInitialized(opts *bind.FilterOpts) (*WeightedVaultsVPCalcInitializedIterator, error) {

	logs, sub, err := _WeightedVaultsVPCalc.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &WeightedVaultsVPCalcInitializedIterator{contract: _WeightedVaultsVPCalc.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *WeightedVaultsVPCalcInitialized) (event.Subscription, error) {

	logs, sub, err := _WeightedVaultsVPCalc.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(WeightedVaultsVPCalcInitialized)
				if err := _WeightedVaultsVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcFilterer) ParseInitialized(log types.Log) (*WeightedVaultsVPCalcInitialized, error) {
	event := new(WeightedVaultsVPCalcInitialized)
	if err := _WeightedVaultsVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// WeightedVaultsVPCalcSetVaultWeightIterator is returned from FilterSetVaultWeight and is used to iterate over the raw logs and unpacked data for SetVaultWeight events raised by the WeightedVaultsVPCalc contract.
type WeightedVaultsVPCalcSetVaultWeightIterator struct {
	Event *WeightedVaultsVPCalcSetVaultWeight // Event containing the contract specifics and raw log

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
func (it *WeightedVaultsVPCalcSetVaultWeightIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(WeightedVaultsVPCalcSetVaultWeight)
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
		it.Event = new(WeightedVaultsVPCalcSetVaultWeight)
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
func (it *WeightedVaultsVPCalcSetVaultWeightIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *WeightedVaultsVPCalcSetVaultWeightIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// WeightedVaultsVPCalcSetVaultWeight represents a SetVaultWeight event raised by the WeightedVaultsVPCalc contract.
type WeightedVaultsVPCalcSetVaultWeight struct {
	Vault  common.Address
	Weight *big.Int
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetVaultWeight is a free log retrieval operation binding the contract event 0xacf049e96246b51c4c3b4a3346404f9a892478516474929c53ad5298bfe8008e.
//
// Solidity: event SetVaultWeight(address indexed vault, uint208 weight)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcFilterer) FilterSetVaultWeight(opts *bind.FilterOpts, vault []common.Address) (*WeightedVaultsVPCalcSetVaultWeightIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _WeightedVaultsVPCalc.contract.FilterLogs(opts, "SetVaultWeight", vaultRule)
	if err != nil {
		return nil, err
	}
	return &WeightedVaultsVPCalcSetVaultWeightIterator{contract: _WeightedVaultsVPCalc.contract, event: "SetVaultWeight", logs: logs, sub: sub}, nil
}

// WatchSetVaultWeight is a free log subscription operation binding the contract event 0xacf049e96246b51c4c3b4a3346404f9a892478516474929c53ad5298bfe8008e.
//
// Solidity: event SetVaultWeight(address indexed vault, uint208 weight)
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcFilterer) WatchSetVaultWeight(opts *bind.WatchOpts, sink chan<- *WeightedVaultsVPCalcSetVaultWeight, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _WeightedVaultsVPCalc.contract.WatchLogs(opts, "SetVaultWeight", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(WeightedVaultsVPCalcSetVaultWeight)
				if err := _WeightedVaultsVPCalc.contract.UnpackLog(event, "SetVaultWeight", log); err != nil {
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
func (_WeightedVaultsVPCalc *WeightedVaultsVPCalcFilterer) ParseSetVaultWeight(log types.Log) (*WeightedVaultsVPCalcSetVaultWeight, error) {
	event := new(WeightedVaultsVPCalcSetVaultWeight)
	if err := _WeightedVaultsVPCalc.contract.UnpackLog(event, "SetVaultWeight", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

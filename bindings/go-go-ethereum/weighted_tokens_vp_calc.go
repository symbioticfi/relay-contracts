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

// WeightedTokensVPCalcMetaData contains all meta data concerning the WeightedTokensVPCalc contract.
var WeightedTokensVPCalcMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"getTokenWeight\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokenWeightAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setTokenWeight\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"stakeToVotingPower\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"stakeToVotingPowerAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"stake\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetTokenWeight\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"weight\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"CheckpointUnorderedInsertion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"WeightedTokensVPCalc_TooLargeWeight\",\"inputs\":[]}]",
}

// WeightedTokensVPCalcABI is the input ABI used to generate the binding from.
// Deprecated: Use WeightedTokensVPCalcMetaData.ABI instead.
var WeightedTokensVPCalcABI = WeightedTokensVPCalcMetaData.ABI

// WeightedTokensVPCalc is an auto generated Go binding around an Ethereum contract.
type WeightedTokensVPCalc struct {
	WeightedTokensVPCalcCaller     // Read-only binding to the contract
	WeightedTokensVPCalcTransactor // Write-only binding to the contract
	WeightedTokensVPCalcFilterer   // Log filterer for contract events
}

// WeightedTokensVPCalcCaller is an auto generated read-only Go binding around an Ethereum contract.
type WeightedTokensVPCalcCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// WeightedTokensVPCalcTransactor is an auto generated write-only Go binding around an Ethereum contract.
type WeightedTokensVPCalcTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// WeightedTokensVPCalcFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type WeightedTokensVPCalcFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// WeightedTokensVPCalcSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type WeightedTokensVPCalcSession struct {
	Contract     *WeightedTokensVPCalc // Generic contract binding to set the session for
	CallOpts     bind.CallOpts         // Call options to use throughout this session
	TransactOpts bind.TransactOpts     // Transaction auth options to use throughout this session
}

// WeightedTokensVPCalcCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type WeightedTokensVPCalcCallerSession struct {
	Contract *WeightedTokensVPCalcCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts               // Call options to use throughout this session
}

// WeightedTokensVPCalcTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type WeightedTokensVPCalcTransactorSession struct {
	Contract     *WeightedTokensVPCalcTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts               // Transaction auth options to use throughout this session
}

// WeightedTokensVPCalcRaw is an auto generated low-level Go binding around an Ethereum contract.
type WeightedTokensVPCalcRaw struct {
	Contract *WeightedTokensVPCalc // Generic contract binding to access the raw methods on
}

// WeightedTokensVPCalcCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type WeightedTokensVPCalcCallerRaw struct {
	Contract *WeightedTokensVPCalcCaller // Generic read-only contract binding to access the raw methods on
}

// WeightedTokensVPCalcTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type WeightedTokensVPCalcTransactorRaw struct {
	Contract *WeightedTokensVPCalcTransactor // Generic write-only contract binding to access the raw methods on
}

// NewWeightedTokensVPCalc creates a new instance of WeightedTokensVPCalc, bound to a specific deployed contract.
func NewWeightedTokensVPCalc(address common.Address, backend bind.ContractBackend) (*WeightedTokensVPCalc, error) {
	contract, err := bindWeightedTokensVPCalc(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &WeightedTokensVPCalc{WeightedTokensVPCalcCaller: WeightedTokensVPCalcCaller{contract: contract}, WeightedTokensVPCalcTransactor: WeightedTokensVPCalcTransactor{contract: contract}, WeightedTokensVPCalcFilterer: WeightedTokensVPCalcFilterer{contract: contract}}, nil
}

// NewWeightedTokensVPCalcCaller creates a new read-only instance of WeightedTokensVPCalc, bound to a specific deployed contract.
func NewWeightedTokensVPCalcCaller(address common.Address, caller bind.ContractCaller) (*WeightedTokensVPCalcCaller, error) {
	contract, err := bindWeightedTokensVPCalc(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &WeightedTokensVPCalcCaller{contract: contract}, nil
}

// NewWeightedTokensVPCalcTransactor creates a new write-only instance of WeightedTokensVPCalc, bound to a specific deployed contract.
func NewWeightedTokensVPCalcTransactor(address common.Address, transactor bind.ContractTransactor) (*WeightedTokensVPCalcTransactor, error) {
	contract, err := bindWeightedTokensVPCalc(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &WeightedTokensVPCalcTransactor{contract: contract}, nil
}

// NewWeightedTokensVPCalcFilterer creates a new log filterer instance of WeightedTokensVPCalc, bound to a specific deployed contract.
func NewWeightedTokensVPCalcFilterer(address common.Address, filterer bind.ContractFilterer) (*WeightedTokensVPCalcFilterer, error) {
	contract, err := bindWeightedTokensVPCalc(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &WeightedTokensVPCalcFilterer{contract: contract}, nil
}

// bindWeightedTokensVPCalc binds a generic wrapper to an already deployed contract.
func bindWeightedTokensVPCalc(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := WeightedTokensVPCalcMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_WeightedTokensVPCalc *WeightedTokensVPCalcRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _WeightedTokensVPCalc.Contract.WeightedTokensVPCalcCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_WeightedTokensVPCalc *WeightedTokensVPCalcRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _WeightedTokensVPCalc.Contract.WeightedTokensVPCalcTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_WeightedTokensVPCalc *WeightedTokensVPCalcRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _WeightedTokensVPCalc.Contract.WeightedTokensVPCalcTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _WeightedTokensVPCalc.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_WeightedTokensVPCalc *WeightedTokensVPCalcTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _WeightedTokensVPCalc.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_WeightedTokensVPCalc *WeightedTokensVPCalcTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _WeightedTokensVPCalc.Contract.contract.Transact(opts, method, params...)
}

// GetTokenWeight is a free data retrieval call binding the contract method 0x250aa683.
//
// Solidity: function getTokenWeight(address token) view returns(uint208)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCaller) GetTokenWeight(opts *bind.CallOpts, token common.Address) (*big.Int, error) {
	var out []interface{}
	err := _WeightedTokensVPCalc.contract.Call(opts, &out, "getTokenWeight", token)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenWeight is a free data retrieval call binding the contract method 0x250aa683.
//
// Solidity: function getTokenWeight(address token) view returns(uint208)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcSession) GetTokenWeight(token common.Address) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.GetTokenWeight(&_WeightedTokensVPCalc.CallOpts, token)
}

// GetTokenWeight is a free data retrieval call binding the contract method 0x250aa683.
//
// Solidity: function getTokenWeight(address token) view returns(uint208)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCallerSession) GetTokenWeight(token common.Address) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.GetTokenWeight(&_WeightedTokensVPCalc.CallOpts, token)
}

// GetTokenWeightAt is a free data retrieval call binding the contract method 0x8ca7a5c9.
//
// Solidity: function getTokenWeightAt(address token, uint48 timestamp) view returns(uint208)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCaller) GetTokenWeightAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _WeightedTokensVPCalc.contract.Call(opts, &out, "getTokenWeightAt", token, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTokenWeightAt is a free data retrieval call binding the contract method 0x8ca7a5c9.
//
// Solidity: function getTokenWeightAt(address token, uint48 timestamp) view returns(uint208)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcSession) GetTokenWeightAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.GetTokenWeightAt(&_WeightedTokensVPCalc.CallOpts, token, timestamp)
}

// GetTokenWeightAt is a free data retrieval call binding the contract method 0x8ca7a5c9.
//
// Solidity: function getTokenWeightAt(address token, uint48 timestamp) view returns(uint208)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCallerSession) GetTokenWeightAt(token common.Address, timestamp *big.Int) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.GetTokenWeightAt(&_WeightedTokensVPCalc.CallOpts, token, timestamp)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCaller) StakeToVotingPower(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	var out []interface{}
	err := _WeightedTokensVPCalc.contract.Call(opts, &out, "stakeToVotingPower", vault, stake, extraData)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.StakeToVotingPower(&_WeightedTokensVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPower is a free data retrieval call binding the contract method 0x039b8dd0.
//
// Solidity: function stakeToVotingPower(address vault, uint256 stake, bytes extraData) view returns(uint256)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCallerSession) StakeToVotingPower(vault common.Address, stake *big.Int, extraData []byte) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.StakeToVotingPower(&_WeightedTokensVPCalc.CallOpts, vault, stake, extraData)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCaller) StakeToVotingPowerAt(opts *bind.CallOpts, vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _WeightedTokensVPCalc.contract.Call(opts, &out, "stakeToVotingPowerAt", vault, stake, extraData, timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.StakeToVotingPowerAt(&_WeightedTokensVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// StakeToVotingPowerAt is a free data retrieval call binding the contract method 0x52936362.
//
// Solidity: function stakeToVotingPowerAt(address vault, uint256 stake, bytes extraData, uint48 timestamp) view returns(uint256)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcCallerSession) StakeToVotingPowerAt(vault common.Address, stake *big.Int, extraData []byte, timestamp *big.Int) (*big.Int, error) {
	return _WeightedTokensVPCalc.Contract.StakeToVotingPowerAt(&_WeightedTokensVPCalc.CallOpts, vault, stake, extraData, timestamp)
}

// SetTokenWeight is a paid mutator transaction binding the contract method 0x7d4d1521.
//
// Solidity: function setTokenWeight(address token, uint208 weight) returns()
func (_WeightedTokensVPCalc *WeightedTokensVPCalcTransactor) SetTokenWeight(opts *bind.TransactOpts, token common.Address, weight *big.Int) (*types.Transaction, error) {
	return _WeightedTokensVPCalc.contract.Transact(opts, "setTokenWeight", token, weight)
}

// SetTokenWeight is a paid mutator transaction binding the contract method 0x7d4d1521.
//
// Solidity: function setTokenWeight(address token, uint208 weight) returns()
func (_WeightedTokensVPCalc *WeightedTokensVPCalcSession) SetTokenWeight(token common.Address, weight *big.Int) (*types.Transaction, error) {
	return _WeightedTokensVPCalc.Contract.SetTokenWeight(&_WeightedTokensVPCalc.TransactOpts, token, weight)
}

// SetTokenWeight is a paid mutator transaction binding the contract method 0x7d4d1521.
//
// Solidity: function setTokenWeight(address token, uint208 weight) returns()
func (_WeightedTokensVPCalc *WeightedTokensVPCalcTransactorSession) SetTokenWeight(token common.Address, weight *big.Int) (*types.Transaction, error) {
	return _WeightedTokensVPCalc.Contract.SetTokenWeight(&_WeightedTokensVPCalc.TransactOpts, token, weight)
}

// WeightedTokensVPCalcInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the WeightedTokensVPCalc contract.
type WeightedTokensVPCalcInitializedIterator struct {
	Event *WeightedTokensVPCalcInitialized // Event containing the contract specifics and raw log

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
func (it *WeightedTokensVPCalcInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(WeightedTokensVPCalcInitialized)
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
		it.Event = new(WeightedTokensVPCalcInitialized)
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
func (it *WeightedTokensVPCalcInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *WeightedTokensVPCalcInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// WeightedTokensVPCalcInitialized represents a Initialized event raised by the WeightedTokensVPCalc contract.
type WeightedTokensVPCalcInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcFilterer) FilterInitialized(opts *bind.FilterOpts) (*WeightedTokensVPCalcInitializedIterator, error) {

	logs, sub, err := _WeightedTokensVPCalc.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &WeightedTokensVPCalcInitializedIterator{contract: _WeightedTokensVPCalc.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *WeightedTokensVPCalcInitialized) (event.Subscription, error) {

	logs, sub, err := _WeightedTokensVPCalc.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(WeightedTokensVPCalcInitialized)
				if err := _WeightedTokensVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_WeightedTokensVPCalc *WeightedTokensVPCalcFilterer) ParseInitialized(log types.Log) (*WeightedTokensVPCalcInitialized, error) {
	event := new(WeightedTokensVPCalcInitialized)
	if err := _WeightedTokensVPCalc.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// WeightedTokensVPCalcSetTokenWeightIterator is returned from FilterSetTokenWeight and is used to iterate over the raw logs and unpacked data for SetTokenWeight events raised by the WeightedTokensVPCalc contract.
type WeightedTokensVPCalcSetTokenWeightIterator struct {
	Event *WeightedTokensVPCalcSetTokenWeight // Event containing the contract specifics and raw log

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
func (it *WeightedTokensVPCalcSetTokenWeightIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(WeightedTokensVPCalcSetTokenWeight)
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
		it.Event = new(WeightedTokensVPCalcSetTokenWeight)
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
func (it *WeightedTokensVPCalcSetTokenWeightIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *WeightedTokensVPCalcSetTokenWeightIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// WeightedTokensVPCalcSetTokenWeight represents a SetTokenWeight event raised by the WeightedTokensVPCalc contract.
type WeightedTokensVPCalcSetTokenWeight struct {
	Token  common.Address
	Weight *big.Int
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetTokenWeight is a free log retrieval operation binding the contract event 0x2cda4a20f5fdbac0eecc2936dc177539fcd152bafa12f214b4205287e12a145d.
//
// Solidity: event SetTokenWeight(address indexed token, uint208 weight)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcFilterer) FilterSetTokenWeight(opts *bind.FilterOpts, token []common.Address) (*WeightedTokensVPCalcSetTokenWeightIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _WeightedTokensVPCalc.contract.FilterLogs(opts, "SetTokenWeight", tokenRule)
	if err != nil {
		return nil, err
	}
	return &WeightedTokensVPCalcSetTokenWeightIterator{contract: _WeightedTokensVPCalc.contract, event: "SetTokenWeight", logs: logs, sub: sub}, nil
}

// WatchSetTokenWeight is a free log subscription operation binding the contract event 0x2cda4a20f5fdbac0eecc2936dc177539fcd152bafa12f214b4205287e12a145d.
//
// Solidity: event SetTokenWeight(address indexed token, uint208 weight)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcFilterer) WatchSetTokenWeight(opts *bind.WatchOpts, sink chan<- *WeightedTokensVPCalcSetTokenWeight, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _WeightedTokensVPCalc.contract.WatchLogs(opts, "SetTokenWeight", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(WeightedTokensVPCalcSetTokenWeight)
				if err := _WeightedTokensVPCalc.contract.UnpackLog(event, "SetTokenWeight", log); err != nil {
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

// ParseSetTokenWeight is a log parse operation binding the contract event 0x2cda4a20f5fdbac0eecc2936dc177539fcd152bafa12f214b4205287e12a145d.
//
// Solidity: event SetTokenWeight(address indexed token, uint208 weight)
func (_WeightedTokensVPCalc *WeightedTokensVPCalcFilterer) ParseSetTokenWeight(log types.Log) (*WeightedTokensVPCalcSetTokenWeight, error) {
	event := new(WeightedTokensVPCalcSetTokenWeight)
	if err := _WeightedTokensVPCalc.contract.UnpackLog(event, "SetTokenWeight", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

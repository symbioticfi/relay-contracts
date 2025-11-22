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

// IOpNetVaultAutoDeployAutoDeployConfig is an auto generated low-level Go binding around an user-defined struct.
type IOpNetVaultAutoDeployAutoDeployConfig struct {
	EpochDuration *big.Int
	Collateral    common.Address
	Burner        common.Address
	WithSlasher   bool
	IsBurnerHook  bool
}

// IOpNetVaultAutoDeployMetaData contains all meta data concerning the IOpNetVaultAutoDeploy contract.
var IOpNetVaultAutoDeployMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"VAULT_CONFIGURATOR\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getAutoDeployConfig\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getAutoDeployedVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isAutoDeployEnabled\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSetMaxNetworkLimitHookEnabled\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setAutoDeployConfig\",\"inputs\":[{\"name\":\"config\",\"type\":\"tuple\",\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setAutoDeployStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setSetMaxNetworkLimitHookStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"SetAutoDeployConfig\",\"inputs\":[{\"name\":\"config\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIOpNetVaultAutoDeploy.AutoDeployConfig\",\"components\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"collateral\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"burner\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"withSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"isBurnerHook\",\"type\":\"bool\",\"internalType\":\"bool\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetAutoDeployStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSetMaxNetworkLimitHookStatus\",\"inputs\":[{\"name\":\"status\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidBurnerHook\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidCollateral\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidEpochDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"OpNetVaultAutoDeploy_InvalidWithSlasher\",\"inputs\":[]}]",
}

// IOpNetVaultAutoDeployABI is the input ABI used to generate the binding from.
// Deprecated: Use IOpNetVaultAutoDeployMetaData.ABI instead.
var IOpNetVaultAutoDeployABI = IOpNetVaultAutoDeployMetaData.ABI

// IOpNetVaultAutoDeploy is an auto generated Go binding around an Ethereum contract.
type IOpNetVaultAutoDeploy struct {
	IOpNetVaultAutoDeployCaller     // Read-only binding to the contract
	IOpNetVaultAutoDeployTransactor // Write-only binding to the contract
	IOpNetVaultAutoDeployFilterer   // Log filterer for contract events
}

// IOpNetVaultAutoDeployCaller is an auto generated read-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOpNetVaultAutoDeployTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOpNetVaultAutoDeployFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IOpNetVaultAutoDeployFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IOpNetVaultAutoDeploySession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IOpNetVaultAutoDeploySession struct {
	Contract     *IOpNetVaultAutoDeploy // Generic contract binding to set the session for
	CallOpts     bind.CallOpts          // Call options to use throughout this session
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// IOpNetVaultAutoDeployCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IOpNetVaultAutoDeployCallerSession struct {
	Contract *IOpNetVaultAutoDeployCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts                // Call options to use throughout this session
}

// IOpNetVaultAutoDeployTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IOpNetVaultAutoDeployTransactorSession struct {
	Contract     *IOpNetVaultAutoDeployTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts                // Transaction auth options to use throughout this session
}

// IOpNetVaultAutoDeployRaw is an auto generated low-level Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployRaw struct {
	Contract *IOpNetVaultAutoDeploy // Generic contract binding to access the raw methods on
}

// IOpNetVaultAutoDeployCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployCallerRaw struct {
	Contract *IOpNetVaultAutoDeployCaller // Generic read-only contract binding to access the raw methods on
}

// IOpNetVaultAutoDeployTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IOpNetVaultAutoDeployTransactorRaw struct {
	Contract *IOpNetVaultAutoDeployTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIOpNetVaultAutoDeploy creates a new instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeploy(address common.Address, backend bind.ContractBackend) (*IOpNetVaultAutoDeploy, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploy{IOpNetVaultAutoDeployCaller: IOpNetVaultAutoDeployCaller{contract: contract}, IOpNetVaultAutoDeployTransactor: IOpNetVaultAutoDeployTransactor{contract: contract}, IOpNetVaultAutoDeployFilterer: IOpNetVaultAutoDeployFilterer{contract: contract}}, nil
}

// NewIOpNetVaultAutoDeployCaller creates a new read-only instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeployCaller(address common.Address, caller bind.ContractCaller) (*IOpNetVaultAutoDeployCaller, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployCaller{contract: contract}, nil
}

// NewIOpNetVaultAutoDeployTransactor creates a new write-only instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeployTransactor(address common.Address, transactor bind.ContractTransactor) (*IOpNetVaultAutoDeployTransactor, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployTransactor{contract: contract}, nil
}

// NewIOpNetVaultAutoDeployFilterer creates a new log filterer instance of IOpNetVaultAutoDeploy, bound to a specific deployed contract.
func NewIOpNetVaultAutoDeployFilterer(address common.Address, filterer bind.ContractFilterer) (*IOpNetVaultAutoDeployFilterer, error) {
	contract, err := bindIOpNetVaultAutoDeploy(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeployFilterer{contract: contract}, nil
}

// bindIOpNetVaultAutoDeploy binds a generic wrapper to an already deployed contract.
func bindIOpNetVaultAutoDeploy(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IOpNetVaultAutoDeployMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOpNetVaultAutoDeploy.Contract.IOpNetVaultAutoDeployCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.IOpNetVaultAutoDeployTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.IOpNetVaultAutoDeployTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IOpNetVaultAutoDeploy.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.contract.Transact(opts, method, params...)
}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) VAULTCONFIGURATOR(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "VAULT_CONFIGURATOR")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) VAULTCONFIGURATOR() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.VAULTCONFIGURATOR(&_IOpNetVaultAutoDeploy.CallOpts)
}

// VAULTCONFIGURATOR is a free data retrieval call binding the contract method 0xb25bc0c0.
//
// Solidity: function VAULT_CONFIGURATOR() view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) VAULTCONFIGURATOR() (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.VAULTCONFIGURATOR(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetAutoDeployConfig(opts *bind.CallOpts) (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getAutoDeployConfig")

	if err != nil {
		return *new(IOpNetVaultAutoDeployAutoDeployConfig), err
	}

	out0 := *abi.ConvertType(out[0], new(IOpNetVaultAutoDeployAutoDeployConfig)).(*IOpNetVaultAutoDeployAutoDeployConfig)

	return out0, err

}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetAutoDeployConfig() (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployConfig(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployConfig is a free data retrieval call binding the contract method 0xa149c987.
//
// Solidity: function getAutoDeployConfig() view returns((uint48,address,address,bool,bool))
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetAutoDeployConfig() (IOpNetVaultAutoDeployAutoDeployConfig, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployConfig(&_IOpNetVaultAutoDeploy.CallOpts)
}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) GetAutoDeployedVault(opts *bind.CallOpts, operator common.Address) (common.Address, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "getAutoDeployedVault", operator)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) GetAutoDeployedVault(operator common.Address) (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployedVault(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// GetAutoDeployedVault is a free data retrieval call binding the contract method 0x2b2fd015.
//
// Solidity: function getAutoDeployedVault(address operator) view returns(address)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) GetAutoDeployedVault(operator common.Address) (common.Address, error) {
	return _IOpNetVaultAutoDeploy.Contract.GetAutoDeployedVault(&_IOpNetVaultAutoDeploy.CallOpts, operator)
}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsAutoDeployEnabled(opts *bind.CallOpts) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isAutoDeployEnabled")

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsAutoDeployEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsAutoDeployEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// IsAutoDeployEnabled is a free data retrieval call binding the contract method 0xdeb018dc.
//
// Solidity: function isAutoDeployEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsAutoDeployEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsAutoDeployEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCaller) IsSetMaxNetworkLimitHookEnabled(opts *bind.CallOpts) (bool, error) {
	var out []interface{}
	err := _IOpNetVaultAutoDeploy.contract.Call(opts, &out, "isSetMaxNetworkLimitHookEnabled")

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) IsSetMaxNetworkLimitHookEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSetMaxNetworkLimitHookEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// IsSetMaxNetworkLimitHookEnabled is a free data retrieval call binding the contract method 0xe77b136d.
//
// Solidity: function isSetMaxNetworkLimitHookEnabled() view returns(bool)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployCallerSession) IsSetMaxNetworkLimitHookEnabled() (bool, error) {
	return _IOpNetVaultAutoDeploy.Contract.IsSetMaxNetworkLimitHookEnabled(&_IOpNetVaultAutoDeploy.CallOpts)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) SetAutoDeployConfig(opts *bind.TransactOpts, config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "setAutoDeployConfig", config)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) SetAutoDeployConfig(config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployConfig(&_IOpNetVaultAutoDeploy.TransactOpts, config)
}

// SetAutoDeployConfig is a paid mutator transaction binding the contract method 0x8cecaab4.
//
// Solidity: function setAutoDeployConfig((uint48,address,address,bool,bool) config) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) SetAutoDeployConfig(config IOpNetVaultAutoDeployAutoDeployConfig) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployConfig(&_IOpNetVaultAutoDeploy.TransactOpts, config)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) SetAutoDeployStatus(opts *bind.TransactOpts, status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "setAutoDeployStatus", status)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) SetAutoDeployStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// SetAutoDeployStatus is a paid mutator transaction binding the contract method 0x79e3bf0e.
//
// Solidity: function setAutoDeployStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) SetAutoDeployStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetAutoDeployStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactor) SetSetMaxNetworkLimitHookStatus(opts *bind.TransactOpts, status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.contract.Transact(opts, "setSetMaxNetworkLimitHookStatus", status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeploySession) SetSetMaxNetworkLimitHookStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetSetMaxNetworkLimitHookStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// SetSetMaxNetworkLimitHookStatus is a paid mutator transaction binding the contract method 0xda3fad7a.
//
// Solidity: function setSetMaxNetworkLimitHookStatus(bool status) returns()
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployTransactorSession) SetSetMaxNetworkLimitHookStatus(status bool) (*types.Transaction, error) {
	return _IOpNetVaultAutoDeploy.Contract.SetSetMaxNetworkLimitHookStatus(&_IOpNetVaultAutoDeploy.TransactOpts, status)
}

// IOpNetVaultAutoDeploySetAutoDeployConfigIterator is returned from FilterSetAutoDeployConfig and is used to iterate over the raw logs and unpacked data for SetAutoDeployConfig events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployConfigIterator struct {
	Event *IOpNetVaultAutoDeploySetAutoDeployConfig // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeploySetAutoDeployConfigIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeploySetAutoDeployConfig)
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
		it.Event = new(IOpNetVaultAutoDeploySetAutoDeployConfig)
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
func (it *IOpNetVaultAutoDeploySetAutoDeployConfigIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeploySetAutoDeployConfigIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeploySetAutoDeployConfig represents a SetAutoDeployConfig event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployConfig struct {
	Config IOpNetVaultAutoDeployAutoDeployConfig
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetAutoDeployConfig is a free log retrieval operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterSetAutoDeployConfig(opts *bind.FilterOpts) (*IOpNetVaultAutoDeploySetAutoDeployConfigIterator, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetAutoDeployConfig")
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploySetAutoDeployConfigIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "SetAutoDeployConfig", logs: logs, sub: sub}, nil
}

// WatchSetAutoDeployConfig is a free log subscription operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchSetAutoDeployConfig(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeploySetAutoDeployConfig) (event.Subscription, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetAutoDeployConfig")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeploySetAutoDeployConfig)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployConfig", log); err != nil {
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

// ParseSetAutoDeployConfig is a log parse operation binding the contract event 0x77e47da1f6025186b00adae5351f623eba1ab5151f7d15bc44c6a39be86e6c05.
//
// Solidity: event SetAutoDeployConfig((uint48,address,address,bool,bool) config)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseSetAutoDeployConfig(log types.Log) (*IOpNetVaultAutoDeploySetAutoDeployConfig, error) {
	event := new(IOpNetVaultAutoDeploySetAutoDeployConfig)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployConfig", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeploySetAutoDeployStatusIterator is returned from FilterSetAutoDeployStatus and is used to iterate over the raw logs and unpacked data for SetAutoDeployStatus events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployStatusIterator struct {
	Event *IOpNetVaultAutoDeploySetAutoDeployStatus // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeploySetAutoDeployStatusIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeploySetAutoDeployStatus)
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
		it.Event = new(IOpNetVaultAutoDeploySetAutoDeployStatus)
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
func (it *IOpNetVaultAutoDeploySetAutoDeployStatusIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeploySetAutoDeployStatusIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeploySetAutoDeployStatus represents a SetAutoDeployStatus event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetAutoDeployStatus struct {
	Status bool
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetAutoDeployStatus is a free log retrieval operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterSetAutoDeployStatus(opts *bind.FilterOpts) (*IOpNetVaultAutoDeploySetAutoDeployStatusIterator, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetAutoDeployStatus")
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploySetAutoDeployStatusIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "SetAutoDeployStatus", logs: logs, sub: sub}, nil
}

// WatchSetAutoDeployStatus is a free log subscription operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchSetAutoDeployStatus(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeploySetAutoDeployStatus) (event.Subscription, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetAutoDeployStatus")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeploySetAutoDeployStatus)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployStatus", log); err != nil {
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

// ParseSetAutoDeployStatus is a log parse operation binding the contract event 0x8951c46d8957e007c4f4222e768ee8e59bb367b6c72569e92e337a5b194bf04d.
//
// Solidity: event SetAutoDeployStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseSetAutoDeployStatus(log types.Log) (*IOpNetVaultAutoDeploySetAutoDeployStatus, error) {
	event := new(IOpNetVaultAutoDeploySetAutoDeployStatus)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetAutoDeployStatus", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator is returned from FilterSetSetMaxNetworkLimitHookStatus and is used to iterate over the raw logs and unpacked data for SetSetMaxNetworkLimitHookStatus events raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator struct {
	Event *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus // Event containing the contract specifics and raw log

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
func (it *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
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
		it.Event = new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
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
func (it *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus represents a SetSetMaxNetworkLimitHookStatus event raised by the IOpNetVaultAutoDeploy contract.
type IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus struct {
	Status bool
	Raw    types.Log // Blockchain specific contextual infos
}

// FilterSetSetMaxNetworkLimitHookStatus is a free log retrieval operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) FilterSetSetMaxNetworkLimitHookStatus(opts *bind.FilterOpts) (*IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.FilterLogs(opts, "SetSetMaxNetworkLimitHookStatus")
	if err != nil {
		return nil, err
	}
	return &IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatusIterator{contract: _IOpNetVaultAutoDeploy.contract, event: "SetSetMaxNetworkLimitHookStatus", logs: logs, sub: sub}, nil
}

// WatchSetSetMaxNetworkLimitHookStatus is a free log subscription operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) WatchSetSetMaxNetworkLimitHookStatus(opts *bind.WatchOpts, sink chan<- *IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus) (event.Subscription, error) {

	logs, sub, err := _IOpNetVaultAutoDeploy.contract.WatchLogs(opts, "SetSetMaxNetworkLimitHookStatus")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
				if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSetMaxNetworkLimitHookStatus", log); err != nil {
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

// ParseSetSetMaxNetworkLimitHookStatus is a log parse operation binding the contract event 0x8bd71bb92871c7cb65d4ba7554dadeb02abcf4d9e99aff8367714c5a15bd019c.
//
// Solidity: event SetSetMaxNetworkLimitHookStatus(bool status)
func (_IOpNetVaultAutoDeploy *IOpNetVaultAutoDeployFilterer) ParseSetSetMaxNetworkLimitHookStatus(log types.Log) (*IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus, error) {
	event := new(IOpNetVaultAutoDeploySetSetMaxNetworkLimitHookStatus)
	if err := _IOpNetVaultAutoDeploy.contract.UnpackLog(event, "SetSetMaxNetworkLimitHookStatus", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

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

// IVotingPowerProviderOperatorVotingPower is an auto generated low-level Go binding around an user-defined struct.
type IVotingPowerProviderOperatorVotingPower struct {
	Operator common.Address
	Vaults   []IVotingPowerProviderVaultValue
}

// IVotingPowerProviderVaultValue is an auto generated low-level Go binding around an user-defined struct.
type IVotingPowerProviderVaultValue struct {
	Vault common.Address
	Value *big.Int
}

// IVotingPowerProviderMetaData contains all meta data concerning the IVotingPowerProvider contract.
var IVotingPowerProviderMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"OPERATOR_REGISTRY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_FACTORY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakes\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakesAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaults\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaultsAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowers\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowersAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaults\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaultsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingData\",\"inputs\":[],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingDataAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokens\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokensAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowers\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowersAt\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"invalidateOldSignatures\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"isOperatorRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegistered\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegisteredAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"registerOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"registerOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"RegisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlashingData\",\"inputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperator\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperatorVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSharedVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidToken\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorAlreadyRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenNotRegistered\",\"inputs\":[]}]",
}

// IVotingPowerProviderABI is the input ABI used to generate the binding from.
// Deprecated: Use IVotingPowerProviderMetaData.ABI instead.
var IVotingPowerProviderABI = IVotingPowerProviderMetaData.ABI

// IVotingPowerProvider is an auto generated Go binding around an Ethereum contract.
type IVotingPowerProvider struct {
	IVotingPowerProviderCaller     // Read-only binding to the contract
	IVotingPowerProviderTransactor // Write-only binding to the contract
	IVotingPowerProviderFilterer   // Log filterer for contract events
}

// IVotingPowerProviderCaller is an auto generated read-only Go binding around an Ethereum contract.
type IVotingPowerProviderCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVotingPowerProviderTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IVotingPowerProviderTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVotingPowerProviderFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IVotingPowerProviderFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IVotingPowerProviderSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IVotingPowerProviderSession struct {
	Contract     *IVotingPowerProvider // Generic contract binding to set the session for
	CallOpts     bind.CallOpts         // Call options to use throughout this session
	TransactOpts bind.TransactOpts     // Transaction auth options to use throughout this session
}

// IVotingPowerProviderCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IVotingPowerProviderCallerSession struct {
	Contract *IVotingPowerProviderCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts               // Call options to use throughout this session
}

// IVotingPowerProviderTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IVotingPowerProviderTransactorSession struct {
	Contract     *IVotingPowerProviderTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts               // Transaction auth options to use throughout this session
}

// IVotingPowerProviderRaw is an auto generated low-level Go binding around an Ethereum contract.
type IVotingPowerProviderRaw struct {
	Contract *IVotingPowerProvider // Generic contract binding to access the raw methods on
}

// IVotingPowerProviderCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IVotingPowerProviderCallerRaw struct {
	Contract *IVotingPowerProviderCaller // Generic read-only contract binding to access the raw methods on
}

// IVotingPowerProviderTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IVotingPowerProviderTransactorRaw struct {
	Contract *IVotingPowerProviderTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIVotingPowerProvider creates a new instance of IVotingPowerProvider, bound to a specific deployed contract.
func NewIVotingPowerProvider(address common.Address, backend bind.ContractBackend) (*IVotingPowerProvider, error) {
	contract, err := bindIVotingPowerProvider(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProvider{IVotingPowerProviderCaller: IVotingPowerProviderCaller{contract: contract}, IVotingPowerProviderTransactor: IVotingPowerProviderTransactor{contract: contract}, IVotingPowerProviderFilterer: IVotingPowerProviderFilterer{contract: contract}}, nil
}

// NewIVotingPowerProviderCaller creates a new read-only instance of IVotingPowerProvider, bound to a specific deployed contract.
func NewIVotingPowerProviderCaller(address common.Address, caller bind.ContractCaller) (*IVotingPowerProviderCaller, error) {
	contract, err := bindIVotingPowerProvider(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderCaller{contract: contract}, nil
}

// NewIVotingPowerProviderTransactor creates a new write-only instance of IVotingPowerProvider, bound to a specific deployed contract.
func NewIVotingPowerProviderTransactor(address common.Address, transactor bind.ContractTransactor) (*IVotingPowerProviderTransactor, error) {
	contract, err := bindIVotingPowerProvider(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderTransactor{contract: contract}, nil
}

// NewIVotingPowerProviderFilterer creates a new log filterer instance of IVotingPowerProvider, bound to a specific deployed contract.
func NewIVotingPowerProviderFilterer(address common.Address, filterer bind.ContractFilterer) (*IVotingPowerProviderFilterer, error) {
	contract, err := bindIVotingPowerProvider(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderFilterer{contract: contract}, nil
}

// bindIVotingPowerProvider binds a generic wrapper to an already deployed contract.
func bindIVotingPowerProvider(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IVotingPowerProviderMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IVotingPowerProvider *IVotingPowerProviderRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IVotingPowerProvider.Contract.IVotingPowerProviderCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IVotingPowerProvider *IVotingPowerProviderRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.IVotingPowerProviderTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IVotingPowerProvider *IVotingPowerProviderRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.IVotingPowerProviderTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IVotingPowerProvider *IVotingPowerProviderCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IVotingPowerProvider.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IVotingPowerProvider *IVotingPowerProviderTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IVotingPowerProvider *IVotingPowerProviderTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.contract.Transact(opts, method, params...)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) OPERATORREGISTRY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "OPERATOR_REGISTRY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IVotingPowerProvider *IVotingPowerProviderSession) OPERATORREGISTRY() (common.Address, error) {
	return _IVotingPowerProvider.Contract.OPERATORREGISTRY(&_IVotingPowerProvider.CallOpts)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) OPERATORREGISTRY() (common.Address, error) {
	return _IVotingPowerProvider.Contract.OPERATORREGISTRY(&_IVotingPowerProvider.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) VAULTFACTORY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "VAULT_FACTORY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IVotingPowerProvider *IVotingPowerProviderSession) VAULTFACTORY() (common.Address, error) {
	return _IVotingPowerProvider.Contract.VAULTFACTORY(&_IVotingPowerProvider.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) VAULTFACTORY() (common.Address, error) {
	return _IVotingPowerProvider.Contract.VAULTFACTORY(&_IVotingPowerProvider.CallOpts)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperatorStakes(opts *bind.CallOpts, operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperatorStakes", operator)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorStakes(&_IVotingPowerProvider.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorStakes(&_IVotingPowerProvider.CallOpts, operator)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperatorStakesAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperatorStakesAt", operator, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorStakesAt(&_IVotingPowerProvider.CallOpts, operator, timestamp)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorStakesAt(&_IVotingPowerProvider.CallOpts, operator, timestamp)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperatorVaults(opts *bind.CallOpts, operator common.Address) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperatorVaults", operator)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVaults(&_IVotingPowerProvider.CallOpts, operator)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVaults(&_IVotingPowerProvider.CallOpts, operator)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperatorVaultsAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperatorVaultsAt", operator, timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVaultsAt(&_IVotingPowerProvider.CallOpts, operator, timestamp)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVaultsAt(&_IVotingPowerProvider.CallOpts, operator, timestamp)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperatorVotingPowers(opts *bind.CallOpts, operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperatorVotingPowers", operator, extraData)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVotingPowers(&_IVotingPowerProvider.CallOpts, operator, extraData)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVotingPowers(&_IVotingPowerProvider.CallOpts, operator, extraData)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperatorVotingPowersAt(opts *bind.CallOpts, operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperatorVotingPowersAt", operator, extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVotingPowersAt(&_IVotingPowerProvider.CallOpts, operator, extraData, timestamp)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IVotingPowerProvider.Contract.GetOperatorVotingPowersAt(&_IVotingPowerProvider.CallOpts, operator, extraData, timestamp)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperators() ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperators(&_IVotingPowerProvider.CallOpts)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperators() ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperators(&_IVotingPowerProvider.CallOpts)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperatorsAt(&_IVotingPowerProvider.CallOpts, timestamp)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetOperatorsAt(&_IVotingPowerProvider.CallOpts, timestamp)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetSharedVaults(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getSharedVaults")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetSharedVaults() ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetSharedVaults(&_IVotingPowerProvider.CallOpts)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetSharedVaults() ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetSharedVaults(&_IVotingPowerProvider.CallOpts)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetSharedVaultsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getSharedVaultsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetSharedVaultsAt(&_IVotingPowerProvider.CallOpts, timestamp)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetSharedVaultsAt(&_IVotingPowerProvider.CallOpts, timestamp)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetSlashingData(opts *bind.CallOpts) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getSlashingData")

	outstruct := new(struct {
		RequireSlasher        bool
		MinVaultEpochDuration *big.Int
	})
	if err != nil {
		return *outstruct, err
	}

	outstruct.RequireSlasher = *abi.ConvertType(out[0], new(bool)).(*bool)
	outstruct.MinVaultEpochDuration = *abi.ConvertType(out[1], new(*big.Int)).(**big.Int)

	return *outstruct, err

}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IVotingPowerProvider.Contract.GetSlashingData(&_IVotingPowerProvider.CallOpts)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IVotingPowerProvider.Contract.GetSlashingData(&_IVotingPowerProvider.CallOpts)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetSlashingDataAt(opts *bind.CallOpts, timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getSlashingDataAt", timestamp, hint)

	outstruct := new(struct {
		RequireSlasher        bool
		MinVaultEpochDuration *big.Int
	})
	if err != nil {
		return *outstruct, err
	}

	outstruct.RequireSlasher = *abi.ConvertType(out[0], new(bool)).(*bool)
	outstruct.MinVaultEpochDuration = *abi.ConvertType(out[1], new(*big.Int)).(**big.Int)

	return *outstruct, err

}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IVotingPowerProvider.Contract.GetSlashingDataAt(&_IVotingPowerProvider.CallOpts, timestamp, hint)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IVotingPowerProvider.Contract.GetSlashingDataAt(&_IVotingPowerProvider.CallOpts, timestamp, hint)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetTokens(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getTokens")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetTokens() ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetTokens(&_IVotingPowerProvider.CallOpts)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetTokens() ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetTokens(&_IVotingPowerProvider.CallOpts)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetTokensAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getTokensAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetTokensAt(&_IVotingPowerProvider.CallOpts, timestamp)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IVotingPowerProvider.Contract.GetTokensAt(&_IVotingPowerProvider.CallOpts, timestamp)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetVotingPowers(opts *bind.CallOpts, extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getVotingPowers", extraData)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IVotingPowerProvider.Contract.GetVotingPowers(&_IVotingPowerProvider.CallOpts, extraData)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IVotingPowerProvider.Contract.GetVotingPowers(&_IVotingPowerProvider.CallOpts, extraData)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IVotingPowerProvider *IVotingPowerProviderCaller) GetVotingPowersAt(opts *bind.CallOpts, extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "getVotingPowersAt", extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IVotingPowerProvider *IVotingPowerProviderSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IVotingPowerProvider.Contract.GetVotingPowersAt(&_IVotingPowerProvider.CallOpts, extraData, timestamp)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IVotingPowerProvider.Contract.GetVotingPowersAt(&_IVotingPowerProvider.CallOpts, extraData, timestamp)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsOperatorRegistered(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isOperatorRegistered", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorRegistered(&_IVotingPowerProvider.CallOpts, operator)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorRegistered(&_IVotingPowerProvider.CallOpts, operator)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsOperatorRegisteredAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isOperatorRegisteredAt", operator, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorRegisteredAt(&_IVotingPowerProvider.CallOpts, operator, timestamp)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorRegisteredAt(&_IVotingPowerProvider.CallOpts, operator, timestamp)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsOperatorVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isOperatorVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegistered(&_IVotingPowerProvider.CallOpts, vault)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegistered(&_IVotingPowerProvider.CallOpts, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsOperatorVaultRegistered0(opts *bind.CallOpts, operator common.Address, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isOperatorVaultRegistered0", operator, vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegistered0(&_IVotingPowerProvider.CallOpts, operator, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegistered0(&_IVotingPowerProvider.CallOpts, operator, vault)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsOperatorVaultRegisteredAt(opts *bind.CallOpts, operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isOperatorVaultRegisteredAt", operator, vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegisteredAt(&_IVotingPowerProvider.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegisteredAt(&_IVotingPowerProvider.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsOperatorVaultRegisteredAt0(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isOperatorVaultRegisteredAt0", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegisteredAt0(&_IVotingPowerProvider.CallOpts, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsOperatorVaultRegisteredAt0(&_IVotingPowerProvider.CallOpts, vault, timestamp)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsSharedVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isSharedVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsSharedVaultRegistered(&_IVotingPowerProvider.CallOpts, vault)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsSharedVaultRegistered(&_IVotingPowerProvider.CallOpts, vault)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsSharedVaultRegisteredAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isSharedVaultRegisteredAt", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsSharedVaultRegisteredAt(&_IVotingPowerProvider.CallOpts, vault, timestamp)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsSharedVaultRegisteredAt(&_IVotingPowerProvider.CallOpts, vault, timestamp)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsTokenRegistered(opts *bind.CallOpts, token common.Address) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isTokenRegistered", token)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsTokenRegistered(&_IVotingPowerProvider.CallOpts, token)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IVotingPowerProvider.Contract.IsTokenRegistered(&_IVotingPowerProvider.CallOpts, token)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCaller) IsTokenRegisteredAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IVotingPowerProvider.contract.Call(opts, &out, "isTokenRegisteredAt", token, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsTokenRegisteredAt(&_IVotingPowerProvider.CallOpts, token, timestamp)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IVotingPowerProvider *IVotingPowerProviderCallerSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IVotingPowerProvider.Contract.IsTokenRegisteredAt(&_IVotingPowerProvider.CallOpts, token, timestamp)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactor) InvalidateOldSignatures(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVotingPowerProvider.contract.Transact(opts, "invalidateOldSignatures")
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IVotingPowerProvider *IVotingPowerProviderSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.InvalidateOldSignatures(&_IVotingPowerProvider.TransactOpts)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactorSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.InvalidateOldSignatures(&_IVotingPowerProvider.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactor) RegisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVotingPowerProvider.contract.Transact(opts, "registerOperator")
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IVotingPowerProvider *IVotingPowerProviderSession) RegisterOperator() (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.RegisterOperator(&_IVotingPowerProvider.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactorSession) RegisterOperator() (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.RegisterOperator(&_IVotingPowerProvider.TransactOpts)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactor) RegisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IVotingPowerProvider.contract.Transact(opts, "registerOperatorWithSignature", operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IVotingPowerProvider *IVotingPowerProviderSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.RegisterOperatorWithSignature(&_IVotingPowerProvider.TransactOpts, operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactorSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.RegisterOperatorWithSignature(&_IVotingPowerProvider.TransactOpts, operator, signature)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactor) UnregisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IVotingPowerProvider.contract.Transact(opts, "unregisterOperator")
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IVotingPowerProvider *IVotingPowerProviderSession) UnregisterOperator() (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.UnregisterOperator(&_IVotingPowerProvider.TransactOpts)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactorSession) UnregisterOperator() (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.UnregisterOperator(&_IVotingPowerProvider.TransactOpts)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactor) UnregisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IVotingPowerProvider.contract.Transact(opts, "unregisterOperatorWithSignature", operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IVotingPowerProvider *IVotingPowerProviderSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.UnregisterOperatorWithSignature(&_IVotingPowerProvider.TransactOpts, operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IVotingPowerProvider *IVotingPowerProviderTransactorSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IVotingPowerProvider.Contract.UnregisterOperatorWithSignature(&_IVotingPowerProvider.TransactOpts, operator, signature)
}

// IVotingPowerProviderRegisterOperatorIterator is returned from FilterRegisterOperator and is used to iterate over the raw logs and unpacked data for RegisterOperator events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterOperatorIterator struct {
	Event *IVotingPowerProviderRegisterOperator // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderRegisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderRegisterOperator)
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
		it.Event = new(IVotingPowerProviderRegisterOperator)
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
func (it *IVotingPowerProviderRegisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderRegisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderRegisterOperator represents a RegisterOperator event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperator is a free log retrieval operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterRegisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IVotingPowerProviderRegisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderRegisterOperatorIterator{contract: _IVotingPowerProvider.contract, event: "RegisterOperator", logs: logs, sub: sub}, nil
}

// WatchRegisterOperator is a free log subscription operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchRegisterOperator(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderRegisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderRegisterOperator)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
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

// ParseRegisterOperator is a log parse operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseRegisterOperator(log types.Log) (*IVotingPowerProviderRegisterOperator, error) {
	event := new(IVotingPowerProviderRegisterOperator)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderRegisterOperatorVaultIterator is returned from FilterRegisterOperatorVault and is used to iterate over the raw logs and unpacked data for RegisterOperatorVault events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterOperatorVaultIterator struct {
	Event *IVotingPowerProviderRegisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderRegisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderRegisterOperatorVault)
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
		it.Event = new(IVotingPowerProviderRegisterOperatorVault)
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
func (it *IVotingPowerProviderRegisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderRegisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderRegisterOperatorVault represents a RegisterOperatorVault event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperatorVault is a free log retrieval operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterRegisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IVotingPowerProviderRegisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderRegisterOperatorVaultIterator{contract: _IVotingPowerProvider.contract, event: "RegisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchRegisterOperatorVault is a free log subscription operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchRegisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderRegisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderRegisterOperatorVault)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
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

// ParseRegisterOperatorVault is a log parse operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseRegisterOperatorVault(log types.Log) (*IVotingPowerProviderRegisterOperatorVault, error) {
	event := new(IVotingPowerProviderRegisterOperatorVault)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderRegisterSharedVaultIterator is returned from FilterRegisterSharedVault and is used to iterate over the raw logs and unpacked data for RegisterSharedVault events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterSharedVaultIterator struct {
	Event *IVotingPowerProviderRegisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderRegisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderRegisterSharedVault)
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
		it.Event = new(IVotingPowerProviderRegisterSharedVault)
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
func (it *IVotingPowerProviderRegisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderRegisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderRegisterSharedVault represents a RegisterSharedVault event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterSharedVault is a free log retrieval operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterRegisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IVotingPowerProviderRegisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderRegisterSharedVaultIterator{contract: _IVotingPowerProvider.contract, event: "RegisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchRegisterSharedVault is a free log subscription operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchRegisterSharedVault(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderRegisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderRegisterSharedVault)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
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

// ParseRegisterSharedVault is a log parse operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseRegisterSharedVault(log types.Log) (*IVotingPowerProviderRegisterSharedVault, error) {
	event := new(IVotingPowerProviderRegisterSharedVault)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderRegisterTokenIterator is returned from FilterRegisterToken and is used to iterate over the raw logs and unpacked data for RegisterToken events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterTokenIterator struct {
	Event *IVotingPowerProviderRegisterToken // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderRegisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderRegisterToken)
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
		it.Event = new(IVotingPowerProviderRegisterToken)
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
func (it *IVotingPowerProviderRegisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderRegisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderRegisterToken represents a RegisterToken event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderRegisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterToken is a free log retrieval operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterRegisterToken(opts *bind.FilterOpts, token []common.Address) (*IVotingPowerProviderRegisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderRegisterTokenIterator{contract: _IVotingPowerProvider.contract, event: "RegisterToken", logs: logs, sub: sub}, nil
}

// WatchRegisterToken is a free log subscription operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchRegisterToken(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderRegisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderRegisterToken)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterToken", log); err != nil {
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

// ParseRegisterToken is a log parse operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseRegisterToken(log types.Log) (*IVotingPowerProviderRegisterToken, error) {
	event := new(IVotingPowerProviderRegisterToken)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "RegisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderSetSlashingDataIterator is returned from FilterSetSlashingData and is used to iterate over the raw logs and unpacked data for SetSlashingData events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderSetSlashingDataIterator struct {
	Event *IVotingPowerProviderSetSlashingData // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderSetSlashingDataIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderSetSlashingData)
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
		it.Event = new(IVotingPowerProviderSetSlashingData)
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
func (it *IVotingPowerProviderSetSlashingDataIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderSetSlashingDataIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderSetSlashingData represents a SetSlashingData event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderSetSlashingData struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetSlashingData is a free log retrieval operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterSetSlashingData(opts *bind.FilterOpts) (*IVotingPowerProviderSetSlashingDataIterator, error) {

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderSetSlashingDataIterator{contract: _IVotingPowerProvider.contract, event: "SetSlashingData", logs: logs, sub: sub}, nil
}

// WatchSetSlashingData is a free log subscription operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchSetSlashingData(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderSetSlashingData) (event.Subscription, error) {

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderSetSlashingData)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
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

// ParseSetSlashingData is a log parse operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseSetSlashingData(log types.Log) (*IVotingPowerProviderSetSlashingData, error) {
	event := new(IVotingPowerProviderSetSlashingData)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderUnregisterOperatorIterator is returned from FilterUnregisterOperator and is used to iterate over the raw logs and unpacked data for UnregisterOperator events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterOperatorIterator struct {
	Event *IVotingPowerProviderUnregisterOperator // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderUnregisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderUnregisterOperator)
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
		it.Event = new(IVotingPowerProviderUnregisterOperator)
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
func (it *IVotingPowerProviderUnregisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderUnregisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderUnregisterOperator represents a UnregisterOperator event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperator is a free log retrieval operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterUnregisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IVotingPowerProviderUnregisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderUnregisterOperatorIterator{contract: _IVotingPowerProvider.contract, event: "UnregisterOperator", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperator is a free log subscription operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchUnregisterOperator(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderUnregisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderUnregisterOperator)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
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

// ParseUnregisterOperator is a log parse operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseUnregisterOperator(log types.Log) (*IVotingPowerProviderUnregisterOperator, error) {
	event := new(IVotingPowerProviderUnregisterOperator)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderUnregisterOperatorVaultIterator is returned from FilterUnregisterOperatorVault and is used to iterate over the raw logs and unpacked data for UnregisterOperatorVault events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterOperatorVaultIterator struct {
	Event *IVotingPowerProviderUnregisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderUnregisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderUnregisterOperatorVault)
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
		it.Event = new(IVotingPowerProviderUnregisterOperatorVault)
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
func (it *IVotingPowerProviderUnregisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderUnregisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderUnregisterOperatorVault represents a UnregisterOperatorVault event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperatorVault is a free log retrieval operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterUnregisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IVotingPowerProviderUnregisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderUnregisterOperatorVaultIterator{contract: _IVotingPowerProvider.contract, event: "UnregisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperatorVault is a free log subscription operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchUnregisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderUnregisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderUnregisterOperatorVault)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
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

// ParseUnregisterOperatorVault is a log parse operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseUnregisterOperatorVault(log types.Log) (*IVotingPowerProviderUnregisterOperatorVault, error) {
	event := new(IVotingPowerProviderUnregisterOperatorVault)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderUnregisterSharedVaultIterator is returned from FilterUnregisterSharedVault and is used to iterate over the raw logs and unpacked data for UnregisterSharedVault events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterSharedVaultIterator struct {
	Event *IVotingPowerProviderUnregisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderUnregisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderUnregisterSharedVault)
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
		it.Event = new(IVotingPowerProviderUnregisterSharedVault)
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
func (it *IVotingPowerProviderUnregisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderUnregisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderUnregisterSharedVault represents a UnregisterSharedVault event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterSharedVault is a free log retrieval operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterUnregisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IVotingPowerProviderUnregisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderUnregisterSharedVaultIterator{contract: _IVotingPowerProvider.contract, event: "UnregisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterSharedVault is a free log subscription operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchUnregisterSharedVault(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderUnregisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderUnregisterSharedVault)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
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

// ParseUnregisterSharedVault is a log parse operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseUnregisterSharedVault(log types.Log) (*IVotingPowerProviderUnregisterSharedVault, error) {
	event := new(IVotingPowerProviderUnregisterSharedVault)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IVotingPowerProviderUnregisterTokenIterator is returned from FilterUnregisterToken and is used to iterate over the raw logs and unpacked data for UnregisterToken events raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterTokenIterator struct {
	Event *IVotingPowerProviderUnregisterToken // Event containing the contract specifics and raw log

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
func (it *IVotingPowerProviderUnregisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IVotingPowerProviderUnregisterToken)
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
		it.Event = new(IVotingPowerProviderUnregisterToken)
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
func (it *IVotingPowerProviderUnregisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IVotingPowerProviderUnregisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IVotingPowerProviderUnregisterToken represents a UnregisterToken event raised by the IVotingPowerProvider contract.
type IVotingPowerProviderUnregisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterToken is a free log retrieval operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) FilterUnregisterToken(opts *bind.FilterOpts, token []common.Address) (*IVotingPowerProviderUnregisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.FilterLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IVotingPowerProviderUnregisterTokenIterator{contract: _IVotingPowerProvider.contract, event: "UnregisterToken", logs: logs, sub: sub}, nil
}

// WatchUnregisterToken is a free log subscription operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) WatchUnregisterToken(opts *bind.WatchOpts, sink chan<- *IVotingPowerProviderUnregisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IVotingPowerProvider.contract.WatchLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IVotingPowerProviderUnregisterToken)
				if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
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

// ParseUnregisterToken is a log parse operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IVotingPowerProvider *IVotingPowerProviderFilterer) ParseUnregisterToken(log types.Log) (*IVotingPowerProviderUnregisterToken, error) {
	event := new(IVotingPowerProviderUnregisterToken)
	if err := _IVotingPowerProvider.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

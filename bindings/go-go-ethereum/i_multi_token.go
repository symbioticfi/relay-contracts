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

// IMultiTokenMetaData contains all meta data concerning the IMultiToken contract.
var IMultiTokenMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"OPERATOR_REGISTRY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_FACTORY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakes\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakesAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaults\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaultsAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowers\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowersAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaults\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaultsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingData\",\"inputs\":[],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingDataAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokens\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokensAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowers\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowersAt\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"invalidateOldSignatures\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"isOperatorRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegistered\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegisteredAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"registerOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"registerOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"registerToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"RegisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlashingData\",\"inputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperator\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperatorVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSharedVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidToken\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorAlreadyRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenNotRegistered\",\"inputs\":[]}]",
}

// IMultiTokenABI is the input ABI used to generate the binding from.
// Deprecated: Use IMultiTokenMetaData.ABI instead.
var IMultiTokenABI = IMultiTokenMetaData.ABI

// IMultiToken is an auto generated Go binding around an Ethereum contract.
type IMultiToken struct {
	IMultiTokenCaller     // Read-only binding to the contract
	IMultiTokenTransactor // Write-only binding to the contract
	IMultiTokenFilterer   // Log filterer for contract events
}

// IMultiTokenCaller is an auto generated read-only Go binding around an Ethereum contract.
type IMultiTokenCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IMultiTokenTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IMultiTokenTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IMultiTokenFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IMultiTokenFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IMultiTokenSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IMultiTokenSession struct {
	Contract     *IMultiToken      // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IMultiTokenCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IMultiTokenCallerSession struct {
	Contract *IMultiTokenCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts      // Call options to use throughout this session
}

// IMultiTokenTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IMultiTokenTransactorSession struct {
	Contract     *IMultiTokenTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// IMultiTokenRaw is an auto generated low-level Go binding around an Ethereum contract.
type IMultiTokenRaw struct {
	Contract *IMultiToken // Generic contract binding to access the raw methods on
}

// IMultiTokenCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IMultiTokenCallerRaw struct {
	Contract *IMultiTokenCaller // Generic read-only contract binding to access the raw methods on
}

// IMultiTokenTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IMultiTokenTransactorRaw struct {
	Contract *IMultiTokenTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIMultiToken creates a new instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiToken(address common.Address, backend bind.ContractBackend) (*IMultiToken, error) {
	contract, err := bindIMultiToken(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IMultiToken{IMultiTokenCaller: IMultiTokenCaller{contract: contract}, IMultiTokenTransactor: IMultiTokenTransactor{contract: contract}, IMultiTokenFilterer: IMultiTokenFilterer{contract: contract}}, nil
}

// NewIMultiTokenCaller creates a new read-only instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiTokenCaller(address common.Address, caller bind.ContractCaller) (*IMultiTokenCaller, error) {
	contract, err := bindIMultiToken(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenCaller{contract: contract}, nil
}

// NewIMultiTokenTransactor creates a new write-only instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiTokenTransactor(address common.Address, transactor bind.ContractTransactor) (*IMultiTokenTransactor, error) {
	contract, err := bindIMultiToken(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenTransactor{contract: contract}, nil
}

// NewIMultiTokenFilterer creates a new log filterer instance of IMultiToken, bound to a specific deployed contract.
func NewIMultiTokenFilterer(address common.Address, filterer bind.ContractFilterer) (*IMultiTokenFilterer, error) {
	contract, err := bindIMultiToken(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenFilterer{contract: contract}, nil
}

// bindIMultiToken binds a generic wrapper to an already deployed contract.
func bindIMultiToken(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IMultiTokenMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IMultiToken *IMultiTokenRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IMultiToken.Contract.IMultiTokenCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IMultiToken *IMultiTokenRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IMultiToken.Contract.IMultiTokenTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IMultiToken *IMultiTokenRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IMultiToken.Contract.IMultiTokenTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IMultiToken *IMultiTokenCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IMultiToken.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IMultiToken *IMultiTokenTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IMultiToken.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IMultiToken *IMultiTokenTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IMultiToken.Contract.contract.Transact(opts, method, params...)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IMultiToken *IMultiTokenCaller) OPERATORREGISTRY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "OPERATOR_REGISTRY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IMultiToken *IMultiTokenSession) OPERATORREGISTRY() (common.Address, error) {
	return _IMultiToken.Contract.OPERATORREGISTRY(&_IMultiToken.CallOpts)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IMultiToken *IMultiTokenCallerSession) OPERATORREGISTRY() (common.Address, error) {
	return _IMultiToken.Contract.OPERATORREGISTRY(&_IMultiToken.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IMultiToken *IMultiTokenCaller) VAULTFACTORY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "VAULT_FACTORY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IMultiToken *IMultiTokenSession) VAULTFACTORY() (common.Address, error) {
	return _IMultiToken.Contract.VAULTFACTORY(&_IMultiToken.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IMultiToken *IMultiTokenCallerSession) VAULTFACTORY() (common.Address, error) {
	return _IMultiToken.Contract.VAULTFACTORY(&_IMultiToken.CallOpts)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCaller) GetOperatorStakes(opts *bind.CallOpts, operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperatorStakes", operator)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorStakes(&_IMultiToken.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorStakes(&_IMultiToken.CallOpts, operator)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCaller) GetOperatorStakesAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperatorStakesAt", operator, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorStakesAt(&_IMultiToken.CallOpts, operator, timestamp)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorStakesAt(&_IMultiToken.CallOpts, operator, timestamp)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetOperatorVaults(opts *bind.CallOpts, operator common.Address) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperatorVaults", operator)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperatorVaults(&_IMultiToken.CallOpts, operator)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperatorVaults(&_IMultiToken.CallOpts, operator)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetOperatorVaultsAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperatorVaultsAt", operator, timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperatorVaultsAt(&_IMultiToken.CallOpts, operator, timestamp)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperatorVaultsAt(&_IMultiToken.CallOpts, operator, timestamp)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCaller) GetOperatorVotingPowers(opts *bind.CallOpts, operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperatorVotingPowers", operator, extraData)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorVotingPowers(&_IMultiToken.CallOpts, operator, extraData)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorVotingPowers(&_IMultiToken.CallOpts, operator, extraData)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCaller) GetOperatorVotingPowersAt(opts *bind.CallOpts, operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperatorVotingPowersAt", operator, extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorVotingPowersAt(&_IMultiToken.CallOpts, operator, extraData, timestamp)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IMultiToken.Contract.GetOperatorVotingPowersAt(&_IMultiToken.CallOpts, operator, extraData, timestamp)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetOperators() ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperators(&_IMultiToken.CallOpts)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperators() ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperators(&_IMultiToken.CallOpts)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperatorsAt(&_IMultiToken.CallOpts, timestamp)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetOperatorsAt(&_IMultiToken.CallOpts, timestamp)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetSharedVaults(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getSharedVaults")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetSharedVaults() ([]common.Address, error) {
	return _IMultiToken.Contract.GetSharedVaults(&_IMultiToken.CallOpts)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetSharedVaults() ([]common.Address, error) {
	return _IMultiToken.Contract.GetSharedVaults(&_IMultiToken.CallOpts)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetSharedVaultsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getSharedVaultsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetSharedVaultsAt(&_IMultiToken.CallOpts, timestamp)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetSharedVaultsAt(&_IMultiToken.CallOpts, timestamp)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IMultiToken *IMultiTokenCaller) GetSlashingData(opts *bind.CallOpts) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getSlashingData")

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
func (_IMultiToken *IMultiTokenSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IMultiToken.Contract.GetSlashingData(&_IMultiToken.CallOpts)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IMultiToken *IMultiTokenCallerSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IMultiToken.Contract.GetSlashingData(&_IMultiToken.CallOpts)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IMultiToken *IMultiTokenCaller) GetSlashingDataAt(opts *bind.CallOpts, timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getSlashingDataAt", timestamp, hint)

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
func (_IMultiToken *IMultiTokenSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IMultiToken.Contract.GetSlashingDataAt(&_IMultiToken.CallOpts, timestamp, hint)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IMultiToken *IMultiTokenCallerSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IMultiToken.Contract.GetSlashingDataAt(&_IMultiToken.CallOpts, timestamp, hint)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetTokens(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getTokens")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetTokens() ([]common.Address, error) {
	return _IMultiToken.Contract.GetTokens(&_IMultiToken.CallOpts)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetTokens() ([]common.Address, error) {
	return _IMultiToken.Contract.GetTokens(&_IMultiToken.CallOpts)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCaller) GetTokensAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getTokensAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetTokensAt(&_IMultiToken.CallOpts, timestamp)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IMultiToken *IMultiTokenCallerSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IMultiToken.Contract.GetTokensAt(&_IMultiToken.CallOpts, timestamp)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IMultiToken *IMultiTokenCaller) GetVotingPowers(opts *bind.CallOpts, extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getVotingPowers", extraData)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IMultiToken *IMultiTokenSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IMultiToken.Contract.GetVotingPowers(&_IMultiToken.CallOpts, extraData)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IMultiToken *IMultiTokenCallerSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IMultiToken.Contract.GetVotingPowers(&_IMultiToken.CallOpts, extraData)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IMultiToken *IMultiTokenCaller) GetVotingPowersAt(opts *bind.CallOpts, extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "getVotingPowersAt", extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IMultiToken *IMultiTokenSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IMultiToken.Contract.GetVotingPowersAt(&_IMultiToken.CallOpts, extraData, timestamp)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IMultiToken *IMultiTokenCallerSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IMultiToken.Contract.GetVotingPowersAt(&_IMultiToken.CallOpts, extraData, timestamp)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsOperatorRegistered(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isOperatorRegistered", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IMultiToken.Contract.IsOperatorRegistered(&_IMultiToken.CallOpts, operator)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IMultiToken.Contract.IsOperatorRegistered(&_IMultiToken.CallOpts, operator)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsOperatorRegisteredAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isOperatorRegisteredAt", operator, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsOperatorRegisteredAt(&_IMultiToken.CallOpts, operator, timestamp)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsOperatorRegisteredAt(&_IMultiToken.CallOpts, operator, timestamp)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsOperatorVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isOperatorVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegistered(&_IMultiToken.CallOpts, vault)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegistered(&_IMultiToken.CallOpts, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsOperatorVaultRegistered0(opts *bind.CallOpts, operator common.Address, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isOperatorVaultRegistered0", operator, vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegistered0(&_IMultiToken.CallOpts, operator, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegistered0(&_IMultiToken.CallOpts, operator, vault)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsOperatorVaultRegisteredAt(opts *bind.CallOpts, operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isOperatorVaultRegisteredAt", operator, vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegisteredAt(&_IMultiToken.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegisteredAt(&_IMultiToken.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsOperatorVaultRegisteredAt0(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isOperatorVaultRegisteredAt0", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegisteredAt0(&_IMultiToken.CallOpts, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsOperatorVaultRegisteredAt0(&_IMultiToken.CallOpts, vault, timestamp)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsSharedVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isSharedVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IMultiToken.Contract.IsSharedVaultRegistered(&_IMultiToken.CallOpts, vault)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IMultiToken.Contract.IsSharedVaultRegistered(&_IMultiToken.CallOpts, vault)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsSharedVaultRegisteredAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isSharedVaultRegisteredAt", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsSharedVaultRegisteredAt(&_IMultiToken.CallOpts, vault, timestamp)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsSharedVaultRegisteredAt(&_IMultiToken.CallOpts, vault, timestamp)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsTokenRegistered(opts *bind.CallOpts, token common.Address) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isTokenRegistered", token)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IMultiToken.Contract.IsTokenRegistered(&_IMultiToken.CallOpts, token)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IMultiToken.Contract.IsTokenRegistered(&_IMultiToken.CallOpts, token)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCaller) IsTokenRegisteredAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IMultiToken.contract.Call(opts, &out, "isTokenRegisteredAt", token, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsTokenRegisteredAt(&_IMultiToken.CallOpts, token, timestamp)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IMultiToken *IMultiTokenCallerSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IMultiToken.Contract.IsTokenRegisteredAt(&_IMultiToken.CallOpts, token, timestamp)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IMultiToken *IMultiTokenTransactor) InvalidateOldSignatures(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "invalidateOldSignatures")
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IMultiToken *IMultiTokenSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IMultiToken.Contract.InvalidateOldSignatures(&_IMultiToken.TransactOpts)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IMultiToken *IMultiTokenTransactorSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IMultiToken.Contract.InvalidateOldSignatures(&_IMultiToken.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IMultiToken *IMultiTokenTransactor) RegisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "registerOperator")
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IMultiToken *IMultiTokenSession) RegisterOperator() (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterOperator(&_IMultiToken.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IMultiToken *IMultiTokenTransactorSession) RegisterOperator() (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterOperator(&_IMultiToken.TransactOpts)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IMultiToken *IMultiTokenTransactor) RegisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "registerOperatorWithSignature", operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IMultiToken *IMultiTokenSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterOperatorWithSignature(&_IMultiToken.TransactOpts, operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IMultiToken *IMultiTokenTransactorSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterOperatorWithSignature(&_IMultiToken.TransactOpts, operator, signature)
}

// RegisterToken is a paid mutator transaction binding the contract method 0x09824a80.
//
// Solidity: function registerToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactor) RegisterToken(opts *bind.TransactOpts, token common.Address) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "registerToken", token)
}

// RegisterToken is a paid mutator transaction binding the contract method 0x09824a80.
//
// Solidity: function registerToken(address token) returns()
func (_IMultiToken *IMultiTokenSession) RegisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterToken(&_IMultiToken.TransactOpts, token)
}

// RegisterToken is a paid mutator transaction binding the contract method 0x09824a80.
//
// Solidity: function registerToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactorSession) RegisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.RegisterToken(&_IMultiToken.TransactOpts, token)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IMultiToken *IMultiTokenTransactor) UnregisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "unregisterOperator")
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IMultiToken *IMultiTokenSession) UnregisterOperator() (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterOperator(&_IMultiToken.TransactOpts)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IMultiToken *IMultiTokenTransactorSession) UnregisterOperator() (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterOperator(&_IMultiToken.TransactOpts)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IMultiToken *IMultiTokenTransactor) UnregisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "unregisterOperatorWithSignature", operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IMultiToken *IMultiTokenSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterOperatorWithSignature(&_IMultiToken.TransactOpts, operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IMultiToken *IMultiTokenTransactorSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterOperatorWithSignature(&_IMultiToken.TransactOpts, operator, signature)
}

// UnregisterToken is a paid mutator transaction binding the contract method 0x77860cdd.
//
// Solidity: function unregisterToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactor) UnregisterToken(opts *bind.TransactOpts, token common.Address) (*types.Transaction, error) {
	return _IMultiToken.contract.Transact(opts, "unregisterToken", token)
}

// UnregisterToken is a paid mutator transaction binding the contract method 0x77860cdd.
//
// Solidity: function unregisterToken(address token) returns()
func (_IMultiToken *IMultiTokenSession) UnregisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterToken(&_IMultiToken.TransactOpts, token)
}

// UnregisterToken is a paid mutator transaction binding the contract method 0x77860cdd.
//
// Solidity: function unregisterToken(address token) returns()
func (_IMultiToken *IMultiTokenTransactorSession) UnregisterToken(token common.Address) (*types.Transaction, error) {
	return _IMultiToken.Contract.UnregisterToken(&_IMultiToken.TransactOpts, token)
}

// IMultiTokenRegisterOperatorIterator is returned from FilterRegisterOperator and is used to iterate over the raw logs and unpacked data for RegisterOperator events raised by the IMultiToken contract.
type IMultiTokenRegisterOperatorIterator struct {
	Event *IMultiTokenRegisterOperator // Event containing the contract specifics and raw log

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
func (it *IMultiTokenRegisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenRegisterOperator)
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
		it.Event = new(IMultiTokenRegisterOperator)
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
func (it *IMultiTokenRegisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenRegisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenRegisterOperator represents a RegisterOperator event raised by the IMultiToken contract.
type IMultiTokenRegisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperator is a free log retrieval operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IMultiToken *IMultiTokenFilterer) FilterRegisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IMultiTokenRegisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenRegisterOperatorIterator{contract: _IMultiToken.contract, event: "RegisterOperator", logs: logs, sub: sub}, nil
}

// WatchRegisterOperator is a free log subscription operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IMultiToken *IMultiTokenFilterer) WatchRegisterOperator(opts *bind.WatchOpts, sink chan<- *IMultiTokenRegisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenRegisterOperator)
				if err := _IMultiToken.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseRegisterOperator(log types.Log) (*IMultiTokenRegisterOperator, error) {
	event := new(IMultiTokenRegisterOperator)
	if err := _IMultiToken.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenRegisterOperatorVaultIterator is returned from FilterRegisterOperatorVault and is used to iterate over the raw logs and unpacked data for RegisterOperatorVault events raised by the IMultiToken contract.
type IMultiTokenRegisterOperatorVaultIterator struct {
	Event *IMultiTokenRegisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IMultiTokenRegisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenRegisterOperatorVault)
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
		it.Event = new(IMultiTokenRegisterOperatorVault)
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
func (it *IMultiTokenRegisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenRegisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenRegisterOperatorVault represents a RegisterOperatorVault event raised by the IMultiToken contract.
type IMultiTokenRegisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperatorVault is a free log retrieval operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) FilterRegisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IMultiTokenRegisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenRegisterOperatorVaultIterator{contract: _IMultiToken.contract, event: "RegisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchRegisterOperatorVault is a free log subscription operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) WatchRegisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IMultiTokenRegisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenRegisterOperatorVault)
				if err := _IMultiToken.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseRegisterOperatorVault(log types.Log) (*IMultiTokenRegisterOperatorVault, error) {
	event := new(IMultiTokenRegisterOperatorVault)
	if err := _IMultiToken.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenRegisterSharedVaultIterator is returned from FilterRegisterSharedVault and is used to iterate over the raw logs and unpacked data for RegisterSharedVault events raised by the IMultiToken contract.
type IMultiTokenRegisterSharedVaultIterator struct {
	Event *IMultiTokenRegisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IMultiTokenRegisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenRegisterSharedVault)
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
		it.Event = new(IMultiTokenRegisterSharedVault)
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
func (it *IMultiTokenRegisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenRegisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenRegisterSharedVault represents a RegisterSharedVault event raised by the IMultiToken contract.
type IMultiTokenRegisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterSharedVault is a free log retrieval operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) FilterRegisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IMultiTokenRegisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenRegisterSharedVaultIterator{contract: _IMultiToken.contract, event: "RegisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchRegisterSharedVault is a free log subscription operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) WatchRegisterSharedVault(opts *bind.WatchOpts, sink chan<- *IMultiTokenRegisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenRegisterSharedVault)
				if err := _IMultiToken.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseRegisterSharedVault(log types.Log) (*IMultiTokenRegisterSharedVault, error) {
	event := new(IMultiTokenRegisterSharedVault)
	if err := _IMultiToken.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenRegisterTokenIterator is returned from FilterRegisterToken and is used to iterate over the raw logs and unpacked data for RegisterToken events raised by the IMultiToken contract.
type IMultiTokenRegisterTokenIterator struct {
	Event *IMultiTokenRegisterToken // Event containing the contract specifics and raw log

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
func (it *IMultiTokenRegisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenRegisterToken)
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
		it.Event = new(IMultiTokenRegisterToken)
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
func (it *IMultiTokenRegisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenRegisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenRegisterToken represents a RegisterToken event raised by the IMultiToken contract.
type IMultiTokenRegisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterToken is a free log retrieval operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IMultiToken *IMultiTokenFilterer) FilterRegisterToken(opts *bind.FilterOpts, token []common.Address) (*IMultiTokenRegisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenRegisterTokenIterator{contract: _IMultiToken.contract, event: "RegisterToken", logs: logs, sub: sub}, nil
}

// WatchRegisterToken is a free log subscription operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IMultiToken *IMultiTokenFilterer) WatchRegisterToken(opts *bind.WatchOpts, sink chan<- *IMultiTokenRegisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenRegisterToken)
				if err := _IMultiToken.contract.UnpackLog(event, "RegisterToken", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseRegisterToken(log types.Log) (*IMultiTokenRegisterToken, error) {
	event := new(IMultiTokenRegisterToken)
	if err := _IMultiToken.contract.UnpackLog(event, "RegisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenSetSlashingDataIterator is returned from FilterSetSlashingData and is used to iterate over the raw logs and unpacked data for SetSlashingData events raised by the IMultiToken contract.
type IMultiTokenSetSlashingDataIterator struct {
	Event *IMultiTokenSetSlashingData // Event containing the contract specifics and raw log

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
func (it *IMultiTokenSetSlashingDataIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenSetSlashingData)
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
		it.Event = new(IMultiTokenSetSlashingData)
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
func (it *IMultiTokenSetSlashingDataIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenSetSlashingDataIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenSetSlashingData represents a SetSlashingData event raised by the IMultiToken contract.
type IMultiTokenSetSlashingData struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetSlashingData is a free log retrieval operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IMultiToken *IMultiTokenFilterer) FilterSetSlashingData(opts *bind.FilterOpts) (*IMultiTokenSetSlashingDataIterator, error) {

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return &IMultiTokenSetSlashingDataIterator{contract: _IMultiToken.contract, event: "SetSlashingData", logs: logs, sub: sub}, nil
}

// WatchSetSlashingData is a free log subscription operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IMultiToken *IMultiTokenFilterer) WatchSetSlashingData(opts *bind.WatchOpts, sink chan<- *IMultiTokenSetSlashingData) (event.Subscription, error) {

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenSetSlashingData)
				if err := _IMultiToken.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseSetSlashingData(log types.Log) (*IMultiTokenSetSlashingData, error) {
	event := new(IMultiTokenSetSlashingData)
	if err := _IMultiToken.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenUnregisterOperatorIterator is returned from FilterUnregisterOperator and is used to iterate over the raw logs and unpacked data for UnregisterOperator events raised by the IMultiToken contract.
type IMultiTokenUnregisterOperatorIterator struct {
	Event *IMultiTokenUnregisterOperator // Event containing the contract specifics and raw log

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
func (it *IMultiTokenUnregisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenUnregisterOperator)
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
		it.Event = new(IMultiTokenUnregisterOperator)
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
func (it *IMultiTokenUnregisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenUnregisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenUnregisterOperator represents a UnregisterOperator event raised by the IMultiToken contract.
type IMultiTokenUnregisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperator is a free log retrieval operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IMultiToken *IMultiTokenFilterer) FilterUnregisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IMultiTokenUnregisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenUnregisterOperatorIterator{contract: _IMultiToken.contract, event: "UnregisterOperator", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperator is a free log subscription operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IMultiToken *IMultiTokenFilterer) WatchUnregisterOperator(opts *bind.WatchOpts, sink chan<- *IMultiTokenUnregisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenUnregisterOperator)
				if err := _IMultiToken.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseUnregisterOperator(log types.Log) (*IMultiTokenUnregisterOperator, error) {
	event := new(IMultiTokenUnregisterOperator)
	if err := _IMultiToken.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenUnregisterOperatorVaultIterator is returned from FilterUnregisterOperatorVault and is used to iterate over the raw logs and unpacked data for UnregisterOperatorVault events raised by the IMultiToken contract.
type IMultiTokenUnregisterOperatorVaultIterator struct {
	Event *IMultiTokenUnregisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IMultiTokenUnregisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenUnregisterOperatorVault)
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
		it.Event = new(IMultiTokenUnregisterOperatorVault)
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
func (it *IMultiTokenUnregisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenUnregisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenUnregisterOperatorVault represents a UnregisterOperatorVault event raised by the IMultiToken contract.
type IMultiTokenUnregisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperatorVault is a free log retrieval operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) FilterUnregisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IMultiTokenUnregisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenUnregisterOperatorVaultIterator{contract: _IMultiToken.contract, event: "UnregisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperatorVault is a free log subscription operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) WatchUnregisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IMultiTokenUnregisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenUnregisterOperatorVault)
				if err := _IMultiToken.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseUnregisterOperatorVault(log types.Log) (*IMultiTokenUnregisterOperatorVault, error) {
	event := new(IMultiTokenUnregisterOperatorVault)
	if err := _IMultiToken.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenUnregisterSharedVaultIterator is returned from FilterUnregisterSharedVault and is used to iterate over the raw logs and unpacked data for UnregisterSharedVault events raised by the IMultiToken contract.
type IMultiTokenUnregisterSharedVaultIterator struct {
	Event *IMultiTokenUnregisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IMultiTokenUnregisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenUnregisterSharedVault)
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
		it.Event = new(IMultiTokenUnregisterSharedVault)
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
func (it *IMultiTokenUnregisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenUnregisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenUnregisterSharedVault represents a UnregisterSharedVault event raised by the IMultiToken contract.
type IMultiTokenUnregisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterSharedVault is a free log retrieval operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) FilterUnregisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IMultiTokenUnregisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenUnregisterSharedVaultIterator{contract: _IMultiToken.contract, event: "UnregisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterSharedVault is a free log subscription operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IMultiToken *IMultiTokenFilterer) WatchUnregisterSharedVault(opts *bind.WatchOpts, sink chan<- *IMultiTokenUnregisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenUnregisterSharedVault)
				if err := _IMultiToken.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseUnregisterSharedVault(log types.Log) (*IMultiTokenUnregisterSharedVault, error) {
	event := new(IMultiTokenUnregisterSharedVault)
	if err := _IMultiToken.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IMultiTokenUnregisterTokenIterator is returned from FilterUnregisterToken and is used to iterate over the raw logs and unpacked data for UnregisterToken events raised by the IMultiToken contract.
type IMultiTokenUnregisterTokenIterator struct {
	Event *IMultiTokenUnregisterToken // Event containing the contract specifics and raw log

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
func (it *IMultiTokenUnregisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IMultiTokenUnregisterToken)
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
		it.Event = new(IMultiTokenUnregisterToken)
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
func (it *IMultiTokenUnregisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IMultiTokenUnregisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IMultiTokenUnregisterToken represents a UnregisterToken event raised by the IMultiToken contract.
type IMultiTokenUnregisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterToken is a free log retrieval operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IMultiToken *IMultiTokenFilterer) FilterUnregisterToken(opts *bind.FilterOpts, token []common.Address) (*IMultiTokenUnregisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IMultiToken.contract.FilterLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IMultiTokenUnregisterTokenIterator{contract: _IMultiToken.contract, event: "UnregisterToken", logs: logs, sub: sub}, nil
}

// WatchUnregisterToken is a free log subscription operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IMultiToken *IMultiTokenFilterer) WatchUnregisterToken(opts *bind.WatchOpts, sink chan<- *IMultiTokenUnregisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IMultiToken.contract.WatchLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IMultiTokenUnregisterToken)
				if err := _IMultiToken.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
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
func (_IMultiToken *IMultiTokenFilterer) ParseUnregisterToken(log types.Log) (*IMultiTokenUnregisterToken, error) {
	event := new(IMultiTokenUnregisterToken)
	if err := _IMultiToken.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

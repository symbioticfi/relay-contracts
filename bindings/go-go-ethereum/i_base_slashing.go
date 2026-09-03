// Code generated - DO NOT EDIT.
// This file is a generated binding and any manual changes will be lost.

package relaycontracts

import (
	"context"
	"errors"
	"math/big"
	"strings"
	"time"

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
	_ = time.Tick
	_ = context.Background
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

// IBaseSlashingMetaData contains all meta data concerning the IBaseSlashing contract.
var IBaseSlashingMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"OPERATOR_REGISTRY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"VAULT_FACTORY\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"executeSlashVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"slashIndex\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"hints\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"success\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"slashedAmount\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"getOperatorStakes\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorStakesAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaults\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVaultsAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowers\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorVotingPowersAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"extraData\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getOperatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaults\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSharedVaultsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlasher\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingData\",\"inputs\":[],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSlashingDataAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokens\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTokensAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address[]\",\"internalType\":\"address[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowers\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowersAt\",\"inputs\":[{\"name\":\"extraData\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.OperatorVotingPower[]\",\"components\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vaults\",\"type\":\"tuple[]\",\"internalType\":\"structIVotingPowerProvider.VaultValue[]\",\"components\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\",\"internalType\":\"uint256\"}]}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"invalidateOldSignatures\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"isOperatorRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegistered\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isOperatorVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegistered\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSharedVaultRegisteredAt\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegistered\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isTokenRegisteredAt\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"registerOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"registerOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setSlasher\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"slashVault\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"vault\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"amount\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"hints\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"success\",\"type\":\"bool\",\"internalType\":\"bool\"},{\"name\":\"response\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperator\",\"inputs\":[],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"unregisterOperatorWithSignature\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"signature\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"ExecuteSlash\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"slashIndex\",\"type\":\"uint256\",\"indexed\":true,\"internalType\":\"uint256\"},{\"name\":\"success\",\"type\":\"bool\",\"indexed\":true,\"internalType\":\"bool\"},{\"name\":\"slashedAmount\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InstantSlash\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"success\",\"type\":\"bool\",\"indexed\":true,\"internalType\":\"bool\"},{\"name\":\"slashedAmount\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RegisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlasher\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSlashingData\",\"inputs\":[{\"name\":\"requireSlasher\",\"type\":\"bool\",\"indexed\":false,\"internalType\":\"bool\"},{\"name\":\"minVaultEpochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperator\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterOperatorVault\",\"inputs\":[{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterSharedVault\",\"inputs\":[{\"name\":\"vault\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"UnregisterToken\",\"inputs\":[{\"name\":\"token\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"VetoSlash\",\"inputs\":[{\"name\":\"slasher\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"operator\",\"type\":\"address\",\"indexed\":true,\"internalType\":\"address\"},{\"name\":\"success\",\"type\":\"bool\",\"indexed\":true,\"internalType\":\"bool\"},{\"name\":\"slashIndex\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"BaseSlashing_NoSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_NoSlashing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_NotSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_NotVetoSlasher\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"BaseSlashing_UnknownSlasherType\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperator\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidOperatorVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSharedVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidSignature\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidToken\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_InvalidVault\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorAlreadyRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_OperatorVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_SharedVaultNotRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenAlreadyIsRegistered\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"VotingPowerProvider_TokenNotRegistered\",\"inputs\":[]}]",
}

// IBaseSlashingABI is the input ABI used to generate the binding from.
// Deprecated: Use IBaseSlashingMetaData.ABI instead.
var IBaseSlashingABI = IBaseSlashingMetaData.ABI

// IBaseSlashing is an auto generated Go binding around an Ethereum contract.
type IBaseSlashing struct {
	IBaseSlashingCaller     // Read-only binding to the contract
	IBaseSlashingTransactor // Write-only binding to the contract
	IBaseSlashingFilterer   // Log filterer for contract events
}

// IBaseSlashingCaller is an auto generated read-only Go binding around an Ethereum contract.
type IBaseSlashingCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseSlashingTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IBaseSlashingTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseSlashingFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IBaseSlashingFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IBaseSlashingSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IBaseSlashingSession struct {
	Contract     *IBaseSlashing    // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IBaseSlashingCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IBaseSlashingCallerSession struct {
	Contract *IBaseSlashingCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts        // Call options to use throughout this session
}

// IBaseSlashingTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IBaseSlashingTransactorSession struct {
	Contract     *IBaseSlashingTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts        // Transaction auth options to use throughout this session
}

// IBaseSlashingRaw is an auto generated low-level Go binding around an Ethereum contract.
type IBaseSlashingRaw struct {
	Contract *IBaseSlashing // Generic contract binding to access the raw methods on
}

// IBaseSlashingCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IBaseSlashingCallerRaw struct {
	Contract *IBaseSlashingCaller // Generic read-only contract binding to access the raw methods on
}

// IBaseSlashingTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IBaseSlashingTransactorRaw struct {
	Contract *IBaseSlashingTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIBaseSlashing creates a new instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashing(address common.Address, backend bind.ContractBackend) (*IBaseSlashing, error) {
	contract, err := bindIBaseSlashing(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashing{IBaseSlashingCaller: IBaseSlashingCaller{contract: contract}, IBaseSlashingTransactor: IBaseSlashingTransactor{contract: contract}, IBaseSlashingFilterer: IBaseSlashingFilterer{contract: contract}}, nil
}

// NewIBaseSlashingCaller creates a new read-only instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashingCaller(address common.Address, caller bind.ContractCaller) (*IBaseSlashingCaller, error) {
	contract, err := bindIBaseSlashing(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingCaller{contract: contract}, nil
}

// NewIBaseSlashingTransactor creates a new write-only instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashingTransactor(address common.Address, transactor bind.ContractTransactor) (*IBaseSlashingTransactor, error) {
	contract, err := bindIBaseSlashing(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingTransactor{contract: contract}, nil
}

// NewIBaseSlashingFilterer creates a new log filterer instance of IBaseSlashing, bound to a specific deployed contract.
func NewIBaseSlashingFilterer(address common.Address, filterer bind.ContractFilterer) (*IBaseSlashingFilterer, error) {
	contract, err := bindIBaseSlashing(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingFilterer{contract: contract}, nil
}

// bindIBaseSlashing binds a generic wrapper to an already deployed contract.
func bindIBaseSlashing(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IBaseSlashingMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IBaseSlashing *IBaseSlashingRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IBaseSlashing.Contract.IBaseSlashingCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IBaseSlashing *IBaseSlashingRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.IBaseSlashingTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IBaseSlashing *IBaseSlashingRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.IBaseSlashingTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IBaseSlashing *IBaseSlashingCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IBaseSlashing.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IBaseSlashing *IBaseSlashingTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IBaseSlashing *IBaseSlashingTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.contract.Transact(opts, method, params...)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IBaseSlashing *IBaseSlashingCaller) OPERATORREGISTRY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "OPERATOR_REGISTRY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IBaseSlashing *IBaseSlashingSession) OPERATORREGISTRY() (common.Address, error) {
	return _IBaseSlashing.Contract.OPERATORREGISTRY(&_IBaseSlashing.CallOpts)
}

// OPERATORREGISTRY is a free data retrieval call binding the contract method 0x83ce0322.
//
// Solidity: function OPERATOR_REGISTRY() view returns(address)
func (_IBaseSlashing *IBaseSlashingCallerSession) OPERATORREGISTRY() (common.Address, error) {
	return _IBaseSlashing.Contract.OPERATORREGISTRY(&_IBaseSlashing.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IBaseSlashing *IBaseSlashingCaller) VAULTFACTORY(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "VAULT_FACTORY")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IBaseSlashing *IBaseSlashingSession) VAULTFACTORY() (common.Address, error) {
	return _IBaseSlashing.Contract.VAULTFACTORY(&_IBaseSlashing.CallOpts)
}

// VAULTFACTORY is a free data retrieval call binding the contract method 0x103f2907.
//
// Solidity: function VAULT_FACTORY() view returns(address)
func (_IBaseSlashing *IBaseSlashingCallerSession) VAULTFACTORY() (common.Address, error) {
	return _IBaseSlashing.Contract.VAULTFACTORY(&_IBaseSlashing.CallOpts)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperatorStakes(opts *bind.CallOpts, operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperatorStakes", operator)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorStakes(&_IBaseSlashing.CallOpts, operator)
}

// GetOperatorStakes is a free data retrieval call binding the contract method 0x93816a13.
//
// Solidity: function getOperatorStakes(address operator) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperatorStakes(operator common.Address) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorStakes(&_IBaseSlashing.CallOpts, operator)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperatorStakesAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperatorStakesAt", operator, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorStakesAt(&_IBaseSlashing.CallOpts, operator, timestamp)
}

// GetOperatorStakesAt is a free data retrieval call binding the contract method 0xa54e116e.
//
// Solidity: function getOperatorStakesAt(address operator, uint48 timestamp) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperatorStakesAt(operator common.Address, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorStakesAt(&_IBaseSlashing.CallOpts, operator, timestamp)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperatorVaults(opts *bind.CallOpts, operator common.Address) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperatorVaults", operator)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperatorVaults(&_IBaseSlashing.CallOpts, operator)
}

// GetOperatorVaults is a free data retrieval call binding the contract method 0x14d7e25b.
//
// Solidity: function getOperatorVaults(address operator) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperatorVaults(operator common.Address) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperatorVaults(&_IBaseSlashing.CallOpts, operator)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperatorVaultsAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperatorVaultsAt", operator, timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperatorVaultsAt(&_IBaseSlashing.CallOpts, operator, timestamp)
}

// GetOperatorVaultsAt is a free data retrieval call binding the contract method 0x49f993ec.
//
// Solidity: function getOperatorVaultsAt(address operator, uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperatorVaultsAt(operator common.Address, timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperatorVaultsAt(&_IBaseSlashing.CallOpts, operator, timestamp)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperatorVotingPowers(opts *bind.CallOpts, operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperatorVotingPowers", operator, extraData)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorVotingPowers(&_IBaseSlashing.CallOpts, operator, extraData)
}

// GetOperatorVotingPowers is a free data retrieval call binding the contract method 0x63ff1140.
//
// Solidity: function getOperatorVotingPowers(address operator, bytes extraData) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperatorVotingPowers(operator common.Address, extraData []byte) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorVotingPowers(&_IBaseSlashing.CallOpts, operator, extraData)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperatorVotingPowersAt(opts *bind.CallOpts, operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperatorVotingPowersAt", operator, extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderVaultValue), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderVaultValue)).(*[]IVotingPowerProviderVaultValue)

	return out0, err

}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorVotingPowersAt(&_IBaseSlashing.CallOpts, operator, extraData, timestamp)
}

// GetOperatorVotingPowersAt is a free data retrieval call binding the contract method 0x380f9945.
//
// Solidity: function getOperatorVotingPowersAt(address operator, bytes extraData, uint48 timestamp) view returns((address,uint256)[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperatorVotingPowersAt(operator common.Address, extraData []byte, timestamp *big.Int) ([]IVotingPowerProviderVaultValue, error) {
	return _IBaseSlashing.Contract.GetOperatorVotingPowersAt(&_IBaseSlashing.CallOpts, operator, extraData, timestamp)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperators(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperators")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperators() ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperators(&_IBaseSlashing.CallOpts)
}

// GetOperators is a free data retrieval call binding the contract method 0x27a099d8.
//
// Solidity: function getOperators() view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperators() ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperators(&_IBaseSlashing.CallOpts)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetOperatorsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getOperatorsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperatorsAt(&_IBaseSlashing.CallOpts, timestamp)
}

// GetOperatorsAt is a free data retrieval call binding the contract method 0xa2e33009.
//
// Solidity: function getOperatorsAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetOperatorsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetOperatorsAt(&_IBaseSlashing.CallOpts, timestamp)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetSharedVaults(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getSharedVaults")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetSharedVaults() ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetSharedVaults(&_IBaseSlashing.CallOpts)
}

// GetSharedVaults is a free data retrieval call binding the contract method 0xc28474cd.
//
// Solidity: function getSharedVaults() view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetSharedVaults() ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetSharedVaults(&_IBaseSlashing.CallOpts)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetSharedVaultsAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getSharedVaultsAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetSharedVaultsAt(&_IBaseSlashing.CallOpts, timestamp)
}

// GetSharedVaultsAt is a free data retrieval call binding the contract method 0x4a0c7c17.
//
// Solidity: function getSharedVaultsAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetSharedVaultsAt(timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetSharedVaultsAt(&_IBaseSlashing.CallOpts, timestamp)
}

// GetSlasher is a free data retrieval call binding the contract method 0xd0c80f13.
//
// Solidity: function getSlasher() view returns(address)
func (_IBaseSlashing *IBaseSlashingCaller) GetSlasher(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getSlasher")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetSlasher is a free data retrieval call binding the contract method 0xd0c80f13.
//
// Solidity: function getSlasher() view returns(address)
func (_IBaseSlashing *IBaseSlashingSession) GetSlasher() (common.Address, error) {
	return _IBaseSlashing.Contract.GetSlasher(&_IBaseSlashing.CallOpts)
}

// GetSlasher is a free data retrieval call binding the contract method 0xd0c80f13.
//
// Solidity: function getSlasher() view returns(address)
func (_IBaseSlashing *IBaseSlashingCallerSession) GetSlasher() (common.Address, error) {
	return _IBaseSlashing.Contract.GetSlasher(&_IBaseSlashing.CallOpts)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IBaseSlashing *IBaseSlashingCaller) GetSlashingData(opts *bind.CallOpts) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getSlashingData")

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
func (_IBaseSlashing *IBaseSlashingSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IBaseSlashing.Contract.GetSlashingData(&_IBaseSlashing.CallOpts)
}

// GetSlashingData is a free data retrieval call binding the contract method 0xf7dfb974.
//
// Solidity: function getSlashingData() view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IBaseSlashing *IBaseSlashingCallerSession) GetSlashingData() (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IBaseSlashing.Contract.GetSlashingData(&_IBaseSlashing.CallOpts)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IBaseSlashing *IBaseSlashingCaller) GetSlashingDataAt(opts *bind.CallOpts, timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getSlashingDataAt", timestamp, hint)

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
func (_IBaseSlashing *IBaseSlashingSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IBaseSlashing.Contract.GetSlashingDataAt(&_IBaseSlashing.CallOpts, timestamp, hint)
}

// GetSlashingDataAt is a free data retrieval call binding the contract method 0x7a74c7fd.
//
// Solidity: function getSlashingDataAt(uint48 timestamp, bytes hint) view returns(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IBaseSlashing *IBaseSlashingCallerSession) GetSlashingDataAt(timestamp *big.Int, hint []byte) (struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
}, error) {
	return _IBaseSlashing.Contract.GetSlashingDataAt(&_IBaseSlashing.CallOpts, timestamp, hint)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetTokens(opts *bind.CallOpts) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getTokens")

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetTokens() ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetTokens(&_IBaseSlashing.CallOpts)
}

// GetTokens is a free data retrieval call binding the contract method 0xaa6ca808.
//
// Solidity: function getTokens() view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetTokens() ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetTokens(&_IBaseSlashing.CallOpts)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCaller) GetTokensAt(opts *bind.CallOpts, timestamp *big.Int) ([]common.Address, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getTokensAt", timestamp)

	if err != nil {
		return *new([]common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new([]common.Address)).(*[]common.Address)

	return out0, err

}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetTokensAt(&_IBaseSlashing.CallOpts, timestamp)
}

// GetTokensAt is a free data retrieval call binding the contract method 0x1796df1b.
//
// Solidity: function getTokensAt(uint48 timestamp) view returns(address[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetTokensAt(timestamp *big.Int) ([]common.Address, error) {
	return _IBaseSlashing.Contract.GetTokensAt(&_IBaseSlashing.CallOpts, timestamp)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IBaseSlashing *IBaseSlashingCaller) GetVotingPowers(opts *bind.CallOpts, extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getVotingPowers", extraData)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IBaseSlashing *IBaseSlashingSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IBaseSlashing.Contract.GetVotingPowers(&_IBaseSlashing.CallOpts, extraData)
}

// GetVotingPowers is a free data retrieval call binding the contract method 0xff7cd71c.
//
// Solidity: function getVotingPowers(bytes[] extraData) view returns((address,(address,uint256)[])[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetVotingPowers(extraData [][]byte) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IBaseSlashing.Contract.GetVotingPowers(&_IBaseSlashing.CallOpts, extraData)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IBaseSlashing *IBaseSlashingCaller) GetVotingPowersAt(opts *bind.CallOpts, extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "getVotingPowersAt", extraData, timestamp)

	if err != nil {
		return *new([]IVotingPowerProviderOperatorVotingPower), err
	}

	out0 := *abi.ConvertType(out[0], new([]IVotingPowerProviderOperatorVotingPower)).(*[]IVotingPowerProviderOperatorVotingPower)

	return out0, err

}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IBaseSlashing *IBaseSlashingSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IBaseSlashing.Contract.GetVotingPowersAt(&_IBaseSlashing.CallOpts, extraData, timestamp)
}

// GetVotingPowersAt is a free data retrieval call binding the contract method 0x77adea5f.
//
// Solidity: function getVotingPowersAt(bytes[] extraData, uint48 timestamp) view returns((address,(address,uint256)[])[])
func (_IBaseSlashing *IBaseSlashingCallerSession) GetVotingPowersAt(extraData [][]byte, timestamp *big.Int) ([]IVotingPowerProviderOperatorVotingPower, error) {
	return _IBaseSlashing.Contract.GetVotingPowersAt(&_IBaseSlashing.CallOpts, extraData, timestamp)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsOperatorRegistered(opts *bind.CallOpts, operator common.Address) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isOperatorRegistered", operator)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorRegistered(&_IBaseSlashing.CallOpts, operator)
}

// IsOperatorRegistered is a free data retrieval call binding the contract method 0x6b1906f8.
//
// Solidity: function isOperatorRegistered(address operator) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsOperatorRegistered(operator common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorRegistered(&_IBaseSlashing.CallOpts, operator)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsOperatorRegisteredAt(opts *bind.CallOpts, operator common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isOperatorRegisteredAt", operator, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorRegisteredAt(&_IBaseSlashing.CallOpts, operator, timestamp)
}

// IsOperatorRegisteredAt is a free data retrieval call binding the contract method 0x8a5aef51.
//
// Solidity: function isOperatorRegisteredAt(address operator, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsOperatorRegisteredAt(operator common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorRegisteredAt(&_IBaseSlashing.CallOpts, operator, timestamp)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsOperatorVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isOperatorVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegistered(&_IBaseSlashing.CallOpts, vault)
}

// IsOperatorVaultRegistered is a free data retrieval call binding the contract method 0x0f6e0743.
//
// Solidity: function isOperatorVaultRegistered(address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsOperatorVaultRegistered(vault common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegistered(&_IBaseSlashing.CallOpts, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsOperatorVaultRegistered0(opts *bind.CallOpts, operator common.Address, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isOperatorVaultRegistered0", operator, vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegistered0(&_IBaseSlashing.CallOpts, operator, vault)
}

// IsOperatorVaultRegistered0 is a free data retrieval call binding the contract method 0x669fa8c7.
//
// Solidity: function isOperatorVaultRegistered(address operator, address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsOperatorVaultRegistered0(operator common.Address, vault common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegistered0(&_IBaseSlashing.CallOpts, operator, vault)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsOperatorVaultRegisteredAt(opts *bind.CallOpts, operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isOperatorVaultRegisteredAt", operator, vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegisteredAt(&_IBaseSlashing.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt is a free data retrieval call binding the contract method 0xdae8f803.
//
// Solidity: function isOperatorVaultRegisteredAt(address operator, address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsOperatorVaultRegisteredAt(operator common.Address, vault common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegisteredAt(&_IBaseSlashing.CallOpts, operator, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsOperatorVaultRegisteredAt0(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isOperatorVaultRegisteredAt0", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegisteredAt0(&_IBaseSlashing.CallOpts, vault, timestamp)
}

// IsOperatorVaultRegisteredAt0 is a free data retrieval call binding the contract method 0xf6c011de.
//
// Solidity: function isOperatorVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsOperatorVaultRegisteredAt0(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsOperatorVaultRegisteredAt0(&_IBaseSlashing.CallOpts, vault, timestamp)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsSharedVaultRegistered(opts *bind.CallOpts, vault common.Address) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isSharedVaultRegistered", vault)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsSharedVaultRegistered(&_IBaseSlashing.CallOpts, vault)
}

// IsSharedVaultRegistered is a free data retrieval call binding the contract method 0x9a1ebee9.
//
// Solidity: function isSharedVaultRegistered(address vault) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsSharedVaultRegistered(vault common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsSharedVaultRegistered(&_IBaseSlashing.CallOpts, vault)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsSharedVaultRegisteredAt(opts *bind.CallOpts, vault common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isSharedVaultRegisteredAt", vault, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsSharedVaultRegisteredAt(&_IBaseSlashing.CallOpts, vault, timestamp)
}

// IsSharedVaultRegisteredAt is a free data retrieval call binding the contract method 0xe66e1ed2.
//
// Solidity: function isSharedVaultRegisteredAt(address vault, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsSharedVaultRegisteredAt(vault common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsSharedVaultRegisteredAt(&_IBaseSlashing.CallOpts, vault, timestamp)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsTokenRegistered(opts *bind.CallOpts, token common.Address) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isTokenRegistered", token)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsTokenRegistered(&_IBaseSlashing.CallOpts, token)
}

// IsTokenRegistered is a free data retrieval call binding the contract method 0x26aa101f.
//
// Solidity: function isTokenRegistered(address token) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsTokenRegistered(token common.Address) (bool, error) {
	return _IBaseSlashing.Contract.IsTokenRegistered(&_IBaseSlashing.CallOpts, token)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCaller) IsTokenRegisteredAt(opts *bind.CallOpts, token common.Address, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IBaseSlashing.contract.Call(opts, &out, "isTokenRegisteredAt", token, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsTokenRegisteredAt(&_IBaseSlashing.CallOpts, token, timestamp)
}

// IsTokenRegisteredAt is a free data retrieval call binding the contract method 0x6a496108.
//
// Solidity: function isTokenRegisteredAt(address token, uint48 timestamp) view returns(bool)
func (_IBaseSlashing *IBaseSlashingCallerSession) IsTokenRegisteredAt(token common.Address, timestamp *big.Int) (bool, error) {
	return _IBaseSlashing.Contract.IsTokenRegisteredAt(&_IBaseSlashing.CallOpts, token, timestamp)
}

// ExecuteSlashVault is a paid mutator transaction binding the contract method 0x393e152f.
//
// Solidity: function executeSlashVault(address vault, uint256 slashIndex, bytes hints) returns(bool success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingTransactor) ExecuteSlashVault(opts *bind.TransactOpts, vault common.Address, slashIndex *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "executeSlashVault", vault, slashIndex, hints)
}

// ExecuteSlashVault is a paid mutator transaction binding the contract method 0x393e152f.
//
// Solidity: function executeSlashVault(address vault, uint256 slashIndex, bytes hints) returns(bool success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingSession) ExecuteSlashVault(vault common.Address, slashIndex *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.ExecuteSlashVault(&_IBaseSlashing.TransactOpts, vault, slashIndex, hints)
}

// ExecuteSlashVault is a paid mutator transaction binding the contract method 0x393e152f.
//
// Solidity: function executeSlashVault(address vault, uint256 slashIndex, bytes hints) returns(bool success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingTransactorSession) ExecuteSlashVault(vault common.Address, slashIndex *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.ExecuteSlashVault(&_IBaseSlashing.TransactOpts, vault, slashIndex, hints)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IBaseSlashing *IBaseSlashingTransactor) InvalidateOldSignatures(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "invalidateOldSignatures")
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IBaseSlashing *IBaseSlashingSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IBaseSlashing.Contract.InvalidateOldSignatures(&_IBaseSlashing.TransactOpts)
}

// InvalidateOldSignatures is a paid mutator transaction binding the contract method 0x622e4dba.
//
// Solidity: function invalidateOldSignatures() returns()
func (_IBaseSlashing *IBaseSlashingTransactorSession) InvalidateOldSignatures() (*types.Transaction, error) {
	return _IBaseSlashing.Contract.InvalidateOldSignatures(&_IBaseSlashing.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IBaseSlashing *IBaseSlashingTransactor) RegisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "registerOperator")
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IBaseSlashing *IBaseSlashingSession) RegisterOperator() (*types.Transaction, error) {
	return _IBaseSlashing.Contract.RegisterOperator(&_IBaseSlashing.TransactOpts)
}

// RegisterOperator is a paid mutator transaction binding the contract method 0x2acde098.
//
// Solidity: function registerOperator() returns()
func (_IBaseSlashing *IBaseSlashingTransactorSession) RegisterOperator() (*types.Transaction, error) {
	return _IBaseSlashing.Contract.RegisterOperator(&_IBaseSlashing.TransactOpts)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IBaseSlashing *IBaseSlashingTransactor) RegisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "registerOperatorWithSignature", operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IBaseSlashing *IBaseSlashingSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.RegisterOperatorWithSignature(&_IBaseSlashing.TransactOpts, operator, signature)
}

// RegisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xeb5e940d.
//
// Solidity: function registerOperatorWithSignature(address operator, bytes signature) returns()
func (_IBaseSlashing *IBaseSlashingTransactorSession) RegisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.RegisterOperatorWithSignature(&_IBaseSlashing.TransactOpts, operator, signature)
}

// SetSlasher is a paid mutator transaction binding the contract method 0xaabc2496.
//
// Solidity: function setSlasher(address slasher) returns()
func (_IBaseSlashing *IBaseSlashingTransactor) SetSlasher(opts *bind.TransactOpts, slasher common.Address) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "setSlasher", slasher)
}

// SetSlasher is a paid mutator transaction binding the contract method 0xaabc2496.
//
// Solidity: function setSlasher(address slasher) returns()
func (_IBaseSlashing *IBaseSlashingSession) SetSlasher(slasher common.Address) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SetSlasher(&_IBaseSlashing.TransactOpts, slasher)
}

// SetSlasher is a paid mutator transaction binding the contract method 0xaabc2496.
//
// Solidity: function setSlasher(address slasher) returns()
func (_IBaseSlashing *IBaseSlashingTransactorSession) SetSlasher(slasher common.Address) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SetSlasher(&_IBaseSlashing.TransactOpts, slasher)
}

// SlashVault is a paid mutator transaction binding the contract method 0x260ce0bd.
//
// Solidity: function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes hints) returns(bool success, bytes response)
func (_IBaseSlashing *IBaseSlashingTransactor) SlashVault(opts *bind.TransactOpts, timestamp *big.Int, vault common.Address, operator common.Address, amount *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "slashVault", timestamp, vault, operator, amount, hints)
}

// SlashVault is a paid mutator transaction binding the contract method 0x260ce0bd.
//
// Solidity: function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes hints) returns(bool success, bytes response)
func (_IBaseSlashing *IBaseSlashingSession) SlashVault(timestamp *big.Int, vault common.Address, operator common.Address, amount *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SlashVault(&_IBaseSlashing.TransactOpts, timestamp, vault, operator, amount, hints)
}

// SlashVault is a paid mutator transaction binding the contract method 0x260ce0bd.
//
// Solidity: function slashVault(uint48 timestamp, address vault, address operator, uint256 amount, bytes hints) returns(bool success, bytes response)
func (_IBaseSlashing *IBaseSlashingTransactorSession) SlashVault(timestamp *big.Int, vault common.Address, operator common.Address, amount *big.Int, hints []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.SlashVault(&_IBaseSlashing.TransactOpts, timestamp, vault, operator, amount, hints)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IBaseSlashing *IBaseSlashingTransactor) UnregisterOperator(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "unregisterOperator")
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IBaseSlashing *IBaseSlashingSession) UnregisterOperator() (*types.Transaction, error) {
	return _IBaseSlashing.Contract.UnregisterOperator(&_IBaseSlashing.TransactOpts)
}

// UnregisterOperator is a paid mutator transaction binding the contract method 0xa876b89a.
//
// Solidity: function unregisterOperator() returns()
func (_IBaseSlashing *IBaseSlashingTransactorSession) UnregisterOperator() (*types.Transaction, error) {
	return _IBaseSlashing.Contract.UnregisterOperator(&_IBaseSlashing.TransactOpts)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IBaseSlashing *IBaseSlashingTransactor) UnregisterOperatorWithSignature(opts *bind.TransactOpts, operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IBaseSlashing.contract.Transact(opts, "unregisterOperatorWithSignature", operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IBaseSlashing *IBaseSlashingSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.UnregisterOperatorWithSignature(&_IBaseSlashing.TransactOpts, operator, signature)
}

// UnregisterOperatorWithSignature is a paid mutator transaction binding the contract method 0xf96d1946.
//
// Solidity: function unregisterOperatorWithSignature(address operator, bytes signature) returns()
func (_IBaseSlashing *IBaseSlashingTransactorSession) UnregisterOperatorWithSignature(operator common.Address, signature []byte) (*types.Transaction, error) {
	return _IBaseSlashing.Contract.UnregisterOperatorWithSignature(&_IBaseSlashing.TransactOpts, operator, signature)
}

// IBaseSlashingExecuteSlashIterator is returned from FilterExecuteSlash and is used to iterate over the raw logs and unpacked data for ExecuteSlash events raised by the IBaseSlashing contract.
type IBaseSlashingExecuteSlashIterator struct {
	Event *IBaseSlashingExecuteSlash // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingExecuteSlashIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingExecuteSlash)
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
		it.Event = new(IBaseSlashingExecuteSlash)
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
func (it *IBaseSlashingExecuteSlashIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingExecuteSlashIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingExecuteSlash represents a ExecuteSlash event raised by the IBaseSlashing contract.
type IBaseSlashingExecuteSlash struct {
	Slasher       common.Address
	SlashIndex    *big.Int
	Success       bool
	SlashedAmount *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterExecuteSlash is a free log retrieval operation binding the contract event 0xeceffb66eab7d894b03042d8db748e6a430e9b61287b00451b206a03322a22be.
//
// Solidity: event ExecuteSlash(address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterExecuteSlash(opts *bind.FilterOpts, slasher []common.Address, slashIndex []*big.Int, success []bool) (*IBaseSlashingExecuteSlashIterator, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var slashIndexRule []interface{}
	for _, slashIndexItem := range slashIndex {
		slashIndexRule = append(slashIndexRule, slashIndexItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "ExecuteSlash", slasherRule, slashIndexRule, successRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingExecuteSlashIterator{contract: _IBaseSlashing.contract, event: "ExecuteSlash", logs: logs, sub: sub}, nil
}

// WatchExecuteSlash is a free log subscription operation binding the contract event 0xeceffb66eab7d894b03042d8db748e6a430e9b61287b00451b206a03322a22be.
//
// Solidity: event ExecuteSlash(address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchExecuteSlash(opts *bind.WatchOpts, sink chan<- *IBaseSlashingExecuteSlash, slasher []common.Address, slashIndex []*big.Int, success []bool) (event.Subscription, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var slashIndexRule []interface{}
	for _, slashIndexItem := range slashIndex {
		slashIndexRule = append(slashIndexRule, slashIndexItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "ExecuteSlash", slasherRule, slashIndexRule, successRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingExecuteSlash)
				if err := _IBaseSlashing.contract.UnpackLog(event, "ExecuteSlash", log); err != nil {
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

// ParseExecuteSlash is a log parse operation binding the contract event 0xeceffb66eab7d894b03042d8db748e6a430e9b61287b00451b206a03322a22be.
//
// Solidity: event ExecuteSlash(address indexed slasher, uint256 indexed slashIndex, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseExecuteSlash(log types.Log) (*IBaseSlashingExecuteSlash, error) {
	event := new(IBaseSlashingExecuteSlash)
	if err := _IBaseSlashing.contract.UnpackLog(event, "ExecuteSlash", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingInstantSlashIterator is returned from FilterInstantSlash and is used to iterate over the raw logs and unpacked data for InstantSlash events raised by the IBaseSlashing contract.
type IBaseSlashingInstantSlashIterator struct {
	Event *IBaseSlashingInstantSlash // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingInstantSlashIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingInstantSlash)
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
		it.Event = new(IBaseSlashingInstantSlash)
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
func (it *IBaseSlashingInstantSlashIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingInstantSlashIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingInstantSlash represents a InstantSlash event raised by the IBaseSlashing contract.
type IBaseSlashingInstantSlash struct {
	Slasher       common.Address
	Operator      common.Address
	Success       bool
	SlashedAmount *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterInstantSlash is a free log retrieval operation binding the contract event 0x0aad709246d97ff10a8af5e6c1601ba0280ab5dba56b57540e121d0e04a3d9b1.
//
// Solidity: event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterInstantSlash(opts *bind.FilterOpts, slasher []common.Address, operator []common.Address, success []bool) (*IBaseSlashingInstantSlashIterator, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "InstantSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingInstantSlashIterator{contract: _IBaseSlashing.contract, event: "InstantSlash", logs: logs, sub: sub}, nil
}

// WatchInstantSlash is a free log subscription operation binding the contract event 0x0aad709246d97ff10a8af5e6c1601ba0280ab5dba56b57540e121d0e04a3d9b1.
//
// Solidity: event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchInstantSlash(opts *bind.WatchOpts, sink chan<- *IBaseSlashingInstantSlash, slasher []common.Address, operator []common.Address, success []bool) (event.Subscription, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "InstantSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingInstantSlash)
				if err := _IBaseSlashing.contract.UnpackLog(event, "InstantSlash", log); err != nil {
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

// ParseInstantSlash is a log parse operation binding the contract event 0x0aad709246d97ff10a8af5e6c1601ba0280ab5dba56b57540e121d0e04a3d9b1.
//
// Solidity: event InstantSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashedAmount)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseInstantSlash(log types.Log) (*IBaseSlashingInstantSlash, error) {
	event := new(IBaseSlashingInstantSlash)
	if err := _IBaseSlashing.contract.UnpackLog(event, "InstantSlash", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingRegisterOperatorIterator is returned from FilterRegisterOperator and is used to iterate over the raw logs and unpacked data for RegisterOperator events raised by the IBaseSlashing contract.
type IBaseSlashingRegisterOperatorIterator struct {
	Event *IBaseSlashingRegisterOperator // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingRegisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingRegisterOperator)
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
		it.Event = new(IBaseSlashingRegisterOperator)
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
func (it *IBaseSlashingRegisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingRegisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingRegisterOperator represents a RegisterOperator event raised by the IBaseSlashing contract.
type IBaseSlashingRegisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperator is a free log retrieval operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterRegisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IBaseSlashingRegisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingRegisterOperatorIterator{contract: _IBaseSlashing.contract, event: "RegisterOperator", logs: logs, sub: sub}, nil
}

// WatchRegisterOperator is a free log subscription operation binding the contract event 0xdfd9e0392912bee97777ec588d2ff7ae010ea24202d153a0bff1b30aed643daa.
//
// Solidity: event RegisterOperator(address indexed operator)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchRegisterOperator(opts *bind.WatchOpts, sink chan<- *IBaseSlashingRegisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "RegisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingRegisterOperator)
				if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseRegisterOperator(log types.Log) (*IBaseSlashingRegisterOperator, error) {
	event := new(IBaseSlashingRegisterOperator)
	if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingRegisterOperatorVaultIterator is returned from FilterRegisterOperatorVault and is used to iterate over the raw logs and unpacked data for RegisterOperatorVault events raised by the IBaseSlashing contract.
type IBaseSlashingRegisterOperatorVaultIterator struct {
	Event *IBaseSlashingRegisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingRegisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingRegisterOperatorVault)
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
		it.Event = new(IBaseSlashingRegisterOperatorVault)
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
func (it *IBaseSlashingRegisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingRegisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingRegisterOperatorVault represents a RegisterOperatorVault event raised by the IBaseSlashing contract.
type IBaseSlashingRegisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterRegisterOperatorVault is a free log retrieval operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterRegisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IBaseSlashingRegisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingRegisterOperatorVaultIterator{contract: _IBaseSlashing.contract, event: "RegisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchRegisterOperatorVault is a free log subscription operation binding the contract event 0x6db8d1ad7903329250db9b7a653d3aa009807c85daa2281a75e063808bceefdc.
//
// Solidity: event RegisterOperatorVault(address indexed operator, address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchRegisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IBaseSlashingRegisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "RegisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingRegisterOperatorVault)
				if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseRegisterOperatorVault(log types.Log) (*IBaseSlashingRegisterOperatorVault, error) {
	event := new(IBaseSlashingRegisterOperatorVault)
	if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingRegisterSharedVaultIterator is returned from FilterRegisterSharedVault and is used to iterate over the raw logs and unpacked data for RegisterSharedVault events raised by the IBaseSlashing contract.
type IBaseSlashingRegisterSharedVaultIterator struct {
	Event *IBaseSlashingRegisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingRegisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingRegisterSharedVault)
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
		it.Event = new(IBaseSlashingRegisterSharedVault)
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
func (it *IBaseSlashingRegisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingRegisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingRegisterSharedVault represents a RegisterSharedVault event raised by the IBaseSlashing contract.
type IBaseSlashingRegisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterSharedVault is a free log retrieval operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterRegisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IBaseSlashingRegisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingRegisterSharedVaultIterator{contract: _IBaseSlashing.contract, event: "RegisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchRegisterSharedVault is a free log subscription operation binding the contract event 0x99528065e654d6d4b95447d6787148a84b7e98a95e752784e99da056b403b25c.
//
// Solidity: event RegisterSharedVault(address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchRegisterSharedVault(opts *bind.WatchOpts, sink chan<- *IBaseSlashingRegisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "RegisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingRegisterSharedVault)
				if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseRegisterSharedVault(log types.Log) (*IBaseSlashingRegisterSharedVault, error) {
	event := new(IBaseSlashingRegisterSharedVault)
	if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingRegisterTokenIterator is returned from FilterRegisterToken and is used to iterate over the raw logs and unpacked data for RegisterToken events raised by the IBaseSlashing contract.
type IBaseSlashingRegisterTokenIterator struct {
	Event *IBaseSlashingRegisterToken // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingRegisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingRegisterToken)
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
		it.Event = new(IBaseSlashingRegisterToken)
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
func (it *IBaseSlashingRegisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingRegisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingRegisterToken represents a RegisterToken event raised by the IBaseSlashing contract.
type IBaseSlashingRegisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterRegisterToken is a free log retrieval operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterRegisterToken(opts *bind.FilterOpts, token []common.Address) (*IBaseSlashingRegisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingRegisterTokenIterator{contract: _IBaseSlashing.contract, event: "RegisterToken", logs: logs, sub: sub}, nil
}

// WatchRegisterToken is a free log subscription operation binding the contract event 0xf7fe8023cb2e36bde1d59a88ac5763a8c11be6d25e6819f71bb7e23e5bf0dc16.
//
// Solidity: event RegisterToken(address indexed token)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchRegisterToken(opts *bind.WatchOpts, sink chan<- *IBaseSlashingRegisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "RegisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingRegisterToken)
				if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterToken", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseRegisterToken(log types.Log) (*IBaseSlashingRegisterToken, error) {
	event := new(IBaseSlashingRegisterToken)
	if err := _IBaseSlashing.contract.UnpackLog(event, "RegisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingSetSlasherIterator is returned from FilterSetSlasher and is used to iterate over the raw logs and unpacked data for SetSlasher events raised by the IBaseSlashing contract.
type IBaseSlashingSetSlasherIterator struct {
	Event *IBaseSlashingSetSlasher // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingSetSlasherIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingSetSlasher)
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
		it.Event = new(IBaseSlashingSetSlasher)
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
func (it *IBaseSlashingSetSlasherIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingSetSlasherIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingSetSlasher represents a SetSlasher event raised by the IBaseSlashing contract.
type IBaseSlashingSetSlasher struct {
	Slasher common.Address
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterSetSlasher is a free log retrieval operation binding the contract event 0xe7e4c932e03abddfe20f83af42c33627e816115c7ec2b168441f65dc14bfc3ba.
//
// Solidity: event SetSlasher(address slasher)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterSetSlasher(opts *bind.FilterOpts) (*IBaseSlashingSetSlasherIterator, error) {

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "SetSlasher")
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingSetSlasherIterator{contract: _IBaseSlashing.contract, event: "SetSlasher", logs: logs, sub: sub}, nil
}

// WatchSetSlasher is a free log subscription operation binding the contract event 0xe7e4c932e03abddfe20f83af42c33627e816115c7ec2b168441f65dc14bfc3ba.
//
// Solidity: event SetSlasher(address slasher)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchSetSlasher(opts *bind.WatchOpts, sink chan<- *IBaseSlashingSetSlasher) (event.Subscription, error) {

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "SetSlasher")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingSetSlasher)
				if err := _IBaseSlashing.contract.UnpackLog(event, "SetSlasher", log); err != nil {
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

// ParseSetSlasher is a log parse operation binding the contract event 0xe7e4c932e03abddfe20f83af42c33627e816115c7ec2b168441f65dc14bfc3ba.
//
// Solidity: event SetSlasher(address slasher)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseSetSlasher(log types.Log) (*IBaseSlashingSetSlasher, error) {
	event := new(IBaseSlashingSetSlasher)
	if err := _IBaseSlashing.contract.UnpackLog(event, "SetSlasher", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingSetSlashingDataIterator is returned from FilterSetSlashingData and is used to iterate over the raw logs and unpacked data for SetSlashingData events raised by the IBaseSlashing contract.
type IBaseSlashingSetSlashingDataIterator struct {
	Event *IBaseSlashingSetSlashingData // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingSetSlashingDataIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingSetSlashingData)
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
		it.Event = new(IBaseSlashingSetSlashingData)
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
func (it *IBaseSlashingSetSlashingDataIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingSetSlashingDataIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingSetSlashingData represents a SetSlashingData event raised by the IBaseSlashing contract.
type IBaseSlashingSetSlashingData struct {
	RequireSlasher        bool
	MinVaultEpochDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetSlashingData is a free log retrieval operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterSetSlashingData(opts *bind.FilterOpts) (*IBaseSlashingSetSlashingDataIterator, error) {

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingSetSlashingDataIterator{contract: _IBaseSlashing.contract, event: "SetSlashingData", logs: logs, sub: sub}, nil
}

// WatchSetSlashingData is a free log subscription operation binding the contract event 0xfa31c1b97ed96532301949e5fd34d2e059500b0de599195245ddf8fbfbb36db0.
//
// Solidity: event SetSlashingData(bool requireSlasher, uint48 minVaultEpochDuration)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchSetSlashingData(opts *bind.WatchOpts, sink chan<- *IBaseSlashingSetSlashingData) (event.Subscription, error) {

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "SetSlashingData")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingSetSlashingData)
				if err := _IBaseSlashing.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseSetSlashingData(log types.Log) (*IBaseSlashingSetSlashingData, error) {
	event := new(IBaseSlashingSetSlashingData)
	if err := _IBaseSlashing.contract.UnpackLog(event, "SetSlashingData", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingUnregisterOperatorIterator is returned from FilterUnregisterOperator and is used to iterate over the raw logs and unpacked data for UnregisterOperator events raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterOperatorIterator struct {
	Event *IBaseSlashingUnregisterOperator // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingUnregisterOperatorIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingUnregisterOperator)
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
		it.Event = new(IBaseSlashingUnregisterOperator)
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
func (it *IBaseSlashingUnregisterOperatorIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingUnregisterOperatorIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingUnregisterOperator represents a UnregisterOperator event raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterOperator struct {
	Operator common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperator is a free log retrieval operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterUnregisterOperator(opts *bind.FilterOpts, operator []common.Address) (*IBaseSlashingUnregisterOperatorIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingUnregisterOperatorIterator{contract: _IBaseSlashing.contract, event: "UnregisterOperator", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperator is a free log subscription operation binding the contract event 0xd1b48d1e49885298af5dc8adc7777836ef804b38af88eabf4e079c04ee1538a7.
//
// Solidity: event UnregisterOperator(address indexed operator)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchUnregisterOperator(opts *bind.WatchOpts, sink chan<- *IBaseSlashingUnregisterOperator, operator []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "UnregisterOperator", operatorRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingUnregisterOperator)
				if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseUnregisterOperator(log types.Log) (*IBaseSlashingUnregisterOperator, error) {
	event := new(IBaseSlashingUnregisterOperator)
	if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterOperator", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingUnregisterOperatorVaultIterator is returned from FilterUnregisterOperatorVault and is used to iterate over the raw logs and unpacked data for UnregisterOperatorVault events raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterOperatorVaultIterator struct {
	Event *IBaseSlashingUnregisterOperatorVault // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingUnregisterOperatorVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingUnregisterOperatorVault)
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
		it.Event = new(IBaseSlashingUnregisterOperatorVault)
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
func (it *IBaseSlashingUnregisterOperatorVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingUnregisterOperatorVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingUnregisterOperatorVault represents a UnregisterOperatorVault event raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterOperatorVault struct {
	Operator common.Address
	Vault    common.Address
	Raw      types.Log // Blockchain specific contextual infos
}

// FilterUnregisterOperatorVault is a free log retrieval operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterUnregisterOperatorVault(opts *bind.FilterOpts, operator []common.Address, vault []common.Address) (*IBaseSlashingUnregisterOperatorVaultIterator, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingUnregisterOperatorVaultIterator{contract: _IBaseSlashing.contract, event: "UnregisterOperatorVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterOperatorVault is a free log subscription operation binding the contract event 0x3455b6128675eff843703027879cc9b52d6ce684ddc6077cbe0d191ad98b255e.
//
// Solidity: event UnregisterOperatorVault(address indexed operator, address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchUnregisterOperatorVault(opts *bind.WatchOpts, sink chan<- *IBaseSlashingUnregisterOperatorVault, operator []common.Address, vault []common.Address) (event.Subscription, error) {

	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "UnregisterOperatorVault", operatorRule, vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingUnregisterOperatorVault)
				if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseUnregisterOperatorVault(log types.Log) (*IBaseSlashingUnregisterOperatorVault, error) {
	event := new(IBaseSlashingUnregisterOperatorVault)
	if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterOperatorVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingUnregisterSharedVaultIterator is returned from FilterUnregisterSharedVault and is used to iterate over the raw logs and unpacked data for UnregisterSharedVault events raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterSharedVaultIterator struct {
	Event *IBaseSlashingUnregisterSharedVault // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingUnregisterSharedVaultIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingUnregisterSharedVault)
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
		it.Event = new(IBaseSlashingUnregisterSharedVault)
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
func (it *IBaseSlashingUnregisterSharedVaultIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingUnregisterSharedVaultIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingUnregisterSharedVault represents a UnregisterSharedVault event raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterSharedVault struct {
	Vault common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterSharedVault is a free log retrieval operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterUnregisterSharedVault(opts *bind.FilterOpts, vault []common.Address) (*IBaseSlashingUnregisterSharedVaultIterator, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingUnregisterSharedVaultIterator{contract: _IBaseSlashing.contract, event: "UnregisterSharedVault", logs: logs, sub: sub}, nil
}

// WatchUnregisterSharedVault is a free log subscription operation binding the contract event 0xead83f8482d0fa5de2b5c28fb39ee288392076d150db7020e10a92954aea82ee.
//
// Solidity: event UnregisterSharedVault(address indexed vault)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchUnregisterSharedVault(opts *bind.WatchOpts, sink chan<- *IBaseSlashingUnregisterSharedVault, vault []common.Address) (event.Subscription, error) {

	var vaultRule []interface{}
	for _, vaultItem := range vault {
		vaultRule = append(vaultRule, vaultItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "UnregisterSharedVault", vaultRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingUnregisterSharedVault)
				if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseUnregisterSharedVault(log types.Log) (*IBaseSlashingUnregisterSharedVault, error) {
	event := new(IBaseSlashingUnregisterSharedVault)
	if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterSharedVault", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingUnregisterTokenIterator is returned from FilterUnregisterToken and is used to iterate over the raw logs and unpacked data for UnregisterToken events raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterTokenIterator struct {
	Event *IBaseSlashingUnregisterToken // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingUnregisterTokenIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingUnregisterToken)
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
		it.Event = new(IBaseSlashingUnregisterToken)
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
func (it *IBaseSlashingUnregisterTokenIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingUnregisterTokenIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingUnregisterToken represents a UnregisterToken event raised by the IBaseSlashing contract.
type IBaseSlashingUnregisterToken struct {
	Token common.Address
	Raw   types.Log // Blockchain specific contextual infos
}

// FilterUnregisterToken is a free log retrieval operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterUnregisterToken(opts *bind.FilterOpts, token []common.Address) (*IBaseSlashingUnregisterTokenIterator, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingUnregisterTokenIterator{contract: _IBaseSlashing.contract, event: "UnregisterToken", logs: logs, sub: sub}, nil
}

// WatchUnregisterToken is a free log subscription operation binding the contract event 0xca2a890939276223a9122217752c67608466faee388aff53f077d00a186a389b.
//
// Solidity: event UnregisterToken(address indexed token)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchUnregisterToken(opts *bind.WatchOpts, sink chan<- *IBaseSlashingUnregisterToken, token []common.Address) (event.Subscription, error) {

	var tokenRule []interface{}
	for _, tokenItem := range token {
		tokenRule = append(tokenRule, tokenItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "UnregisterToken", tokenRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingUnregisterToken)
				if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
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
func (_IBaseSlashing *IBaseSlashingFilterer) ParseUnregisterToken(log types.Log) (*IBaseSlashingUnregisterToken, error) {
	event := new(IBaseSlashingUnregisterToken)
	if err := _IBaseSlashing.contract.UnpackLog(event, "UnregisterToken", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IBaseSlashingVetoSlashIterator is returned from FilterVetoSlash and is used to iterate over the raw logs and unpacked data for VetoSlash events raised by the IBaseSlashing contract.
type IBaseSlashingVetoSlashIterator struct {
	Event *IBaseSlashingVetoSlash // Event containing the contract specifics and raw log

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
func (it *IBaseSlashingVetoSlashIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IBaseSlashingVetoSlash)
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
		it.Event = new(IBaseSlashingVetoSlash)
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
func (it *IBaseSlashingVetoSlashIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IBaseSlashingVetoSlashIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IBaseSlashingVetoSlash represents a VetoSlash event raised by the IBaseSlashing contract.
type IBaseSlashingVetoSlash struct {
	Slasher    common.Address
	Operator   common.Address
	Success    bool
	SlashIndex *big.Int
	Raw        types.Log // Blockchain specific contextual infos
}

// FilterVetoSlash is a free log retrieval operation binding the contract event 0xdb0a74dbd84722062e6d4cf7a0fe6571ab288f67da21ce1c100dac3399e01ed4.
//
// Solidity: event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex)
func (_IBaseSlashing *IBaseSlashingFilterer) FilterVetoSlash(opts *bind.FilterOpts, slasher []common.Address, operator []common.Address, success []bool) (*IBaseSlashingVetoSlashIterator, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.FilterLogs(opts, "VetoSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return &IBaseSlashingVetoSlashIterator{contract: _IBaseSlashing.contract, event: "VetoSlash", logs: logs, sub: sub}, nil
}

// WatchVetoSlash is a free log subscription operation binding the contract event 0xdb0a74dbd84722062e6d4cf7a0fe6571ab288f67da21ce1c100dac3399e01ed4.
//
// Solidity: event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex)
func (_IBaseSlashing *IBaseSlashingFilterer) WatchVetoSlash(opts *bind.WatchOpts, sink chan<- *IBaseSlashingVetoSlash, slasher []common.Address, operator []common.Address, success []bool) (event.Subscription, error) {

	var slasherRule []interface{}
	for _, slasherItem := range slasher {
		slasherRule = append(slasherRule, slasherItem)
	}
	var operatorRule []interface{}
	for _, operatorItem := range operator {
		operatorRule = append(operatorRule, operatorItem)
	}
	var successRule []interface{}
	for _, successItem := range success {
		successRule = append(successRule, successItem)
	}

	logs, sub, err := _IBaseSlashing.contract.WatchLogs(opts, "VetoSlash", slasherRule, operatorRule, successRule)
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IBaseSlashingVetoSlash)
				if err := _IBaseSlashing.contract.UnpackLog(event, "VetoSlash", log); err != nil {
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

// ParseVetoSlash is a log parse operation binding the contract event 0xdb0a74dbd84722062e6d4cf7a0fe6571ab288f67da21ce1c100dac3399e01ed4.
//
// Solidity: event VetoSlash(address indexed slasher, address indexed operator, bool indexed success, uint256 slashIndex)
func (_IBaseSlashing *IBaseSlashingFilterer) ParseVetoSlash(log types.Log) (*IBaseSlashingVetoSlash, error) {
	event := new(IBaseSlashingVetoSlash)
	if err := _IBaseSlashing.contract.UnpackLog(event, "VetoSlash", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

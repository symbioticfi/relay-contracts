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

// ISettlementExtraData is an auto generated low-level Go binding around an user-defined struct.
type ISettlementExtraData struct {
	Key   [32]byte
	Value [32]byte
}

// ISettlementValSetHeader is an auto generated low-level Go binding around an user-defined struct.
type ISettlementValSetHeader struct {
	Version            uint8
	RequiredKeyTag     uint8
	Epoch              *big.Int
	CaptureTimestamp   *big.Int
	QuorumThreshold    *big.Int
	TotalVotingPower   *big.Int
	ValidatorsSszMRoot [32]byte
}

// ISettlementMetaData contains all meta data concerning the ISettlement contract.
var ISettlementMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"VALIDATOR_SET_VERSION\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"commitValSetHeader\",\"inputs\":[{\"name\":\"header\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"getCaptureTimestampFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCaptureTimestampFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getExtraData\",\"inputs\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getExtraDataAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getLastCommittedHeaderEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholdFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholdFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTagFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTagFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSigVerifier\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSigVerifierAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTotalVotingPowerFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getTotalVotingPowerFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeaderHash\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValSetHeaderHashAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValidatorsSszMRootFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getValidatorsSszMRootFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVersionFromValSetHeader\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVersionFromValSetHeaderAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isValSetHeaderCommittedAt\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"setGenesis\",\"inputs\":[{\"name\":\"valSetHeader\",\"type\":\"tuple\",\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setSigVerifier\",\"inputs\":[{\"name\":\"sigVerifier\",\"type\":\"address\",\"internalType\":\"address\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"verifyQuorumSig\",\"inputs\":[{\"name\":\"message\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"verifyQuorumSigAt\",\"inputs\":[{\"name\":\"message\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"proof\",\"type\":\"bytes\",\"internalType\":\"bytes\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"hint\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"event\",\"name\":\"CommitValSetHeader\",\"inputs\":[{\"name\":\"valSetHeader\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"indexed\":false,\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitSigVerifier\",\"inputs\":[{\"name\":\"sigVerifier\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetGenesis\",\"inputs\":[{\"name\":\"valSetHeader\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structISettlement.ValSetHeader\",\"components\":[{\"name\":\"version\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"requiredKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"captureTimestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"quorumThreshold\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"totalVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"validatorsSszMRoot\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]},{\"name\":\"extraData\",\"type\":\"tuple[]\",\"indexed\":false,\"internalType\":\"structISettlement.ExtraData[]\",\"components\":[{\"name\":\"key\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"},{\"name\":\"value\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetSigVerifier\",\"inputs\":[{\"name\":\"sigVerifier\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"Settlement_DuplicateExtraDataKey\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidCaptureTimestamp\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidEpoch\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidSigVerifier\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidValidatorsSszMRoot\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_InvalidVersion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_QuorumThresholdGtTotalVotingPower\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_ValSetHeaderAlreadyCommitted\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"Settlement_VerificationFailed\",\"inputs\":[]}]",
}

// ISettlementABI is the input ABI used to generate the binding from.
// Deprecated: Use ISettlementMetaData.ABI instead.
var ISettlementABI = ISettlementMetaData.ABI

// ISettlement is an auto generated Go binding around an Ethereum contract.
type ISettlement struct {
	ISettlementCaller     // Read-only binding to the contract
	ISettlementTransactor // Write-only binding to the contract
	ISettlementFilterer   // Log filterer for contract events
}

// ISettlementCaller is an auto generated read-only Go binding around an Ethereum contract.
type ISettlementCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISettlementTransactor is an auto generated write-only Go binding around an Ethereum contract.
type ISettlementTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISettlementFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type ISettlementFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ISettlementSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type ISettlementSession struct {
	Contract     *ISettlement      // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// ISettlementCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type ISettlementCallerSession struct {
	Contract *ISettlementCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts      // Call options to use throughout this session
}

// ISettlementTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type ISettlementTransactorSession struct {
	Contract     *ISettlementTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts      // Transaction auth options to use throughout this session
}

// ISettlementRaw is an auto generated low-level Go binding around an Ethereum contract.
type ISettlementRaw struct {
	Contract *ISettlement // Generic contract binding to access the raw methods on
}

// ISettlementCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type ISettlementCallerRaw struct {
	Contract *ISettlementCaller // Generic read-only contract binding to access the raw methods on
}

// ISettlementTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type ISettlementTransactorRaw struct {
	Contract *ISettlementTransactor // Generic write-only contract binding to access the raw methods on
}

// NewISettlement creates a new instance of ISettlement, bound to a specific deployed contract.
func NewISettlement(address common.Address, backend bind.ContractBackend) (*ISettlement, error) {
	contract, err := bindISettlement(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &ISettlement{ISettlementCaller: ISettlementCaller{contract: contract}, ISettlementTransactor: ISettlementTransactor{contract: contract}, ISettlementFilterer: ISettlementFilterer{contract: contract}}, nil
}

// NewISettlementCaller creates a new read-only instance of ISettlement, bound to a specific deployed contract.
func NewISettlementCaller(address common.Address, caller bind.ContractCaller) (*ISettlementCaller, error) {
	contract, err := bindISettlement(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &ISettlementCaller{contract: contract}, nil
}

// NewISettlementTransactor creates a new write-only instance of ISettlement, bound to a specific deployed contract.
func NewISettlementTransactor(address common.Address, transactor bind.ContractTransactor) (*ISettlementTransactor, error) {
	contract, err := bindISettlement(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &ISettlementTransactor{contract: contract}, nil
}

// NewISettlementFilterer creates a new log filterer instance of ISettlement, bound to a specific deployed contract.
func NewISettlementFilterer(address common.Address, filterer bind.ContractFilterer) (*ISettlementFilterer, error) {
	contract, err := bindISettlement(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &ISettlementFilterer{contract: contract}, nil
}

// bindISettlement binds a generic wrapper to an already deployed contract.
func bindISettlement(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := ISettlementMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISettlement *ISettlementRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISettlement.Contract.ISettlementCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISettlement *ISettlementRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISettlement.Contract.ISettlementTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISettlement *ISettlementRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISettlement.Contract.ISettlementTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ISettlement *ISettlementCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ISettlement.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ISettlement *ISettlementTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ISettlement.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ISettlement *ISettlementTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ISettlement.Contract.contract.Transact(opts, method, params...)
}

// VALIDATORSETVERSION is a free data retrieval call binding the contract method 0x321d7b8d.
//
// Solidity: function VALIDATOR_SET_VERSION() view returns(uint8)
func (_ISettlement *ISettlementCaller) VALIDATORSETVERSION(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "VALIDATOR_SET_VERSION")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// VALIDATORSETVERSION is a free data retrieval call binding the contract method 0x321d7b8d.
//
// Solidity: function VALIDATOR_SET_VERSION() view returns(uint8)
func (_ISettlement *ISettlementSession) VALIDATORSETVERSION() (uint8, error) {
	return _ISettlement.Contract.VALIDATORSETVERSION(&_ISettlement.CallOpts)
}

// VALIDATORSETVERSION is a free data retrieval call binding the contract method 0x321d7b8d.
//
// Solidity: function VALIDATOR_SET_VERSION() view returns(uint8)
func (_ISettlement *ISettlementCallerSession) VALIDATORSETVERSION() (uint8, error) {
	return _ISettlement.Contract.VALIDATORSETVERSION(&_ISettlement.CallOpts)
}

// GetCaptureTimestampFromValSetHeader is a free data retrieval call binding the contract method 0xf4935d39.
//
// Solidity: function getCaptureTimestampFromValSetHeader() view returns(uint48)
func (_ISettlement *ISettlementCaller) GetCaptureTimestampFromValSetHeader(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getCaptureTimestampFromValSetHeader")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCaptureTimestampFromValSetHeader is a free data retrieval call binding the contract method 0xf4935d39.
//
// Solidity: function getCaptureTimestampFromValSetHeader() view returns(uint48)
func (_ISettlement *ISettlementSession) GetCaptureTimestampFromValSetHeader() (*big.Int, error) {
	return _ISettlement.Contract.GetCaptureTimestampFromValSetHeader(&_ISettlement.CallOpts)
}

// GetCaptureTimestampFromValSetHeader is a free data retrieval call binding the contract method 0xf4935d39.
//
// Solidity: function getCaptureTimestampFromValSetHeader() view returns(uint48)
func (_ISettlement *ISettlementCallerSession) GetCaptureTimestampFromValSetHeader() (*big.Int, error) {
	return _ISettlement.Contract.GetCaptureTimestampFromValSetHeader(&_ISettlement.CallOpts)
}

// GetCaptureTimestampFromValSetHeaderAt is a free data retrieval call binding the contract method 0x5485b549.
//
// Solidity: function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) view returns(uint48)
func (_ISettlement *ISettlementCaller) GetCaptureTimestampFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getCaptureTimestampFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCaptureTimestampFromValSetHeaderAt is a free data retrieval call binding the contract method 0x5485b549.
//
// Solidity: function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) view returns(uint48)
func (_ISettlement *ISettlementSession) GetCaptureTimestampFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _ISettlement.Contract.GetCaptureTimestampFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetCaptureTimestampFromValSetHeaderAt is a free data retrieval call binding the contract method 0x5485b549.
//
// Solidity: function getCaptureTimestampFromValSetHeaderAt(uint48 epoch) view returns(uint48)
func (_ISettlement *ISettlementCallerSession) GetCaptureTimestampFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _ISettlement.Contract.GetCaptureTimestampFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetExtraData is a free data retrieval call binding the contract method 0xecae6344.
//
// Solidity: function getExtraData(bytes32 key) view returns(bytes32)
func (_ISettlement *ISettlementCaller) GetExtraData(opts *bind.CallOpts, key [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getExtraData", key)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetExtraData is a free data retrieval call binding the contract method 0xecae6344.
//
// Solidity: function getExtraData(bytes32 key) view returns(bytes32)
func (_ISettlement *ISettlementSession) GetExtraData(key [32]byte) ([32]byte, error) {
	return _ISettlement.Contract.GetExtraData(&_ISettlement.CallOpts, key)
}

// GetExtraData is a free data retrieval call binding the contract method 0xecae6344.
//
// Solidity: function getExtraData(bytes32 key) view returns(bytes32)
func (_ISettlement *ISettlementCallerSession) GetExtraData(key [32]byte) ([32]byte, error) {
	return _ISettlement.Contract.GetExtraData(&_ISettlement.CallOpts, key)
}

// GetExtraDataAt is a free data retrieval call binding the contract method 0x52bb038a.
//
// Solidity: function getExtraDataAt(uint48 epoch, bytes32 key) view returns(bytes32)
func (_ISettlement *ISettlementCaller) GetExtraDataAt(opts *bind.CallOpts, epoch *big.Int, key [32]byte) ([32]byte, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getExtraDataAt", epoch, key)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetExtraDataAt is a free data retrieval call binding the contract method 0x52bb038a.
//
// Solidity: function getExtraDataAt(uint48 epoch, bytes32 key) view returns(bytes32)
func (_ISettlement *ISettlementSession) GetExtraDataAt(epoch *big.Int, key [32]byte) ([32]byte, error) {
	return _ISettlement.Contract.GetExtraDataAt(&_ISettlement.CallOpts, epoch, key)
}

// GetExtraDataAt is a free data retrieval call binding the contract method 0x52bb038a.
//
// Solidity: function getExtraDataAt(uint48 epoch, bytes32 key) view returns(bytes32)
func (_ISettlement *ISettlementCallerSession) GetExtraDataAt(epoch *big.Int, key [32]byte) ([32]byte, error) {
	return _ISettlement.Contract.GetExtraDataAt(&_ISettlement.CallOpts, epoch, key)
}

// GetLastCommittedHeaderEpoch is a free data retrieval call binding the contract method 0x65b0849b.
//
// Solidity: function getLastCommittedHeaderEpoch() view returns(uint48)
func (_ISettlement *ISettlementCaller) GetLastCommittedHeaderEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getLastCommittedHeaderEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetLastCommittedHeaderEpoch is a free data retrieval call binding the contract method 0x65b0849b.
//
// Solidity: function getLastCommittedHeaderEpoch() view returns(uint48)
func (_ISettlement *ISettlementSession) GetLastCommittedHeaderEpoch() (*big.Int, error) {
	return _ISettlement.Contract.GetLastCommittedHeaderEpoch(&_ISettlement.CallOpts)
}

// GetLastCommittedHeaderEpoch is a free data retrieval call binding the contract method 0x65b0849b.
//
// Solidity: function getLastCommittedHeaderEpoch() view returns(uint48)
func (_ISettlement *ISettlementCallerSession) GetLastCommittedHeaderEpoch() (*big.Int, error) {
	return _ISettlement.Contract.GetLastCommittedHeaderEpoch(&_ISettlement.CallOpts)
}

// GetQuorumThresholdFromValSetHeader is a free data retrieval call binding the contract method 0xe586b38e.
//
// Solidity: function getQuorumThresholdFromValSetHeader() view returns(uint256)
func (_ISettlement *ISettlementCaller) GetQuorumThresholdFromValSetHeader(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getQuorumThresholdFromValSetHeader")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetQuorumThresholdFromValSetHeader is a free data retrieval call binding the contract method 0xe586b38e.
//
// Solidity: function getQuorumThresholdFromValSetHeader() view returns(uint256)
func (_ISettlement *ISettlementSession) GetQuorumThresholdFromValSetHeader() (*big.Int, error) {
	return _ISettlement.Contract.GetQuorumThresholdFromValSetHeader(&_ISettlement.CallOpts)
}

// GetQuorumThresholdFromValSetHeader is a free data retrieval call binding the contract method 0xe586b38e.
//
// Solidity: function getQuorumThresholdFromValSetHeader() view returns(uint256)
func (_ISettlement *ISettlementCallerSession) GetQuorumThresholdFromValSetHeader() (*big.Int, error) {
	return _ISettlement.Contract.GetQuorumThresholdFromValSetHeader(&_ISettlement.CallOpts)
}

// GetQuorumThresholdFromValSetHeaderAt is a free data retrieval call binding the contract method 0x1d86bd88.
//
// Solidity: function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_ISettlement *ISettlementCaller) GetQuorumThresholdFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getQuorumThresholdFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetQuorumThresholdFromValSetHeaderAt is a free data retrieval call binding the contract method 0x1d86bd88.
//
// Solidity: function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_ISettlement *ISettlementSession) GetQuorumThresholdFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _ISettlement.Contract.GetQuorumThresholdFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetQuorumThresholdFromValSetHeaderAt is a free data retrieval call binding the contract method 0x1d86bd88.
//
// Solidity: function getQuorumThresholdFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_ISettlement *ISettlementCallerSession) GetQuorumThresholdFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _ISettlement.Contract.GetQuorumThresholdFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetRequiredKeyTagFromValSetHeader is a free data retrieval call binding the contract method 0xb91a434a.
//
// Solidity: function getRequiredKeyTagFromValSetHeader() view returns(uint8)
func (_ISettlement *ISettlementCaller) GetRequiredKeyTagFromValSetHeader(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getRequiredKeyTagFromValSetHeader")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredKeyTagFromValSetHeader is a free data retrieval call binding the contract method 0xb91a434a.
//
// Solidity: function getRequiredKeyTagFromValSetHeader() view returns(uint8)
func (_ISettlement *ISettlementSession) GetRequiredKeyTagFromValSetHeader() (uint8, error) {
	return _ISettlement.Contract.GetRequiredKeyTagFromValSetHeader(&_ISettlement.CallOpts)
}

// GetRequiredKeyTagFromValSetHeader is a free data retrieval call binding the contract method 0xb91a434a.
//
// Solidity: function getRequiredKeyTagFromValSetHeader() view returns(uint8)
func (_ISettlement *ISettlementCallerSession) GetRequiredKeyTagFromValSetHeader() (uint8, error) {
	return _ISettlement.Contract.GetRequiredKeyTagFromValSetHeader(&_ISettlement.CallOpts)
}

// GetRequiredKeyTagFromValSetHeaderAt is a free data retrieval call binding the contract method 0xe4378ed2.
//
// Solidity: function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_ISettlement *ISettlementCaller) GetRequiredKeyTagFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (uint8, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getRequiredKeyTagFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredKeyTagFromValSetHeaderAt is a free data retrieval call binding the contract method 0xe4378ed2.
//
// Solidity: function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_ISettlement *ISettlementSession) GetRequiredKeyTagFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _ISettlement.Contract.GetRequiredKeyTagFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetRequiredKeyTagFromValSetHeaderAt is a free data retrieval call binding the contract method 0xe4378ed2.
//
// Solidity: function getRequiredKeyTagFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_ISettlement *ISettlementCallerSession) GetRequiredKeyTagFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _ISettlement.Contract.GetRequiredKeyTagFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetSigVerifier is a free data retrieval call binding the contract method 0x5b28556d.
//
// Solidity: function getSigVerifier() view returns(address)
func (_ISettlement *ISettlementCaller) GetSigVerifier(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getSigVerifier")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetSigVerifier is a free data retrieval call binding the contract method 0x5b28556d.
//
// Solidity: function getSigVerifier() view returns(address)
func (_ISettlement *ISettlementSession) GetSigVerifier() (common.Address, error) {
	return _ISettlement.Contract.GetSigVerifier(&_ISettlement.CallOpts)
}

// GetSigVerifier is a free data retrieval call binding the contract method 0x5b28556d.
//
// Solidity: function getSigVerifier() view returns(address)
func (_ISettlement *ISettlementCallerSession) GetSigVerifier() (common.Address, error) {
	return _ISettlement.Contract.GetSigVerifier(&_ISettlement.CallOpts)
}

// GetSigVerifierAt is a free data retrieval call binding the contract method 0xa54ce263.
//
// Solidity: function getSigVerifierAt(uint48 epoch, bytes hint) view returns(address)
func (_ISettlement *ISettlementCaller) GetSigVerifierAt(opts *bind.CallOpts, epoch *big.Int, hint []byte) (common.Address, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getSigVerifierAt", epoch, hint)

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// GetSigVerifierAt is a free data retrieval call binding the contract method 0xa54ce263.
//
// Solidity: function getSigVerifierAt(uint48 epoch, bytes hint) view returns(address)
func (_ISettlement *ISettlementSession) GetSigVerifierAt(epoch *big.Int, hint []byte) (common.Address, error) {
	return _ISettlement.Contract.GetSigVerifierAt(&_ISettlement.CallOpts, epoch, hint)
}

// GetSigVerifierAt is a free data retrieval call binding the contract method 0xa54ce263.
//
// Solidity: function getSigVerifierAt(uint48 epoch, bytes hint) view returns(address)
func (_ISettlement *ISettlementCallerSession) GetSigVerifierAt(epoch *big.Int, hint []byte) (common.Address, error) {
	return _ISettlement.Contract.GetSigVerifierAt(&_ISettlement.CallOpts, epoch, hint)
}

// GetTotalVotingPowerFromValSetHeader is a free data retrieval call binding the contract method 0xc38de37f.
//
// Solidity: function getTotalVotingPowerFromValSetHeader() view returns(uint256)
func (_ISettlement *ISettlementCaller) GetTotalVotingPowerFromValSetHeader(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getTotalVotingPowerFromValSetHeader")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTotalVotingPowerFromValSetHeader is a free data retrieval call binding the contract method 0xc38de37f.
//
// Solidity: function getTotalVotingPowerFromValSetHeader() view returns(uint256)
func (_ISettlement *ISettlementSession) GetTotalVotingPowerFromValSetHeader() (*big.Int, error) {
	return _ISettlement.Contract.GetTotalVotingPowerFromValSetHeader(&_ISettlement.CallOpts)
}

// GetTotalVotingPowerFromValSetHeader is a free data retrieval call binding the contract method 0xc38de37f.
//
// Solidity: function getTotalVotingPowerFromValSetHeader() view returns(uint256)
func (_ISettlement *ISettlementCallerSession) GetTotalVotingPowerFromValSetHeader() (*big.Int, error) {
	return _ISettlement.Contract.GetTotalVotingPowerFromValSetHeader(&_ISettlement.CallOpts)
}

// GetTotalVotingPowerFromValSetHeaderAt is a free data retrieval call binding the contract method 0xf7e5b491.
//
// Solidity: function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_ISettlement *ISettlementCaller) GetTotalVotingPowerFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getTotalVotingPowerFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetTotalVotingPowerFromValSetHeaderAt is a free data retrieval call binding the contract method 0xf7e5b491.
//
// Solidity: function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_ISettlement *ISettlementSession) GetTotalVotingPowerFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _ISettlement.Contract.GetTotalVotingPowerFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetTotalVotingPowerFromValSetHeaderAt is a free data retrieval call binding the contract method 0xf7e5b491.
//
// Solidity: function getTotalVotingPowerFromValSetHeaderAt(uint48 epoch) view returns(uint256)
func (_ISettlement *ISettlementCallerSession) GetTotalVotingPowerFromValSetHeaderAt(epoch *big.Int) (*big.Int, error) {
	return _ISettlement.Contract.GetTotalVotingPowerFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetValSetHeader is a free data retrieval call binding the contract method 0xadc91fc8.
//
// Solidity: function getValSetHeader() view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_ISettlement *ISettlementCaller) GetValSetHeader(opts *bind.CallOpts) (ISettlementValSetHeader, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getValSetHeader")

	if err != nil {
		return *new(ISettlementValSetHeader), err
	}

	out0 := *abi.ConvertType(out[0], new(ISettlementValSetHeader)).(*ISettlementValSetHeader)

	return out0, err

}

// GetValSetHeader is a free data retrieval call binding the contract method 0xadc91fc8.
//
// Solidity: function getValSetHeader() view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_ISettlement *ISettlementSession) GetValSetHeader() (ISettlementValSetHeader, error) {
	return _ISettlement.Contract.GetValSetHeader(&_ISettlement.CallOpts)
}

// GetValSetHeader is a free data retrieval call binding the contract method 0xadc91fc8.
//
// Solidity: function getValSetHeader() view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_ISettlement *ISettlementCallerSession) GetValSetHeader() (ISettlementValSetHeader, error) {
	return _ISettlement.Contract.GetValSetHeader(&_ISettlement.CallOpts)
}

// GetValSetHeaderAt is a free data retrieval call binding the contract method 0x4addaee7.
//
// Solidity: function getValSetHeaderAt(uint48 epoch) view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_ISettlement *ISettlementCaller) GetValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (ISettlementValSetHeader, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getValSetHeaderAt", epoch)

	if err != nil {
		return *new(ISettlementValSetHeader), err
	}

	out0 := *abi.ConvertType(out[0], new(ISettlementValSetHeader)).(*ISettlementValSetHeader)

	return out0, err

}

// GetValSetHeaderAt is a free data retrieval call binding the contract method 0x4addaee7.
//
// Solidity: function getValSetHeaderAt(uint48 epoch) view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_ISettlement *ISettlementSession) GetValSetHeaderAt(epoch *big.Int) (ISettlementValSetHeader, error) {
	return _ISettlement.Contract.GetValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetValSetHeaderAt is a free data retrieval call binding the contract method 0x4addaee7.
//
// Solidity: function getValSetHeaderAt(uint48 epoch) view returns((uint8,uint8,uint48,uint48,uint256,uint256,bytes32))
func (_ISettlement *ISettlementCallerSession) GetValSetHeaderAt(epoch *big.Int) (ISettlementValSetHeader, error) {
	return _ISettlement.Contract.GetValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetValSetHeaderHash is a free data retrieval call binding the contract method 0x32624bf3.
//
// Solidity: function getValSetHeaderHash() view returns(bytes32)
func (_ISettlement *ISettlementCaller) GetValSetHeaderHash(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getValSetHeaderHash")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValSetHeaderHash is a free data retrieval call binding the contract method 0x32624bf3.
//
// Solidity: function getValSetHeaderHash() view returns(bytes32)
func (_ISettlement *ISettlementSession) GetValSetHeaderHash() ([32]byte, error) {
	return _ISettlement.Contract.GetValSetHeaderHash(&_ISettlement.CallOpts)
}

// GetValSetHeaderHash is a free data retrieval call binding the contract method 0x32624bf3.
//
// Solidity: function getValSetHeaderHash() view returns(bytes32)
func (_ISettlement *ISettlementCallerSession) GetValSetHeaderHash() ([32]byte, error) {
	return _ISettlement.Contract.GetValSetHeaderHash(&_ISettlement.CallOpts)
}

// GetValSetHeaderHashAt is a free data retrieval call binding the contract method 0xf35d12a3.
//
// Solidity: function getValSetHeaderHashAt(uint48 epoch) view returns(bytes32)
func (_ISettlement *ISettlementCaller) GetValSetHeaderHashAt(opts *bind.CallOpts, epoch *big.Int) ([32]byte, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getValSetHeaderHashAt", epoch)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValSetHeaderHashAt is a free data retrieval call binding the contract method 0xf35d12a3.
//
// Solidity: function getValSetHeaderHashAt(uint48 epoch) view returns(bytes32)
func (_ISettlement *ISettlementSession) GetValSetHeaderHashAt(epoch *big.Int) ([32]byte, error) {
	return _ISettlement.Contract.GetValSetHeaderHashAt(&_ISettlement.CallOpts, epoch)
}

// GetValSetHeaderHashAt is a free data retrieval call binding the contract method 0xf35d12a3.
//
// Solidity: function getValSetHeaderHashAt(uint48 epoch) view returns(bytes32)
func (_ISettlement *ISettlementCallerSession) GetValSetHeaderHashAt(epoch *big.Int) ([32]byte, error) {
	return _ISettlement.Contract.GetValSetHeaderHashAt(&_ISettlement.CallOpts, epoch)
}

// GetValidatorsSszMRootFromValSetHeader is a free data retrieval call binding the contract method 0x0167166e.
//
// Solidity: function getValidatorsSszMRootFromValSetHeader() view returns(bytes32)
func (_ISettlement *ISettlementCaller) GetValidatorsSszMRootFromValSetHeader(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getValidatorsSszMRootFromValSetHeader")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValidatorsSszMRootFromValSetHeader is a free data retrieval call binding the contract method 0x0167166e.
//
// Solidity: function getValidatorsSszMRootFromValSetHeader() view returns(bytes32)
func (_ISettlement *ISettlementSession) GetValidatorsSszMRootFromValSetHeader() ([32]byte, error) {
	return _ISettlement.Contract.GetValidatorsSszMRootFromValSetHeader(&_ISettlement.CallOpts)
}

// GetValidatorsSszMRootFromValSetHeader is a free data retrieval call binding the contract method 0x0167166e.
//
// Solidity: function getValidatorsSszMRootFromValSetHeader() view returns(bytes32)
func (_ISettlement *ISettlementCallerSession) GetValidatorsSszMRootFromValSetHeader() ([32]byte, error) {
	return _ISettlement.Contract.GetValidatorsSszMRootFromValSetHeader(&_ISettlement.CallOpts)
}

// GetValidatorsSszMRootFromValSetHeaderAt is a free data retrieval call binding the contract method 0x230ae408.
//
// Solidity: function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) view returns(bytes32)
func (_ISettlement *ISettlementCaller) GetValidatorsSszMRootFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) ([32]byte, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getValidatorsSszMRootFromValSetHeaderAt", epoch)

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// GetValidatorsSszMRootFromValSetHeaderAt is a free data retrieval call binding the contract method 0x230ae408.
//
// Solidity: function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) view returns(bytes32)
func (_ISettlement *ISettlementSession) GetValidatorsSszMRootFromValSetHeaderAt(epoch *big.Int) ([32]byte, error) {
	return _ISettlement.Contract.GetValidatorsSszMRootFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetValidatorsSszMRootFromValSetHeaderAt is a free data retrieval call binding the contract method 0x230ae408.
//
// Solidity: function getValidatorsSszMRootFromValSetHeaderAt(uint48 epoch) view returns(bytes32)
func (_ISettlement *ISettlementCallerSession) GetValidatorsSszMRootFromValSetHeaderAt(epoch *big.Int) ([32]byte, error) {
	return _ISettlement.Contract.GetValidatorsSszMRootFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetVersionFromValSetHeader is a free data retrieval call binding the contract method 0xd2df9fb6.
//
// Solidity: function getVersionFromValSetHeader() view returns(uint8)
func (_ISettlement *ISettlementCaller) GetVersionFromValSetHeader(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getVersionFromValSetHeader")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetVersionFromValSetHeader is a free data retrieval call binding the contract method 0xd2df9fb6.
//
// Solidity: function getVersionFromValSetHeader() view returns(uint8)
func (_ISettlement *ISettlementSession) GetVersionFromValSetHeader() (uint8, error) {
	return _ISettlement.Contract.GetVersionFromValSetHeader(&_ISettlement.CallOpts)
}

// GetVersionFromValSetHeader is a free data retrieval call binding the contract method 0xd2df9fb6.
//
// Solidity: function getVersionFromValSetHeader() view returns(uint8)
func (_ISettlement *ISettlementCallerSession) GetVersionFromValSetHeader() (uint8, error) {
	return _ISettlement.Contract.GetVersionFromValSetHeader(&_ISettlement.CallOpts)
}

// GetVersionFromValSetHeaderAt is a free data retrieval call binding the contract method 0x548202ad.
//
// Solidity: function getVersionFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_ISettlement *ISettlementCaller) GetVersionFromValSetHeaderAt(opts *bind.CallOpts, epoch *big.Int) (uint8, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "getVersionFromValSetHeaderAt", epoch)

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetVersionFromValSetHeaderAt is a free data retrieval call binding the contract method 0x548202ad.
//
// Solidity: function getVersionFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_ISettlement *ISettlementSession) GetVersionFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _ISettlement.Contract.GetVersionFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// GetVersionFromValSetHeaderAt is a free data retrieval call binding the contract method 0x548202ad.
//
// Solidity: function getVersionFromValSetHeaderAt(uint48 epoch) view returns(uint8)
func (_ISettlement *ISettlementCallerSession) GetVersionFromValSetHeaderAt(epoch *big.Int) (uint8, error) {
	return _ISettlement.Contract.GetVersionFromValSetHeaderAt(&_ISettlement.CallOpts, epoch)
}

// IsValSetHeaderCommittedAt is a free data retrieval call binding the contract method 0x5fa4bbd2.
//
// Solidity: function isValSetHeaderCommittedAt(uint48 epoch) view returns(bool)
func (_ISettlement *ISettlementCaller) IsValSetHeaderCommittedAt(opts *bind.CallOpts, epoch *big.Int) (bool, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "isValSetHeaderCommittedAt", epoch)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsValSetHeaderCommittedAt is a free data retrieval call binding the contract method 0x5fa4bbd2.
//
// Solidity: function isValSetHeaderCommittedAt(uint48 epoch) view returns(bool)
func (_ISettlement *ISettlementSession) IsValSetHeaderCommittedAt(epoch *big.Int) (bool, error) {
	return _ISettlement.Contract.IsValSetHeaderCommittedAt(&_ISettlement.CallOpts, epoch)
}

// IsValSetHeaderCommittedAt is a free data retrieval call binding the contract method 0x5fa4bbd2.
//
// Solidity: function isValSetHeaderCommittedAt(uint48 epoch) view returns(bool)
func (_ISettlement *ISettlementCallerSession) IsValSetHeaderCommittedAt(epoch *big.Int) (bool, error) {
	return _ISettlement.Contract.IsValSetHeaderCommittedAt(&_ISettlement.CallOpts, epoch)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0x1dc1898b.
//
// Solidity: function verifyQuorumSig(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISettlement *ISettlementCaller) VerifyQuorumSig(opts *bind.CallOpts, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "verifyQuorumSig", message, keyTag, quorumThreshold, proof)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0x1dc1898b.
//
// Solidity: function verifyQuorumSig(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISettlement *ISettlementSession) VerifyQuorumSig(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _ISettlement.Contract.VerifyQuorumSig(&_ISettlement.CallOpts, message, keyTag, quorumThreshold, proof)
}

// VerifyQuorumSig is a free data retrieval call binding the contract method 0x1dc1898b.
//
// Solidity: function verifyQuorumSig(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof) view returns(bool)
func (_ISettlement *ISettlementCallerSession) VerifyQuorumSig(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte) (bool, error) {
	return _ISettlement.Contract.VerifyQuorumSig(&_ISettlement.CallOpts, message, keyTag, quorumThreshold, proof)
}

// VerifyQuorumSigAt is a free data retrieval call binding the contract method 0xacaa2269.
//
// Solidity: function verifyQuorumSigAt(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof, uint48 epoch, bytes hint) view returns(bool)
func (_ISettlement *ISettlementCaller) VerifyQuorumSigAt(opts *bind.CallOpts, message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte, epoch *big.Int, hint []byte) (bool, error) {
	var out []interface{}
	err := _ISettlement.contract.Call(opts, &out, "verifyQuorumSigAt", message, keyTag, quorumThreshold, proof, epoch, hint)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// VerifyQuorumSigAt is a free data retrieval call binding the contract method 0xacaa2269.
//
// Solidity: function verifyQuorumSigAt(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof, uint48 epoch, bytes hint) view returns(bool)
func (_ISettlement *ISettlementSession) VerifyQuorumSigAt(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte, epoch *big.Int, hint []byte) (bool, error) {
	return _ISettlement.Contract.VerifyQuorumSigAt(&_ISettlement.CallOpts, message, keyTag, quorumThreshold, proof, epoch, hint)
}

// VerifyQuorumSigAt is a free data retrieval call binding the contract method 0xacaa2269.
//
// Solidity: function verifyQuorumSigAt(bytes message, uint8 keyTag, uint256 quorumThreshold, bytes proof, uint48 epoch, bytes hint) view returns(bool)
func (_ISettlement *ISettlementCallerSession) VerifyQuorumSigAt(message []byte, keyTag uint8, quorumThreshold *big.Int, proof []byte, epoch *big.Int, hint []byte) (bool, error) {
	return _ISettlement.Contract.VerifyQuorumSigAt(&_ISettlement.CallOpts, message, keyTag, quorumThreshold, proof, epoch, hint)
}

// CommitValSetHeader is a paid mutator transaction binding the contract method 0x6f5f058e.
//
// Solidity: function commitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header, (bytes32,bytes32)[] extraData, bytes proof) returns()
func (_ISettlement *ISettlementTransactor) CommitValSetHeader(opts *bind.TransactOpts, header ISettlementValSetHeader, extraData []ISettlementExtraData, proof []byte) (*types.Transaction, error) {
	return _ISettlement.contract.Transact(opts, "commitValSetHeader", header, extraData, proof)
}

// CommitValSetHeader is a paid mutator transaction binding the contract method 0x6f5f058e.
//
// Solidity: function commitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header, (bytes32,bytes32)[] extraData, bytes proof) returns()
func (_ISettlement *ISettlementSession) CommitValSetHeader(header ISettlementValSetHeader, extraData []ISettlementExtraData, proof []byte) (*types.Transaction, error) {
	return _ISettlement.Contract.CommitValSetHeader(&_ISettlement.TransactOpts, header, extraData, proof)
}

// CommitValSetHeader is a paid mutator transaction binding the contract method 0x6f5f058e.
//
// Solidity: function commitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) header, (bytes32,bytes32)[] extraData, bytes proof) returns()
func (_ISettlement *ISettlementTransactorSession) CommitValSetHeader(header ISettlementValSetHeader, extraData []ISettlementExtraData, proof []byte) (*types.Transaction, error) {
	return _ISettlement.Contract.CommitValSetHeader(&_ISettlement.TransactOpts, header, extraData, proof)
}

// SetGenesis is a paid mutator transaction binding the contract method 0xec3be7e4.
//
// Solidity: function setGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData) returns()
func (_ISettlement *ISettlementTransactor) SetGenesis(opts *bind.TransactOpts, valSetHeader ISettlementValSetHeader, extraData []ISettlementExtraData) (*types.Transaction, error) {
	return _ISettlement.contract.Transact(opts, "setGenesis", valSetHeader, extraData)
}

// SetGenesis is a paid mutator transaction binding the contract method 0xec3be7e4.
//
// Solidity: function setGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData) returns()
func (_ISettlement *ISettlementSession) SetGenesis(valSetHeader ISettlementValSetHeader, extraData []ISettlementExtraData) (*types.Transaction, error) {
	return _ISettlement.Contract.SetGenesis(&_ISettlement.TransactOpts, valSetHeader, extraData)
}

// SetGenesis is a paid mutator transaction binding the contract method 0xec3be7e4.
//
// Solidity: function setGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData) returns()
func (_ISettlement *ISettlementTransactorSession) SetGenesis(valSetHeader ISettlementValSetHeader, extraData []ISettlementExtraData) (*types.Transaction, error) {
	return _ISettlement.Contract.SetGenesis(&_ISettlement.TransactOpts, valSetHeader, extraData)
}

// SetSigVerifier is a paid mutator transaction binding the contract method 0xbd7e9980.
//
// Solidity: function setSigVerifier(address sigVerifier) returns()
func (_ISettlement *ISettlementTransactor) SetSigVerifier(opts *bind.TransactOpts, sigVerifier common.Address) (*types.Transaction, error) {
	return _ISettlement.contract.Transact(opts, "setSigVerifier", sigVerifier)
}

// SetSigVerifier is a paid mutator transaction binding the contract method 0xbd7e9980.
//
// Solidity: function setSigVerifier(address sigVerifier) returns()
func (_ISettlement *ISettlementSession) SetSigVerifier(sigVerifier common.Address) (*types.Transaction, error) {
	return _ISettlement.Contract.SetSigVerifier(&_ISettlement.TransactOpts, sigVerifier)
}

// SetSigVerifier is a paid mutator transaction binding the contract method 0xbd7e9980.
//
// Solidity: function setSigVerifier(address sigVerifier) returns()
func (_ISettlement *ISettlementTransactorSession) SetSigVerifier(sigVerifier common.Address) (*types.Transaction, error) {
	return _ISettlement.Contract.SetSigVerifier(&_ISettlement.TransactOpts, sigVerifier)
}

// ISettlementCommitValSetHeaderIterator is returned from FilterCommitValSetHeader and is used to iterate over the raw logs and unpacked data for CommitValSetHeader events raised by the ISettlement contract.
type ISettlementCommitValSetHeaderIterator struct {
	Event *ISettlementCommitValSetHeader // Event containing the contract specifics and raw log

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
func (it *ISettlementCommitValSetHeaderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ISettlementCommitValSetHeader)
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
		it.Event = new(ISettlementCommitValSetHeader)
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
func (it *ISettlementCommitValSetHeaderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ISettlementCommitValSetHeaderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ISettlementCommitValSetHeader represents a CommitValSetHeader event raised by the ISettlement contract.
type ISettlementCommitValSetHeader struct {
	ValSetHeader ISettlementValSetHeader
	ExtraData    []ISettlementExtraData
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterCommitValSetHeader is a free log retrieval operation binding the contract event 0x9ed1f51eddfff95a70fd993c30da7d26fc67bda21c9145aafc7d0a510a405558.
//
// Solidity: event CommitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_ISettlement *ISettlementFilterer) FilterCommitValSetHeader(opts *bind.FilterOpts) (*ISettlementCommitValSetHeaderIterator, error) {

	logs, sub, err := _ISettlement.contract.FilterLogs(opts, "CommitValSetHeader")
	if err != nil {
		return nil, err
	}
	return &ISettlementCommitValSetHeaderIterator{contract: _ISettlement.contract, event: "CommitValSetHeader", logs: logs, sub: sub}, nil
}

// WatchCommitValSetHeader is a free log subscription operation binding the contract event 0x9ed1f51eddfff95a70fd993c30da7d26fc67bda21c9145aafc7d0a510a405558.
//
// Solidity: event CommitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_ISettlement *ISettlementFilterer) WatchCommitValSetHeader(opts *bind.WatchOpts, sink chan<- *ISettlementCommitValSetHeader) (event.Subscription, error) {

	logs, sub, err := _ISettlement.contract.WatchLogs(opts, "CommitValSetHeader")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ISettlementCommitValSetHeader)
				if err := _ISettlement.contract.UnpackLog(event, "CommitValSetHeader", log); err != nil {
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

// ParseCommitValSetHeader is a log parse operation binding the contract event 0x9ed1f51eddfff95a70fd993c30da7d26fc67bda21c9145aafc7d0a510a405558.
//
// Solidity: event CommitValSetHeader((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_ISettlement *ISettlementFilterer) ParseCommitValSetHeader(log types.Log) (*ISettlementCommitValSetHeader, error) {
	event := new(ISettlementCommitValSetHeader)
	if err := _ISettlement.contract.UnpackLog(event, "CommitValSetHeader", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ISettlementInitSigVerifierIterator is returned from FilterInitSigVerifier and is used to iterate over the raw logs and unpacked data for InitSigVerifier events raised by the ISettlement contract.
type ISettlementInitSigVerifierIterator struct {
	Event *ISettlementInitSigVerifier // Event containing the contract specifics and raw log

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
func (it *ISettlementInitSigVerifierIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ISettlementInitSigVerifier)
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
		it.Event = new(ISettlementInitSigVerifier)
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
func (it *ISettlementInitSigVerifierIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ISettlementInitSigVerifierIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ISettlementInitSigVerifier represents a InitSigVerifier event raised by the ISettlement contract.
type ISettlementInitSigVerifier struct {
	SigVerifier common.Address
	Raw         types.Log // Blockchain specific contextual infos
}

// FilterInitSigVerifier is a free log retrieval operation binding the contract event 0x8c698070f0c9ef92ff032a24e5c83ef7783fd360fde9c6af8ed5fca9fa5abbb7.
//
// Solidity: event InitSigVerifier(address sigVerifier)
func (_ISettlement *ISettlementFilterer) FilterInitSigVerifier(opts *bind.FilterOpts) (*ISettlementInitSigVerifierIterator, error) {

	logs, sub, err := _ISettlement.contract.FilterLogs(opts, "InitSigVerifier")
	if err != nil {
		return nil, err
	}
	return &ISettlementInitSigVerifierIterator{contract: _ISettlement.contract, event: "InitSigVerifier", logs: logs, sub: sub}, nil
}

// WatchInitSigVerifier is a free log subscription operation binding the contract event 0x8c698070f0c9ef92ff032a24e5c83ef7783fd360fde9c6af8ed5fca9fa5abbb7.
//
// Solidity: event InitSigVerifier(address sigVerifier)
func (_ISettlement *ISettlementFilterer) WatchInitSigVerifier(opts *bind.WatchOpts, sink chan<- *ISettlementInitSigVerifier) (event.Subscription, error) {

	logs, sub, err := _ISettlement.contract.WatchLogs(opts, "InitSigVerifier")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ISettlementInitSigVerifier)
				if err := _ISettlement.contract.UnpackLog(event, "InitSigVerifier", log); err != nil {
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

// ParseInitSigVerifier is a log parse operation binding the contract event 0x8c698070f0c9ef92ff032a24e5c83ef7783fd360fde9c6af8ed5fca9fa5abbb7.
//
// Solidity: event InitSigVerifier(address sigVerifier)
func (_ISettlement *ISettlementFilterer) ParseInitSigVerifier(log types.Log) (*ISettlementInitSigVerifier, error) {
	event := new(ISettlementInitSigVerifier)
	if err := _ISettlement.contract.UnpackLog(event, "InitSigVerifier", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ISettlementSetGenesisIterator is returned from FilterSetGenesis and is used to iterate over the raw logs and unpacked data for SetGenesis events raised by the ISettlement contract.
type ISettlementSetGenesisIterator struct {
	Event *ISettlementSetGenesis // Event containing the contract specifics and raw log

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
func (it *ISettlementSetGenesisIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ISettlementSetGenesis)
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
		it.Event = new(ISettlementSetGenesis)
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
func (it *ISettlementSetGenesisIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ISettlementSetGenesisIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ISettlementSetGenesis represents a SetGenesis event raised by the ISettlement contract.
type ISettlementSetGenesis struct {
	ValSetHeader ISettlementValSetHeader
	ExtraData    []ISettlementExtraData
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterSetGenesis is a free log retrieval operation binding the contract event 0xd4b7365d7a7dd369f40b249f48684bd7e51524b3ab56a9eb188ac339d574bbc0.
//
// Solidity: event SetGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_ISettlement *ISettlementFilterer) FilterSetGenesis(opts *bind.FilterOpts) (*ISettlementSetGenesisIterator, error) {

	logs, sub, err := _ISettlement.contract.FilterLogs(opts, "SetGenesis")
	if err != nil {
		return nil, err
	}
	return &ISettlementSetGenesisIterator{contract: _ISettlement.contract, event: "SetGenesis", logs: logs, sub: sub}, nil
}

// WatchSetGenesis is a free log subscription operation binding the contract event 0xd4b7365d7a7dd369f40b249f48684bd7e51524b3ab56a9eb188ac339d574bbc0.
//
// Solidity: event SetGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_ISettlement *ISettlementFilterer) WatchSetGenesis(opts *bind.WatchOpts, sink chan<- *ISettlementSetGenesis) (event.Subscription, error) {

	logs, sub, err := _ISettlement.contract.WatchLogs(opts, "SetGenesis")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ISettlementSetGenesis)
				if err := _ISettlement.contract.UnpackLog(event, "SetGenesis", log); err != nil {
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

// ParseSetGenesis is a log parse operation binding the contract event 0xd4b7365d7a7dd369f40b249f48684bd7e51524b3ab56a9eb188ac339d574bbc0.
//
// Solidity: event SetGenesis((uint8,uint8,uint48,uint48,uint256,uint256,bytes32) valSetHeader, (bytes32,bytes32)[] extraData)
func (_ISettlement *ISettlementFilterer) ParseSetGenesis(log types.Log) (*ISettlementSetGenesis, error) {
	event := new(ISettlementSetGenesis)
	if err := _ISettlement.contract.UnpackLog(event, "SetGenesis", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ISettlementSetSigVerifierIterator is returned from FilterSetSigVerifier and is used to iterate over the raw logs and unpacked data for SetSigVerifier events raised by the ISettlement contract.
type ISettlementSetSigVerifierIterator struct {
	Event *ISettlementSetSigVerifier // Event containing the contract specifics and raw log

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
func (it *ISettlementSetSigVerifierIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ISettlementSetSigVerifier)
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
		it.Event = new(ISettlementSetSigVerifier)
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
func (it *ISettlementSetSigVerifierIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ISettlementSetSigVerifierIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ISettlementSetSigVerifier represents a SetSigVerifier event raised by the ISettlement contract.
type ISettlementSetSigVerifier struct {
	SigVerifier common.Address
	Raw         types.Log // Blockchain specific contextual infos
}

// FilterSetSigVerifier is a free log retrieval operation binding the contract event 0x3cb2fcfd41e182e933eb967bdeaac4f8ff69c80b6fd24fea9561dfbdec127942.
//
// Solidity: event SetSigVerifier(address sigVerifier)
func (_ISettlement *ISettlementFilterer) FilterSetSigVerifier(opts *bind.FilterOpts) (*ISettlementSetSigVerifierIterator, error) {

	logs, sub, err := _ISettlement.contract.FilterLogs(opts, "SetSigVerifier")
	if err != nil {
		return nil, err
	}
	return &ISettlementSetSigVerifierIterator{contract: _ISettlement.contract, event: "SetSigVerifier", logs: logs, sub: sub}, nil
}

// WatchSetSigVerifier is a free log subscription operation binding the contract event 0x3cb2fcfd41e182e933eb967bdeaac4f8ff69c80b6fd24fea9561dfbdec127942.
//
// Solidity: event SetSigVerifier(address sigVerifier)
func (_ISettlement *ISettlementFilterer) WatchSetSigVerifier(opts *bind.WatchOpts, sink chan<- *ISettlementSetSigVerifier) (event.Subscription, error) {

	logs, sub, err := _ISettlement.contract.WatchLogs(opts, "SetSigVerifier")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ISettlementSetSigVerifier)
				if err := _ISettlement.contract.UnpackLog(event, "SetSigVerifier", log); err != nil {
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

// ParseSetSigVerifier is a log parse operation binding the contract event 0x3cb2fcfd41e182e933eb967bdeaac4f8ff69c80b6fd24fea9561dfbdec127942.
//
// Solidity: event SetSigVerifier(address sigVerifier)
func (_ISettlement *ISettlementFilterer) ParseSetSigVerifier(log types.Log) (*ISettlementSetSigVerifier, error) {
	event := new(ISettlementSetSigVerifier)
	if err := _ISettlement.contract.UnpackLog(event, "SetSigVerifier", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

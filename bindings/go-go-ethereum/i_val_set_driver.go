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

// IValSetDriverConfig is an auto generated low-level Go binding around an user-defined struct.
type IValSetDriverConfig struct {
	NumAggregators          *big.Int
	NumCommitters           *big.Int
	CommitterSlotDuration   *big.Int
	VotingPowerProviders    []IValSetDriverCrossChainAddress
	KeysProvider            IValSetDriverCrossChainAddress
	Settlements             []IValSetDriverCrossChainAddress
	MaxVotingPower          *big.Int
	MinInclusionVotingPower *big.Int
	MaxValidatorsCount      *big.Int
	RequiredKeyTags         []uint8
	QuorumThresholds        []IValSetDriverQuorumThreshold
	RequiredHeaderKeyTag    uint8
	VerificationType        uint32
}

// IValSetDriverCrossChainAddress is an auto generated low-level Go binding around an user-defined struct.
type IValSetDriverCrossChainAddress struct {
	ChainId uint64
	Addr    common.Address
}

// IValSetDriverQuorumThreshold is an auto generated low-level Go binding around an user-defined struct.
type IValSetDriverQuorumThreshold struct {
	KeyTag          uint8
	QuorumThreshold *big.Int
}

// IValSetDriverMetaData contains all meta data concerning the IValSetDriver contract.
var IValSetDriverMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"MAX_QUORUM_THRESHOLD\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint248\",\"internalType\":\"uint248\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"addQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"addSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"addVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"getCommitterSlotDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCommitterSlotDurationAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getConfig\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.Config\",\"components\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"numCommitters\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"committerSlotDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"votingPowerProviders\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"keysProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"settlements\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"},{\"name\":\"quorumThresholds\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]},{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"verificationType\",\"type\":\"uint32\",\"internalType\":\"uint32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getConfigAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.Config\",\"components\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"numCommitters\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"committerSlotDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"votingPowerProviders\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"keysProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"settlements\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"},{\"name\":\"quorumThresholds\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]},{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"verificationType\",\"type\":\"uint32\",\"internalType\":\"uint32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysProvider\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysProviderAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxValidatorsCount\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxValidatorsCountAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxVotingPower\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxVotingPowerAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMinInclusionVotingPower\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMinInclusionVotingPowerAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumAggregators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumAggregatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumCommitters\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumCommittersAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholds\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholdsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredHeaderKeyTag\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredHeaderKeyTagAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTags\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTagsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSettlements\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSettlementsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVerificationType\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVerificationTypeAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowerProviders\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowerProvidersAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isQuorumThresholdRegistered\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isQuorumThresholdRegisteredAt\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSettlementRegistered\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSettlementRegisteredAt\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isVotingPowerProviderRegistered\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isVotingPowerProviderRegisteredAt\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"removeQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"removeSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"removeVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setCommitterSlotDuration\",\"inputs\":[{\"name\":\"slotDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setKeysProvider\",\"inputs\":[{\"name\":\"keysProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setMaxValidatorsCount\",\"inputs\":[{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setMaxVotingPower\",\"inputs\":[{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setMinInclusionVotingPower\",\"inputs\":[{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setNumAggregators\",\"inputs\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setNumCommitters\",\"inputs\":[{\"name\":\"numCommitters\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setRequiredHeaderKeyTag\",\"inputs\":[{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setRequiredKeyTags\",\"inputs\":[{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setVerificationType\",\"inputs\":[{\"name\":\"verificationType\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"AddQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"AddSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"AddVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RemoveQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RemoveSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RemoveVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetCommitterSlotDuration\",\"inputs\":[{\"name\":\"committerSlotDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetKeysProvider\",\"inputs\":[{\"name\":\"keysProvider\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetMaxValidatorsCount\",\"inputs\":[{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetMaxVotingPower\",\"inputs\":[{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetMinInclusionVotingPower\",\"inputs\":[{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetNumAggregators\",\"inputs\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetNumCommitters\",\"inputs\":[{\"name\":\"numCommitters\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetRequiredHeaderKeyTag\",\"inputs\":[{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"indexed\":false,\"internalType\":\"uint8\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetRequiredKeyTags\",\"inputs\":[{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"indexed\":false,\"internalType\":\"uint8[]\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetVerificationType\",\"inputs\":[{\"name\":\"verificationType\",\"type\":\"uint32\",\"indexed\":false,\"internalType\":\"uint32\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"ValSetDriver_ChainAlreadyAdded\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_InvalidCrossChainAddress\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_InvalidMaxValidatorsCount\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_InvalidQuorumThreshold\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_KeyTagAlreadyAdded\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_NotAdded\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_ZeroCommitterSlotDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_ZeroNumAggregators\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_ZeroNumCommitters\",\"inputs\":[]}]",
}

// IValSetDriverABI is the input ABI used to generate the binding from.
// Deprecated: Use IValSetDriverMetaData.ABI instead.
var IValSetDriverABI = IValSetDriverMetaData.ABI

// IValSetDriver is an auto generated Go binding around an Ethereum contract.
type IValSetDriver struct {
	IValSetDriverCaller     // Read-only binding to the contract
	IValSetDriverTransactor // Write-only binding to the contract
	IValSetDriverFilterer   // Log filterer for contract events
}

// IValSetDriverCaller is an auto generated read-only Go binding around an Ethereum contract.
type IValSetDriverCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IValSetDriverTransactor is an auto generated write-only Go binding around an Ethereum contract.
type IValSetDriverTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IValSetDriverFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type IValSetDriverFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// IValSetDriverSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type IValSetDriverSession struct {
	Contract     *IValSetDriver    // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// IValSetDriverCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type IValSetDriverCallerSession struct {
	Contract *IValSetDriverCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts        // Call options to use throughout this session
}

// IValSetDriverTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type IValSetDriverTransactorSession struct {
	Contract     *IValSetDriverTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts        // Transaction auth options to use throughout this session
}

// IValSetDriverRaw is an auto generated low-level Go binding around an Ethereum contract.
type IValSetDriverRaw struct {
	Contract *IValSetDriver // Generic contract binding to access the raw methods on
}

// IValSetDriverCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type IValSetDriverCallerRaw struct {
	Contract *IValSetDriverCaller // Generic read-only contract binding to access the raw methods on
}

// IValSetDriverTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type IValSetDriverTransactorRaw struct {
	Contract *IValSetDriverTransactor // Generic write-only contract binding to access the raw methods on
}

// NewIValSetDriver creates a new instance of IValSetDriver, bound to a specific deployed contract.
func NewIValSetDriver(address common.Address, backend bind.ContractBackend) (*IValSetDriver, error) {
	contract, err := bindIValSetDriver(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &IValSetDriver{IValSetDriverCaller: IValSetDriverCaller{contract: contract}, IValSetDriverTransactor: IValSetDriverTransactor{contract: contract}, IValSetDriverFilterer: IValSetDriverFilterer{contract: contract}}, nil
}

// NewIValSetDriverCaller creates a new read-only instance of IValSetDriver, bound to a specific deployed contract.
func NewIValSetDriverCaller(address common.Address, caller bind.ContractCaller) (*IValSetDriverCaller, error) {
	contract, err := bindIValSetDriver(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &IValSetDriverCaller{contract: contract}, nil
}

// NewIValSetDriverTransactor creates a new write-only instance of IValSetDriver, bound to a specific deployed contract.
func NewIValSetDriverTransactor(address common.Address, transactor bind.ContractTransactor) (*IValSetDriverTransactor, error) {
	contract, err := bindIValSetDriver(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &IValSetDriverTransactor{contract: contract}, nil
}

// NewIValSetDriverFilterer creates a new log filterer instance of IValSetDriver, bound to a specific deployed contract.
func NewIValSetDriverFilterer(address common.Address, filterer bind.ContractFilterer) (*IValSetDriverFilterer, error) {
	contract, err := bindIValSetDriver(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &IValSetDriverFilterer{contract: contract}, nil
}

// bindIValSetDriver binds a generic wrapper to an already deployed contract.
func bindIValSetDriver(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := IValSetDriverMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IValSetDriver *IValSetDriverRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IValSetDriver.Contract.IValSetDriverCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IValSetDriver *IValSetDriverRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IValSetDriver.Contract.IValSetDriverTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IValSetDriver *IValSetDriverRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IValSetDriver.Contract.IValSetDriverTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_IValSetDriver *IValSetDriverCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _IValSetDriver.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_IValSetDriver *IValSetDriverTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _IValSetDriver.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_IValSetDriver *IValSetDriverTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _IValSetDriver.Contract.contract.Transact(opts, method, params...)
}

// MAXQUORUMTHRESHOLD is a free data retrieval call binding the contract method 0x127ec283.
//
// Solidity: function MAX_QUORUM_THRESHOLD() view returns(uint248)
func (_IValSetDriver *IValSetDriverCaller) MAXQUORUMTHRESHOLD(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "MAX_QUORUM_THRESHOLD")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// MAXQUORUMTHRESHOLD is a free data retrieval call binding the contract method 0x127ec283.
//
// Solidity: function MAX_QUORUM_THRESHOLD() view returns(uint248)
func (_IValSetDriver *IValSetDriverSession) MAXQUORUMTHRESHOLD() (*big.Int, error) {
	return _IValSetDriver.Contract.MAXQUORUMTHRESHOLD(&_IValSetDriver.CallOpts)
}

// MAXQUORUMTHRESHOLD is a free data retrieval call binding the contract method 0x127ec283.
//
// Solidity: function MAX_QUORUM_THRESHOLD() view returns(uint248)
func (_IValSetDriver *IValSetDriverCallerSession) MAXQUORUMTHRESHOLD() (*big.Int, error) {
	return _IValSetDriver.Contract.MAXQUORUMTHRESHOLD(&_IValSetDriver.CallOpts)
}

// GetCommitterSlotDuration is a free data retrieval call binding the contract method 0xcdad0bb6.
//
// Solidity: function getCommitterSlotDuration() view returns(uint48)
func (_IValSetDriver *IValSetDriverCaller) GetCommitterSlotDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getCommitterSlotDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCommitterSlotDuration is a free data retrieval call binding the contract method 0xcdad0bb6.
//
// Solidity: function getCommitterSlotDuration() view returns(uint48)
func (_IValSetDriver *IValSetDriverSession) GetCommitterSlotDuration() (*big.Int, error) {
	return _IValSetDriver.Contract.GetCommitterSlotDuration(&_IValSetDriver.CallOpts)
}

// GetCommitterSlotDuration is a free data retrieval call binding the contract method 0xcdad0bb6.
//
// Solidity: function getCommitterSlotDuration() view returns(uint48)
func (_IValSetDriver *IValSetDriverCallerSession) GetCommitterSlotDuration() (*big.Int, error) {
	return _IValSetDriver.Contract.GetCommitterSlotDuration(&_IValSetDriver.CallOpts)
}

// GetCommitterSlotDurationAt is a free data retrieval call binding the contract method 0x490be3bd.
//
// Solidity: function getCommitterSlotDurationAt(uint48 timestamp) view returns(uint48)
func (_IValSetDriver *IValSetDriverCaller) GetCommitterSlotDurationAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getCommitterSlotDurationAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCommitterSlotDurationAt is a free data retrieval call binding the contract method 0x490be3bd.
//
// Solidity: function getCommitterSlotDurationAt(uint48 timestamp) view returns(uint48)
func (_IValSetDriver *IValSetDriverSession) GetCommitterSlotDurationAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetCommitterSlotDurationAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetCommitterSlotDurationAt is a free data retrieval call binding the contract method 0x490be3bd.
//
// Solidity: function getCommitterSlotDurationAt(uint48 timestamp) view returns(uint48)
func (_IValSetDriver *IValSetDriverCallerSession) GetCommitterSlotDurationAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetCommitterSlotDurationAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetConfig is a free data retrieval call binding the contract method 0xc3f909d4.
//
// Solidity: function getConfig() view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_IValSetDriver *IValSetDriverCaller) GetConfig(opts *bind.CallOpts) (IValSetDriverConfig, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getConfig")

	if err != nil {
		return *new(IValSetDriverConfig), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverConfig)).(*IValSetDriverConfig)

	return out0, err

}

// GetConfig is a free data retrieval call binding the contract method 0xc3f909d4.
//
// Solidity: function getConfig() view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_IValSetDriver *IValSetDriverSession) GetConfig() (IValSetDriverConfig, error) {
	return _IValSetDriver.Contract.GetConfig(&_IValSetDriver.CallOpts)
}

// GetConfig is a free data retrieval call binding the contract method 0xc3f909d4.
//
// Solidity: function getConfig() view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_IValSetDriver *IValSetDriverCallerSession) GetConfig() (IValSetDriverConfig, error) {
	return _IValSetDriver.Contract.GetConfig(&_IValSetDriver.CallOpts)
}

// GetConfigAt is a free data retrieval call binding the contract method 0x13fb0877.
//
// Solidity: function getConfigAt(uint48 timestamp) view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_IValSetDriver *IValSetDriverCaller) GetConfigAt(opts *bind.CallOpts, timestamp *big.Int) (IValSetDriverConfig, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getConfigAt", timestamp)

	if err != nil {
		return *new(IValSetDriverConfig), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverConfig)).(*IValSetDriverConfig)

	return out0, err

}

// GetConfigAt is a free data retrieval call binding the contract method 0x13fb0877.
//
// Solidity: function getConfigAt(uint48 timestamp) view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_IValSetDriver *IValSetDriverSession) GetConfigAt(timestamp *big.Int) (IValSetDriverConfig, error) {
	return _IValSetDriver.Contract.GetConfigAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetConfigAt is a free data retrieval call binding the contract method 0x13fb0877.
//
// Solidity: function getConfigAt(uint48 timestamp) view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_IValSetDriver *IValSetDriverCallerSession) GetConfigAt(timestamp *big.Int) (IValSetDriverConfig, error) {
	return _IValSetDriver.Contract.GetConfigAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetKeysProvider is a free data retrieval call binding the contract method 0x297d29b8.
//
// Solidity: function getKeysProvider() view returns((uint64,address))
func (_IValSetDriver *IValSetDriverCaller) GetKeysProvider(opts *bind.CallOpts) (IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getKeysProvider")

	if err != nil {
		return *new(IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverCrossChainAddress)).(*IValSetDriverCrossChainAddress)

	return out0, err

}

// GetKeysProvider is a free data retrieval call binding the contract method 0x297d29b8.
//
// Solidity: function getKeysProvider() view returns((uint64,address))
func (_IValSetDriver *IValSetDriverSession) GetKeysProvider() (IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetKeysProvider(&_IValSetDriver.CallOpts)
}

// GetKeysProvider is a free data retrieval call binding the contract method 0x297d29b8.
//
// Solidity: function getKeysProvider() view returns((uint64,address))
func (_IValSetDriver *IValSetDriverCallerSession) GetKeysProvider() (IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetKeysProvider(&_IValSetDriver.CallOpts)
}

// GetKeysProviderAt is a free data retrieval call binding the contract method 0x10a49295.
//
// Solidity: function getKeysProviderAt(uint48 timestamp) view returns((uint64,address))
func (_IValSetDriver *IValSetDriverCaller) GetKeysProviderAt(opts *bind.CallOpts, timestamp *big.Int) (IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getKeysProviderAt", timestamp)

	if err != nil {
		return *new(IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverCrossChainAddress)).(*IValSetDriverCrossChainAddress)

	return out0, err

}

// GetKeysProviderAt is a free data retrieval call binding the contract method 0x10a49295.
//
// Solidity: function getKeysProviderAt(uint48 timestamp) view returns((uint64,address))
func (_IValSetDriver *IValSetDriverSession) GetKeysProviderAt(timestamp *big.Int) (IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetKeysProviderAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetKeysProviderAt is a free data retrieval call binding the contract method 0x10a49295.
//
// Solidity: function getKeysProviderAt(uint48 timestamp) view returns((uint64,address))
func (_IValSetDriver *IValSetDriverCallerSession) GetKeysProviderAt(timestamp *big.Int) (IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetKeysProviderAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetMaxValidatorsCount is a free data retrieval call binding the contract method 0x06ce894d.
//
// Solidity: function getMaxValidatorsCount() view returns(uint208)
func (_IValSetDriver *IValSetDriverCaller) GetMaxValidatorsCount(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getMaxValidatorsCount")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxValidatorsCount is a free data retrieval call binding the contract method 0x06ce894d.
//
// Solidity: function getMaxValidatorsCount() view returns(uint208)
func (_IValSetDriver *IValSetDriverSession) GetMaxValidatorsCount() (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxValidatorsCount(&_IValSetDriver.CallOpts)
}

// GetMaxValidatorsCount is a free data retrieval call binding the contract method 0x06ce894d.
//
// Solidity: function getMaxValidatorsCount() view returns(uint208)
func (_IValSetDriver *IValSetDriverCallerSession) GetMaxValidatorsCount() (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxValidatorsCount(&_IValSetDriver.CallOpts)
}

// GetMaxValidatorsCountAt is a free data retrieval call binding the contract method 0x4f938edc.
//
// Solidity: function getMaxValidatorsCountAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverCaller) GetMaxValidatorsCountAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getMaxValidatorsCountAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxValidatorsCountAt is a free data retrieval call binding the contract method 0x4f938edc.
//
// Solidity: function getMaxValidatorsCountAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverSession) GetMaxValidatorsCountAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxValidatorsCountAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetMaxValidatorsCountAt is a free data retrieval call binding the contract method 0x4f938edc.
//
// Solidity: function getMaxValidatorsCountAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverCallerSession) GetMaxValidatorsCountAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxValidatorsCountAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetMaxVotingPower is a free data retrieval call binding the contract method 0x9f9c3080.
//
// Solidity: function getMaxVotingPower() view returns(uint256)
func (_IValSetDriver *IValSetDriverCaller) GetMaxVotingPower(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getMaxVotingPower")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxVotingPower is a free data retrieval call binding the contract method 0x9f9c3080.
//
// Solidity: function getMaxVotingPower() view returns(uint256)
func (_IValSetDriver *IValSetDriverSession) GetMaxVotingPower() (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxVotingPower(&_IValSetDriver.CallOpts)
}

// GetMaxVotingPower is a free data retrieval call binding the contract method 0x9f9c3080.
//
// Solidity: function getMaxVotingPower() view returns(uint256)
func (_IValSetDriver *IValSetDriverCallerSession) GetMaxVotingPower() (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxVotingPower(&_IValSetDriver.CallOpts)
}

// GetMaxVotingPowerAt is a free data retrieval call binding the contract method 0x848b3040.
//
// Solidity: function getMaxVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_IValSetDriver *IValSetDriverCaller) GetMaxVotingPowerAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getMaxVotingPowerAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxVotingPowerAt is a free data retrieval call binding the contract method 0x848b3040.
//
// Solidity: function getMaxVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_IValSetDriver *IValSetDriverSession) GetMaxVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxVotingPowerAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetMaxVotingPowerAt is a free data retrieval call binding the contract method 0x848b3040.
//
// Solidity: function getMaxVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_IValSetDriver *IValSetDriverCallerSession) GetMaxVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetMaxVotingPowerAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetMinInclusionVotingPower is a free data retrieval call binding the contract method 0xb6a94695.
//
// Solidity: function getMinInclusionVotingPower() view returns(uint256)
func (_IValSetDriver *IValSetDriverCaller) GetMinInclusionVotingPower(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getMinInclusionVotingPower")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMinInclusionVotingPower is a free data retrieval call binding the contract method 0xb6a94695.
//
// Solidity: function getMinInclusionVotingPower() view returns(uint256)
func (_IValSetDriver *IValSetDriverSession) GetMinInclusionVotingPower() (*big.Int, error) {
	return _IValSetDriver.Contract.GetMinInclusionVotingPower(&_IValSetDriver.CallOpts)
}

// GetMinInclusionVotingPower is a free data retrieval call binding the contract method 0xb6a94695.
//
// Solidity: function getMinInclusionVotingPower() view returns(uint256)
func (_IValSetDriver *IValSetDriverCallerSession) GetMinInclusionVotingPower() (*big.Int, error) {
	return _IValSetDriver.Contract.GetMinInclusionVotingPower(&_IValSetDriver.CallOpts)
}

// GetMinInclusionVotingPowerAt is a free data retrieval call binding the contract method 0x456705a2.
//
// Solidity: function getMinInclusionVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_IValSetDriver *IValSetDriverCaller) GetMinInclusionVotingPowerAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getMinInclusionVotingPowerAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMinInclusionVotingPowerAt is a free data retrieval call binding the contract method 0x456705a2.
//
// Solidity: function getMinInclusionVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_IValSetDriver *IValSetDriverSession) GetMinInclusionVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetMinInclusionVotingPowerAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetMinInclusionVotingPowerAt is a free data retrieval call binding the contract method 0x456705a2.
//
// Solidity: function getMinInclusionVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_IValSetDriver *IValSetDriverCallerSession) GetMinInclusionVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetMinInclusionVotingPowerAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetNumAggregators is a free data retrieval call binding the contract method 0x21fbfe0d.
//
// Solidity: function getNumAggregators() view returns(uint208)
func (_IValSetDriver *IValSetDriverCaller) GetNumAggregators(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getNumAggregators")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumAggregators is a free data retrieval call binding the contract method 0x21fbfe0d.
//
// Solidity: function getNumAggregators() view returns(uint208)
func (_IValSetDriver *IValSetDriverSession) GetNumAggregators() (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumAggregators(&_IValSetDriver.CallOpts)
}

// GetNumAggregators is a free data retrieval call binding the contract method 0x21fbfe0d.
//
// Solidity: function getNumAggregators() view returns(uint208)
func (_IValSetDriver *IValSetDriverCallerSession) GetNumAggregators() (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumAggregators(&_IValSetDriver.CallOpts)
}

// GetNumAggregatorsAt is a free data retrieval call binding the contract method 0x6bb7e08a.
//
// Solidity: function getNumAggregatorsAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverCaller) GetNumAggregatorsAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getNumAggregatorsAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumAggregatorsAt is a free data retrieval call binding the contract method 0x6bb7e08a.
//
// Solidity: function getNumAggregatorsAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverSession) GetNumAggregatorsAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumAggregatorsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetNumAggregatorsAt is a free data retrieval call binding the contract method 0x6bb7e08a.
//
// Solidity: function getNumAggregatorsAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverCallerSession) GetNumAggregatorsAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumAggregatorsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetNumCommitters is a free data retrieval call binding the contract method 0x7861db16.
//
// Solidity: function getNumCommitters() view returns(uint208)
func (_IValSetDriver *IValSetDriverCaller) GetNumCommitters(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getNumCommitters")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumCommitters is a free data retrieval call binding the contract method 0x7861db16.
//
// Solidity: function getNumCommitters() view returns(uint208)
func (_IValSetDriver *IValSetDriverSession) GetNumCommitters() (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumCommitters(&_IValSetDriver.CallOpts)
}

// GetNumCommitters is a free data retrieval call binding the contract method 0x7861db16.
//
// Solidity: function getNumCommitters() view returns(uint208)
func (_IValSetDriver *IValSetDriverCallerSession) GetNumCommitters() (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumCommitters(&_IValSetDriver.CallOpts)
}

// GetNumCommittersAt is a free data retrieval call binding the contract method 0xe0078c64.
//
// Solidity: function getNumCommittersAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverCaller) GetNumCommittersAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getNumCommittersAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumCommittersAt is a free data retrieval call binding the contract method 0xe0078c64.
//
// Solidity: function getNumCommittersAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverSession) GetNumCommittersAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumCommittersAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetNumCommittersAt is a free data retrieval call binding the contract method 0xe0078c64.
//
// Solidity: function getNumCommittersAt(uint48 timestamp) view returns(uint208)
func (_IValSetDriver *IValSetDriverCallerSession) GetNumCommittersAt(timestamp *big.Int) (*big.Int, error) {
	return _IValSetDriver.Contract.GetNumCommittersAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetQuorumThresholds is a free data retrieval call binding the contract method 0x5796148c.
//
// Solidity: function getQuorumThresholds() view returns((uint8,uint248)[])
func (_IValSetDriver *IValSetDriverCaller) GetQuorumThresholds(opts *bind.CallOpts) ([]IValSetDriverQuorumThreshold, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getQuorumThresholds")

	if err != nil {
		return *new([]IValSetDriverQuorumThreshold), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverQuorumThreshold)).(*[]IValSetDriverQuorumThreshold)

	return out0, err

}

// GetQuorumThresholds is a free data retrieval call binding the contract method 0x5796148c.
//
// Solidity: function getQuorumThresholds() view returns((uint8,uint248)[])
func (_IValSetDriver *IValSetDriverSession) GetQuorumThresholds() ([]IValSetDriverQuorumThreshold, error) {
	return _IValSetDriver.Contract.GetQuorumThresholds(&_IValSetDriver.CallOpts)
}

// GetQuorumThresholds is a free data retrieval call binding the contract method 0x5796148c.
//
// Solidity: function getQuorumThresholds() view returns((uint8,uint248)[])
func (_IValSetDriver *IValSetDriverCallerSession) GetQuorumThresholds() ([]IValSetDriverQuorumThreshold, error) {
	return _IValSetDriver.Contract.GetQuorumThresholds(&_IValSetDriver.CallOpts)
}

// GetQuorumThresholdsAt is a free data retrieval call binding the contract method 0xf2f46b83.
//
// Solidity: function getQuorumThresholdsAt(uint48 timestamp) view returns((uint8,uint248)[])
func (_IValSetDriver *IValSetDriverCaller) GetQuorumThresholdsAt(opts *bind.CallOpts, timestamp *big.Int) ([]IValSetDriverQuorumThreshold, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getQuorumThresholdsAt", timestamp)

	if err != nil {
		return *new([]IValSetDriverQuorumThreshold), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverQuorumThreshold)).(*[]IValSetDriverQuorumThreshold)

	return out0, err

}

// GetQuorumThresholdsAt is a free data retrieval call binding the contract method 0xf2f46b83.
//
// Solidity: function getQuorumThresholdsAt(uint48 timestamp) view returns((uint8,uint248)[])
func (_IValSetDriver *IValSetDriverSession) GetQuorumThresholdsAt(timestamp *big.Int) ([]IValSetDriverQuorumThreshold, error) {
	return _IValSetDriver.Contract.GetQuorumThresholdsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetQuorumThresholdsAt is a free data retrieval call binding the contract method 0xf2f46b83.
//
// Solidity: function getQuorumThresholdsAt(uint48 timestamp) view returns((uint8,uint248)[])
func (_IValSetDriver *IValSetDriverCallerSession) GetQuorumThresholdsAt(timestamp *big.Int) ([]IValSetDriverQuorumThreshold, error) {
	return _IValSetDriver.Contract.GetQuorumThresholdsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetRequiredHeaderKeyTag is a free data retrieval call binding the contract method 0x6582e9f7.
//
// Solidity: function getRequiredHeaderKeyTag() view returns(uint8)
func (_IValSetDriver *IValSetDriverCaller) GetRequiredHeaderKeyTag(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getRequiredHeaderKeyTag")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredHeaderKeyTag is a free data retrieval call binding the contract method 0x6582e9f7.
//
// Solidity: function getRequiredHeaderKeyTag() view returns(uint8)
func (_IValSetDriver *IValSetDriverSession) GetRequiredHeaderKeyTag() (uint8, error) {
	return _IValSetDriver.Contract.GetRequiredHeaderKeyTag(&_IValSetDriver.CallOpts)
}

// GetRequiredHeaderKeyTag is a free data retrieval call binding the contract method 0x6582e9f7.
//
// Solidity: function getRequiredHeaderKeyTag() view returns(uint8)
func (_IValSetDriver *IValSetDriverCallerSession) GetRequiredHeaderKeyTag() (uint8, error) {
	return _IValSetDriver.Contract.GetRequiredHeaderKeyTag(&_IValSetDriver.CallOpts)
}

// GetRequiredHeaderKeyTagAt is a free data retrieval call binding the contract method 0xbc12e1fd.
//
// Solidity: function getRequiredHeaderKeyTagAt(uint48 timestamp) view returns(uint8)
func (_IValSetDriver *IValSetDriverCaller) GetRequiredHeaderKeyTagAt(opts *bind.CallOpts, timestamp *big.Int) (uint8, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getRequiredHeaderKeyTagAt", timestamp)

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredHeaderKeyTagAt is a free data retrieval call binding the contract method 0xbc12e1fd.
//
// Solidity: function getRequiredHeaderKeyTagAt(uint48 timestamp) view returns(uint8)
func (_IValSetDriver *IValSetDriverSession) GetRequiredHeaderKeyTagAt(timestamp *big.Int) (uint8, error) {
	return _IValSetDriver.Contract.GetRequiredHeaderKeyTagAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetRequiredHeaderKeyTagAt is a free data retrieval call binding the contract method 0xbc12e1fd.
//
// Solidity: function getRequiredHeaderKeyTagAt(uint48 timestamp) view returns(uint8)
func (_IValSetDriver *IValSetDriverCallerSession) GetRequiredHeaderKeyTagAt(timestamp *big.Int) (uint8, error) {
	return _IValSetDriver.Contract.GetRequiredHeaderKeyTagAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetRequiredKeyTags is a free data retrieval call binding the contract method 0xf9bfa78a.
//
// Solidity: function getRequiredKeyTags() view returns(uint8[])
func (_IValSetDriver *IValSetDriverCaller) GetRequiredKeyTags(opts *bind.CallOpts) ([]uint8, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getRequiredKeyTags")

	if err != nil {
		return *new([]uint8), err
	}

	out0 := *abi.ConvertType(out[0], new([]uint8)).(*[]uint8)

	return out0, err

}

// GetRequiredKeyTags is a free data retrieval call binding the contract method 0xf9bfa78a.
//
// Solidity: function getRequiredKeyTags() view returns(uint8[])
func (_IValSetDriver *IValSetDriverSession) GetRequiredKeyTags() ([]uint8, error) {
	return _IValSetDriver.Contract.GetRequiredKeyTags(&_IValSetDriver.CallOpts)
}

// GetRequiredKeyTags is a free data retrieval call binding the contract method 0xf9bfa78a.
//
// Solidity: function getRequiredKeyTags() view returns(uint8[])
func (_IValSetDriver *IValSetDriverCallerSession) GetRequiredKeyTags() ([]uint8, error) {
	return _IValSetDriver.Contract.GetRequiredKeyTags(&_IValSetDriver.CallOpts)
}

// GetRequiredKeyTagsAt is a free data retrieval call binding the contract method 0x1161fc83.
//
// Solidity: function getRequiredKeyTagsAt(uint48 timestamp) view returns(uint8[])
func (_IValSetDriver *IValSetDriverCaller) GetRequiredKeyTagsAt(opts *bind.CallOpts, timestamp *big.Int) ([]uint8, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getRequiredKeyTagsAt", timestamp)

	if err != nil {
		return *new([]uint8), err
	}

	out0 := *abi.ConvertType(out[0], new([]uint8)).(*[]uint8)

	return out0, err

}

// GetRequiredKeyTagsAt is a free data retrieval call binding the contract method 0x1161fc83.
//
// Solidity: function getRequiredKeyTagsAt(uint48 timestamp) view returns(uint8[])
func (_IValSetDriver *IValSetDriverSession) GetRequiredKeyTagsAt(timestamp *big.Int) ([]uint8, error) {
	return _IValSetDriver.Contract.GetRequiredKeyTagsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetRequiredKeyTagsAt is a free data retrieval call binding the contract method 0x1161fc83.
//
// Solidity: function getRequiredKeyTagsAt(uint48 timestamp) view returns(uint8[])
func (_IValSetDriver *IValSetDriverCallerSession) GetRequiredKeyTagsAt(timestamp *big.Int) ([]uint8, error) {
	return _IValSetDriver.Contract.GetRequiredKeyTagsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetSettlements is a free data retrieval call binding the contract method 0xa0c2bc25.
//
// Solidity: function getSettlements() view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCaller) GetSettlements(opts *bind.CallOpts) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getSettlements")

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetSettlements is a free data retrieval call binding the contract method 0xa0c2bc25.
//
// Solidity: function getSettlements() view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverSession) GetSettlements() ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetSettlements(&_IValSetDriver.CallOpts)
}

// GetSettlements is a free data retrieval call binding the contract method 0xa0c2bc25.
//
// Solidity: function getSettlements() view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCallerSession) GetSettlements() ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetSettlements(&_IValSetDriver.CallOpts)
}

// GetSettlementsAt is a free data retrieval call binding the contract method 0x763d255a.
//
// Solidity: function getSettlementsAt(uint48 timestamp) view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCaller) GetSettlementsAt(opts *bind.CallOpts, timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getSettlementsAt", timestamp)

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetSettlementsAt is a free data retrieval call binding the contract method 0x763d255a.
//
// Solidity: function getSettlementsAt(uint48 timestamp) view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverSession) GetSettlementsAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetSettlementsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetSettlementsAt is a free data retrieval call binding the contract method 0x763d255a.
//
// Solidity: function getSettlementsAt(uint48 timestamp) view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCallerSession) GetSettlementsAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetSettlementsAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetVerificationType is a free data retrieval call binding the contract method 0x24acc119.
//
// Solidity: function getVerificationType() view returns(uint32)
func (_IValSetDriver *IValSetDriverCaller) GetVerificationType(opts *bind.CallOpts) (uint32, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getVerificationType")

	if err != nil {
		return *new(uint32), err
	}

	out0 := *abi.ConvertType(out[0], new(uint32)).(*uint32)

	return out0, err

}

// GetVerificationType is a free data retrieval call binding the contract method 0x24acc119.
//
// Solidity: function getVerificationType() view returns(uint32)
func (_IValSetDriver *IValSetDriverSession) GetVerificationType() (uint32, error) {
	return _IValSetDriver.Contract.GetVerificationType(&_IValSetDriver.CallOpts)
}

// GetVerificationType is a free data retrieval call binding the contract method 0x24acc119.
//
// Solidity: function getVerificationType() view returns(uint32)
func (_IValSetDriver *IValSetDriverCallerSession) GetVerificationType() (uint32, error) {
	return _IValSetDriver.Contract.GetVerificationType(&_IValSetDriver.CallOpts)
}

// GetVerificationTypeAt is a free data retrieval call binding the contract method 0x3a0ad9ec.
//
// Solidity: function getVerificationTypeAt(uint48 timestamp) view returns(uint32)
func (_IValSetDriver *IValSetDriverCaller) GetVerificationTypeAt(opts *bind.CallOpts, timestamp *big.Int) (uint32, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getVerificationTypeAt", timestamp)

	if err != nil {
		return *new(uint32), err
	}

	out0 := *abi.ConvertType(out[0], new(uint32)).(*uint32)

	return out0, err

}

// GetVerificationTypeAt is a free data retrieval call binding the contract method 0x3a0ad9ec.
//
// Solidity: function getVerificationTypeAt(uint48 timestamp) view returns(uint32)
func (_IValSetDriver *IValSetDriverSession) GetVerificationTypeAt(timestamp *big.Int) (uint32, error) {
	return _IValSetDriver.Contract.GetVerificationTypeAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetVerificationTypeAt is a free data retrieval call binding the contract method 0x3a0ad9ec.
//
// Solidity: function getVerificationTypeAt(uint48 timestamp) view returns(uint32)
func (_IValSetDriver *IValSetDriverCallerSession) GetVerificationTypeAt(timestamp *big.Int) (uint32, error) {
	return _IValSetDriver.Contract.GetVerificationTypeAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetVotingPowerProviders is a free data retrieval call binding the contract method 0x3e39b8db.
//
// Solidity: function getVotingPowerProviders() view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCaller) GetVotingPowerProviders(opts *bind.CallOpts) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getVotingPowerProviders")

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetVotingPowerProviders is a free data retrieval call binding the contract method 0x3e39b8db.
//
// Solidity: function getVotingPowerProviders() view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverSession) GetVotingPowerProviders() ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetVotingPowerProviders(&_IValSetDriver.CallOpts)
}

// GetVotingPowerProviders is a free data retrieval call binding the contract method 0x3e39b8db.
//
// Solidity: function getVotingPowerProviders() view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCallerSession) GetVotingPowerProviders() ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetVotingPowerProviders(&_IValSetDriver.CallOpts)
}

// GetVotingPowerProvidersAt is a free data retrieval call binding the contract method 0x09bba5ca.
//
// Solidity: function getVotingPowerProvidersAt(uint48 timestamp) view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCaller) GetVotingPowerProvidersAt(opts *bind.CallOpts, timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "getVotingPowerProvidersAt", timestamp)

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetVotingPowerProvidersAt is a free data retrieval call binding the contract method 0x09bba5ca.
//
// Solidity: function getVotingPowerProvidersAt(uint48 timestamp) view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverSession) GetVotingPowerProvidersAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetVotingPowerProvidersAt(&_IValSetDriver.CallOpts, timestamp)
}

// GetVotingPowerProvidersAt is a free data retrieval call binding the contract method 0x09bba5ca.
//
// Solidity: function getVotingPowerProvidersAt(uint48 timestamp) view returns((uint64,address)[])
func (_IValSetDriver *IValSetDriverCallerSession) GetVotingPowerProvidersAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _IValSetDriver.Contract.GetVotingPowerProvidersAt(&_IValSetDriver.CallOpts, timestamp)
}

// IsQuorumThresholdRegistered is a free data retrieval call binding the contract method 0x79a4c359.
//
// Solidity: function isQuorumThresholdRegistered((uint8,uint248) quorumThreshold) view returns(bool)
func (_IValSetDriver *IValSetDriverCaller) IsQuorumThresholdRegistered(opts *bind.CallOpts, quorumThreshold IValSetDriverQuorumThreshold) (bool, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "isQuorumThresholdRegistered", quorumThreshold)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsQuorumThresholdRegistered is a free data retrieval call binding the contract method 0x79a4c359.
//
// Solidity: function isQuorumThresholdRegistered((uint8,uint248) quorumThreshold) view returns(bool)
func (_IValSetDriver *IValSetDriverSession) IsQuorumThresholdRegistered(quorumThreshold IValSetDriverQuorumThreshold) (bool, error) {
	return _IValSetDriver.Contract.IsQuorumThresholdRegistered(&_IValSetDriver.CallOpts, quorumThreshold)
}

// IsQuorumThresholdRegistered is a free data retrieval call binding the contract method 0x79a4c359.
//
// Solidity: function isQuorumThresholdRegistered((uint8,uint248) quorumThreshold) view returns(bool)
func (_IValSetDriver *IValSetDriverCallerSession) IsQuorumThresholdRegistered(quorumThreshold IValSetDriverQuorumThreshold) (bool, error) {
	return _IValSetDriver.Contract.IsQuorumThresholdRegistered(&_IValSetDriver.CallOpts, quorumThreshold)
}

// IsQuorumThresholdRegisteredAt is a free data retrieval call binding the contract method 0x80c2fc48.
//
// Solidity: function isQuorumThresholdRegisteredAt((uint8,uint248) quorumThreshold, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverCaller) IsQuorumThresholdRegisteredAt(opts *bind.CallOpts, quorumThreshold IValSetDriverQuorumThreshold, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "isQuorumThresholdRegisteredAt", quorumThreshold, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsQuorumThresholdRegisteredAt is a free data retrieval call binding the contract method 0x80c2fc48.
//
// Solidity: function isQuorumThresholdRegisteredAt((uint8,uint248) quorumThreshold, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverSession) IsQuorumThresholdRegisteredAt(quorumThreshold IValSetDriverQuorumThreshold, timestamp *big.Int) (bool, error) {
	return _IValSetDriver.Contract.IsQuorumThresholdRegisteredAt(&_IValSetDriver.CallOpts, quorumThreshold, timestamp)
}

// IsQuorumThresholdRegisteredAt is a free data retrieval call binding the contract method 0x80c2fc48.
//
// Solidity: function isQuorumThresholdRegisteredAt((uint8,uint248) quorumThreshold, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverCallerSession) IsQuorumThresholdRegisteredAt(quorumThreshold IValSetDriverQuorumThreshold, timestamp *big.Int) (bool, error) {
	return _IValSetDriver.Contract.IsQuorumThresholdRegisteredAt(&_IValSetDriver.CallOpts, quorumThreshold, timestamp)
}

// IsSettlementRegistered is a free data retrieval call binding the contract method 0x965c0768.
//
// Solidity: function isSettlementRegistered((uint64,address) settlement) view returns(bool)
func (_IValSetDriver *IValSetDriverCaller) IsSettlementRegistered(opts *bind.CallOpts, settlement IValSetDriverCrossChainAddress) (bool, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "isSettlementRegistered", settlement)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSettlementRegistered is a free data retrieval call binding the contract method 0x965c0768.
//
// Solidity: function isSettlementRegistered((uint64,address) settlement) view returns(bool)
func (_IValSetDriver *IValSetDriverSession) IsSettlementRegistered(settlement IValSetDriverCrossChainAddress) (bool, error) {
	return _IValSetDriver.Contract.IsSettlementRegistered(&_IValSetDriver.CallOpts, settlement)
}

// IsSettlementRegistered is a free data retrieval call binding the contract method 0x965c0768.
//
// Solidity: function isSettlementRegistered((uint64,address) settlement) view returns(bool)
func (_IValSetDriver *IValSetDriverCallerSession) IsSettlementRegistered(settlement IValSetDriverCrossChainAddress) (bool, error) {
	return _IValSetDriver.Contract.IsSettlementRegistered(&_IValSetDriver.CallOpts, settlement)
}

// IsSettlementRegisteredAt is a free data retrieval call binding the contract method 0x01749b26.
//
// Solidity: function isSettlementRegisteredAt((uint64,address) settlement, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverCaller) IsSettlementRegisteredAt(opts *bind.CallOpts, settlement IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "isSettlementRegisteredAt", settlement, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSettlementRegisteredAt is a free data retrieval call binding the contract method 0x01749b26.
//
// Solidity: function isSettlementRegisteredAt((uint64,address) settlement, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverSession) IsSettlementRegisteredAt(settlement IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _IValSetDriver.Contract.IsSettlementRegisteredAt(&_IValSetDriver.CallOpts, settlement, timestamp)
}

// IsSettlementRegisteredAt is a free data retrieval call binding the contract method 0x01749b26.
//
// Solidity: function isSettlementRegisteredAt((uint64,address) settlement, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverCallerSession) IsSettlementRegisteredAt(settlement IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _IValSetDriver.Contract.IsSettlementRegisteredAt(&_IValSetDriver.CallOpts, settlement, timestamp)
}

// IsVotingPowerProviderRegistered is a free data retrieval call binding the contract method 0x1265b3be.
//
// Solidity: function isVotingPowerProviderRegistered((uint64,address) votingPowerProvider) view returns(bool)
func (_IValSetDriver *IValSetDriverCaller) IsVotingPowerProviderRegistered(opts *bind.CallOpts, votingPowerProvider IValSetDriverCrossChainAddress) (bool, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "isVotingPowerProviderRegistered", votingPowerProvider)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsVotingPowerProviderRegistered is a free data retrieval call binding the contract method 0x1265b3be.
//
// Solidity: function isVotingPowerProviderRegistered((uint64,address) votingPowerProvider) view returns(bool)
func (_IValSetDriver *IValSetDriverSession) IsVotingPowerProviderRegistered(votingPowerProvider IValSetDriverCrossChainAddress) (bool, error) {
	return _IValSetDriver.Contract.IsVotingPowerProviderRegistered(&_IValSetDriver.CallOpts, votingPowerProvider)
}

// IsVotingPowerProviderRegistered is a free data retrieval call binding the contract method 0x1265b3be.
//
// Solidity: function isVotingPowerProviderRegistered((uint64,address) votingPowerProvider) view returns(bool)
func (_IValSetDriver *IValSetDriverCallerSession) IsVotingPowerProviderRegistered(votingPowerProvider IValSetDriverCrossChainAddress) (bool, error) {
	return _IValSetDriver.Contract.IsVotingPowerProviderRegistered(&_IValSetDriver.CallOpts, votingPowerProvider)
}

// IsVotingPowerProviderRegisteredAt is a free data retrieval call binding the contract method 0xc16ccb73.
//
// Solidity: function isVotingPowerProviderRegisteredAt((uint64,address) votingPowerProvider, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverCaller) IsVotingPowerProviderRegisteredAt(opts *bind.CallOpts, votingPowerProvider IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _IValSetDriver.contract.Call(opts, &out, "isVotingPowerProviderRegisteredAt", votingPowerProvider, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsVotingPowerProviderRegisteredAt is a free data retrieval call binding the contract method 0xc16ccb73.
//
// Solidity: function isVotingPowerProviderRegisteredAt((uint64,address) votingPowerProvider, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverSession) IsVotingPowerProviderRegisteredAt(votingPowerProvider IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _IValSetDriver.Contract.IsVotingPowerProviderRegisteredAt(&_IValSetDriver.CallOpts, votingPowerProvider, timestamp)
}

// IsVotingPowerProviderRegisteredAt is a free data retrieval call binding the contract method 0xc16ccb73.
//
// Solidity: function isVotingPowerProviderRegisteredAt((uint64,address) votingPowerProvider, uint48 timestamp) view returns(bool)
func (_IValSetDriver *IValSetDriverCallerSession) IsVotingPowerProviderRegisteredAt(votingPowerProvider IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _IValSetDriver.Contract.IsVotingPowerProviderRegisteredAt(&_IValSetDriver.CallOpts, votingPowerProvider, timestamp)
}

// AddQuorumThreshold is a paid mutator transaction binding the contract method 0x0fe5e0c2.
//
// Solidity: function addQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_IValSetDriver *IValSetDriverTransactor) AddQuorumThreshold(opts *bind.TransactOpts, quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "addQuorumThreshold", quorumThreshold)
}

// AddQuorumThreshold is a paid mutator transaction binding the contract method 0x0fe5e0c2.
//
// Solidity: function addQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_IValSetDriver *IValSetDriverSession) AddQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _IValSetDriver.Contract.AddQuorumThreshold(&_IValSetDriver.TransactOpts, quorumThreshold)
}

// AddQuorumThreshold is a paid mutator transaction binding the contract method 0x0fe5e0c2.
//
// Solidity: function addQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) AddQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _IValSetDriver.Contract.AddQuorumThreshold(&_IValSetDriver.TransactOpts, quorumThreshold)
}

// AddSettlement is a paid mutator transaction binding the contract method 0x52ab8872.
//
// Solidity: function addSettlement((uint64,address) settlement) returns()
func (_IValSetDriver *IValSetDriverTransactor) AddSettlement(opts *bind.TransactOpts, settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "addSettlement", settlement)
}

// AddSettlement is a paid mutator transaction binding the contract method 0x52ab8872.
//
// Solidity: function addSettlement((uint64,address) settlement) returns()
func (_IValSetDriver *IValSetDriverSession) AddSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.AddSettlement(&_IValSetDriver.TransactOpts, settlement)
}

// AddSettlement is a paid mutator transaction binding the contract method 0x52ab8872.
//
// Solidity: function addSettlement((uint64,address) settlement) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) AddSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.AddSettlement(&_IValSetDriver.TransactOpts, settlement)
}

// AddVotingPowerProvider is a paid mutator transaction binding the contract method 0x6940ed80.
//
// Solidity: function addVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_IValSetDriver *IValSetDriverTransactor) AddVotingPowerProvider(opts *bind.TransactOpts, votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "addVotingPowerProvider", votingPowerProvider)
}

// AddVotingPowerProvider is a paid mutator transaction binding the contract method 0x6940ed80.
//
// Solidity: function addVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_IValSetDriver *IValSetDriverSession) AddVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.AddVotingPowerProvider(&_IValSetDriver.TransactOpts, votingPowerProvider)
}

// AddVotingPowerProvider is a paid mutator transaction binding the contract method 0x6940ed80.
//
// Solidity: function addVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) AddVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.AddVotingPowerProvider(&_IValSetDriver.TransactOpts, votingPowerProvider)
}

// RemoveQuorumThreshold is a paid mutator transaction binding the contract method 0xf388db18.
//
// Solidity: function removeQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_IValSetDriver *IValSetDriverTransactor) RemoveQuorumThreshold(opts *bind.TransactOpts, quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "removeQuorumThreshold", quorumThreshold)
}

// RemoveQuorumThreshold is a paid mutator transaction binding the contract method 0xf388db18.
//
// Solidity: function removeQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_IValSetDriver *IValSetDriverSession) RemoveQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _IValSetDriver.Contract.RemoveQuorumThreshold(&_IValSetDriver.TransactOpts, quorumThreshold)
}

// RemoveQuorumThreshold is a paid mutator transaction binding the contract method 0xf388db18.
//
// Solidity: function removeQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) RemoveQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _IValSetDriver.Contract.RemoveQuorumThreshold(&_IValSetDriver.TransactOpts, quorumThreshold)
}

// RemoveSettlement is a paid mutator transaction binding the contract method 0x502bb1ad.
//
// Solidity: function removeSettlement((uint64,address) settlement) returns()
func (_IValSetDriver *IValSetDriverTransactor) RemoveSettlement(opts *bind.TransactOpts, settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "removeSettlement", settlement)
}

// RemoveSettlement is a paid mutator transaction binding the contract method 0x502bb1ad.
//
// Solidity: function removeSettlement((uint64,address) settlement) returns()
func (_IValSetDriver *IValSetDriverSession) RemoveSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.RemoveSettlement(&_IValSetDriver.TransactOpts, settlement)
}

// RemoveSettlement is a paid mutator transaction binding the contract method 0x502bb1ad.
//
// Solidity: function removeSettlement((uint64,address) settlement) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) RemoveSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.RemoveSettlement(&_IValSetDriver.TransactOpts, settlement)
}

// RemoveVotingPowerProvider is a paid mutator transaction binding the contract method 0x325234d5.
//
// Solidity: function removeVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_IValSetDriver *IValSetDriverTransactor) RemoveVotingPowerProvider(opts *bind.TransactOpts, votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "removeVotingPowerProvider", votingPowerProvider)
}

// RemoveVotingPowerProvider is a paid mutator transaction binding the contract method 0x325234d5.
//
// Solidity: function removeVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_IValSetDriver *IValSetDriverSession) RemoveVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.RemoveVotingPowerProvider(&_IValSetDriver.TransactOpts, votingPowerProvider)
}

// RemoveVotingPowerProvider is a paid mutator transaction binding the contract method 0x325234d5.
//
// Solidity: function removeVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) RemoveVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.RemoveVotingPowerProvider(&_IValSetDriver.TransactOpts, votingPowerProvider)
}

// SetCommitterSlotDuration is a paid mutator transaction binding the contract method 0xf86b8fa1.
//
// Solidity: function setCommitterSlotDuration(uint48 slotDuration) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetCommitterSlotDuration(opts *bind.TransactOpts, slotDuration *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setCommitterSlotDuration", slotDuration)
}

// SetCommitterSlotDuration is a paid mutator transaction binding the contract method 0xf86b8fa1.
//
// Solidity: function setCommitterSlotDuration(uint48 slotDuration) returns()
func (_IValSetDriver *IValSetDriverSession) SetCommitterSlotDuration(slotDuration *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetCommitterSlotDuration(&_IValSetDriver.TransactOpts, slotDuration)
}

// SetCommitterSlotDuration is a paid mutator transaction binding the contract method 0xf86b8fa1.
//
// Solidity: function setCommitterSlotDuration(uint48 slotDuration) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetCommitterSlotDuration(slotDuration *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetCommitterSlotDuration(&_IValSetDriver.TransactOpts, slotDuration)
}

// SetKeysProvider is a paid mutator transaction binding the contract method 0xdd08bbff.
//
// Solidity: function setKeysProvider((uint64,address) keysProvider) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetKeysProvider(opts *bind.TransactOpts, keysProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setKeysProvider", keysProvider)
}

// SetKeysProvider is a paid mutator transaction binding the contract method 0xdd08bbff.
//
// Solidity: function setKeysProvider((uint64,address) keysProvider) returns()
func (_IValSetDriver *IValSetDriverSession) SetKeysProvider(keysProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetKeysProvider(&_IValSetDriver.TransactOpts, keysProvider)
}

// SetKeysProvider is a paid mutator transaction binding the contract method 0xdd08bbff.
//
// Solidity: function setKeysProvider((uint64,address) keysProvider) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetKeysProvider(keysProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetKeysProvider(&_IValSetDriver.TransactOpts, keysProvider)
}

// SetMaxValidatorsCount is a paid mutator transaction binding the contract method 0xd2384cd3.
//
// Solidity: function setMaxValidatorsCount(uint208 maxValidatorsCount) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetMaxValidatorsCount(opts *bind.TransactOpts, maxValidatorsCount *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setMaxValidatorsCount", maxValidatorsCount)
}

// SetMaxValidatorsCount is a paid mutator transaction binding the contract method 0xd2384cd3.
//
// Solidity: function setMaxValidatorsCount(uint208 maxValidatorsCount) returns()
func (_IValSetDriver *IValSetDriverSession) SetMaxValidatorsCount(maxValidatorsCount *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetMaxValidatorsCount(&_IValSetDriver.TransactOpts, maxValidatorsCount)
}

// SetMaxValidatorsCount is a paid mutator transaction binding the contract method 0xd2384cd3.
//
// Solidity: function setMaxValidatorsCount(uint208 maxValidatorsCount) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetMaxValidatorsCount(maxValidatorsCount *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetMaxValidatorsCount(&_IValSetDriver.TransactOpts, maxValidatorsCount)
}

// SetMaxVotingPower is a paid mutator transaction binding the contract method 0xf6af258c.
//
// Solidity: function setMaxVotingPower(uint256 maxVotingPower) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetMaxVotingPower(opts *bind.TransactOpts, maxVotingPower *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setMaxVotingPower", maxVotingPower)
}

// SetMaxVotingPower is a paid mutator transaction binding the contract method 0xf6af258c.
//
// Solidity: function setMaxVotingPower(uint256 maxVotingPower) returns()
func (_IValSetDriver *IValSetDriverSession) SetMaxVotingPower(maxVotingPower *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetMaxVotingPower(&_IValSetDriver.TransactOpts, maxVotingPower)
}

// SetMaxVotingPower is a paid mutator transaction binding the contract method 0xf6af258c.
//
// Solidity: function setMaxVotingPower(uint256 maxVotingPower) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetMaxVotingPower(maxVotingPower *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetMaxVotingPower(&_IValSetDriver.TransactOpts, maxVotingPower)
}

// SetMinInclusionVotingPower is a paid mutator transaction binding the contract method 0xfaae42d7.
//
// Solidity: function setMinInclusionVotingPower(uint256 minInclusionVotingPower) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetMinInclusionVotingPower(opts *bind.TransactOpts, minInclusionVotingPower *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setMinInclusionVotingPower", minInclusionVotingPower)
}

// SetMinInclusionVotingPower is a paid mutator transaction binding the contract method 0xfaae42d7.
//
// Solidity: function setMinInclusionVotingPower(uint256 minInclusionVotingPower) returns()
func (_IValSetDriver *IValSetDriverSession) SetMinInclusionVotingPower(minInclusionVotingPower *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetMinInclusionVotingPower(&_IValSetDriver.TransactOpts, minInclusionVotingPower)
}

// SetMinInclusionVotingPower is a paid mutator transaction binding the contract method 0xfaae42d7.
//
// Solidity: function setMinInclusionVotingPower(uint256 minInclusionVotingPower) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetMinInclusionVotingPower(minInclusionVotingPower *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetMinInclusionVotingPower(&_IValSetDriver.TransactOpts, minInclusionVotingPower)
}

// SetNumAggregators is a paid mutator transaction binding the contract method 0x0dec288b.
//
// Solidity: function setNumAggregators(uint208 numAggregators) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetNumAggregators(opts *bind.TransactOpts, numAggregators *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setNumAggregators", numAggregators)
}

// SetNumAggregators is a paid mutator transaction binding the contract method 0x0dec288b.
//
// Solidity: function setNumAggregators(uint208 numAggregators) returns()
func (_IValSetDriver *IValSetDriverSession) SetNumAggregators(numAggregators *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetNumAggregators(&_IValSetDriver.TransactOpts, numAggregators)
}

// SetNumAggregators is a paid mutator transaction binding the contract method 0x0dec288b.
//
// Solidity: function setNumAggregators(uint208 numAggregators) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetNumAggregators(numAggregators *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetNumAggregators(&_IValSetDriver.TransactOpts, numAggregators)
}

// SetNumCommitters is a paid mutator transaction binding the contract method 0x15ddbbe8.
//
// Solidity: function setNumCommitters(uint208 numCommitters) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetNumCommitters(opts *bind.TransactOpts, numCommitters *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setNumCommitters", numCommitters)
}

// SetNumCommitters is a paid mutator transaction binding the contract method 0x15ddbbe8.
//
// Solidity: function setNumCommitters(uint208 numCommitters) returns()
func (_IValSetDriver *IValSetDriverSession) SetNumCommitters(numCommitters *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetNumCommitters(&_IValSetDriver.TransactOpts, numCommitters)
}

// SetNumCommitters is a paid mutator transaction binding the contract method 0x15ddbbe8.
//
// Solidity: function setNumCommitters(uint208 numCommitters) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetNumCommitters(numCommitters *big.Int) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetNumCommitters(&_IValSetDriver.TransactOpts, numCommitters)
}

// SetRequiredHeaderKeyTag is a paid mutator transaction binding the contract method 0xd9736e12.
//
// Solidity: function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetRequiredHeaderKeyTag(opts *bind.TransactOpts, requiredHeaderKeyTag uint8) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setRequiredHeaderKeyTag", requiredHeaderKeyTag)
}

// SetRequiredHeaderKeyTag is a paid mutator transaction binding the contract method 0xd9736e12.
//
// Solidity: function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) returns()
func (_IValSetDriver *IValSetDriverSession) SetRequiredHeaderKeyTag(requiredHeaderKeyTag uint8) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetRequiredHeaderKeyTag(&_IValSetDriver.TransactOpts, requiredHeaderKeyTag)
}

// SetRequiredHeaderKeyTag is a paid mutator transaction binding the contract method 0xd9736e12.
//
// Solidity: function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetRequiredHeaderKeyTag(requiredHeaderKeyTag uint8) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetRequiredHeaderKeyTag(&_IValSetDriver.TransactOpts, requiredHeaderKeyTag)
}

// SetRequiredKeyTags is a paid mutator transaction binding the contract method 0x4678a284.
//
// Solidity: function setRequiredKeyTags(uint8[] requiredKeyTags) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetRequiredKeyTags(opts *bind.TransactOpts, requiredKeyTags []uint8) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setRequiredKeyTags", requiredKeyTags)
}

// SetRequiredKeyTags is a paid mutator transaction binding the contract method 0x4678a284.
//
// Solidity: function setRequiredKeyTags(uint8[] requiredKeyTags) returns()
func (_IValSetDriver *IValSetDriverSession) SetRequiredKeyTags(requiredKeyTags []uint8) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetRequiredKeyTags(&_IValSetDriver.TransactOpts, requiredKeyTags)
}

// SetRequiredKeyTags is a paid mutator transaction binding the contract method 0x4678a284.
//
// Solidity: function setRequiredKeyTags(uint8[] requiredKeyTags) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetRequiredKeyTags(requiredKeyTags []uint8) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetRequiredKeyTags(&_IValSetDriver.TransactOpts, requiredKeyTags)
}

// SetVerificationType is a paid mutator transaction binding the contract method 0x7b8ef42d.
//
// Solidity: function setVerificationType(uint32 verificationType) returns()
func (_IValSetDriver *IValSetDriverTransactor) SetVerificationType(opts *bind.TransactOpts, verificationType uint32) (*types.Transaction, error) {
	return _IValSetDriver.contract.Transact(opts, "setVerificationType", verificationType)
}

// SetVerificationType is a paid mutator transaction binding the contract method 0x7b8ef42d.
//
// Solidity: function setVerificationType(uint32 verificationType) returns()
func (_IValSetDriver *IValSetDriverSession) SetVerificationType(verificationType uint32) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetVerificationType(&_IValSetDriver.TransactOpts, verificationType)
}

// SetVerificationType is a paid mutator transaction binding the contract method 0x7b8ef42d.
//
// Solidity: function setVerificationType(uint32 verificationType) returns()
func (_IValSetDriver *IValSetDriverTransactorSession) SetVerificationType(verificationType uint32) (*types.Transaction, error) {
	return _IValSetDriver.Contract.SetVerificationType(&_IValSetDriver.TransactOpts, verificationType)
}

// IValSetDriverAddQuorumThresholdIterator is returned from FilterAddQuorumThreshold and is used to iterate over the raw logs and unpacked data for AddQuorumThreshold events raised by the IValSetDriver contract.
type IValSetDriverAddQuorumThresholdIterator struct {
	Event *IValSetDriverAddQuorumThreshold // Event containing the contract specifics and raw log

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
func (it *IValSetDriverAddQuorumThresholdIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverAddQuorumThreshold)
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
		it.Event = new(IValSetDriverAddQuorumThreshold)
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
func (it *IValSetDriverAddQuorumThresholdIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverAddQuorumThresholdIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverAddQuorumThreshold represents a AddQuorumThreshold event raised by the IValSetDriver contract.
type IValSetDriverAddQuorumThreshold struct {
	QuorumThreshold IValSetDriverQuorumThreshold
	Raw             types.Log // Blockchain specific contextual infos
}

// FilterAddQuorumThreshold is a free log retrieval operation binding the contract event 0x88ee37bfc079201d8493557f757c8ff6b14222ae13a8393747fb3c74b8ddf06f.
//
// Solidity: event AddQuorumThreshold((uint8,uint248) quorumThreshold)
func (_IValSetDriver *IValSetDriverFilterer) FilterAddQuorumThreshold(opts *bind.FilterOpts) (*IValSetDriverAddQuorumThresholdIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "AddQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverAddQuorumThresholdIterator{contract: _IValSetDriver.contract, event: "AddQuorumThreshold", logs: logs, sub: sub}, nil
}

// WatchAddQuorumThreshold is a free log subscription operation binding the contract event 0x88ee37bfc079201d8493557f757c8ff6b14222ae13a8393747fb3c74b8ddf06f.
//
// Solidity: event AddQuorumThreshold((uint8,uint248) quorumThreshold)
func (_IValSetDriver *IValSetDriverFilterer) WatchAddQuorumThreshold(opts *bind.WatchOpts, sink chan<- *IValSetDriverAddQuorumThreshold) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "AddQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverAddQuorumThreshold)
				if err := _IValSetDriver.contract.UnpackLog(event, "AddQuorumThreshold", log); err != nil {
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

// ParseAddQuorumThreshold is a log parse operation binding the contract event 0x88ee37bfc079201d8493557f757c8ff6b14222ae13a8393747fb3c74b8ddf06f.
//
// Solidity: event AddQuorumThreshold((uint8,uint248) quorumThreshold)
func (_IValSetDriver *IValSetDriverFilterer) ParseAddQuorumThreshold(log types.Log) (*IValSetDriverAddQuorumThreshold, error) {
	event := new(IValSetDriverAddQuorumThreshold)
	if err := _IValSetDriver.contract.UnpackLog(event, "AddQuorumThreshold", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverAddSettlementIterator is returned from FilterAddSettlement and is used to iterate over the raw logs and unpacked data for AddSettlement events raised by the IValSetDriver contract.
type IValSetDriverAddSettlementIterator struct {
	Event *IValSetDriverAddSettlement // Event containing the contract specifics and raw log

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
func (it *IValSetDriverAddSettlementIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverAddSettlement)
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
		it.Event = new(IValSetDriverAddSettlement)
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
func (it *IValSetDriverAddSettlementIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverAddSettlementIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverAddSettlement represents a AddSettlement event raised by the IValSetDriver contract.
type IValSetDriverAddSettlement struct {
	Settlement IValSetDriverCrossChainAddress
	Raw        types.Log // Blockchain specific contextual infos
}

// FilterAddSettlement is a free log retrieval operation binding the contract event 0xd66c27144960b789ff7b5514538e3d85a3623c1669b8d6db4eb85658df2aad57.
//
// Solidity: event AddSettlement((uint64,address) settlement)
func (_IValSetDriver *IValSetDriverFilterer) FilterAddSettlement(opts *bind.FilterOpts) (*IValSetDriverAddSettlementIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "AddSettlement")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverAddSettlementIterator{contract: _IValSetDriver.contract, event: "AddSettlement", logs: logs, sub: sub}, nil
}

// WatchAddSettlement is a free log subscription operation binding the contract event 0xd66c27144960b789ff7b5514538e3d85a3623c1669b8d6db4eb85658df2aad57.
//
// Solidity: event AddSettlement((uint64,address) settlement)
func (_IValSetDriver *IValSetDriverFilterer) WatchAddSettlement(opts *bind.WatchOpts, sink chan<- *IValSetDriverAddSettlement) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "AddSettlement")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverAddSettlement)
				if err := _IValSetDriver.contract.UnpackLog(event, "AddSettlement", log); err != nil {
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

// ParseAddSettlement is a log parse operation binding the contract event 0xd66c27144960b789ff7b5514538e3d85a3623c1669b8d6db4eb85658df2aad57.
//
// Solidity: event AddSettlement((uint64,address) settlement)
func (_IValSetDriver *IValSetDriverFilterer) ParseAddSettlement(log types.Log) (*IValSetDriverAddSettlement, error) {
	event := new(IValSetDriverAddSettlement)
	if err := _IValSetDriver.contract.UnpackLog(event, "AddSettlement", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverAddVotingPowerProviderIterator is returned from FilterAddVotingPowerProvider and is used to iterate over the raw logs and unpacked data for AddVotingPowerProvider events raised by the IValSetDriver contract.
type IValSetDriverAddVotingPowerProviderIterator struct {
	Event *IValSetDriverAddVotingPowerProvider // Event containing the contract specifics and raw log

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
func (it *IValSetDriverAddVotingPowerProviderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverAddVotingPowerProvider)
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
		it.Event = new(IValSetDriverAddVotingPowerProvider)
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
func (it *IValSetDriverAddVotingPowerProviderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverAddVotingPowerProviderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverAddVotingPowerProvider represents a AddVotingPowerProvider event raised by the IValSetDriver contract.
type IValSetDriverAddVotingPowerProvider struct {
	VotingPowerProvider IValSetDriverCrossChainAddress
	Raw                 types.Log // Blockchain specific contextual infos
}

// FilterAddVotingPowerProvider is a free log retrieval operation binding the contract event 0xa8ba28fa43d2ebdcd4f5c29ee4f5e5fb568e9986ae8be7c6ae54540176d6147f.
//
// Solidity: event AddVotingPowerProvider((uint64,address) votingPowerProvider)
func (_IValSetDriver *IValSetDriverFilterer) FilterAddVotingPowerProvider(opts *bind.FilterOpts) (*IValSetDriverAddVotingPowerProviderIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "AddVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverAddVotingPowerProviderIterator{contract: _IValSetDriver.contract, event: "AddVotingPowerProvider", logs: logs, sub: sub}, nil
}

// WatchAddVotingPowerProvider is a free log subscription operation binding the contract event 0xa8ba28fa43d2ebdcd4f5c29ee4f5e5fb568e9986ae8be7c6ae54540176d6147f.
//
// Solidity: event AddVotingPowerProvider((uint64,address) votingPowerProvider)
func (_IValSetDriver *IValSetDriverFilterer) WatchAddVotingPowerProvider(opts *bind.WatchOpts, sink chan<- *IValSetDriverAddVotingPowerProvider) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "AddVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverAddVotingPowerProvider)
				if err := _IValSetDriver.contract.UnpackLog(event, "AddVotingPowerProvider", log); err != nil {
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

// ParseAddVotingPowerProvider is a log parse operation binding the contract event 0xa8ba28fa43d2ebdcd4f5c29ee4f5e5fb568e9986ae8be7c6ae54540176d6147f.
//
// Solidity: event AddVotingPowerProvider((uint64,address) votingPowerProvider)
func (_IValSetDriver *IValSetDriverFilterer) ParseAddVotingPowerProvider(log types.Log) (*IValSetDriverAddVotingPowerProvider, error) {
	event := new(IValSetDriverAddVotingPowerProvider)
	if err := _IValSetDriver.contract.UnpackLog(event, "AddVotingPowerProvider", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverRemoveQuorumThresholdIterator is returned from FilterRemoveQuorumThreshold and is used to iterate over the raw logs and unpacked data for RemoveQuorumThreshold events raised by the IValSetDriver contract.
type IValSetDriverRemoveQuorumThresholdIterator struct {
	Event *IValSetDriverRemoveQuorumThreshold // Event containing the contract specifics and raw log

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
func (it *IValSetDriverRemoveQuorumThresholdIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverRemoveQuorumThreshold)
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
		it.Event = new(IValSetDriverRemoveQuorumThreshold)
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
func (it *IValSetDriverRemoveQuorumThresholdIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverRemoveQuorumThresholdIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverRemoveQuorumThreshold represents a RemoveQuorumThreshold event raised by the IValSetDriver contract.
type IValSetDriverRemoveQuorumThreshold struct {
	QuorumThreshold IValSetDriverQuorumThreshold
	Raw             types.Log // Blockchain specific contextual infos
}

// FilterRemoveQuorumThreshold is a free log retrieval operation binding the contract event 0xb321a5a0425badf1acf0a0b21b7984fa61e1e6405ae9011d4dcdb29b0e2f43ec.
//
// Solidity: event RemoveQuorumThreshold((uint8,uint248) quorumThreshold)
func (_IValSetDriver *IValSetDriverFilterer) FilterRemoveQuorumThreshold(opts *bind.FilterOpts) (*IValSetDriverRemoveQuorumThresholdIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "RemoveQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverRemoveQuorumThresholdIterator{contract: _IValSetDriver.contract, event: "RemoveQuorumThreshold", logs: logs, sub: sub}, nil
}

// WatchRemoveQuorumThreshold is a free log subscription operation binding the contract event 0xb321a5a0425badf1acf0a0b21b7984fa61e1e6405ae9011d4dcdb29b0e2f43ec.
//
// Solidity: event RemoveQuorumThreshold((uint8,uint248) quorumThreshold)
func (_IValSetDriver *IValSetDriverFilterer) WatchRemoveQuorumThreshold(opts *bind.WatchOpts, sink chan<- *IValSetDriverRemoveQuorumThreshold) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "RemoveQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverRemoveQuorumThreshold)
				if err := _IValSetDriver.contract.UnpackLog(event, "RemoveQuorumThreshold", log); err != nil {
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

// ParseRemoveQuorumThreshold is a log parse operation binding the contract event 0xb321a5a0425badf1acf0a0b21b7984fa61e1e6405ae9011d4dcdb29b0e2f43ec.
//
// Solidity: event RemoveQuorumThreshold((uint8,uint248) quorumThreshold)
func (_IValSetDriver *IValSetDriverFilterer) ParseRemoveQuorumThreshold(log types.Log) (*IValSetDriverRemoveQuorumThreshold, error) {
	event := new(IValSetDriverRemoveQuorumThreshold)
	if err := _IValSetDriver.contract.UnpackLog(event, "RemoveQuorumThreshold", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverRemoveSettlementIterator is returned from FilterRemoveSettlement and is used to iterate over the raw logs and unpacked data for RemoveSettlement events raised by the IValSetDriver contract.
type IValSetDriverRemoveSettlementIterator struct {
	Event *IValSetDriverRemoveSettlement // Event containing the contract specifics and raw log

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
func (it *IValSetDriverRemoveSettlementIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverRemoveSettlement)
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
		it.Event = new(IValSetDriverRemoveSettlement)
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
func (it *IValSetDriverRemoveSettlementIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverRemoveSettlementIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverRemoveSettlement represents a RemoveSettlement event raised by the IValSetDriver contract.
type IValSetDriverRemoveSettlement struct {
	Settlement IValSetDriverCrossChainAddress
	Raw        types.Log // Blockchain specific contextual infos
}

// FilterRemoveSettlement is a free log retrieval operation binding the contract event 0x6307047e2a245d2a5867f7667a4a48687593b73e3b2f95d2204256cbff350cf3.
//
// Solidity: event RemoveSettlement((uint64,address) settlement)
func (_IValSetDriver *IValSetDriverFilterer) FilterRemoveSettlement(opts *bind.FilterOpts) (*IValSetDriverRemoveSettlementIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "RemoveSettlement")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverRemoveSettlementIterator{contract: _IValSetDriver.contract, event: "RemoveSettlement", logs: logs, sub: sub}, nil
}

// WatchRemoveSettlement is a free log subscription operation binding the contract event 0x6307047e2a245d2a5867f7667a4a48687593b73e3b2f95d2204256cbff350cf3.
//
// Solidity: event RemoveSettlement((uint64,address) settlement)
func (_IValSetDriver *IValSetDriverFilterer) WatchRemoveSettlement(opts *bind.WatchOpts, sink chan<- *IValSetDriverRemoveSettlement) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "RemoveSettlement")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverRemoveSettlement)
				if err := _IValSetDriver.contract.UnpackLog(event, "RemoveSettlement", log); err != nil {
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

// ParseRemoveSettlement is a log parse operation binding the contract event 0x6307047e2a245d2a5867f7667a4a48687593b73e3b2f95d2204256cbff350cf3.
//
// Solidity: event RemoveSettlement((uint64,address) settlement)
func (_IValSetDriver *IValSetDriverFilterer) ParseRemoveSettlement(log types.Log) (*IValSetDriverRemoveSettlement, error) {
	event := new(IValSetDriverRemoveSettlement)
	if err := _IValSetDriver.contract.UnpackLog(event, "RemoveSettlement", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverRemoveVotingPowerProviderIterator is returned from FilterRemoveVotingPowerProvider and is used to iterate over the raw logs and unpacked data for RemoveVotingPowerProvider events raised by the IValSetDriver contract.
type IValSetDriverRemoveVotingPowerProviderIterator struct {
	Event *IValSetDriverRemoveVotingPowerProvider // Event containing the contract specifics and raw log

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
func (it *IValSetDriverRemoveVotingPowerProviderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverRemoveVotingPowerProvider)
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
		it.Event = new(IValSetDriverRemoveVotingPowerProvider)
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
func (it *IValSetDriverRemoveVotingPowerProviderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverRemoveVotingPowerProviderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverRemoveVotingPowerProvider represents a RemoveVotingPowerProvider event raised by the IValSetDriver contract.
type IValSetDriverRemoveVotingPowerProvider struct {
	VotingPowerProvider IValSetDriverCrossChainAddress
	Raw                 types.Log // Blockchain specific contextual infos
}

// FilterRemoveVotingPowerProvider is a free log retrieval operation binding the contract event 0x2a2103a52b9c3907936be3fea265a7bd34fdfc0c8c09cc3b8e3938b7deda761f.
//
// Solidity: event RemoveVotingPowerProvider((uint64,address) votingPowerProvider)
func (_IValSetDriver *IValSetDriverFilterer) FilterRemoveVotingPowerProvider(opts *bind.FilterOpts) (*IValSetDriverRemoveVotingPowerProviderIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "RemoveVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverRemoveVotingPowerProviderIterator{contract: _IValSetDriver.contract, event: "RemoveVotingPowerProvider", logs: logs, sub: sub}, nil
}

// WatchRemoveVotingPowerProvider is a free log subscription operation binding the contract event 0x2a2103a52b9c3907936be3fea265a7bd34fdfc0c8c09cc3b8e3938b7deda761f.
//
// Solidity: event RemoveVotingPowerProvider((uint64,address) votingPowerProvider)
func (_IValSetDriver *IValSetDriverFilterer) WatchRemoveVotingPowerProvider(opts *bind.WatchOpts, sink chan<- *IValSetDriverRemoveVotingPowerProvider) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "RemoveVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverRemoveVotingPowerProvider)
				if err := _IValSetDriver.contract.UnpackLog(event, "RemoveVotingPowerProvider", log); err != nil {
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

// ParseRemoveVotingPowerProvider is a log parse operation binding the contract event 0x2a2103a52b9c3907936be3fea265a7bd34fdfc0c8c09cc3b8e3938b7deda761f.
//
// Solidity: event RemoveVotingPowerProvider((uint64,address) votingPowerProvider)
func (_IValSetDriver *IValSetDriverFilterer) ParseRemoveVotingPowerProvider(log types.Log) (*IValSetDriverRemoveVotingPowerProvider, error) {
	event := new(IValSetDriverRemoveVotingPowerProvider)
	if err := _IValSetDriver.contract.UnpackLog(event, "RemoveVotingPowerProvider", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetCommitterSlotDurationIterator is returned from FilterSetCommitterSlotDuration and is used to iterate over the raw logs and unpacked data for SetCommitterSlotDuration events raised by the IValSetDriver contract.
type IValSetDriverSetCommitterSlotDurationIterator struct {
	Event *IValSetDriverSetCommitterSlotDuration // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetCommitterSlotDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetCommitterSlotDuration)
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
		it.Event = new(IValSetDriverSetCommitterSlotDuration)
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
func (it *IValSetDriverSetCommitterSlotDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetCommitterSlotDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetCommitterSlotDuration represents a SetCommitterSlotDuration event raised by the IValSetDriver contract.
type IValSetDriverSetCommitterSlotDuration struct {
	CommitterSlotDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetCommitterSlotDuration is a free log retrieval operation binding the contract event 0x853ac7224393856467cf1f4981ef9fa5d586d71783e6f66221f7af0a987f7d51.
//
// Solidity: event SetCommitterSlotDuration(uint48 committerSlotDuration)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetCommitterSlotDuration(opts *bind.FilterOpts) (*IValSetDriverSetCommitterSlotDurationIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetCommitterSlotDuration")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetCommitterSlotDurationIterator{contract: _IValSetDriver.contract, event: "SetCommitterSlotDuration", logs: logs, sub: sub}, nil
}

// WatchSetCommitterSlotDuration is a free log subscription operation binding the contract event 0x853ac7224393856467cf1f4981ef9fa5d586d71783e6f66221f7af0a987f7d51.
//
// Solidity: event SetCommitterSlotDuration(uint48 committerSlotDuration)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetCommitterSlotDuration(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetCommitterSlotDuration) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetCommitterSlotDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetCommitterSlotDuration)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetCommitterSlotDuration", log); err != nil {
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

// ParseSetCommitterSlotDuration is a log parse operation binding the contract event 0x853ac7224393856467cf1f4981ef9fa5d586d71783e6f66221f7af0a987f7d51.
//
// Solidity: event SetCommitterSlotDuration(uint48 committerSlotDuration)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetCommitterSlotDuration(log types.Log) (*IValSetDriverSetCommitterSlotDuration, error) {
	event := new(IValSetDriverSetCommitterSlotDuration)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetCommitterSlotDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetKeysProviderIterator is returned from FilterSetKeysProvider and is used to iterate over the raw logs and unpacked data for SetKeysProvider events raised by the IValSetDriver contract.
type IValSetDriverSetKeysProviderIterator struct {
	Event *IValSetDriverSetKeysProvider // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetKeysProviderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetKeysProvider)
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
		it.Event = new(IValSetDriverSetKeysProvider)
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
func (it *IValSetDriverSetKeysProviderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetKeysProviderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetKeysProvider represents a SetKeysProvider event raised by the IValSetDriver contract.
type IValSetDriverSetKeysProvider struct {
	KeysProvider IValSetDriverCrossChainAddress
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterSetKeysProvider is a free log retrieval operation binding the contract event 0x15ceb492f5dd0988720d5f2258f4de98a2ac5df85b25ed2f33eda91e90e07321.
//
// Solidity: event SetKeysProvider((uint64,address) keysProvider)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetKeysProvider(opts *bind.FilterOpts) (*IValSetDriverSetKeysProviderIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetKeysProvider")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetKeysProviderIterator{contract: _IValSetDriver.contract, event: "SetKeysProvider", logs: logs, sub: sub}, nil
}

// WatchSetKeysProvider is a free log subscription operation binding the contract event 0x15ceb492f5dd0988720d5f2258f4de98a2ac5df85b25ed2f33eda91e90e07321.
//
// Solidity: event SetKeysProvider((uint64,address) keysProvider)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetKeysProvider(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetKeysProvider) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetKeysProvider")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetKeysProvider)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetKeysProvider", log); err != nil {
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

// ParseSetKeysProvider is a log parse operation binding the contract event 0x15ceb492f5dd0988720d5f2258f4de98a2ac5df85b25ed2f33eda91e90e07321.
//
// Solidity: event SetKeysProvider((uint64,address) keysProvider)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetKeysProvider(log types.Log) (*IValSetDriverSetKeysProvider, error) {
	event := new(IValSetDriverSetKeysProvider)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetKeysProvider", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetMaxValidatorsCountIterator is returned from FilterSetMaxValidatorsCount and is used to iterate over the raw logs and unpacked data for SetMaxValidatorsCount events raised by the IValSetDriver contract.
type IValSetDriverSetMaxValidatorsCountIterator struct {
	Event *IValSetDriverSetMaxValidatorsCount // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetMaxValidatorsCountIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetMaxValidatorsCount)
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
		it.Event = new(IValSetDriverSetMaxValidatorsCount)
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
func (it *IValSetDriverSetMaxValidatorsCountIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetMaxValidatorsCountIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetMaxValidatorsCount represents a SetMaxValidatorsCount event raised by the IValSetDriver contract.
type IValSetDriverSetMaxValidatorsCount struct {
	MaxValidatorsCount *big.Int
	Raw                types.Log // Blockchain specific contextual infos
}

// FilterSetMaxValidatorsCount is a free log retrieval operation binding the contract event 0x37ca3532b507cfa33b11765ae8b499cb6830421b982a7f8837ee71ca5a3119c8.
//
// Solidity: event SetMaxValidatorsCount(uint208 maxValidatorsCount)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetMaxValidatorsCount(opts *bind.FilterOpts) (*IValSetDriverSetMaxValidatorsCountIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetMaxValidatorsCount")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetMaxValidatorsCountIterator{contract: _IValSetDriver.contract, event: "SetMaxValidatorsCount", logs: logs, sub: sub}, nil
}

// WatchSetMaxValidatorsCount is a free log subscription operation binding the contract event 0x37ca3532b507cfa33b11765ae8b499cb6830421b982a7f8837ee71ca5a3119c8.
//
// Solidity: event SetMaxValidatorsCount(uint208 maxValidatorsCount)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetMaxValidatorsCount(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetMaxValidatorsCount) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetMaxValidatorsCount")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetMaxValidatorsCount)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetMaxValidatorsCount", log); err != nil {
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

// ParseSetMaxValidatorsCount is a log parse operation binding the contract event 0x37ca3532b507cfa33b11765ae8b499cb6830421b982a7f8837ee71ca5a3119c8.
//
// Solidity: event SetMaxValidatorsCount(uint208 maxValidatorsCount)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetMaxValidatorsCount(log types.Log) (*IValSetDriverSetMaxValidatorsCount, error) {
	event := new(IValSetDriverSetMaxValidatorsCount)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetMaxValidatorsCount", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetMaxVotingPowerIterator is returned from FilterSetMaxVotingPower and is used to iterate over the raw logs and unpacked data for SetMaxVotingPower events raised by the IValSetDriver contract.
type IValSetDriverSetMaxVotingPowerIterator struct {
	Event *IValSetDriverSetMaxVotingPower // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetMaxVotingPowerIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetMaxVotingPower)
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
		it.Event = new(IValSetDriverSetMaxVotingPower)
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
func (it *IValSetDriverSetMaxVotingPowerIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetMaxVotingPowerIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetMaxVotingPower represents a SetMaxVotingPower event raised by the IValSetDriver contract.
type IValSetDriverSetMaxVotingPower struct {
	MaxVotingPower *big.Int
	Raw            types.Log // Blockchain specific contextual infos
}

// FilterSetMaxVotingPower is a free log retrieval operation binding the contract event 0xe891886eac9e583940fb0844098689693a4d105206ec1f789d119b4314383b95.
//
// Solidity: event SetMaxVotingPower(uint256 maxVotingPower)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetMaxVotingPower(opts *bind.FilterOpts) (*IValSetDriverSetMaxVotingPowerIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetMaxVotingPower")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetMaxVotingPowerIterator{contract: _IValSetDriver.contract, event: "SetMaxVotingPower", logs: logs, sub: sub}, nil
}

// WatchSetMaxVotingPower is a free log subscription operation binding the contract event 0xe891886eac9e583940fb0844098689693a4d105206ec1f789d119b4314383b95.
//
// Solidity: event SetMaxVotingPower(uint256 maxVotingPower)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetMaxVotingPower(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetMaxVotingPower) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetMaxVotingPower")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetMaxVotingPower)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetMaxVotingPower", log); err != nil {
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

// ParseSetMaxVotingPower is a log parse operation binding the contract event 0xe891886eac9e583940fb0844098689693a4d105206ec1f789d119b4314383b95.
//
// Solidity: event SetMaxVotingPower(uint256 maxVotingPower)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetMaxVotingPower(log types.Log) (*IValSetDriverSetMaxVotingPower, error) {
	event := new(IValSetDriverSetMaxVotingPower)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetMaxVotingPower", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetMinInclusionVotingPowerIterator is returned from FilterSetMinInclusionVotingPower and is used to iterate over the raw logs and unpacked data for SetMinInclusionVotingPower events raised by the IValSetDriver contract.
type IValSetDriverSetMinInclusionVotingPowerIterator struct {
	Event *IValSetDriverSetMinInclusionVotingPower // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetMinInclusionVotingPowerIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetMinInclusionVotingPower)
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
		it.Event = new(IValSetDriverSetMinInclusionVotingPower)
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
func (it *IValSetDriverSetMinInclusionVotingPowerIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetMinInclusionVotingPowerIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetMinInclusionVotingPower represents a SetMinInclusionVotingPower event raised by the IValSetDriver contract.
type IValSetDriverSetMinInclusionVotingPower struct {
	MinInclusionVotingPower *big.Int
	Raw                     types.Log // Blockchain specific contextual infos
}

// FilterSetMinInclusionVotingPower is a free log retrieval operation binding the contract event 0x7ea1f11872caff0567f050bd06f29f128a1407e56e3272abbadef87f6cbb6188.
//
// Solidity: event SetMinInclusionVotingPower(uint256 minInclusionVotingPower)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetMinInclusionVotingPower(opts *bind.FilterOpts) (*IValSetDriverSetMinInclusionVotingPowerIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetMinInclusionVotingPower")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetMinInclusionVotingPowerIterator{contract: _IValSetDriver.contract, event: "SetMinInclusionVotingPower", logs: logs, sub: sub}, nil
}

// WatchSetMinInclusionVotingPower is a free log subscription operation binding the contract event 0x7ea1f11872caff0567f050bd06f29f128a1407e56e3272abbadef87f6cbb6188.
//
// Solidity: event SetMinInclusionVotingPower(uint256 minInclusionVotingPower)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetMinInclusionVotingPower(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetMinInclusionVotingPower) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetMinInclusionVotingPower")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetMinInclusionVotingPower)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetMinInclusionVotingPower", log); err != nil {
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

// ParseSetMinInclusionVotingPower is a log parse operation binding the contract event 0x7ea1f11872caff0567f050bd06f29f128a1407e56e3272abbadef87f6cbb6188.
//
// Solidity: event SetMinInclusionVotingPower(uint256 minInclusionVotingPower)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetMinInclusionVotingPower(log types.Log) (*IValSetDriverSetMinInclusionVotingPower, error) {
	event := new(IValSetDriverSetMinInclusionVotingPower)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetMinInclusionVotingPower", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetNumAggregatorsIterator is returned from FilterSetNumAggregators and is used to iterate over the raw logs and unpacked data for SetNumAggregators events raised by the IValSetDriver contract.
type IValSetDriverSetNumAggregatorsIterator struct {
	Event *IValSetDriverSetNumAggregators // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetNumAggregatorsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetNumAggregators)
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
		it.Event = new(IValSetDriverSetNumAggregators)
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
func (it *IValSetDriverSetNumAggregatorsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetNumAggregatorsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetNumAggregators represents a SetNumAggregators event raised by the IValSetDriver contract.
type IValSetDriverSetNumAggregators struct {
	NumAggregators *big.Int
	Raw            types.Log // Blockchain specific contextual infos
}

// FilterSetNumAggregators is a free log retrieval operation binding the contract event 0xa47e6808a463c6134cf3bb23d54ee0ccb5c8056ab8c8b5fd5277fc83cc2f25f3.
//
// Solidity: event SetNumAggregators(uint208 numAggregators)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetNumAggregators(opts *bind.FilterOpts) (*IValSetDriverSetNumAggregatorsIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetNumAggregators")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetNumAggregatorsIterator{contract: _IValSetDriver.contract, event: "SetNumAggregators", logs: logs, sub: sub}, nil
}

// WatchSetNumAggregators is a free log subscription operation binding the contract event 0xa47e6808a463c6134cf3bb23d54ee0ccb5c8056ab8c8b5fd5277fc83cc2f25f3.
//
// Solidity: event SetNumAggregators(uint208 numAggregators)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetNumAggregators(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetNumAggregators) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetNumAggregators")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetNumAggregators)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetNumAggregators", log); err != nil {
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

// ParseSetNumAggregators is a log parse operation binding the contract event 0xa47e6808a463c6134cf3bb23d54ee0ccb5c8056ab8c8b5fd5277fc83cc2f25f3.
//
// Solidity: event SetNumAggregators(uint208 numAggregators)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetNumAggregators(log types.Log) (*IValSetDriverSetNumAggregators, error) {
	event := new(IValSetDriverSetNumAggregators)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetNumAggregators", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetNumCommittersIterator is returned from FilterSetNumCommitters and is used to iterate over the raw logs and unpacked data for SetNumCommitters events raised by the IValSetDriver contract.
type IValSetDriverSetNumCommittersIterator struct {
	Event *IValSetDriverSetNumCommitters // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetNumCommittersIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetNumCommitters)
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
		it.Event = new(IValSetDriverSetNumCommitters)
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
func (it *IValSetDriverSetNumCommittersIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetNumCommittersIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetNumCommitters represents a SetNumCommitters event raised by the IValSetDriver contract.
type IValSetDriverSetNumCommitters struct {
	NumCommitters *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterSetNumCommitters is a free log retrieval operation binding the contract event 0x931a819f63102a134c17aeb8b67a254fc3e215c35487041ff43fd3225b272b5f.
//
// Solidity: event SetNumCommitters(uint208 numCommitters)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetNumCommitters(opts *bind.FilterOpts) (*IValSetDriverSetNumCommittersIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetNumCommitters")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetNumCommittersIterator{contract: _IValSetDriver.contract, event: "SetNumCommitters", logs: logs, sub: sub}, nil
}

// WatchSetNumCommitters is a free log subscription operation binding the contract event 0x931a819f63102a134c17aeb8b67a254fc3e215c35487041ff43fd3225b272b5f.
//
// Solidity: event SetNumCommitters(uint208 numCommitters)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetNumCommitters(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetNumCommitters) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetNumCommitters")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetNumCommitters)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetNumCommitters", log); err != nil {
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

// ParseSetNumCommitters is a log parse operation binding the contract event 0x931a819f63102a134c17aeb8b67a254fc3e215c35487041ff43fd3225b272b5f.
//
// Solidity: event SetNumCommitters(uint208 numCommitters)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetNumCommitters(log types.Log) (*IValSetDriverSetNumCommitters, error) {
	event := new(IValSetDriverSetNumCommitters)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetNumCommitters", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetRequiredHeaderKeyTagIterator is returned from FilterSetRequiredHeaderKeyTag and is used to iterate over the raw logs and unpacked data for SetRequiredHeaderKeyTag events raised by the IValSetDriver contract.
type IValSetDriverSetRequiredHeaderKeyTagIterator struct {
	Event *IValSetDriverSetRequiredHeaderKeyTag // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetRequiredHeaderKeyTagIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetRequiredHeaderKeyTag)
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
		it.Event = new(IValSetDriverSetRequiredHeaderKeyTag)
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
func (it *IValSetDriverSetRequiredHeaderKeyTagIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetRequiredHeaderKeyTagIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetRequiredHeaderKeyTag represents a SetRequiredHeaderKeyTag event raised by the IValSetDriver contract.
type IValSetDriverSetRequiredHeaderKeyTag struct {
	RequiredHeaderKeyTag uint8
	Raw                  types.Log // Blockchain specific contextual infos
}

// FilterSetRequiredHeaderKeyTag is a free log retrieval operation binding the contract event 0xba7887224500eabdaa5bddd0e0210aec811345379939ffbbc4bc87bdfb673b70.
//
// Solidity: event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetRequiredHeaderKeyTag(opts *bind.FilterOpts) (*IValSetDriverSetRequiredHeaderKeyTagIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetRequiredHeaderKeyTag")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetRequiredHeaderKeyTagIterator{contract: _IValSetDriver.contract, event: "SetRequiredHeaderKeyTag", logs: logs, sub: sub}, nil
}

// WatchSetRequiredHeaderKeyTag is a free log subscription operation binding the contract event 0xba7887224500eabdaa5bddd0e0210aec811345379939ffbbc4bc87bdfb673b70.
//
// Solidity: event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetRequiredHeaderKeyTag(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetRequiredHeaderKeyTag) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetRequiredHeaderKeyTag")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetRequiredHeaderKeyTag)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetRequiredHeaderKeyTag", log); err != nil {
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

// ParseSetRequiredHeaderKeyTag is a log parse operation binding the contract event 0xba7887224500eabdaa5bddd0e0210aec811345379939ffbbc4bc87bdfb673b70.
//
// Solidity: event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetRequiredHeaderKeyTag(log types.Log) (*IValSetDriverSetRequiredHeaderKeyTag, error) {
	event := new(IValSetDriverSetRequiredHeaderKeyTag)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetRequiredHeaderKeyTag", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetRequiredKeyTagsIterator is returned from FilterSetRequiredKeyTags and is used to iterate over the raw logs and unpacked data for SetRequiredKeyTags events raised by the IValSetDriver contract.
type IValSetDriverSetRequiredKeyTagsIterator struct {
	Event *IValSetDriverSetRequiredKeyTags // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetRequiredKeyTagsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetRequiredKeyTags)
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
		it.Event = new(IValSetDriverSetRequiredKeyTags)
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
func (it *IValSetDriverSetRequiredKeyTagsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetRequiredKeyTagsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetRequiredKeyTags represents a SetRequiredKeyTags event raised by the IValSetDriver contract.
type IValSetDriverSetRequiredKeyTags struct {
	RequiredKeyTags []uint8
	Raw             types.Log // Blockchain specific contextual infos
}

// FilterSetRequiredKeyTags is a free log retrieval operation binding the contract event 0x14f8998266f37e593027a05efebf63b8710681d1cdbd39e6d7a156ff7e1485cd.
//
// Solidity: event SetRequiredKeyTags(uint8[] requiredKeyTags)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetRequiredKeyTags(opts *bind.FilterOpts) (*IValSetDriverSetRequiredKeyTagsIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetRequiredKeyTags")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetRequiredKeyTagsIterator{contract: _IValSetDriver.contract, event: "SetRequiredKeyTags", logs: logs, sub: sub}, nil
}

// WatchSetRequiredKeyTags is a free log subscription operation binding the contract event 0x14f8998266f37e593027a05efebf63b8710681d1cdbd39e6d7a156ff7e1485cd.
//
// Solidity: event SetRequiredKeyTags(uint8[] requiredKeyTags)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetRequiredKeyTags(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetRequiredKeyTags) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetRequiredKeyTags")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetRequiredKeyTags)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetRequiredKeyTags", log); err != nil {
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

// ParseSetRequiredKeyTags is a log parse operation binding the contract event 0x14f8998266f37e593027a05efebf63b8710681d1cdbd39e6d7a156ff7e1485cd.
//
// Solidity: event SetRequiredKeyTags(uint8[] requiredKeyTags)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetRequiredKeyTags(log types.Log) (*IValSetDriverSetRequiredKeyTags, error) {
	event := new(IValSetDriverSetRequiredKeyTags)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetRequiredKeyTags", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// IValSetDriverSetVerificationTypeIterator is returned from FilterSetVerificationType and is used to iterate over the raw logs and unpacked data for SetVerificationType events raised by the IValSetDriver contract.
type IValSetDriverSetVerificationTypeIterator struct {
	Event *IValSetDriverSetVerificationType // Event containing the contract specifics and raw log

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
func (it *IValSetDriverSetVerificationTypeIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(IValSetDriverSetVerificationType)
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
		it.Event = new(IValSetDriverSetVerificationType)
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
func (it *IValSetDriverSetVerificationTypeIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *IValSetDriverSetVerificationTypeIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// IValSetDriverSetVerificationType represents a SetVerificationType event raised by the IValSetDriver contract.
type IValSetDriverSetVerificationType struct {
	VerificationType uint32
	Raw              types.Log // Blockchain specific contextual infos
}

// FilterSetVerificationType is a free log retrieval operation binding the contract event 0x2acc7be3ff5df4b911488f72502071dcf3f4a8f778a8abc351af3220bcd15b7f.
//
// Solidity: event SetVerificationType(uint32 verificationType)
func (_IValSetDriver *IValSetDriverFilterer) FilterSetVerificationType(opts *bind.FilterOpts) (*IValSetDriverSetVerificationTypeIterator, error) {

	logs, sub, err := _IValSetDriver.contract.FilterLogs(opts, "SetVerificationType")
	if err != nil {
		return nil, err
	}
	return &IValSetDriverSetVerificationTypeIterator{contract: _IValSetDriver.contract, event: "SetVerificationType", logs: logs, sub: sub}, nil
}

// WatchSetVerificationType is a free log subscription operation binding the contract event 0x2acc7be3ff5df4b911488f72502071dcf3f4a8f778a8abc351af3220bcd15b7f.
//
// Solidity: event SetVerificationType(uint32 verificationType)
func (_IValSetDriver *IValSetDriverFilterer) WatchSetVerificationType(opts *bind.WatchOpts, sink chan<- *IValSetDriverSetVerificationType) (event.Subscription, error) {

	logs, sub, err := _IValSetDriver.contract.WatchLogs(opts, "SetVerificationType")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(IValSetDriverSetVerificationType)
				if err := _IValSetDriver.contract.UnpackLog(event, "SetVerificationType", log); err != nil {
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

// ParseSetVerificationType is a log parse operation binding the contract event 0x2acc7be3ff5df4b911488f72502071dcf3f4a8f778a8abc351af3220bcd15b7f.
//
// Solidity: event SetVerificationType(uint32 verificationType)
func (_IValSetDriver *IValSetDriverFilterer) ParseSetVerificationType(log types.Log) (*IValSetDriverSetVerificationType, error) {
	event := new(IValSetDriverSetVerificationType)
	if err := _IValSetDriver.contract.UnpackLog(event, "SetVerificationType", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

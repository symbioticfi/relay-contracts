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

// ValSetDriverMetaData contains all meta data concerning the ValSetDriver contract.
var ValSetDriverMetaData = &bind.MetaData{
	ABI: "[{\"type\":\"function\",\"name\":\"MAX_QUORUM_THRESHOLD\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint248\",\"internalType\":\"uint248\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"NETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"address\",\"internalType\":\"address\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"bytes32\",\"internalType\":\"bytes32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"SUBNETWORK_IDENTIFIER\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint96\",\"internalType\":\"uint96\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"addQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"addSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"addVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"getCommitterSlotDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCommitterSlotDurationAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getConfig\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.Config\",\"components\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"numCommitters\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"committerSlotDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"votingPowerProviders\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"keysProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"settlements\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"},{\"name\":\"quorumThresholds\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]},{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"verificationType\",\"type\":\"uint32\",\"internalType\":\"uint32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getConfigAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.Config\",\"components\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"numCommitters\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"committerSlotDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"},{\"name\":\"votingPowerProviders\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"keysProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"settlements\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"},{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"internalType\":\"uint208\"},{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"},{\"name\":\"quorumThresholds\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]},{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"verificationType\",\"type\":\"uint32\",\"internalType\":\"uint32\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCurrentEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCurrentEpochDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getCurrentEpochStart\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochDuration\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochIndex\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getEpochStart\",\"inputs\":[{\"name\":\"epoch\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysProvider\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getKeysProviderAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxValidatorsCount\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxValidatorsCountAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxVotingPower\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMaxVotingPowerAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMinInclusionVotingPower\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getMinInclusionVotingPowerAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpoch\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpochDuration\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNextEpochStart\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumAggregators\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumAggregatorsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumCommitters\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getNumCommittersAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholds\",\"inputs\":[],\"outputs\":[{\"name\":\"quorumThresholds\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getQuorumThresholdsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"quorumThresholds\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.QuorumThreshold[]\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredHeaderKeyTag\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredHeaderKeyTagAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTags\",\"inputs\":[],\"outputs\":[{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getRequiredKeyTagsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSettlements\",\"inputs\":[],\"outputs\":[{\"name\":\"settlements\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getSettlementsAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"settlements\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVerificationType\",\"inputs\":[],\"outputs\":[{\"name\":\"\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVerificationTypeAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowerProviders\",\"inputs\":[],\"outputs\":[{\"name\":\"votingPowerProviders\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"getVotingPowerProvidersAt\",\"inputs\":[{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"votingPowerProviders\",\"type\":\"tuple[]\",\"internalType\":\"structIValSetDriver.CrossChainAddress[]\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isQuorumThresholdRegistered\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isQuorumThresholdRegisteredAt\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSettlementRegistered\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isSettlementRegisteredAt\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isVotingPowerProviderRegistered\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"isVotingPowerProviderRegisteredAt\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"name\":\"timestamp\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[{\"name\":\"\",\"type\":\"bool\",\"internalType\":\"bool\"}],\"stateMutability\":\"view\"},{\"type\":\"function\",\"name\":\"multicall\",\"inputs\":[{\"name\":\"data\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"outputs\":[{\"name\":\"results\",\"type\":\"bytes[]\",\"internalType\":\"bytes[]\"}],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"removeQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"removeSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"removeVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setCommitterSlotDuration\",\"inputs\":[{\"name\":\"slotDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"internalType\":\"uint48\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setKeysProvider\",\"inputs\":[{\"name\":\"keysProvider\",\"type\":\"tuple\",\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setMaxValidatorsCount\",\"inputs\":[{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setMaxVotingPower\",\"inputs\":[{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setMinInclusionVotingPower\",\"inputs\":[{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"internalType\":\"uint256\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setNumAggregators\",\"inputs\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setNumCommitters\",\"inputs\":[{\"name\":\"numCommitters\",\"type\":\"uint208\",\"internalType\":\"uint208\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setRequiredHeaderKeyTag\",\"inputs\":[{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setRequiredKeyTags\",\"inputs\":[{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"internalType\":\"uint8[]\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"setVerificationType\",\"inputs\":[{\"name\":\"verificationType\",\"type\":\"uint32\",\"internalType\":\"uint32\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"function\",\"name\":\"staticDelegateCall\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"},{\"name\":\"data\",\"type\":\"bytes\",\"internalType\":\"bytes\"}],\"outputs\":[],\"stateMutability\":\"nonpayable\"},{\"type\":\"event\",\"name\":\"AddQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"AddSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"AddVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"},{\"name\":\"epochDurationTimestamp\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"InitSubnetwork\",\"inputs\":[{\"name\":\"network\",\"type\":\"address\",\"indexed\":false,\"internalType\":\"address\"},{\"name\":\"subnetworkId\",\"type\":\"uint96\",\"indexed\":false,\"internalType\":\"uint96\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"Initialized\",\"inputs\":[{\"name\":\"version\",\"type\":\"uint64\",\"indexed\":false,\"internalType\":\"uint64\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RemoveQuorumThreshold\",\"inputs\":[{\"name\":\"quorumThreshold\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.QuorumThreshold\",\"components\":[{\"name\":\"keyTag\",\"type\":\"uint8\",\"internalType\":\"uint8\"},{\"name\":\"quorumThreshold\",\"type\":\"uint248\",\"internalType\":\"uint248\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RemoveSettlement\",\"inputs\":[{\"name\":\"settlement\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"RemoveVotingPowerProvider\",\"inputs\":[{\"name\":\"votingPowerProvider\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetCommitterSlotDuration\",\"inputs\":[{\"name\":\"committerSlotDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetEpochDuration\",\"inputs\":[{\"name\":\"epochDuration\",\"type\":\"uint48\",\"indexed\":false,\"internalType\":\"uint48\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetKeysProvider\",\"inputs\":[{\"name\":\"keysProvider\",\"type\":\"tuple\",\"indexed\":false,\"internalType\":\"structIValSetDriver.CrossChainAddress\",\"components\":[{\"name\":\"chainId\",\"type\":\"uint64\",\"internalType\":\"uint64\"},{\"name\":\"addr\",\"type\":\"address\",\"internalType\":\"address\"}]}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetMaxValidatorsCount\",\"inputs\":[{\"name\":\"maxValidatorsCount\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetMaxVotingPower\",\"inputs\":[{\"name\":\"maxVotingPower\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetMinInclusionVotingPower\",\"inputs\":[{\"name\":\"minInclusionVotingPower\",\"type\":\"uint256\",\"indexed\":false,\"internalType\":\"uint256\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetNumAggregators\",\"inputs\":[{\"name\":\"numAggregators\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetNumCommitters\",\"inputs\":[{\"name\":\"numCommitters\",\"type\":\"uint208\",\"indexed\":false,\"internalType\":\"uint208\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetRequiredHeaderKeyTag\",\"inputs\":[{\"name\":\"requiredHeaderKeyTag\",\"type\":\"uint8\",\"indexed\":false,\"internalType\":\"uint8\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetRequiredKeyTags\",\"inputs\":[{\"name\":\"requiredKeyTags\",\"type\":\"uint8[]\",\"indexed\":false,\"internalType\":\"uint8[]\"}],\"anonymous\":false},{\"type\":\"event\",\"name\":\"SetVerificationType\",\"inputs\":[{\"name\":\"verificationType\",\"type\":\"uint32\",\"indexed\":false,\"internalType\":\"uint32\"}],\"anonymous\":false},{\"type\":\"error\",\"name\":\"AddressEmptyCode\",\"inputs\":[{\"name\":\"target\",\"type\":\"address\",\"internalType\":\"address\"}]},{\"type\":\"error\",\"name\":\"CheckpointUnorderedInsertion\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"DuplicateKeyTag\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_InvalidEpochDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_InvalidEpochDurationTimestamp\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"EpochManager_TooOldTimestamp\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"FailedCall\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidInitialization\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidKey\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"InvalidKeyTag\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NetworkManager_InvalidNetwork\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"NotInitializing\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_ChainAlreadyAdded\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_InvalidCrossChainAddress\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_InvalidMaxValidatorsCount\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_InvalidQuorumThreshold\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_KeyTagAlreadyAdded\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_NotAdded\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_ZeroCommitterSlotDuration\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_ZeroNumAggregators\",\"inputs\":[]},{\"type\":\"error\",\"name\":\"ValSetDriver_ZeroNumCommitters\",\"inputs\":[]}]",
}

// ValSetDriverABI is the input ABI used to generate the binding from.
// Deprecated: Use ValSetDriverMetaData.ABI instead.
var ValSetDriverABI = ValSetDriverMetaData.ABI

// ValSetDriver is an auto generated Go binding around an Ethereum contract.
type ValSetDriver struct {
	ValSetDriverCaller     // Read-only binding to the contract
	ValSetDriverTransactor // Write-only binding to the contract
	ValSetDriverFilterer   // Log filterer for contract events
}

// ValSetDriverCaller is an auto generated read-only Go binding around an Ethereum contract.
type ValSetDriverCaller struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ValSetDriverTransactor is an auto generated write-only Go binding around an Ethereum contract.
type ValSetDriverTransactor struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ValSetDriverFilterer is an auto generated log filtering Go binding around an Ethereum contract events.
type ValSetDriverFilterer struct {
	contract *bind.BoundContract // Generic contract wrapper for the low level calls
}

// ValSetDriverSession is an auto generated Go binding around an Ethereum contract,
// with pre-set call and transact options.
type ValSetDriverSession struct {
	Contract     *ValSetDriver     // Generic contract binding to set the session for
	CallOpts     bind.CallOpts     // Call options to use throughout this session
	TransactOpts bind.TransactOpts // Transaction auth options to use throughout this session
}

// ValSetDriverCallerSession is an auto generated read-only Go binding around an Ethereum contract,
// with pre-set call options.
type ValSetDriverCallerSession struct {
	Contract *ValSetDriverCaller // Generic contract caller binding to set the session for
	CallOpts bind.CallOpts       // Call options to use throughout this session
}

// ValSetDriverTransactorSession is an auto generated write-only Go binding around an Ethereum contract,
// with pre-set transact options.
type ValSetDriverTransactorSession struct {
	Contract     *ValSetDriverTransactor // Generic contract transactor binding to set the session for
	TransactOpts bind.TransactOpts       // Transaction auth options to use throughout this session
}

// ValSetDriverRaw is an auto generated low-level Go binding around an Ethereum contract.
type ValSetDriverRaw struct {
	Contract *ValSetDriver // Generic contract binding to access the raw methods on
}

// ValSetDriverCallerRaw is an auto generated low-level read-only Go binding around an Ethereum contract.
type ValSetDriverCallerRaw struct {
	Contract *ValSetDriverCaller // Generic read-only contract binding to access the raw methods on
}

// ValSetDriverTransactorRaw is an auto generated low-level write-only Go binding around an Ethereum contract.
type ValSetDriverTransactorRaw struct {
	Contract *ValSetDriverTransactor // Generic write-only contract binding to access the raw methods on
}

// NewValSetDriver creates a new instance of ValSetDriver, bound to a specific deployed contract.
func NewValSetDriver(address common.Address, backend bind.ContractBackend) (*ValSetDriver, error) {
	contract, err := bindValSetDriver(address, backend, backend, backend)
	if err != nil {
		return nil, err
	}
	return &ValSetDriver{ValSetDriverCaller: ValSetDriverCaller{contract: contract}, ValSetDriverTransactor: ValSetDriverTransactor{contract: contract}, ValSetDriverFilterer: ValSetDriverFilterer{contract: contract}}, nil
}

// NewValSetDriverCaller creates a new read-only instance of ValSetDriver, bound to a specific deployed contract.
func NewValSetDriverCaller(address common.Address, caller bind.ContractCaller) (*ValSetDriverCaller, error) {
	contract, err := bindValSetDriver(address, caller, nil, nil)
	if err != nil {
		return nil, err
	}
	return &ValSetDriverCaller{contract: contract}, nil
}

// NewValSetDriverTransactor creates a new write-only instance of ValSetDriver, bound to a specific deployed contract.
func NewValSetDriverTransactor(address common.Address, transactor bind.ContractTransactor) (*ValSetDriverTransactor, error) {
	contract, err := bindValSetDriver(address, nil, transactor, nil)
	if err != nil {
		return nil, err
	}
	return &ValSetDriverTransactor{contract: contract}, nil
}

// NewValSetDriverFilterer creates a new log filterer instance of ValSetDriver, bound to a specific deployed contract.
func NewValSetDriverFilterer(address common.Address, filterer bind.ContractFilterer) (*ValSetDriverFilterer, error) {
	contract, err := bindValSetDriver(address, nil, nil, filterer)
	if err != nil {
		return nil, err
	}
	return &ValSetDriverFilterer{contract: contract}, nil
}

// bindValSetDriver binds a generic wrapper to an already deployed contract.
func bindValSetDriver(address common.Address, caller bind.ContractCaller, transactor bind.ContractTransactor, filterer bind.ContractFilterer) (*bind.BoundContract, error) {
	parsed, err := ValSetDriverMetaData.GetAbi()
	if err != nil {
		return nil, err
	}
	return bind.NewBoundContract(address, *parsed, caller, transactor, filterer), nil
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ValSetDriver *ValSetDriverRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ValSetDriver.Contract.ValSetDriverCaller.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ValSetDriver *ValSetDriverRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ValSetDriver.Contract.ValSetDriverTransactor.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ValSetDriver *ValSetDriverRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ValSetDriver.Contract.ValSetDriverTransactor.contract.Transact(opts, method, params...)
}

// Call invokes the (constant) contract method with params as input values and
// sets the output to result. The result type might be a single field for simple
// returns, a slice of interfaces for anonymous returns and a struct for named
// returns.
func (_ValSetDriver *ValSetDriverCallerRaw) Call(opts *bind.CallOpts, result *[]interface{}, method string, params ...interface{}) error {
	return _ValSetDriver.Contract.contract.Call(opts, result, method, params...)
}

// Transfer initiates a plain transaction to move funds to the contract, calling
// its default method if one is available.
func (_ValSetDriver *ValSetDriverTransactorRaw) Transfer(opts *bind.TransactOpts) (*types.Transaction, error) {
	return _ValSetDriver.Contract.contract.Transfer(opts)
}

// Transact invokes the (paid) contract method with params as input values.
func (_ValSetDriver *ValSetDriverTransactorRaw) Transact(opts *bind.TransactOpts, method string, params ...interface{}) (*types.Transaction, error) {
	return _ValSetDriver.Contract.contract.Transact(opts, method, params...)
}

// MAXQUORUMTHRESHOLD is a free data retrieval call binding the contract method 0x127ec283.
//
// Solidity: function MAX_QUORUM_THRESHOLD() view returns(uint248)
func (_ValSetDriver *ValSetDriverCaller) MAXQUORUMTHRESHOLD(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "MAX_QUORUM_THRESHOLD")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// MAXQUORUMTHRESHOLD is a free data retrieval call binding the contract method 0x127ec283.
//
// Solidity: function MAX_QUORUM_THRESHOLD() view returns(uint248)
func (_ValSetDriver *ValSetDriverSession) MAXQUORUMTHRESHOLD() (*big.Int, error) {
	return _ValSetDriver.Contract.MAXQUORUMTHRESHOLD(&_ValSetDriver.CallOpts)
}

// MAXQUORUMTHRESHOLD is a free data retrieval call binding the contract method 0x127ec283.
//
// Solidity: function MAX_QUORUM_THRESHOLD() view returns(uint248)
func (_ValSetDriver *ValSetDriverCallerSession) MAXQUORUMTHRESHOLD() (*big.Int, error) {
	return _ValSetDriver.Contract.MAXQUORUMTHRESHOLD(&_ValSetDriver.CallOpts)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_ValSetDriver *ValSetDriverCaller) NETWORK(opts *bind.CallOpts) (common.Address, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "NETWORK")

	if err != nil {
		return *new(common.Address), err
	}

	out0 := *abi.ConvertType(out[0], new(common.Address)).(*common.Address)

	return out0, err

}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_ValSetDriver *ValSetDriverSession) NETWORK() (common.Address, error) {
	return _ValSetDriver.Contract.NETWORK(&_ValSetDriver.CallOpts)
}

// NETWORK is a free data retrieval call binding the contract method 0x8759e6d1.
//
// Solidity: function NETWORK() view returns(address)
func (_ValSetDriver *ValSetDriverCallerSession) NETWORK() (common.Address, error) {
	return _ValSetDriver.Contract.NETWORK(&_ValSetDriver.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_ValSetDriver *ValSetDriverCaller) SUBNETWORK(opts *bind.CallOpts) ([32]byte, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "SUBNETWORK")

	if err != nil {
		return *new([32]byte), err
	}

	out0 := *abi.ConvertType(out[0], new([32]byte)).(*[32]byte)

	return out0, err

}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_ValSetDriver *ValSetDriverSession) SUBNETWORK() ([32]byte, error) {
	return _ValSetDriver.Contract.SUBNETWORK(&_ValSetDriver.CallOpts)
}

// SUBNETWORK is a free data retrieval call binding the contract method 0x773e6b54.
//
// Solidity: function SUBNETWORK() view returns(bytes32)
func (_ValSetDriver *ValSetDriverCallerSession) SUBNETWORK() ([32]byte, error) {
	return _ValSetDriver.Contract.SUBNETWORK(&_ValSetDriver.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_ValSetDriver *ValSetDriverCaller) SUBNETWORKIDENTIFIER(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "SUBNETWORK_IDENTIFIER")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_ValSetDriver *ValSetDriverSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _ValSetDriver.Contract.SUBNETWORKIDENTIFIER(&_ValSetDriver.CallOpts)
}

// SUBNETWORKIDENTIFIER is a free data retrieval call binding the contract method 0xabacb807.
//
// Solidity: function SUBNETWORK_IDENTIFIER() view returns(uint96)
func (_ValSetDriver *ValSetDriverCallerSession) SUBNETWORKIDENTIFIER() (*big.Int, error) {
	return _ValSetDriver.Contract.SUBNETWORKIDENTIFIER(&_ValSetDriver.CallOpts)
}

// GetCommitterSlotDuration is a free data retrieval call binding the contract method 0xcdad0bb6.
//
// Solidity: function getCommitterSlotDuration() view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetCommitterSlotDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getCommitterSlotDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCommitterSlotDuration is a free data retrieval call binding the contract method 0xcdad0bb6.
//
// Solidity: function getCommitterSlotDuration() view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetCommitterSlotDuration() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCommitterSlotDuration(&_ValSetDriver.CallOpts)
}

// GetCommitterSlotDuration is a free data retrieval call binding the contract method 0xcdad0bb6.
//
// Solidity: function getCommitterSlotDuration() view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetCommitterSlotDuration() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCommitterSlotDuration(&_ValSetDriver.CallOpts)
}

// GetCommitterSlotDurationAt is a free data retrieval call binding the contract method 0x490be3bd.
//
// Solidity: function getCommitterSlotDurationAt(uint48 timestamp) view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetCommitterSlotDurationAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getCommitterSlotDurationAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCommitterSlotDurationAt is a free data retrieval call binding the contract method 0x490be3bd.
//
// Solidity: function getCommitterSlotDurationAt(uint48 timestamp) view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetCommitterSlotDurationAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetCommitterSlotDurationAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetCommitterSlotDurationAt is a free data retrieval call binding the contract method 0x490be3bd.
//
// Solidity: function getCommitterSlotDurationAt(uint48 timestamp) view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetCommitterSlotDurationAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetCommitterSlotDurationAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetConfig is a free data retrieval call binding the contract method 0xc3f909d4.
//
// Solidity: function getConfig() view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_ValSetDriver *ValSetDriverCaller) GetConfig(opts *bind.CallOpts) (IValSetDriverConfig, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getConfig")

	if err != nil {
		return *new(IValSetDriverConfig), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverConfig)).(*IValSetDriverConfig)

	return out0, err

}

// GetConfig is a free data retrieval call binding the contract method 0xc3f909d4.
//
// Solidity: function getConfig() view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_ValSetDriver *ValSetDriverSession) GetConfig() (IValSetDriverConfig, error) {
	return _ValSetDriver.Contract.GetConfig(&_ValSetDriver.CallOpts)
}

// GetConfig is a free data retrieval call binding the contract method 0xc3f909d4.
//
// Solidity: function getConfig() view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_ValSetDriver *ValSetDriverCallerSession) GetConfig() (IValSetDriverConfig, error) {
	return _ValSetDriver.Contract.GetConfig(&_ValSetDriver.CallOpts)
}

// GetConfigAt is a free data retrieval call binding the contract method 0x13fb0877.
//
// Solidity: function getConfigAt(uint48 timestamp) view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_ValSetDriver *ValSetDriverCaller) GetConfigAt(opts *bind.CallOpts, timestamp *big.Int) (IValSetDriverConfig, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getConfigAt", timestamp)

	if err != nil {
		return *new(IValSetDriverConfig), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverConfig)).(*IValSetDriverConfig)

	return out0, err

}

// GetConfigAt is a free data retrieval call binding the contract method 0x13fb0877.
//
// Solidity: function getConfigAt(uint48 timestamp) view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_ValSetDriver *ValSetDriverSession) GetConfigAt(timestamp *big.Int) (IValSetDriverConfig, error) {
	return _ValSetDriver.Contract.GetConfigAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetConfigAt is a free data retrieval call binding the contract method 0x13fb0877.
//
// Solidity: function getConfigAt(uint48 timestamp) view returns((uint208,uint208,uint48,(uint64,address)[],(uint64,address),(uint64,address)[],uint256,uint256,uint208,uint8[],(uint8,uint248)[],uint8,uint32))
func (_ValSetDriver *ValSetDriverCallerSession) GetConfigAt(timestamp *big.Int) (IValSetDriverConfig, error) {
	return _ValSetDriver.Contract.GetConfigAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetCurrentEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getCurrentEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetCurrentEpoch() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCurrentEpoch(&_ValSetDriver.CallOpts)
}

// GetCurrentEpoch is a free data retrieval call binding the contract method 0xb97dd9e2.
//
// Solidity: function getCurrentEpoch() view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetCurrentEpoch() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCurrentEpoch(&_ValSetDriver.CallOpts)
}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverCaller) GetCurrentEpochDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getCurrentEpochDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverSession) GetCurrentEpochDuration() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCurrentEpochDuration(&_ValSetDriver.CallOpts)
}

// GetCurrentEpochDuration is a free data retrieval call binding the contract method 0x558e2eb6.
//
// Solidity: function getCurrentEpochDuration() view returns(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverCallerSession) GetCurrentEpochDuration() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCurrentEpochDuration(&_ValSetDriver.CallOpts)
}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetCurrentEpochStart(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getCurrentEpochStart")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetCurrentEpochStart() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCurrentEpochStart(&_ValSetDriver.CallOpts)
}

// GetCurrentEpochStart is a free data retrieval call binding the contract method 0xa6e16c4d.
//
// Solidity: function getCurrentEpochStart() view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetCurrentEpochStart() (*big.Int, error) {
	return _ValSetDriver.Contract.GetCurrentEpochStart(&_ValSetDriver.CallOpts)
}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverCaller) GetEpochDuration(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getEpochDuration", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverSession) GetEpochDuration(epoch *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetEpochDuration(&_ValSetDriver.CallOpts, epoch)
}

// GetEpochDuration is a free data retrieval call binding the contract method 0xf6fd6f14.
//
// Solidity: function getEpochDuration(uint48 epoch) view returns(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverCallerSession) GetEpochDuration(epoch *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetEpochDuration(&_ValSetDriver.CallOpts, epoch)
}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetEpochIndex(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getEpochIndex", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetEpochIndex(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetEpochIndex(&_ValSetDriver.CallOpts, timestamp)
}

// GetEpochIndex is a free data retrieval call binding the contract method 0xccafd209.
//
// Solidity: function getEpochIndex(uint48 timestamp) view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetEpochIndex(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetEpochIndex(&_ValSetDriver.CallOpts, timestamp)
}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetEpochStart(opts *bind.CallOpts, epoch *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getEpochStart", epoch)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetEpochStart(epoch *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetEpochStart(&_ValSetDriver.CallOpts, epoch)
}

// GetEpochStart is a free data retrieval call binding the contract method 0x246e158f.
//
// Solidity: function getEpochStart(uint48 epoch) view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetEpochStart(epoch *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetEpochStart(&_ValSetDriver.CallOpts, epoch)
}

// GetKeysProvider is a free data retrieval call binding the contract method 0x297d29b8.
//
// Solidity: function getKeysProvider() view returns((uint64,address))
func (_ValSetDriver *ValSetDriverCaller) GetKeysProvider(opts *bind.CallOpts) (IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getKeysProvider")

	if err != nil {
		return *new(IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverCrossChainAddress)).(*IValSetDriverCrossChainAddress)

	return out0, err

}

// GetKeysProvider is a free data retrieval call binding the contract method 0x297d29b8.
//
// Solidity: function getKeysProvider() view returns((uint64,address))
func (_ValSetDriver *ValSetDriverSession) GetKeysProvider() (IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetKeysProvider(&_ValSetDriver.CallOpts)
}

// GetKeysProvider is a free data retrieval call binding the contract method 0x297d29b8.
//
// Solidity: function getKeysProvider() view returns((uint64,address))
func (_ValSetDriver *ValSetDriverCallerSession) GetKeysProvider() (IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetKeysProvider(&_ValSetDriver.CallOpts)
}

// GetKeysProviderAt is a free data retrieval call binding the contract method 0x10a49295.
//
// Solidity: function getKeysProviderAt(uint48 timestamp) view returns((uint64,address))
func (_ValSetDriver *ValSetDriverCaller) GetKeysProviderAt(opts *bind.CallOpts, timestamp *big.Int) (IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getKeysProviderAt", timestamp)

	if err != nil {
		return *new(IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new(IValSetDriverCrossChainAddress)).(*IValSetDriverCrossChainAddress)

	return out0, err

}

// GetKeysProviderAt is a free data retrieval call binding the contract method 0x10a49295.
//
// Solidity: function getKeysProviderAt(uint48 timestamp) view returns((uint64,address))
func (_ValSetDriver *ValSetDriverSession) GetKeysProviderAt(timestamp *big.Int) (IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetKeysProviderAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetKeysProviderAt is a free data retrieval call binding the contract method 0x10a49295.
//
// Solidity: function getKeysProviderAt(uint48 timestamp) view returns((uint64,address))
func (_ValSetDriver *ValSetDriverCallerSession) GetKeysProviderAt(timestamp *big.Int) (IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetKeysProviderAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetMaxValidatorsCount is a free data retrieval call binding the contract method 0x06ce894d.
//
// Solidity: function getMaxValidatorsCount() view returns(uint208)
func (_ValSetDriver *ValSetDriverCaller) GetMaxValidatorsCount(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getMaxValidatorsCount")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxValidatorsCount is a free data retrieval call binding the contract method 0x06ce894d.
//
// Solidity: function getMaxValidatorsCount() view returns(uint208)
func (_ValSetDriver *ValSetDriverSession) GetMaxValidatorsCount() (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxValidatorsCount(&_ValSetDriver.CallOpts)
}

// GetMaxValidatorsCount is a free data retrieval call binding the contract method 0x06ce894d.
//
// Solidity: function getMaxValidatorsCount() view returns(uint208)
func (_ValSetDriver *ValSetDriverCallerSession) GetMaxValidatorsCount() (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxValidatorsCount(&_ValSetDriver.CallOpts)
}

// GetMaxValidatorsCountAt is a free data retrieval call binding the contract method 0x4f938edc.
//
// Solidity: function getMaxValidatorsCountAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverCaller) GetMaxValidatorsCountAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getMaxValidatorsCountAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxValidatorsCountAt is a free data retrieval call binding the contract method 0x4f938edc.
//
// Solidity: function getMaxValidatorsCountAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverSession) GetMaxValidatorsCountAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxValidatorsCountAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetMaxValidatorsCountAt is a free data retrieval call binding the contract method 0x4f938edc.
//
// Solidity: function getMaxValidatorsCountAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverCallerSession) GetMaxValidatorsCountAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxValidatorsCountAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetMaxVotingPower is a free data retrieval call binding the contract method 0x9f9c3080.
//
// Solidity: function getMaxVotingPower() view returns(uint256)
func (_ValSetDriver *ValSetDriverCaller) GetMaxVotingPower(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getMaxVotingPower")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxVotingPower is a free data retrieval call binding the contract method 0x9f9c3080.
//
// Solidity: function getMaxVotingPower() view returns(uint256)
func (_ValSetDriver *ValSetDriverSession) GetMaxVotingPower() (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxVotingPower(&_ValSetDriver.CallOpts)
}

// GetMaxVotingPower is a free data retrieval call binding the contract method 0x9f9c3080.
//
// Solidity: function getMaxVotingPower() view returns(uint256)
func (_ValSetDriver *ValSetDriverCallerSession) GetMaxVotingPower() (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxVotingPower(&_ValSetDriver.CallOpts)
}

// GetMaxVotingPowerAt is a free data retrieval call binding the contract method 0x848b3040.
//
// Solidity: function getMaxVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_ValSetDriver *ValSetDriverCaller) GetMaxVotingPowerAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getMaxVotingPowerAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMaxVotingPowerAt is a free data retrieval call binding the contract method 0x848b3040.
//
// Solidity: function getMaxVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_ValSetDriver *ValSetDriverSession) GetMaxVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxVotingPowerAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetMaxVotingPowerAt is a free data retrieval call binding the contract method 0x848b3040.
//
// Solidity: function getMaxVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_ValSetDriver *ValSetDriverCallerSession) GetMaxVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetMaxVotingPowerAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetMinInclusionVotingPower is a free data retrieval call binding the contract method 0xb6a94695.
//
// Solidity: function getMinInclusionVotingPower() view returns(uint256)
func (_ValSetDriver *ValSetDriverCaller) GetMinInclusionVotingPower(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getMinInclusionVotingPower")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMinInclusionVotingPower is a free data retrieval call binding the contract method 0xb6a94695.
//
// Solidity: function getMinInclusionVotingPower() view returns(uint256)
func (_ValSetDriver *ValSetDriverSession) GetMinInclusionVotingPower() (*big.Int, error) {
	return _ValSetDriver.Contract.GetMinInclusionVotingPower(&_ValSetDriver.CallOpts)
}

// GetMinInclusionVotingPower is a free data retrieval call binding the contract method 0xb6a94695.
//
// Solidity: function getMinInclusionVotingPower() view returns(uint256)
func (_ValSetDriver *ValSetDriverCallerSession) GetMinInclusionVotingPower() (*big.Int, error) {
	return _ValSetDriver.Contract.GetMinInclusionVotingPower(&_ValSetDriver.CallOpts)
}

// GetMinInclusionVotingPowerAt is a free data retrieval call binding the contract method 0x456705a2.
//
// Solidity: function getMinInclusionVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_ValSetDriver *ValSetDriverCaller) GetMinInclusionVotingPowerAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getMinInclusionVotingPowerAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetMinInclusionVotingPowerAt is a free data retrieval call binding the contract method 0x456705a2.
//
// Solidity: function getMinInclusionVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_ValSetDriver *ValSetDriverSession) GetMinInclusionVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetMinInclusionVotingPowerAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetMinInclusionVotingPowerAt is a free data retrieval call binding the contract method 0x456705a2.
//
// Solidity: function getMinInclusionVotingPowerAt(uint48 timestamp) view returns(uint256)
func (_ValSetDriver *ValSetDriverCallerSession) GetMinInclusionVotingPowerAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetMinInclusionVotingPowerAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetNextEpoch(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getNextEpoch")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetNextEpoch() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNextEpoch(&_ValSetDriver.CallOpts)
}

// GetNextEpoch is a free data retrieval call binding the contract method 0xefe97d05.
//
// Solidity: function getNextEpoch() view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetNextEpoch() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNextEpoch(&_ValSetDriver.CallOpts)
}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetNextEpochDuration(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getNextEpochDuration")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetNextEpochDuration() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNextEpochDuration(&_ValSetDriver.CallOpts)
}

// GetNextEpochDuration is a free data retrieval call binding the contract method 0x038cf1c0.
//
// Solidity: function getNextEpochDuration() view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetNextEpochDuration() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNextEpochDuration(&_ValSetDriver.CallOpts)
}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_ValSetDriver *ValSetDriverCaller) GetNextEpochStart(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getNextEpochStart")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_ValSetDriver *ValSetDriverSession) GetNextEpochStart() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNextEpochStart(&_ValSetDriver.CallOpts)
}

// GetNextEpochStart is a free data retrieval call binding the contract method 0x65c5f94a.
//
// Solidity: function getNextEpochStart() view returns(uint48)
func (_ValSetDriver *ValSetDriverCallerSession) GetNextEpochStart() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNextEpochStart(&_ValSetDriver.CallOpts)
}

// GetNumAggregators is a free data retrieval call binding the contract method 0x21fbfe0d.
//
// Solidity: function getNumAggregators() view returns(uint208)
func (_ValSetDriver *ValSetDriverCaller) GetNumAggregators(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getNumAggregators")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumAggregators is a free data retrieval call binding the contract method 0x21fbfe0d.
//
// Solidity: function getNumAggregators() view returns(uint208)
func (_ValSetDriver *ValSetDriverSession) GetNumAggregators() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumAggregators(&_ValSetDriver.CallOpts)
}

// GetNumAggregators is a free data retrieval call binding the contract method 0x21fbfe0d.
//
// Solidity: function getNumAggregators() view returns(uint208)
func (_ValSetDriver *ValSetDriverCallerSession) GetNumAggregators() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumAggregators(&_ValSetDriver.CallOpts)
}

// GetNumAggregatorsAt is a free data retrieval call binding the contract method 0x6bb7e08a.
//
// Solidity: function getNumAggregatorsAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverCaller) GetNumAggregatorsAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getNumAggregatorsAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumAggregatorsAt is a free data retrieval call binding the contract method 0x6bb7e08a.
//
// Solidity: function getNumAggregatorsAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverSession) GetNumAggregatorsAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumAggregatorsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetNumAggregatorsAt is a free data retrieval call binding the contract method 0x6bb7e08a.
//
// Solidity: function getNumAggregatorsAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverCallerSession) GetNumAggregatorsAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumAggregatorsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetNumCommitters is a free data retrieval call binding the contract method 0x7861db16.
//
// Solidity: function getNumCommitters() view returns(uint208)
func (_ValSetDriver *ValSetDriverCaller) GetNumCommitters(opts *bind.CallOpts) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getNumCommitters")

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumCommitters is a free data retrieval call binding the contract method 0x7861db16.
//
// Solidity: function getNumCommitters() view returns(uint208)
func (_ValSetDriver *ValSetDriverSession) GetNumCommitters() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumCommitters(&_ValSetDriver.CallOpts)
}

// GetNumCommitters is a free data retrieval call binding the contract method 0x7861db16.
//
// Solidity: function getNumCommitters() view returns(uint208)
func (_ValSetDriver *ValSetDriverCallerSession) GetNumCommitters() (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumCommitters(&_ValSetDriver.CallOpts)
}

// GetNumCommittersAt is a free data retrieval call binding the contract method 0xe0078c64.
//
// Solidity: function getNumCommittersAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverCaller) GetNumCommittersAt(opts *bind.CallOpts, timestamp *big.Int) (*big.Int, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getNumCommittersAt", timestamp)

	if err != nil {
		return *new(*big.Int), err
	}

	out0 := *abi.ConvertType(out[0], new(*big.Int)).(**big.Int)

	return out0, err

}

// GetNumCommittersAt is a free data retrieval call binding the contract method 0xe0078c64.
//
// Solidity: function getNumCommittersAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverSession) GetNumCommittersAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumCommittersAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetNumCommittersAt is a free data retrieval call binding the contract method 0xe0078c64.
//
// Solidity: function getNumCommittersAt(uint48 timestamp) view returns(uint208)
func (_ValSetDriver *ValSetDriverCallerSession) GetNumCommittersAt(timestamp *big.Int) (*big.Int, error) {
	return _ValSetDriver.Contract.GetNumCommittersAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetQuorumThresholds is a free data retrieval call binding the contract method 0x5796148c.
//
// Solidity: function getQuorumThresholds() view returns((uint8,uint248)[] quorumThresholds)
func (_ValSetDriver *ValSetDriverCaller) GetQuorumThresholds(opts *bind.CallOpts) ([]IValSetDriverQuorumThreshold, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getQuorumThresholds")

	if err != nil {
		return *new([]IValSetDriverQuorumThreshold), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverQuorumThreshold)).(*[]IValSetDriverQuorumThreshold)

	return out0, err

}

// GetQuorumThresholds is a free data retrieval call binding the contract method 0x5796148c.
//
// Solidity: function getQuorumThresholds() view returns((uint8,uint248)[] quorumThresholds)
func (_ValSetDriver *ValSetDriverSession) GetQuorumThresholds() ([]IValSetDriverQuorumThreshold, error) {
	return _ValSetDriver.Contract.GetQuorumThresholds(&_ValSetDriver.CallOpts)
}

// GetQuorumThresholds is a free data retrieval call binding the contract method 0x5796148c.
//
// Solidity: function getQuorumThresholds() view returns((uint8,uint248)[] quorumThresholds)
func (_ValSetDriver *ValSetDriverCallerSession) GetQuorumThresholds() ([]IValSetDriverQuorumThreshold, error) {
	return _ValSetDriver.Contract.GetQuorumThresholds(&_ValSetDriver.CallOpts)
}

// GetQuorumThresholdsAt is a free data retrieval call binding the contract method 0xf2f46b83.
//
// Solidity: function getQuorumThresholdsAt(uint48 timestamp) view returns((uint8,uint248)[] quorumThresholds)
func (_ValSetDriver *ValSetDriverCaller) GetQuorumThresholdsAt(opts *bind.CallOpts, timestamp *big.Int) ([]IValSetDriverQuorumThreshold, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getQuorumThresholdsAt", timestamp)

	if err != nil {
		return *new([]IValSetDriverQuorumThreshold), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverQuorumThreshold)).(*[]IValSetDriverQuorumThreshold)

	return out0, err

}

// GetQuorumThresholdsAt is a free data retrieval call binding the contract method 0xf2f46b83.
//
// Solidity: function getQuorumThresholdsAt(uint48 timestamp) view returns((uint8,uint248)[] quorumThresholds)
func (_ValSetDriver *ValSetDriverSession) GetQuorumThresholdsAt(timestamp *big.Int) ([]IValSetDriverQuorumThreshold, error) {
	return _ValSetDriver.Contract.GetQuorumThresholdsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetQuorumThresholdsAt is a free data retrieval call binding the contract method 0xf2f46b83.
//
// Solidity: function getQuorumThresholdsAt(uint48 timestamp) view returns((uint8,uint248)[] quorumThresholds)
func (_ValSetDriver *ValSetDriverCallerSession) GetQuorumThresholdsAt(timestamp *big.Int) ([]IValSetDriverQuorumThreshold, error) {
	return _ValSetDriver.Contract.GetQuorumThresholdsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetRequiredHeaderKeyTag is a free data retrieval call binding the contract method 0x6582e9f7.
//
// Solidity: function getRequiredHeaderKeyTag() view returns(uint8)
func (_ValSetDriver *ValSetDriverCaller) GetRequiredHeaderKeyTag(opts *bind.CallOpts) (uint8, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getRequiredHeaderKeyTag")

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredHeaderKeyTag is a free data retrieval call binding the contract method 0x6582e9f7.
//
// Solidity: function getRequiredHeaderKeyTag() view returns(uint8)
func (_ValSetDriver *ValSetDriverSession) GetRequiredHeaderKeyTag() (uint8, error) {
	return _ValSetDriver.Contract.GetRequiredHeaderKeyTag(&_ValSetDriver.CallOpts)
}

// GetRequiredHeaderKeyTag is a free data retrieval call binding the contract method 0x6582e9f7.
//
// Solidity: function getRequiredHeaderKeyTag() view returns(uint8)
func (_ValSetDriver *ValSetDriverCallerSession) GetRequiredHeaderKeyTag() (uint8, error) {
	return _ValSetDriver.Contract.GetRequiredHeaderKeyTag(&_ValSetDriver.CallOpts)
}

// GetRequiredHeaderKeyTagAt is a free data retrieval call binding the contract method 0xbc12e1fd.
//
// Solidity: function getRequiredHeaderKeyTagAt(uint48 timestamp) view returns(uint8)
func (_ValSetDriver *ValSetDriverCaller) GetRequiredHeaderKeyTagAt(opts *bind.CallOpts, timestamp *big.Int) (uint8, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getRequiredHeaderKeyTagAt", timestamp)

	if err != nil {
		return *new(uint8), err
	}

	out0 := *abi.ConvertType(out[0], new(uint8)).(*uint8)

	return out0, err

}

// GetRequiredHeaderKeyTagAt is a free data retrieval call binding the contract method 0xbc12e1fd.
//
// Solidity: function getRequiredHeaderKeyTagAt(uint48 timestamp) view returns(uint8)
func (_ValSetDriver *ValSetDriverSession) GetRequiredHeaderKeyTagAt(timestamp *big.Int) (uint8, error) {
	return _ValSetDriver.Contract.GetRequiredHeaderKeyTagAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetRequiredHeaderKeyTagAt is a free data retrieval call binding the contract method 0xbc12e1fd.
//
// Solidity: function getRequiredHeaderKeyTagAt(uint48 timestamp) view returns(uint8)
func (_ValSetDriver *ValSetDriverCallerSession) GetRequiredHeaderKeyTagAt(timestamp *big.Int) (uint8, error) {
	return _ValSetDriver.Contract.GetRequiredHeaderKeyTagAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetRequiredKeyTags is a free data retrieval call binding the contract method 0xf9bfa78a.
//
// Solidity: function getRequiredKeyTags() view returns(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverCaller) GetRequiredKeyTags(opts *bind.CallOpts) ([]uint8, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getRequiredKeyTags")

	if err != nil {
		return *new([]uint8), err
	}

	out0 := *abi.ConvertType(out[0], new([]uint8)).(*[]uint8)

	return out0, err

}

// GetRequiredKeyTags is a free data retrieval call binding the contract method 0xf9bfa78a.
//
// Solidity: function getRequiredKeyTags() view returns(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverSession) GetRequiredKeyTags() ([]uint8, error) {
	return _ValSetDriver.Contract.GetRequiredKeyTags(&_ValSetDriver.CallOpts)
}

// GetRequiredKeyTags is a free data retrieval call binding the contract method 0xf9bfa78a.
//
// Solidity: function getRequiredKeyTags() view returns(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverCallerSession) GetRequiredKeyTags() ([]uint8, error) {
	return _ValSetDriver.Contract.GetRequiredKeyTags(&_ValSetDriver.CallOpts)
}

// GetRequiredKeyTagsAt is a free data retrieval call binding the contract method 0x1161fc83.
//
// Solidity: function getRequiredKeyTagsAt(uint48 timestamp) view returns(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverCaller) GetRequiredKeyTagsAt(opts *bind.CallOpts, timestamp *big.Int) ([]uint8, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getRequiredKeyTagsAt", timestamp)

	if err != nil {
		return *new([]uint8), err
	}

	out0 := *abi.ConvertType(out[0], new([]uint8)).(*[]uint8)

	return out0, err

}

// GetRequiredKeyTagsAt is a free data retrieval call binding the contract method 0x1161fc83.
//
// Solidity: function getRequiredKeyTagsAt(uint48 timestamp) view returns(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverSession) GetRequiredKeyTagsAt(timestamp *big.Int) ([]uint8, error) {
	return _ValSetDriver.Contract.GetRequiredKeyTagsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetRequiredKeyTagsAt is a free data retrieval call binding the contract method 0x1161fc83.
//
// Solidity: function getRequiredKeyTagsAt(uint48 timestamp) view returns(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverCallerSession) GetRequiredKeyTagsAt(timestamp *big.Int) ([]uint8, error) {
	return _ValSetDriver.Contract.GetRequiredKeyTagsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetSettlements is a free data retrieval call binding the contract method 0xa0c2bc25.
//
// Solidity: function getSettlements() view returns((uint64,address)[] settlements)
func (_ValSetDriver *ValSetDriverCaller) GetSettlements(opts *bind.CallOpts) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getSettlements")

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetSettlements is a free data retrieval call binding the contract method 0xa0c2bc25.
//
// Solidity: function getSettlements() view returns((uint64,address)[] settlements)
func (_ValSetDriver *ValSetDriverSession) GetSettlements() ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetSettlements(&_ValSetDriver.CallOpts)
}

// GetSettlements is a free data retrieval call binding the contract method 0xa0c2bc25.
//
// Solidity: function getSettlements() view returns((uint64,address)[] settlements)
func (_ValSetDriver *ValSetDriverCallerSession) GetSettlements() ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetSettlements(&_ValSetDriver.CallOpts)
}

// GetSettlementsAt is a free data retrieval call binding the contract method 0x763d255a.
//
// Solidity: function getSettlementsAt(uint48 timestamp) view returns((uint64,address)[] settlements)
func (_ValSetDriver *ValSetDriverCaller) GetSettlementsAt(opts *bind.CallOpts, timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getSettlementsAt", timestamp)

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetSettlementsAt is a free data retrieval call binding the contract method 0x763d255a.
//
// Solidity: function getSettlementsAt(uint48 timestamp) view returns((uint64,address)[] settlements)
func (_ValSetDriver *ValSetDriverSession) GetSettlementsAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetSettlementsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetSettlementsAt is a free data retrieval call binding the contract method 0x763d255a.
//
// Solidity: function getSettlementsAt(uint48 timestamp) view returns((uint64,address)[] settlements)
func (_ValSetDriver *ValSetDriverCallerSession) GetSettlementsAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetSettlementsAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetVerificationType is a free data retrieval call binding the contract method 0x24acc119.
//
// Solidity: function getVerificationType() view returns(uint32)
func (_ValSetDriver *ValSetDriverCaller) GetVerificationType(opts *bind.CallOpts) (uint32, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getVerificationType")

	if err != nil {
		return *new(uint32), err
	}

	out0 := *abi.ConvertType(out[0], new(uint32)).(*uint32)

	return out0, err

}

// GetVerificationType is a free data retrieval call binding the contract method 0x24acc119.
//
// Solidity: function getVerificationType() view returns(uint32)
func (_ValSetDriver *ValSetDriverSession) GetVerificationType() (uint32, error) {
	return _ValSetDriver.Contract.GetVerificationType(&_ValSetDriver.CallOpts)
}

// GetVerificationType is a free data retrieval call binding the contract method 0x24acc119.
//
// Solidity: function getVerificationType() view returns(uint32)
func (_ValSetDriver *ValSetDriverCallerSession) GetVerificationType() (uint32, error) {
	return _ValSetDriver.Contract.GetVerificationType(&_ValSetDriver.CallOpts)
}

// GetVerificationTypeAt is a free data retrieval call binding the contract method 0x3a0ad9ec.
//
// Solidity: function getVerificationTypeAt(uint48 timestamp) view returns(uint32)
func (_ValSetDriver *ValSetDriverCaller) GetVerificationTypeAt(opts *bind.CallOpts, timestamp *big.Int) (uint32, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getVerificationTypeAt", timestamp)

	if err != nil {
		return *new(uint32), err
	}

	out0 := *abi.ConvertType(out[0], new(uint32)).(*uint32)

	return out0, err

}

// GetVerificationTypeAt is a free data retrieval call binding the contract method 0x3a0ad9ec.
//
// Solidity: function getVerificationTypeAt(uint48 timestamp) view returns(uint32)
func (_ValSetDriver *ValSetDriverSession) GetVerificationTypeAt(timestamp *big.Int) (uint32, error) {
	return _ValSetDriver.Contract.GetVerificationTypeAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetVerificationTypeAt is a free data retrieval call binding the contract method 0x3a0ad9ec.
//
// Solidity: function getVerificationTypeAt(uint48 timestamp) view returns(uint32)
func (_ValSetDriver *ValSetDriverCallerSession) GetVerificationTypeAt(timestamp *big.Int) (uint32, error) {
	return _ValSetDriver.Contract.GetVerificationTypeAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetVotingPowerProviders is a free data retrieval call binding the contract method 0x3e39b8db.
//
// Solidity: function getVotingPowerProviders() view returns((uint64,address)[] votingPowerProviders)
func (_ValSetDriver *ValSetDriverCaller) GetVotingPowerProviders(opts *bind.CallOpts) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getVotingPowerProviders")

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetVotingPowerProviders is a free data retrieval call binding the contract method 0x3e39b8db.
//
// Solidity: function getVotingPowerProviders() view returns((uint64,address)[] votingPowerProviders)
func (_ValSetDriver *ValSetDriverSession) GetVotingPowerProviders() ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetVotingPowerProviders(&_ValSetDriver.CallOpts)
}

// GetVotingPowerProviders is a free data retrieval call binding the contract method 0x3e39b8db.
//
// Solidity: function getVotingPowerProviders() view returns((uint64,address)[] votingPowerProviders)
func (_ValSetDriver *ValSetDriverCallerSession) GetVotingPowerProviders() ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetVotingPowerProviders(&_ValSetDriver.CallOpts)
}

// GetVotingPowerProvidersAt is a free data retrieval call binding the contract method 0x09bba5ca.
//
// Solidity: function getVotingPowerProvidersAt(uint48 timestamp) view returns((uint64,address)[] votingPowerProviders)
func (_ValSetDriver *ValSetDriverCaller) GetVotingPowerProvidersAt(opts *bind.CallOpts, timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "getVotingPowerProvidersAt", timestamp)

	if err != nil {
		return *new([]IValSetDriverCrossChainAddress), err
	}

	out0 := *abi.ConvertType(out[0], new([]IValSetDriverCrossChainAddress)).(*[]IValSetDriverCrossChainAddress)

	return out0, err

}

// GetVotingPowerProvidersAt is a free data retrieval call binding the contract method 0x09bba5ca.
//
// Solidity: function getVotingPowerProvidersAt(uint48 timestamp) view returns((uint64,address)[] votingPowerProviders)
func (_ValSetDriver *ValSetDriverSession) GetVotingPowerProvidersAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetVotingPowerProvidersAt(&_ValSetDriver.CallOpts, timestamp)
}

// GetVotingPowerProvidersAt is a free data retrieval call binding the contract method 0x09bba5ca.
//
// Solidity: function getVotingPowerProvidersAt(uint48 timestamp) view returns((uint64,address)[] votingPowerProviders)
func (_ValSetDriver *ValSetDriverCallerSession) GetVotingPowerProvidersAt(timestamp *big.Int) ([]IValSetDriverCrossChainAddress, error) {
	return _ValSetDriver.Contract.GetVotingPowerProvidersAt(&_ValSetDriver.CallOpts, timestamp)
}

// IsQuorumThresholdRegistered is a free data retrieval call binding the contract method 0x79a4c359.
//
// Solidity: function isQuorumThresholdRegistered((uint8,uint248) quorumThreshold) view returns(bool)
func (_ValSetDriver *ValSetDriverCaller) IsQuorumThresholdRegistered(opts *bind.CallOpts, quorumThreshold IValSetDriverQuorumThreshold) (bool, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "isQuorumThresholdRegistered", quorumThreshold)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsQuorumThresholdRegistered is a free data retrieval call binding the contract method 0x79a4c359.
//
// Solidity: function isQuorumThresholdRegistered((uint8,uint248) quorumThreshold) view returns(bool)
func (_ValSetDriver *ValSetDriverSession) IsQuorumThresholdRegistered(quorumThreshold IValSetDriverQuorumThreshold) (bool, error) {
	return _ValSetDriver.Contract.IsQuorumThresholdRegistered(&_ValSetDriver.CallOpts, quorumThreshold)
}

// IsQuorumThresholdRegistered is a free data retrieval call binding the contract method 0x79a4c359.
//
// Solidity: function isQuorumThresholdRegistered((uint8,uint248) quorumThreshold) view returns(bool)
func (_ValSetDriver *ValSetDriverCallerSession) IsQuorumThresholdRegistered(quorumThreshold IValSetDriverQuorumThreshold) (bool, error) {
	return _ValSetDriver.Contract.IsQuorumThresholdRegistered(&_ValSetDriver.CallOpts, quorumThreshold)
}

// IsQuorumThresholdRegisteredAt is a free data retrieval call binding the contract method 0x80c2fc48.
//
// Solidity: function isQuorumThresholdRegisteredAt((uint8,uint248) quorumThreshold, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverCaller) IsQuorumThresholdRegisteredAt(opts *bind.CallOpts, quorumThreshold IValSetDriverQuorumThreshold, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "isQuorumThresholdRegisteredAt", quorumThreshold, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsQuorumThresholdRegisteredAt is a free data retrieval call binding the contract method 0x80c2fc48.
//
// Solidity: function isQuorumThresholdRegisteredAt((uint8,uint248) quorumThreshold, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverSession) IsQuorumThresholdRegisteredAt(quorumThreshold IValSetDriverQuorumThreshold, timestamp *big.Int) (bool, error) {
	return _ValSetDriver.Contract.IsQuorumThresholdRegisteredAt(&_ValSetDriver.CallOpts, quorumThreshold, timestamp)
}

// IsQuorumThresholdRegisteredAt is a free data retrieval call binding the contract method 0x80c2fc48.
//
// Solidity: function isQuorumThresholdRegisteredAt((uint8,uint248) quorumThreshold, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverCallerSession) IsQuorumThresholdRegisteredAt(quorumThreshold IValSetDriverQuorumThreshold, timestamp *big.Int) (bool, error) {
	return _ValSetDriver.Contract.IsQuorumThresholdRegisteredAt(&_ValSetDriver.CallOpts, quorumThreshold, timestamp)
}

// IsSettlementRegistered is a free data retrieval call binding the contract method 0x965c0768.
//
// Solidity: function isSettlementRegistered((uint64,address) settlement) view returns(bool)
func (_ValSetDriver *ValSetDriverCaller) IsSettlementRegistered(opts *bind.CallOpts, settlement IValSetDriverCrossChainAddress) (bool, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "isSettlementRegistered", settlement)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSettlementRegistered is a free data retrieval call binding the contract method 0x965c0768.
//
// Solidity: function isSettlementRegistered((uint64,address) settlement) view returns(bool)
func (_ValSetDriver *ValSetDriverSession) IsSettlementRegistered(settlement IValSetDriverCrossChainAddress) (bool, error) {
	return _ValSetDriver.Contract.IsSettlementRegistered(&_ValSetDriver.CallOpts, settlement)
}

// IsSettlementRegistered is a free data retrieval call binding the contract method 0x965c0768.
//
// Solidity: function isSettlementRegistered((uint64,address) settlement) view returns(bool)
func (_ValSetDriver *ValSetDriverCallerSession) IsSettlementRegistered(settlement IValSetDriverCrossChainAddress) (bool, error) {
	return _ValSetDriver.Contract.IsSettlementRegistered(&_ValSetDriver.CallOpts, settlement)
}

// IsSettlementRegisteredAt is a free data retrieval call binding the contract method 0x01749b26.
//
// Solidity: function isSettlementRegisteredAt((uint64,address) settlement, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverCaller) IsSettlementRegisteredAt(opts *bind.CallOpts, settlement IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "isSettlementRegisteredAt", settlement, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsSettlementRegisteredAt is a free data retrieval call binding the contract method 0x01749b26.
//
// Solidity: function isSettlementRegisteredAt((uint64,address) settlement, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverSession) IsSettlementRegisteredAt(settlement IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _ValSetDriver.Contract.IsSettlementRegisteredAt(&_ValSetDriver.CallOpts, settlement, timestamp)
}

// IsSettlementRegisteredAt is a free data retrieval call binding the contract method 0x01749b26.
//
// Solidity: function isSettlementRegisteredAt((uint64,address) settlement, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverCallerSession) IsSettlementRegisteredAt(settlement IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _ValSetDriver.Contract.IsSettlementRegisteredAt(&_ValSetDriver.CallOpts, settlement, timestamp)
}

// IsVotingPowerProviderRegistered is a free data retrieval call binding the contract method 0x1265b3be.
//
// Solidity: function isVotingPowerProviderRegistered((uint64,address) votingPowerProvider) view returns(bool)
func (_ValSetDriver *ValSetDriverCaller) IsVotingPowerProviderRegistered(opts *bind.CallOpts, votingPowerProvider IValSetDriverCrossChainAddress) (bool, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "isVotingPowerProviderRegistered", votingPowerProvider)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsVotingPowerProviderRegistered is a free data retrieval call binding the contract method 0x1265b3be.
//
// Solidity: function isVotingPowerProviderRegistered((uint64,address) votingPowerProvider) view returns(bool)
func (_ValSetDriver *ValSetDriverSession) IsVotingPowerProviderRegistered(votingPowerProvider IValSetDriverCrossChainAddress) (bool, error) {
	return _ValSetDriver.Contract.IsVotingPowerProviderRegistered(&_ValSetDriver.CallOpts, votingPowerProvider)
}

// IsVotingPowerProviderRegistered is a free data retrieval call binding the contract method 0x1265b3be.
//
// Solidity: function isVotingPowerProviderRegistered((uint64,address) votingPowerProvider) view returns(bool)
func (_ValSetDriver *ValSetDriverCallerSession) IsVotingPowerProviderRegistered(votingPowerProvider IValSetDriverCrossChainAddress) (bool, error) {
	return _ValSetDriver.Contract.IsVotingPowerProviderRegistered(&_ValSetDriver.CallOpts, votingPowerProvider)
}

// IsVotingPowerProviderRegisteredAt is a free data retrieval call binding the contract method 0xc16ccb73.
//
// Solidity: function isVotingPowerProviderRegisteredAt((uint64,address) votingPowerProvider, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverCaller) IsVotingPowerProviderRegisteredAt(opts *bind.CallOpts, votingPowerProvider IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	var out []interface{}
	err := _ValSetDriver.contract.Call(opts, &out, "isVotingPowerProviderRegisteredAt", votingPowerProvider, timestamp)

	if err != nil {
		return *new(bool), err
	}

	out0 := *abi.ConvertType(out[0], new(bool)).(*bool)

	return out0, err

}

// IsVotingPowerProviderRegisteredAt is a free data retrieval call binding the contract method 0xc16ccb73.
//
// Solidity: function isVotingPowerProviderRegisteredAt((uint64,address) votingPowerProvider, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverSession) IsVotingPowerProviderRegisteredAt(votingPowerProvider IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _ValSetDriver.Contract.IsVotingPowerProviderRegisteredAt(&_ValSetDriver.CallOpts, votingPowerProvider, timestamp)
}

// IsVotingPowerProviderRegisteredAt is a free data retrieval call binding the contract method 0xc16ccb73.
//
// Solidity: function isVotingPowerProviderRegisteredAt((uint64,address) votingPowerProvider, uint48 timestamp) view returns(bool)
func (_ValSetDriver *ValSetDriverCallerSession) IsVotingPowerProviderRegisteredAt(votingPowerProvider IValSetDriverCrossChainAddress, timestamp *big.Int) (bool, error) {
	return _ValSetDriver.Contract.IsVotingPowerProviderRegisteredAt(&_ValSetDriver.CallOpts, votingPowerProvider, timestamp)
}

// AddQuorumThreshold is a paid mutator transaction binding the contract method 0x0fe5e0c2.
//
// Solidity: function addQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_ValSetDriver *ValSetDriverTransactor) AddQuorumThreshold(opts *bind.TransactOpts, quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "addQuorumThreshold", quorumThreshold)
}

// AddQuorumThreshold is a paid mutator transaction binding the contract method 0x0fe5e0c2.
//
// Solidity: function addQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_ValSetDriver *ValSetDriverSession) AddQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _ValSetDriver.Contract.AddQuorumThreshold(&_ValSetDriver.TransactOpts, quorumThreshold)
}

// AddQuorumThreshold is a paid mutator transaction binding the contract method 0x0fe5e0c2.
//
// Solidity: function addQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) AddQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _ValSetDriver.Contract.AddQuorumThreshold(&_ValSetDriver.TransactOpts, quorumThreshold)
}

// AddSettlement is a paid mutator transaction binding the contract method 0x52ab8872.
//
// Solidity: function addSettlement((uint64,address) settlement) returns()
func (_ValSetDriver *ValSetDriverTransactor) AddSettlement(opts *bind.TransactOpts, settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "addSettlement", settlement)
}

// AddSettlement is a paid mutator transaction binding the contract method 0x52ab8872.
//
// Solidity: function addSettlement((uint64,address) settlement) returns()
func (_ValSetDriver *ValSetDriverSession) AddSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.AddSettlement(&_ValSetDriver.TransactOpts, settlement)
}

// AddSettlement is a paid mutator transaction binding the contract method 0x52ab8872.
//
// Solidity: function addSettlement((uint64,address) settlement) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) AddSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.AddSettlement(&_ValSetDriver.TransactOpts, settlement)
}

// AddVotingPowerProvider is a paid mutator transaction binding the contract method 0x6940ed80.
//
// Solidity: function addVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_ValSetDriver *ValSetDriverTransactor) AddVotingPowerProvider(opts *bind.TransactOpts, votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "addVotingPowerProvider", votingPowerProvider)
}

// AddVotingPowerProvider is a paid mutator transaction binding the contract method 0x6940ed80.
//
// Solidity: function addVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_ValSetDriver *ValSetDriverSession) AddVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.AddVotingPowerProvider(&_ValSetDriver.TransactOpts, votingPowerProvider)
}

// AddVotingPowerProvider is a paid mutator transaction binding the contract method 0x6940ed80.
//
// Solidity: function addVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) AddVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.AddVotingPowerProvider(&_ValSetDriver.TransactOpts, votingPowerProvider)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_ValSetDriver *ValSetDriverTransactor) Multicall(opts *bind.TransactOpts, data [][]byte) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "multicall", data)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_ValSetDriver *ValSetDriverSession) Multicall(data [][]byte) (*types.Transaction, error) {
	return _ValSetDriver.Contract.Multicall(&_ValSetDriver.TransactOpts, data)
}

// Multicall is a paid mutator transaction binding the contract method 0xac9650d8.
//
// Solidity: function multicall(bytes[] data) returns(bytes[] results)
func (_ValSetDriver *ValSetDriverTransactorSession) Multicall(data [][]byte) (*types.Transaction, error) {
	return _ValSetDriver.Contract.Multicall(&_ValSetDriver.TransactOpts, data)
}

// RemoveQuorumThreshold is a paid mutator transaction binding the contract method 0xf388db18.
//
// Solidity: function removeQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_ValSetDriver *ValSetDriverTransactor) RemoveQuorumThreshold(opts *bind.TransactOpts, quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "removeQuorumThreshold", quorumThreshold)
}

// RemoveQuorumThreshold is a paid mutator transaction binding the contract method 0xf388db18.
//
// Solidity: function removeQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_ValSetDriver *ValSetDriverSession) RemoveQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _ValSetDriver.Contract.RemoveQuorumThreshold(&_ValSetDriver.TransactOpts, quorumThreshold)
}

// RemoveQuorumThreshold is a paid mutator transaction binding the contract method 0xf388db18.
//
// Solidity: function removeQuorumThreshold((uint8,uint248) quorumThreshold) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) RemoveQuorumThreshold(quorumThreshold IValSetDriverQuorumThreshold) (*types.Transaction, error) {
	return _ValSetDriver.Contract.RemoveQuorumThreshold(&_ValSetDriver.TransactOpts, quorumThreshold)
}

// RemoveSettlement is a paid mutator transaction binding the contract method 0x502bb1ad.
//
// Solidity: function removeSettlement((uint64,address) settlement) returns()
func (_ValSetDriver *ValSetDriverTransactor) RemoveSettlement(opts *bind.TransactOpts, settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "removeSettlement", settlement)
}

// RemoveSettlement is a paid mutator transaction binding the contract method 0x502bb1ad.
//
// Solidity: function removeSettlement((uint64,address) settlement) returns()
func (_ValSetDriver *ValSetDriverSession) RemoveSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.RemoveSettlement(&_ValSetDriver.TransactOpts, settlement)
}

// RemoveSettlement is a paid mutator transaction binding the contract method 0x502bb1ad.
//
// Solidity: function removeSettlement((uint64,address) settlement) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) RemoveSettlement(settlement IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.RemoveSettlement(&_ValSetDriver.TransactOpts, settlement)
}

// RemoveVotingPowerProvider is a paid mutator transaction binding the contract method 0x325234d5.
//
// Solidity: function removeVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_ValSetDriver *ValSetDriverTransactor) RemoveVotingPowerProvider(opts *bind.TransactOpts, votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "removeVotingPowerProvider", votingPowerProvider)
}

// RemoveVotingPowerProvider is a paid mutator transaction binding the contract method 0x325234d5.
//
// Solidity: function removeVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_ValSetDriver *ValSetDriverSession) RemoveVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.RemoveVotingPowerProvider(&_ValSetDriver.TransactOpts, votingPowerProvider)
}

// RemoveVotingPowerProvider is a paid mutator transaction binding the contract method 0x325234d5.
//
// Solidity: function removeVotingPowerProvider((uint64,address) votingPowerProvider) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) RemoveVotingPowerProvider(votingPowerProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.RemoveVotingPowerProvider(&_ValSetDriver.TransactOpts, votingPowerProvider)
}

// SetCommitterSlotDuration is a paid mutator transaction binding the contract method 0xf86b8fa1.
//
// Solidity: function setCommitterSlotDuration(uint48 slotDuration) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetCommitterSlotDuration(opts *bind.TransactOpts, slotDuration *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setCommitterSlotDuration", slotDuration)
}

// SetCommitterSlotDuration is a paid mutator transaction binding the contract method 0xf86b8fa1.
//
// Solidity: function setCommitterSlotDuration(uint48 slotDuration) returns()
func (_ValSetDriver *ValSetDriverSession) SetCommitterSlotDuration(slotDuration *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetCommitterSlotDuration(&_ValSetDriver.TransactOpts, slotDuration)
}

// SetCommitterSlotDuration is a paid mutator transaction binding the contract method 0xf86b8fa1.
//
// Solidity: function setCommitterSlotDuration(uint48 slotDuration) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetCommitterSlotDuration(slotDuration *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetCommitterSlotDuration(&_ValSetDriver.TransactOpts, slotDuration)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetEpochDuration(opts *bind.TransactOpts, epochDuration *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setEpochDuration", epochDuration)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_ValSetDriver *ValSetDriverSession) SetEpochDuration(epochDuration *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetEpochDuration(&_ValSetDriver.TransactOpts, epochDuration)
}

// SetEpochDuration is a paid mutator transaction binding the contract method 0x2f53d5ff.
//
// Solidity: function setEpochDuration(uint48 epochDuration) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetEpochDuration(epochDuration *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetEpochDuration(&_ValSetDriver.TransactOpts, epochDuration)
}

// SetKeysProvider is a paid mutator transaction binding the contract method 0xdd08bbff.
//
// Solidity: function setKeysProvider((uint64,address) keysProvider) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetKeysProvider(opts *bind.TransactOpts, keysProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setKeysProvider", keysProvider)
}

// SetKeysProvider is a paid mutator transaction binding the contract method 0xdd08bbff.
//
// Solidity: function setKeysProvider((uint64,address) keysProvider) returns()
func (_ValSetDriver *ValSetDriverSession) SetKeysProvider(keysProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetKeysProvider(&_ValSetDriver.TransactOpts, keysProvider)
}

// SetKeysProvider is a paid mutator transaction binding the contract method 0xdd08bbff.
//
// Solidity: function setKeysProvider((uint64,address) keysProvider) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetKeysProvider(keysProvider IValSetDriverCrossChainAddress) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetKeysProvider(&_ValSetDriver.TransactOpts, keysProvider)
}

// SetMaxValidatorsCount is a paid mutator transaction binding the contract method 0xd2384cd3.
//
// Solidity: function setMaxValidatorsCount(uint208 maxValidatorsCount) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetMaxValidatorsCount(opts *bind.TransactOpts, maxValidatorsCount *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setMaxValidatorsCount", maxValidatorsCount)
}

// SetMaxValidatorsCount is a paid mutator transaction binding the contract method 0xd2384cd3.
//
// Solidity: function setMaxValidatorsCount(uint208 maxValidatorsCount) returns()
func (_ValSetDriver *ValSetDriverSession) SetMaxValidatorsCount(maxValidatorsCount *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetMaxValidatorsCount(&_ValSetDriver.TransactOpts, maxValidatorsCount)
}

// SetMaxValidatorsCount is a paid mutator transaction binding the contract method 0xd2384cd3.
//
// Solidity: function setMaxValidatorsCount(uint208 maxValidatorsCount) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetMaxValidatorsCount(maxValidatorsCount *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetMaxValidatorsCount(&_ValSetDriver.TransactOpts, maxValidatorsCount)
}

// SetMaxVotingPower is a paid mutator transaction binding the contract method 0xf6af258c.
//
// Solidity: function setMaxVotingPower(uint256 maxVotingPower) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetMaxVotingPower(opts *bind.TransactOpts, maxVotingPower *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setMaxVotingPower", maxVotingPower)
}

// SetMaxVotingPower is a paid mutator transaction binding the contract method 0xf6af258c.
//
// Solidity: function setMaxVotingPower(uint256 maxVotingPower) returns()
func (_ValSetDriver *ValSetDriverSession) SetMaxVotingPower(maxVotingPower *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetMaxVotingPower(&_ValSetDriver.TransactOpts, maxVotingPower)
}

// SetMaxVotingPower is a paid mutator transaction binding the contract method 0xf6af258c.
//
// Solidity: function setMaxVotingPower(uint256 maxVotingPower) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetMaxVotingPower(maxVotingPower *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetMaxVotingPower(&_ValSetDriver.TransactOpts, maxVotingPower)
}

// SetMinInclusionVotingPower is a paid mutator transaction binding the contract method 0xfaae42d7.
//
// Solidity: function setMinInclusionVotingPower(uint256 minInclusionVotingPower) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetMinInclusionVotingPower(opts *bind.TransactOpts, minInclusionVotingPower *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setMinInclusionVotingPower", minInclusionVotingPower)
}

// SetMinInclusionVotingPower is a paid mutator transaction binding the contract method 0xfaae42d7.
//
// Solidity: function setMinInclusionVotingPower(uint256 minInclusionVotingPower) returns()
func (_ValSetDriver *ValSetDriverSession) SetMinInclusionVotingPower(minInclusionVotingPower *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetMinInclusionVotingPower(&_ValSetDriver.TransactOpts, minInclusionVotingPower)
}

// SetMinInclusionVotingPower is a paid mutator transaction binding the contract method 0xfaae42d7.
//
// Solidity: function setMinInclusionVotingPower(uint256 minInclusionVotingPower) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetMinInclusionVotingPower(minInclusionVotingPower *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetMinInclusionVotingPower(&_ValSetDriver.TransactOpts, minInclusionVotingPower)
}

// SetNumAggregators is a paid mutator transaction binding the contract method 0x0dec288b.
//
// Solidity: function setNumAggregators(uint208 numAggregators) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetNumAggregators(opts *bind.TransactOpts, numAggregators *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setNumAggregators", numAggregators)
}

// SetNumAggregators is a paid mutator transaction binding the contract method 0x0dec288b.
//
// Solidity: function setNumAggregators(uint208 numAggregators) returns()
func (_ValSetDriver *ValSetDriverSession) SetNumAggregators(numAggregators *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetNumAggregators(&_ValSetDriver.TransactOpts, numAggregators)
}

// SetNumAggregators is a paid mutator transaction binding the contract method 0x0dec288b.
//
// Solidity: function setNumAggregators(uint208 numAggregators) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetNumAggregators(numAggregators *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetNumAggregators(&_ValSetDriver.TransactOpts, numAggregators)
}

// SetNumCommitters is a paid mutator transaction binding the contract method 0x15ddbbe8.
//
// Solidity: function setNumCommitters(uint208 numCommitters) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetNumCommitters(opts *bind.TransactOpts, numCommitters *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setNumCommitters", numCommitters)
}

// SetNumCommitters is a paid mutator transaction binding the contract method 0x15ddbbe8.
//
// Solidity: function setNumCommitters(uint208 numCommitters) returns()
func (_ValSetDriver *ValSetDriverSession) SetNumCommitters(numCommitters *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetNumCommitters(&_ValSetDriver.TransactOpts, numCommitters)
}

// SetNumCommitters is a paid mutator transaction binding the contract method 0x15ddbbe8.
//
// Solidity: function setNumCommitters(uint208 numCommitters) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetNumCommitters(numCommitters *big.Int) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetNumCommitters(&_ValSetDriver.TransactOpts, numCommitters)
}

// SetRequiredHeaderKeyTag is a paid mutator transaction binding the contract method 0xd9736e12.
//
// Solidity: function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetRequiredHeaderKeyTag(opts *bind.TransactOpts, requiredHeaderKeyTag uint8) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setRequiredHeaderKeyTag", requiredHeaderKeyTag)
}

// SetRequiredHeaderKeyTag is a paid mutator transaction binding the contract method 0xd9736e12.
//
// Solidity: function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) returns()
func (_ValSetDriver *ValSetDriverSession) SetRequiredHeaderKeyTag(requiredHeaderKeyTag uint8) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetRequiredHeaderKeyTag(&_ValSetDriver.TransactOpts, requiredHeaderKeyTag)
}

// SetRequiredHeaderKeyTag is a paid mutator transaction binding the contract method 0xd9736e12.
//
// Solidity: function setRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetRequiredHeaderKeyTag(requiredHeaderKeyTag uint8) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetRequiredHeaderKeyTag(&_ValSetDriver.TransactOpts, requiredHeaderKeyTag)
}

// SetRequiredKeyTags is a paid mutator transaction binding the contract method 0x4678a284.
//
// Solidity: function setRequiredKeyTags(uint8[] requiredKeyTags) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetRequiredKeyTags(opts *bind.TransactOpts, requiredKeyTags []uint8) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setRequiredKeyTags", requiredKeyTags)
}

// SetRequiredKeyTags is a paid mutator transaction binding the contract method 0x4678a284.
//
// Solidity: function setRequiredKeyTags(uint8[] requiredKeyTags) returns()
func (_ValSetDriver *ValSetDriverSession) SetRequiredKeyTags(requiredKeyTags []uint8) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetRequiredKeyTags(&_ValSetDriver.TransactOpts, requiredKeyTags)
}

// SetRequiredKeyTags is a paid mutator transaction binding the contract method 0x4678a284.
//
// Solidity: function setRequiredKeyTags(uint8[] requiredKeyTags) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetRequiredKeyTags(requiredKeyTags []uint8) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetRequiredKeyTags(&_ValSetDriver.TransactOpts, requiredKeyTags)
}

// SetVerificationType is a paid mutator transaction binding the contract method 0x7b8ef42d.
//
// Solidity: function setVerificationType(uint32 verificationType) returns()
func (_ValSetDriver *ValSetDriverTransactor) SetVerificationType(opts *bind.TransactOpts, verificationType uint32) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "setVerificationType", verificationType)
}

// SetVerificationType is a paid mutator transaction binding the contract method 0x7b8ef42d.
//
// Solidity: function setVerificationType(uint32 verificationType) returns()
func (_ValSetDriver *ValSetDriverSession) SetVerificationType(verificationType uint32) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetVerificationType(&_ValSetDriver.TransactOpts, verificationType)
}

// SetVerificationType is a paid mutator transaction binding the contract method 0x7b8ef42d.
//
// Solidity: function setVerificationType(uint32 verificationType) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) SetVerificationType(verificationType uint32) (*types.Transaction, error) {
	return _ValSetDriver.Contract.SetVerificationType(&_ValSetDriver.TransactOpts, verificationType)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_ValSetDriver *ValSetDriverTransactor) StaticDelegateCall(opts *bind.TransactOpts, target common.Address, data []byte) (*types.Transaction, error) {
	return _ValSetDriver.contract.Transact(opts, "staticDelegateCall", target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_ValSetDriver *ValSetDriverSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _ValSetDriver.Contract.StaticDelegateCall(&_ValSetDriver.TransactOpts, target, data)
}

// StaticDelegateCall is a paid mutator transaction binding the contract method 0x9f86fd85.
//
// Solidity: function staticDelegateCall(address target, bytes data) returns()
func (_ValSetDriver *ValSetDriverTransactorSession) StaticDelegateCall(target common.Address, data []byte) (*types.Transaction, error) {
	return _ValSetDriver.Contract.StaticDelegateCall(&_ValSetDriver.TransactOpts, target, data)
}

// ValSetDriverAddQuorumThresholdIterator is returned from FilterAddQuorumThreshold and is used to iterate over the raw logs and unpacked data for AddQuorumThreshold events raised by the ValSetDriver contract.
type ValSetDriverAddQuorumThresholdIterator struct {
	Event *ValSetDriverAddQuorumThreshold // Event containing the contract specifics and raw log

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
func (it *ValSetDriverAddQuorumThresholdIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverAddQuorumThreshold)
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
		it.Event = new(ValSetDriverAddQuorumThreshold)
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
func (it *ValSetDriverAddQuorumThresholdIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverAddQuorumThresholdIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverAddQuorumThreshold represents a AddQuorumThreshold event raised by the ValSetDriver contract.
type ValSetDriverAddQuorumThreshold struct {
	QuorumThreshold IValSetDriverQuorumThreshold
	Raw             types.Log // Blockchain specific contextual infos
}

// FilterAddQuorumThreshold is a free log retrieval operation binding the contract event 0x88ee37bfc079201d8493557f757c8ff6b14222ae13a8393747fb3c74b8ddf06f.
//
// Solidity: event AddQuorumThreshold((uint8,uint248) quorumThreshold)
func (_ValSetDriver *ValSetDriverFilterer) FilterAddQuorumThreshold(opts *bind.FilterOpts) (*ValSetDriverAddQuorumThresholdIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "AddQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverAddQuorumThresholdIterator{contract: _ValSetDriver.contract, event: "AddQuorumThreshold", logs: logs, sub: sub}, nil
}

// WatchAddQuorumThreshold is a free log subscription operation binding the contract event 0x88ee37bfc079201d8493557f757c8ff6b14222ae13a8393747fb3c74b8ddf06f.
//
// Solidity: event AddQuorumThreshold((uint8,uint248) quorumThreshold)
func (_ValSetDriver *ValSetDriverFilterer) WatchAddQuorumThreshold(opts *bind.WatchOpts, sink chan<- *ValSetDriverAddQuorumThreshold) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "AddQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverAddQuorumThreshold)
				if err := _ValSetDriver.contract.UnpackLog(event, "AddQuorumThreshold", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseAddQuorumThreshold(log types.Log) (*ValSetDriverAddQuorumThreshold, error) {
	event := new(ValSetDriverAddQuorumThreshold)
	if err := _ValSetDriver.contract.UnpackLog(event, "AddQuorumThreshold", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverAddSettlementIterator is returned from FilterAddSettlement and is used to iterate over the raw logs and unpacked data for AddSettlement events raised by the ValSetDriver contract.
type ValSetDriverAddSettlementIterator struct {
	Event *ValSetDriverAddSettlement // Event containing the contract specifics and raw log

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
func (it *ValSetDriverAddSettlementIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverAddSettlement)
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
		it.Event = new(ValSetDriverAddSettlement)
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
func (it *ValSetDriverAddSettlementIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverAddSettlementIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverAddSettlement represents a AddSettlement event raised by the ValSetDriver contract.
type ValSetDriverAddSettlement struct {
	Settlement IValSetDriverCrossChainAddress
	Raw        types.Log // Blockchain specific contextual infos
}

// FilterAddSettlement is a free log retrieval operation binding the contract event 0xd66c27144960b789ff7b5514538e3d85a3623c1669b8d6db4eb85658df2aad57.
//
// Solidity: event AddSettlement((uint64,address) settlement)
func (_ValSetDriver *ValSetDriverFilterer) FilterAddSettlement(opts *bind.FilterOpts) (*ValSetDriverAddSettlementIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "AddSettlement")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverAddSettlementIterator{contract: _ValSetDriver.contract, event: "AddSettlement", logs: logs, sub: sub}, nil
}

// WatchAddSettlement is a free log subscription operation binding the contract event 0xd66c27144960b789ff7b5514538e3d85a3623c1669b8d6db4eb85658df2aad57.
//
// Solidity: event AddSettlement((uint64,address) settlement)
func (_ValSetDriver *ValSetDriverFilterer) WatchAddSettlement(opts *bind.WatchOpts, sink chan<- *ValSetDriverAddSettlement) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "AddSettlement")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverAddSettlement)
				if err := _ValSetDriver.contract.UnpackLog(event, "AddSettlement", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseAddSettlement(log types.Log) (*ValSetDriverAddSettlement, error) {
	event := new(ValSetDriverAddSettlement)
	if err := _ValSetDriver.contract.UnpackLog(event, "AddSettlement", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverAddVotingPowerProviderIterator is returned from FilterAddVotingPowerProvider and is used to iterate over the raw logs and unpacked data for AddVotingPowerProvider events raised by the ValSetDriver contract.
type ValSetDriverAddVotingPowerProviderIterator struct {
	Event *ValSetDriverAddVotingPowerProvider // Event containing the contract specifics and raw log

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
func (it *ValSetDriverAddVotingPowerProviderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverAddVotingPowerProvider)
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
		it.Event = new(ValSetDriverAddVotingPowerProvider)
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
func (it *ValSetDriverAddVotingPowerProviderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverAddVotingPowerProviderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverAddVotingPowerProvider represents a AddVotingPowerProvider event raised by the ValSetDriver contract.
type ValSetDriverAddVotingPowerProvider struct {
	VotingPowerProvider IValSetDriverCrossChainAddress
	Raw                 types.Log // Blockchain specific contextual infos
}

// FilterAddVotingPowerProvider is a free log retrieval operation binding the contract event 0xa8ba28fa43d2ebdcd4f5c29ee4f5e5fb568e9986ae8be7c6ae54540176d6147f.
//
// Solidity: event AddVotingPowerProvider((uint64,address) votingPowerProvider)
func (_ValSetDriver *ValSetDriverFilterer) FilterAddVotingPowerProvider(opts *bind.FilterOpts) (*ValSetDriverAddVotingPowerProviderIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "AddVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverAddVotingPowerProviderIterator{contract: _ValSetDriver.contract, event: "AddVotingPowerProvider", logs: logs, sub: sub}, nil
}

// WatchAddVotingPowerProvider is a free log subscription operation binding the contract event 0xa8ba28fa43d2ebdcd4f5c29ee4f5e5fb568e9986ae8be7c6ae54540176d6147f.
//
// Solidity: event AddVotingPowerProvider((uint64,address) votingPowerProvider)
func (_ValSetDriver *ValSetDriverFilterer) WatchAddVotingPowerProvider(opts *bind.WatchOpts, sink chan<- *ValSetDriverAddVotingPowerProvider) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "AddVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverAddVotingPowerProvider)
				if err := _ValSetDriver.contract.UnpackLog(event, "AddVotingPowerProvider", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseAddVotingPowerProvider(log types.Log) (*ValSetDriverAddVotingPowerProvider, error) {
	event := new(ValSetDriverAddVotingPowerProvider)
	if err := _ValSetDriver.contract.UnpackLog(event, "AddVotingPowerProvider", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverInitEpochDurationIterator is returned from FilterInitEpochDuration and is used to iterate over the raw logs and unpacked data for InitEpochDuration events raised by the ValSetDriver contract.
type ValSetDriverInitEpochDurationIterator struct {
	Event *ValSetDriverInitEpochDuration // Event containing the contract specifics and raw log

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
func (it *ValSetDriverInitEpochDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverInitEpochDuration)
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
		it.Event = new(ValSetDriverInitEpochDuration)
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
func (it *ValSetDriverInitEpochDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverInitEpochDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverInitEpochDuration represents a InitEpochDuration event raised by the ValSetDriver contract.
type ValSetDriverInitEpochDuration struct {
	EpochDuration          *big.Int
	EpochDurationTimestamp *big.Int
	Raw                    types.Log // Blockchain specific contextual infos
}

// FilterInitEpochDuration is a free log retrieval operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_ValSetDriver *ValSetDriverFilterer) FilterInitEpochDuration(opts *bind.FilterOpts) (*ValSetDriverInitEpochDurationIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "InitEpochDuration")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverInitEpochDurationIterator{contract: _ValSetDriver.contract, event: "InitEpochDuration", logs: logs, sub: sub}, nil
}

// WatchInitEpochDuration is a free log subscription operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_ValSetDriver *ValSetDriverFilterer) WatchInitEpochDuration(opts *bind.WatchOpts, sink chan<- *ValSetDriverInitEpochDuration) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "InitEpochDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverInitEpochDuration)
				if err := _ValSetDriver.contract.UnpackLog(event, "InitEpochDuration", log); err != nil {
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

// ParseInitEpochDuration is a log parse operation binding the contract event 0xf688b7b02a20c2dda7d7de03a41637b274af7706eb975ea4af45858648370f55.
//
// Solidity: event InitEpochDuration(uint48 epochDuration, uint48 epochDurationTimestamp)
func (_ValSetDriver *ValSetDriverFilterer) ParseInitEpochDuration(log types.Log) (*ValSetDriverInitEpochDuration, error) {
	event := new(ValSetDriverInitEpochDuration)
	if err := _ValSetDriver.contract.UnpackLog(event, "InitEpochDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverInitSubnetworkIterator is returned from FilterInitSubnetwork and is used to iterate over the raw logs and unpacked data for InitSubnetwork events raised by the ValSetDriver contract.
type ValSetDriverInitSubnetworkIterator struct {
	Event *ValSetDriverInitSubnetwork // Event containing the contract specifics and raw log

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
func (it *ValSetDriverInitSubnetworkIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverInitSubnetwork)
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
		it.Event = new(ValSetDriverInitSubnetwork)
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
func (it *ValSetDriverInitSubnetworkIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverInitSubnetworkIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverInitSubnetwork represents a InitSubnetwork event raised by the ValSetDriver contract.
type ValSetDriverInitSubnetwork struct {
	Network      common.Address
	SubnetworkId *big.Int
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterInitSubnetwork is a free log retrieval operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_ValSetDriver *ValSetDriverFilterer) FilterInitSubnetwork(opts *bind.FilterOpts) (*ValSetDriverInitSubnetworkIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverInitSubnetworkIterator{contract: _ValSetDriver.contract, event: "InitSubnetwork", logs: logs, sub: sub}, nil
}

// WatchInitSubnetwork is a free log subscription operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_ValSetDriver *ValSetDriverFilterer) WatchInitSubnetwork(opts *bind.WatchOpts, sink chan<- *ValSetDriverInitSubnetwork) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "InitSubnetwork")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverInitSubnetwork)
				if err := _ValSetDriver.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
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

// ParseInitSubnetwork is a log parse operation binding the contract event 0x469c2e982e7d76d34cf5d1e72abee29749bb9971942c180e9023cea09f5f8e83.
//
// Solidity: event InitSubnetwork(address network, uint96 subnetworkId)
func (_ValSetDriver *ValSetDriverFilterer) ParseInitSubnetwork(log types.Log) (*ValSetDriverInitSubnetwork, error) {
	event := new(ValSetDriverInitSubnetwork)
	if err := _ValSetDriver.contract.UnpackLog(event, "InitSubnetwork", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverInitializedIterator is returned from FilterInitialized and is used to iterate over the raw logs and unpacked data for Initialized events raised by the ValSetDriver contract.
type ValSetDriverInitializedIterator struct {
	Event *ValSetDriverInitialized // Event containing the contract specifics and raw log

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
func (it *ValSetDriverInitializedIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverInitialized)
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
		it.Event = new(ValSetDriverInitialized)
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
func (it *ValSetDriverInitializedIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverInitializedIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverInitialized represents a Initialized event raised by the ValSetDriver contract.
type ValSetDriverInitialized struct {
	Version uint64
	Raw     types.Log // Blockchain specific contextual infos
}

// FilterInitialized is a free log retrieval operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_ValSetDriver *ValSetDriverFilterer) FilterInitialized(opts *bind.FilterOpts) (*ValSetDriverInitializedIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverInitializedIterator{contract: _ValSetDriver.contract, event: "Initialized", logs: logs, sub: sub}, nil
}

// WatchInitialized is a free log subscription operation binding the contract event 0xc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d2.
//
// Solidity: event Initialized(uint64 version)
func (_ValSetDriver *ValSetDriverFilterer) WatchInitialized(opts *bind.WatchOpts, sink chan<- *ValSetDriverInitialized) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "Initialized")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverInitialized)
				if err := _ValSetDriver.contract.UnpackLog(event, "Initialized", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseInitialized(log types.Log) (*ValSetDriverInitialized, error) {
	event := new(ValSetDriverInitialized)
	if err := _ValSetDriver.contract.UnpackLog(event, "Initialized", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverRemoveQuorumThresholdIterator is returned from FilterRemoveQuorumThreshold and is used to iterate over the raw logs and unpacked data for RemoveQuorumThreshold events raised by the ValSetDriver contract.
type ValSetDriverRemoveQuorumThresholdIterator struct {
	Event *ValSetDriverRemoveQuorumThreshold // Event containing the contract specifics and raw log

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
func (it *ValSetDriverRemoveQuorumThresholdIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverRemoveQuorumThreshold)
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
		it.Event = new(ValSetDriverRemoveQuorumThreshold)
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
func (it *ValSetDriverRemoveQuorumThresholdIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverRemoveQuorumThresholdIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverRemoveQuorumThreshold represents a RemoveQuorumThreshold event raised by the ValSetDriver contract.
type ValSetDriverRemoveQuorumThreshold struct {
	QuorumThreshold IValSetDriverQuorumThreshold
	Raw             types.Log // Blockchain specific contextual infos
}

// FilterRemoveQuorumThreshold is a free log retrieval operation binding the contract event 0xb321a5a0425badf1acf0a0b21b7984fa61e1e6405ae9011d4dcdb29b0e2f43ec.
//
// Solidity: event RemoveQuorumThreshold((uint8,uint248) quorumThreshold)
func (_ValSetDriver *ValSetDriverFilterer) FilterRemoveQuorumThreshold(opts *bind.FilterOpts) (*ValSetDriverRemoveQuorumThresholdIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "RemoveQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverRemoveQuorumThresholdIterator{contract: _ValSetDriver.contract, event: "RemoveQuorumThreshold", logs: logs, sub: sub}, nil
}

// WatchRemoveQuorumThreshold is a free log subscription operation binding the contract event 0xb321a5a0425badf1acf0a0b21b7984fa61e1e6405ae9011d4dcdb29b0e2f43ec.
//
// Solidity: event RemoveQuorumThreshold((uint8,uint248) quorumThreshold)
func (_ValSetDriver *ValSetDriverFilterer) WatchRemoveQuorumThreshold(opts *bind.WatchOpts, sink chan<- *ValSetDriverRemoveQuorumThreshold) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "RemoveQuorumThreshold")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverRemoveQuorumThreshold)
				if err := _ValSetDriver.contract.UnpackLog(event, "RemoveQuorumThreshold", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseRemoveQuorumThreshold(log types.Log) (*ValSetDriverRemoveQuorumThreshold, error) {
	event := new(ValSetDriverRemoveQuorumThreshold)
	if err := _ValSetDriver.contract.UnpackLog(event, "RemoveQuorumThreshold", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverRemoveSettlementIterator is returned from FilterRemoveSettlement and is used to iterate over the raw logs and unpacked data for RemoveSettlement events raised by the ValSetDriver contract.
type ValSetDriverRemoveSettlementIterator struct {
	Event *ValSetDriverRemoveSettlement // Event containing the contract specifics and raw log

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
func (it *ValSetDriverRemoveSettlementIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverRemoveSettlement)
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
		it.Event = new(ValSetDriverRemoveSettlement)
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
func (it *ValSetDriverRemoveSettlementIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverRemoveSettlementIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverRemoveSettlement represents a RemoveSettlement event raised by the ValSetDriver contract.
type ValSetDriverRemoveSettlement struct {
	Settlement IValSetDriverCrossChainAddress
	Raw        types.Log // Blockchain specific contextual infos
}

// FilterRemoveSettlement is a free log retrieval operation binding the contract event 0x6307047e2a245d2a5867f7667a4a48687593b73e3b2f95d2204256cbff350cf3.
//
// Solidity: event RemoveSettlement((uint64,address) settlement)
func (_ValSetDriver *ValSetDriverFilterer) FilterRemoveSettlement(opts *bind.FilterOpts) (*ValSetDriverRemoveSettlementIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "RemoveSettlement")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverRemoveSettlementIterator{contract: _ValSetDriver.contract, event: "RemoveSettlement", logs: logs, sub: sub}, nil
}

// WatchRemoveSettlement is a free log subscription operation binding the contract event 0x6307047e2a245d2a5867f7667a4a48687593b73e3b2f95d2204256cbff350cf3.
//
// Solidity: event RemoveSettlement((uint64,address) settlement)
func (_ValSetDriver *ValSetDriverFilterer) WatchRemoveSettlement(opts *bind.WatchOpts, sink chan<- *ValSetDriverRemoveSettlement) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "RemoveSettlement")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverRemoveSettlement)
				if err := _ValSetDriver.contract.UnpackLog(event, "RemoveSettlement", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseRemoveSettlement(log types.Log) (*ValSetDriverRemoveSettlement, error) {
	event := new(ValSetDriverRemoveSettlement)
	if err := _ValSetDriver.contract.UnpackLog(event, "RemoveSettlement", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverRemoveVotingPowerProviderIterator is returned from FilterRemoveVotingPowerProvider and is used to iterate over the raw logs and unpacked data for RemoveVotingPowerProvider events raised by the ValSetDriver contract.
type ValSetDriverRemoveVotingPowerProviderIterator struct {
	Event *ValSetDriverRemoveVotingPowerProvider // Event containing the contract specifics and raw log

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
func (it *ValSetDriverRemoveVotingPowerProviderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverRemoveVotingPowerProvider)
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
		it.Event = new(ValSetDriverRemoveVotingPowerProvider)
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
func (it *ValSetDriverRemoveVotingPowerProviderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverRemoveVotingPowerProviderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverRemoveVotingPowerProvider represents a RemoveVotingPowerProvider event raised by the ValSetDriver contract.
type ValSetDriverRemoveVotingPowerProvider struct {
	VotingPowerProvider IValSetDriverCrossChainAddress
	Raw                 types.Log // Blockchain specific contextual infos
}

// FilterRemoveVotingPowerProvider is a free log retrieval operation binding the contract event 0x2a2103a52b9c3907936be3fea265a7bd34fdfc0c8c09cc3b8e3938b7deda761f.
//
// Solidity: event RemoveVotingPowerProvider((uint64,address) votingPowerProvider)
func (_ValSetDriver *ValSetDriverFilterer) FilterRemoveVotingPowerProvider(opts *bind.FilterOpts) (*ValSetDriverRemoveVotingPowerProviderIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "RemoveVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverRemoveVotingPowerProviderIterator{contract: _ValSetDriver.contract, event: "RemoveVotingPowerProvider", logs: logs, sub: sub}, nil
}

// WatchRemoveVotingPowerProvider is a free log subscription operation binding the contract event 0x2a2103a52b9c3907936be3fea265a7bd34fdfc0c8c09cc3b8e3938b7deda761f.
//
// Solidity: event RemoveVotingPowerProvider((uint64,address) votingPowerProvider)
func (_ValSetDriver *ValSetDriverFilterer) WatchRemoveVotingPowerProvider(opts *bind.WatchOpts, sink chan<- *ValSetDriverRemoveVotingPowerProvider) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "RemoveVotingPowerProvider")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverRemoveVotingPowerProvider)
				if err := _ValSetDriver.contract.UnpackLog(event, "RemoveVotingPowerProvider", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseRemoveVotingPowerProvider(log types.Log) (*ValSetDriverRemoveVotingPowerProvider, error) {
	event := new(ValSetDriverRemoveVotingPowerProvider)
	if err := _ValSetDriver.contract.UnpackLog(event, "RemoveVotingPowerProvider", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetCommitterSlotDurationIterator is returned from FilterSetCommitterSlotDuration and is used to iterate over the raw logs and unpacked data for SetCommitterSlotDuration events raised by the ValSetDriver contract.
type ValSetDriverSetCommitterSlotDurationIterator struct {
	Event *ValSetDriverSetCommitterSlotDuration // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetCommitterSlotDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetCommitterSlotDuration)
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
		it.Event = new(ValSetDriverSetCommitterSlotDuration)
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
func (it *ValSetDriverSetCommitterSlotDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetCommitterSlotDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetCommitterSlotDuration represents a SetCommitterSlotDuration event raised by the ValSetDriver contract.
type ValSetDriverSetCommitterSlotDuration struct {
	CommitterSlotDuration *big.Int
	Raw                   types.Log // Blockchain specific contextual infos
}

// FilterSetCommitterSlotDuration is a free log retrieval operation binding the contract event 0x853ac7224393856467cf1f4981ef9fa5d586d71783e6f66221f7af0a987f7d51.
//
// Solidity: event SetCommitterSlotDuration(uint48 committerSlotDuration)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetCommitterSlotDuration(opts *bind.FilterOpts) (*ValSetDriverSetCommitterSlotDurationIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetCommitterSlotDuration")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetCommitterSlotDurationIterator{contract: _ValSetDriver.contract, event: "SetCommitterSlotDuration", logs: logs, sub: sub}, nil
}

// WatchSetCommitterSlotDuration is a free log subscription operation binding the contract event 0x853ac7224393856467cf1f4981ef9fa5d586d71783e6f66221f7af0a987f7d51.
//
// Solidity: event SetCommitterSlotDuration(uint48 committerSlotDuration)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetCommitterSlotDuration(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetCommitterSlotDuration) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetCommitterSlotDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetCommitterSlotDuration)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetCommitterSlotDuration", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetCommitterSlotDuration(log types.Log) (*ValSetDriverSetCommitterSlotDuration, error) {
	event := new(ValSetDriverSetCommitterSlotDuration)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetCommitterSlotDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetEpochDurationIterator is returned from FilterSetEpochDuration and is used to iterate over the raw logs and unpacked data for SetEpochDuration events raised by the ValSetDriver contract.
type ValSetDriverSetEpochDurationIterator struct {
	Event *ValSetDriverSetEpochDuration // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetEpochDurationIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetEpochDuration)
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
		it.Event = new(ValSetDriverSetEpochDuration)
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
func (it *ValSetDriverSetEpochDurationIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetEpochDurationIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetEpochDuration represents a SetEpochDuration event raised by the ValSetDriver contract.
type ValSetDriverSetEpochDuration struct {
	EpochDuration *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterSetEpochDuration is a free log retrieval operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetEpochDuration(opts *bind.FilterOpts) (*ValSetDriverSetEpochDurationIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetEpochDuration")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetEpochDurationIterator{contract: _ValSetDriver.contract, event: "SetEpochDuration", logs: logs, sub: sub}, nil
}

// WatchSetEpochDuration is a free log subscription operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetEpochDuration(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetEpochDuration) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetEpochDuration")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetEpochDuration)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetEpochDuration", log); err != nil {
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

// ParseSetEpochDuration is a log parse operation binding the contract event 0xc950f06b73b224f8b32d39245a5905020aebfc426a15833a70ac2e4e2ebe098c.
//
// Solidity: event SetEpochDuration(uint48 epochDuration)
func (_ValSetDriver *ValSetDriverFilterer) ParseSetEpochDuration(log types.Log) (*ValSetDriverSetEpochDuration, error) {
	event := new(ValSetDriverSetEpochDuration)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetEpochDuration", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetKeysProviderIterator is returned from FilterSetKeysProvider and is used to iterate over the raw logs and unpacked data for SetKeysProvider events raised by the ValSetDriver contract.
type ValSetDriverSetKeysProviderIterator struct {
	Event *ValSetDriverSetKeysProvider // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetKeysProviderIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetKeysProvider)
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
		it.Event = new(ValSetDriverSetKeysProvider)
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
func (it *ValSetDriverSetKeysProviderIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetKeysProviderIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetKeysProvider represents a SetKeysProvider event raised by the ValSetDriver contract.
type ValSetDriverSetKeysProvider struct {
	KeysProvider IValSetDriverCrossChainAddress
	Raw          types.Log // Blockchain specific contextual infos
}

// FilterSetKeysProvider is a free log retrieval operation binding the contract event 0x15ceb492f5dd0988720d5f2258f4de98a2ac5df85b25ed2f33eda91e90e07321.
//
// Solidity: event SetKeysProvider((uint64,address) keysProvider)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetKeysProvider(opts *bind.FilterOpts) (*ValSetDriverSetKeysProviderIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetKeysProvider")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetKeysProviderIterator{contract: _ValSetDriver.contract, event: "SetKeysProvider", logs: logs, sub: sub}, nil
}

// WatchSetKeysProvider is a free log subscription operation binding the contract event 0x15ceb492f5dd0988720d5f2258f4de98a2ac5df85b25ed2f33eda91e90e07321.
//
// Solidity: event SetKeysProvider((uint64,address) keysProvider)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetKeysProvider(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetKeysProvider) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetKeysProvider")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetKeysProvider)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetKeysProvider", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetKeysProvider(log types.Log) (*ValSetDriverSetKeysProvider, error) {
	event := new(ValSetDriverSetKeysProvider)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetKeysProvider", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetMaxValidatorsCountIterator is returned from FilterSetMaxValidatorsCount and is used to iterate over the raw logs and unpacked data for SetMaxValidatorsCount events raised by the ValSetDriver contract.
type ValSetDriverSetMaxValidatorsCountIterator struct {
	Event *ValSetDriverSetMaxValidatorsCount // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetMaxValidatorsCountIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetMaxValidatorsCount)
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
		it.Event = new(ValSetDriverSetMaxValidatorsCount)
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
func (it *ValSetDriverSetMaxValidatorsCountIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetMaxValidatorsCountIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetMaxValidatorsCount represents a SetMaxValidatorsCount event raised by the ValSetDriver contract.
type ValSetDriverSetMaxValidatorsCount struct {
	MaxValidatorsCount *big.Int
	Raw                types.Log // Blockchain specific contextual infos
}

// FilterSetMaxValidatorsCount is a free log retrieval operation binding the contract event 0x37ca3532b507cfa33b11765ae8b499cb6830421b982a7f8837ee71ca5a3119c8.
//
// Solidity: event SetMaxValidatorsCount(uint208 maxValidatorsCount)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetMaxValidatorsCount(opts *bind.FilterOpts) (*ValSetDriverSetMaxValidatorsCountIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetMaxValidatorsCount")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetMaxValidatorsCountIterator{contract: _ValSetDriver.contract, event: "SetMaxValidatorsCount", logs: logs, sub: sub}, nil
}

// WatchSetMaxValidatorsCount is a free log subscription operation binding the contract event 0x37ca3532b507cfa33b11765ae8b499cb6830421b982a7f8837ee71ca5a3119c8.
//
// Solidity: event SetMaxValidatorsCount(uint208 maxValidatorsCount)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetMaxValidatorsCount(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetMaxValidatorsCount) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetMaxValidatorsCount")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetMaxValidatorsCount)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetMaxValidatorsCount", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetMaxValidatorsCount(log types.Log) (*ValSetDriverSetMaxValidatorsCount, error) {
	event := new(ValSetDriverSetMaxValidatorsCount)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetMaxValidatorsCount", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetMaxVotingPowerIterator is returned from FilterSetMaxVotingPower and is used to iterate over the raw logs and unpacked data for SetMaxVotingPower events raised by the ValSetDriver contract.
type ValSetDriverSetMaxVotingPowerIterator struct {
	Event *ValSetDriverSetMaxVotingPower // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetMaxVotingPowerIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetMaxVotingPower)
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
		it.Event = new(ValSetDriverSetMaxVotingPower)
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
func (it *ValSetDriverSetMaxVotingPowerIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetMaxVotingPowerIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetMaxVotingPower represents a SetMaxVotingPower event raised by the ValSetDriver contract.
type ValSetDriverSetMaxVotingPower struct {
	MaxVotingPower *big.Int
	Raw            types.Log // Blockchain specific contextual infos
}

// FilterSetMaxVotingPower is a free log retrieval operation binding the contract event 0xe891886eac9e583940fb0844098689693a4d105206ec1f789d119b4314383b95.
//
// Solidity: event SetMaxVotingPower(uint256 maxVotingPower)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetMaxVotingPower(opts *bind.FilterOpts) (*ValSetDriverSetMaxVotingPowerIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetMaxVotingPower")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetMaxVotingPowerIterator{contract: _ValSetDriver.contract, event: "SetMaxVotingPower", logs: logs, sub: sub}, nil
}

// WatchSetMaxVotingPower is a free log subscription operation binding the contract event 0xe891886eac9e583940fb0844098689693a4d105206ec1f789d119b4314383b95.
//
// Solidity: event SetMaxVotingPower(uint256 maxVotingPower)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetMaxVotingPower(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetMaxVotingPower) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetMaxVotingPower")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetMaxVotingPower)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetMaxVotingPower", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetMaxVotingPower(log types.Log) (*ValSetDriverSetMaxVotingPower, error) {
	event := new(ValSetDriverSetMaxVotingPower)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetMaxVotingPower", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetMinInclusionVotingPowerIterator is returned from FilterSetMinInclusionVotingPower and is used to iterate over the raw logs and unpacked data for SetMinInclusionVotingPower events raised by the ValSetDriver contract.
type ValSetDriverSetMinInclusionVotingPowerIterator struct {
	Event *ValSetDriverSetMinInclusionVotingPower // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetMinInclusionVotingPowerIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetMinInclusionVotingPower)
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
		it.Event = new(ValSetDriverSetMinInclusionVotingPower)
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
func (it *ValSetDriverSetMinInclusionVotingPowerIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetMinInclusionVotingPowerIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetMinInclusionVotingPower represents a SetMinInclusionVotingPower event raised by the ValSetDriver contract.
type ValSetDriverSetMinInclusionVotingPower struct {
	MinInclusionVotingPower *big.Int
	Raw                     types.Log // Blockchain specific contextual infos
}

// FilterSetMinInclusionVotingPower is a free log retrieval operation binding the contract event 0x7ea1f11872caff0567f050bd06f29f128a1407e56e3272abbadef87f6cbb6188.
//
// Solidity: event SetMinInclusionVotingPower(uint256 minInclusionVotingPower)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetMinInclusionVotingPower(opts *bind.FilterOpts) (*ValSetDriverSetMinInclusionVotingPowerIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetMinInclusionVotingPower")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetMinInclusionVotingPowerIterator{contract: _ValSetDriver.contract, event: "SetMinInclusionVotingPower", logs: logs, sub: sub}, nil
}

// WatchSetMinInclusionVotingPower is a free log subscription operation binding the contract event 0x7ea1f11872caff0567f050bd06f29f128a1407e56e3272abbadef87f6cbb6188.
//
// Solidity: event SetMinInclusionVotingPower(uint256 minInclusionVotingPower)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetMinInclusionVotingPower(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetMinInclusionVotingPower) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetMinInclusionVotingPower")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetMinInclusionVotingPower)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetMinInclusionVotingPower", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetMinInclusionVotingPower(log types.Log) (*ValSetDriverSetMinInclusionVotingPower, error) {
	event := new(ValSetDriverSetMinInclusionVotingPower)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetMinInclusionVotingPower", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetNumAggregatorsIterator is returned from FilterSetNumAggregators and is used to iterate over the raw logs and unpacked data for SetNumAggregators events raised by the ValSetDriver contract.
type ValSetDriverSetNumAggregatorsIterator struct {
	Event *ValSetDriverSetNumAggregators // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetNumAggregatorsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetNumAggregators)
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
		it.Event = new(ValSetDriverSetNumAggregators)
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
func (it *ValSetDriverSetNumAggregatorsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetNumAggregatorsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetNumAggregators represents a SetNumAggregators event raised by the ValSetDriver contract.
type ValSetDriverSetNumAggregators struct {
	NumAggregators *big.Int
	Raw            types.Log // Blockchain specific contextual infos
}

// FilterSetNumAggregators is a free log retrieval operation binding the contract event 0xa47e6808a463c6134cf3bb23d54ee0ccb5c8056ab8c8b5fd5277fc83cc2f25f3.
//
// Solidity: event SetNumAggregators(uint208 numAggregators)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetNumAggregators(opts *bind.FilterOpts) (*ValSetDriverSetNumAggregatorsIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetNumAggregators")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetNumAggregatorsIterator{contract: _ValSetDriver.contract, event: "SetNumAggregators", logs: logs, sub: sub}, nil
}

// WatchSetNumAggregators is a free log subscription operation binding the contract event 0xa47e6808a463c6134cf3bb23d54ee0ccb5c8056ab8c8b5fd5277fc83cc2f25f3.
//
// Solidity: event SetNumAggregators(uint208 numAggregators)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetNumAggregators(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetNumAggregators) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetNumAggregators")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetNumAggregators)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetNumAggregators", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetNumAggregators(log types.Log) (*ValSetDriverSetNumAggregators, error) {
	event := new(ValSetDriverSetNumAggregators)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetNumAggregators", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetNumCommittersIterator is returned from FilterSetNumCommitters and is used to iterate over the raw logs and unpacked data for SetNumCommitters events raised by the ValSetDriver contract.
type ValSetDriverSetNumCommittersIterator struct {
	Event *ValSetDriverSetNumCommitters // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetNumCommittersIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetNumCommitters)
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
		it.Event = new(ValSetDriverSetNumCommitters)
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
func (it *ValSetDriverSetNumCommittersIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetNumCommittersIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetNumCommitters represents a SetNumCommitters event raised by the ValSetDriver contract.
type ValSetDriverSetNumCommitters struct {
	NumCommitters *big.Int
	Raw           types.Log // Blockchain specific contextual infos
}

// FilterSetNumCommitters is a free log retrieval operation binding the contract event 0x931a819f63102a134c17aeb8b67a254fc3e215c35487041ff43fd3225b272b5f.
//
// Solidity: event SetNumCommitters(uint208 numCommitters)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetNumCommitters(opts *bind.FilterOpts) (*ValSetDriverSetNumCommittersIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetNumCommitters")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetNumCommittersIterator{contract: _ValSetDriver.contract, event: "SetNumCommitters", logs: logs, sub: sub}, nil
}

// WatchSetNumCommitters is a free log subscription operation binding the contract event 0x931a819f63102a134c17aeb8b67a254fc3e215c35487041ff43fd3225b272b5f.
//
// Solidity: event SetNumCommitters(uint208 numCommitters)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetNumCommitters(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetNumCommitters) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetNumCommitters")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetNumCommitters)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetNumCommitters", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetNumCommitters(log types.Log) (*ValSetDriverSetNumCommitters, error) {
	event := new(ValSetDriverSetNumCommitters)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetNumCommitters", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetRequiredHeaderKeyTagIterator is returned from FilterSetRequiredHeaderKeyTag and is used to iterate over the raw logs and unpacked data for SetRequiredHeaderKeyTag events raised by the ValSetDriver contract.
type ValSetDriverSetRequiredHeaderKeyTagIterator struct {
	Event *ValSetDriverSetRequiredHeaderKeyTag // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetRequiredHeaderKeyTagIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetRequiredHeaderKeyTag)
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
		it.Event = new(ValSetDriverSetRequiredHeaderKeyTag)
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
func (it *ValSetDriverSetRequiredHeaderKeyTagIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetRequiredHeaderKeyTagIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetRequiredHeaderKeyTag represents a SetRequiredHeaderKeyTag event raised by the ValSetDriver contract.
type ValSetDriverSetRequiredHeaderKeyTag struct {
	RequiredHeaderKeyTag uint8
	Raw                  types.Log // Blockchain specific contextual infos
}

// FilterSetRequiredHeaderKeyTag is a free log retrieval operation binding the contract event 0xba7887224500eabdaa5bddd0e0210aec811345379939ffbbc4bc87bdfb673b70.
//
// Solidity: event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetRequiredHeaderKeyTag(opts *bind.FilterOpts) (*ValSetDriverSetRequiredHeaderKeyTagIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetRequiredHeaderKeyTag")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetRequiredHeaderKeyTagIterator{contract: _ValSetDriver.contract, event: "SetRequiredHeaderKeyTag", logs: logs, sub: sub}, nil
}

// WatchSetRequiredHeaderKeyTag is a free log subscription operation binding the contract event 0xba7887224500eabdaa5bddd0e0210aec811345379939ffbbc4bc87bdfb673b70.
//
// Solidity: event SetRequiredHeaderKeyTag(uint8 requiredHeaderKeyTag)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetRequiredHeaderKeyTag(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetRequiredHeaderKeyTag) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetRequiredHeaderKeyTag")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetRequiredHeaderKeyTag)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetRequiredHeaderKeyTag", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetRequiredHeaderKeyTag(log types.Log) (*ValSetDriverSetRequiredHeaderKeyTag, error) {
	event := new(ValSetDriverSetRequiredHeaderKeyTag)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetRequiredHeaderKeyTag", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetRequiredKeyTagsIterator is returned from FilterSetRequiredKeyTags and is used to iterate over the raw logs and unpacked data for SetRequiredKeyTags events raised by the ValSetDriver contract.
type ValSetDriverSetRequiredKeyTagsIterator struct {
	Event *ValSetDriverSetRequiredKeyTags // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetRequiredKeyTagsIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetRequiredKeyTags)
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
		it.Event = new(ValSetDriverSetRequiredKeyTags)
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
func (it *ValSetDriverSetRequiredKeyTagsIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetRequiredKeyTagsIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetRequiredKeyTags represents a SetRequiredKeyTags event raised by the ValSetDriver contract.
type ValSetDriverSetRequiredKeyTags struct {
	RequiredKeyTags []uint8
	Raw             types.Log // Blockchain specific contextual infos
}

// FilterSetRequiredKeyTags is a free log retrieval operation binding the contract event 0x14f8998266f37e593027a05efebf63b8710681d1cdbd39e6d7a156ff7e1485cd.
//
// Solidity: event SetRequiredKeyTags(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetRequiredKeyTags(opts *bind.FilterOpts) (*ValSetDriverSetRequiredKeyTagsIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetRequiredKeyTags")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetRequiredKeyTagsIterator{contract: _ValSetDriver.contract, event: "SetRequiredKeyTags", logs: logs, sub: sub}, nil
}

// WatchSetRequiredKeyTags is a free log subscription operation binding the contract event 0x14f8998266f37e593027a05efebf63b8710681d1cdbd39e6d7a156ff7e1485cd.
//
// Solidity: event SetRequiredKeyTags(uint8[] requiredKeyTags)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetRequiredKeyTags(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetRequiredKeyTags) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetRequiredKeyTags")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetRequiredKeyTags)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetRequiredKeyTags", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetRequiredKeyTags(log types.Log) (*ValSetDriverSetRequiredKeyTags, error) {
	event := new(ValSetDriverSetRequiredKeyTags)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetRequiredKeyTags", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

// ValSetDriverSetVerificationTypeIterator is returned from FilterSetVerificationType and is used to iterate over the raw logs and unpacked data for SetVerificationType events raised by the ValSetDriver contract.
type ValSetDriverSetVerificationTypeIterator struct {
	Event *ValSetDriverSetVerificationType // Event containing the contract specifics and raw log

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
func (it *ValSetDriverSetVerificationTypeIterator) Next() bool {
	// If the iterator failed, stop iterating
	if it.fail != nil {
		return false
	}
	// If the iterator completed, deliver directly whatever's available
	if it.done {
		select {
		case log := <-it.logs:
			it.Event = new(ValSetDriverSetVerificationType)
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
		it.Event = new(ValSetDriverSetVerificationType)
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
func (it *ValSetDriverSetVerificationTypeIterator) Error() error {
	return it.fail
}

// Close terminates the iteration process, releasing any pending underlying
// resources.
func (it *ValSetDriverSetVerificationTypeIterator) Close() error {
	it.sub.Unsubscribe()
	return nil
}

// ValSetDriverSetVerificationType represents a SetVerificationType event raised by the ValSetDriver contract.
type ValSetDriverSetVerificationType struct {
	VerificationType uint32
	Raw              types.Log // Blockchain specific contextual infos
}

// FilterSetVerificationType is a free log retrieval operation binding the contract event 0x2acc7be3ff5df4b911488f72502071dcf3f4a8f778a8abc351af3220bcd15b7f.
//
// Solidity: event SetVerificationType(uint32 verificationType)
func (_ValSetDriver *ValSetDriverFilterer) FilterSetVerificationType(opts *bind.FilterOpts) (*ValSetDriverSetVerificationTypeIterator, error) {

	logs, sub, err := _ValSetDriver.contract.FilterLogs(opts, "SetVerificationType")
	if err != nil {
		return nil, err
	}
	return &ValSetDriverSetVerificationTypeIterator{contract: _ValSetDriver.contract, event: "SetVerificationType", logs: logs, sub: sub}, nil
}

// WatchSetVerificationType is a free log subscription operation binding the contract event 0x2acc7be3ff5df4b911488f72502071dcf3f4a8f778a8abc351af3220bcd15b7f.
//
// Solidity: event SetVerificationType(uint32 verificationType)
func (_ValSetDriver *ValSetDriverFilterer) WatchSetVerificationType(opts *bind.WatchOpts, sink chan<- *ValSetDriverSetVerificationType) (event.Subscription, error) {

	logs, sub, err := _ValSetDriver.contract.WatchLogs(opts, "SetVerificationType")
	if err != nil {
		return nil, err
	}
	return event.NewSubscription(func(quit <-chan struct{}) error {
		defer sub.Unsubscribe()
		for {
			select {
			case log := <-logs:
				// New log arrived, parse the event and forward to the user
				event := new(ValSetDriverSetVerificationType)
				if err := _ValSetDriver.contract.UnpackLog(event, "SetVerificationType", log); err != nil {
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
func (_ValSetDriver *ValSetDriverFilterer) ParseSetVerificationType(log types.Log) (*ValSetDriverSetVerificationType, error) {
	event := new(ValSetDriverSetVerificationType)
	if err := _ValSetDriver.contract.UnpackLog(event, "SetVerificationType", log); err != nil {
		return nil, err
	}
	event.Raw = log
	return event, nil
}

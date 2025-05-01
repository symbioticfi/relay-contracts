package eth

import (
	"math/big"

	"github.com/ethereum/go-ethereum/common"
)

// Phase represents the different phases of the protocol
type Phase uint64

const (
	IDLE Phase = iota
	COMMIT
	FAIL
)

type CrossChainAddress struct {
	Address common.Address
	ChainId uint64
}

type MasterConfig struct {
	VotingPowerProviders []CrossChainAddress
	KeysProvider         CrossChainAddress
	Replicas             []CrossChainAddress
}

type ValSetConfig struct {
	MaxVotingPower          *big.Int
	MinInclusionVotingPower *big.Int
	MaxValidatorsCount      *big.Int
}

type VaultVotingPower struct {
	Vault       common.Address
	VotingPower *big.Int
}

type OperatorVotingPower struct {
	Operator common.Address
	Vaults   []VaultVotingPower
}

type Key struct {
	Tag     uint8
	Payload []byte
}

type OperatorWithKeys struct {
	Operator common.Address
	Keys     []Key
}

type Eip712Domain struct {
	Fields            [1]byte
	Name              string
	Version           string
	ChainId           *big.Int
	VerifyingContract common.Address
	Salt              *big.Int
	Extensions        []big.Int
}

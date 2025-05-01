package types

import (
	"fmt"
	"math/big"
	"offchain-middleware/bls"

	"github.com/ethereum/go-ethereum/crypto"

	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/common"
)

type Key struct {
	Tag     uint8  `ssz-size:"8"`
	Payload []byte `ssz-max:"64"`
}

type Vault struct {
	Vault       common.Address `ssz-size:"20"`
	VotingPower *big.Int       `ssz-size:"32"`
}

type Validator struct {
	// Version     uint8          `ssz-size:"8"` TODO: do we need this?
	Operator    common.Address `ssz-size:"20"`
	VotingPower *big.Int       `ssz-size:"32"`
	IsActive    bool           `ssz-size:"1"`
	Keys        []*Key         `ssz-max:"128"`
	Vaults      []*Vault       `ssz-max:"10"`
}

type ValidatorSet struct {
	Version                uint8
	TotalActiveVotingPower *big.Int
	Validators             []*Validator
}

// ValidatorSetHeader represents the input for validator set header
type ValidatorSetHeader struct {
	Version                uint8
	ActiveAggregatedKeys   []G1
	TotalActiveVotingPower *big.Int
	ValidatorsSszMRoot     [32]byte
	ExtraData              []byte
}

type G1 [2]*big.Int

func FormatG1(g1 *bls.G1) G1 {
	G1 := G1{new(big.Int), new(big.Int)}

	g1.G1Affine.X.BigInt(G1[0])
	g1.G1Affine.Y.BigInt(G1[1])
	return G1
}

func Hash(v *ValidatorSetHeader) ([]byte, error) {
	bytes, err := v.Encode()
	if err != nil {
		return nil, fmt.Errorf("")
	}

	return crypto.Keccak256(bytes), nil
}

func (v *ValidatorSetHeader) Encode() ([]byte, error) {
	arguments := abi.Arguments{
		{
			Type: abi.Type{
				T: abi.SliceTy,
				Elem: &abi.Type{
					T:    abi.ArrayTy,
					Size: 2,
					Elem: &abi.Type{T: abi.UintTy, Size: 256}, // G1 points as array of two uint256
				},
			},
		},
		{
			Type: abi.Type{
				T:    abi.UintTy,
				Size: 256,
			},
		},
		{
			Type: abi.Type{
				T:    abi.FixedBytesTy,
				Size: 32,
			},
		},
		{
			Type: abi.Type{
				T: abi.BytesTy,
			},
		},
	}

	return arguments.Pack(v.ActiveAggregatedKeys, v.TotalActiveVotingPower, v.ValidatorsSszMRoot, v.ExtraData)
}

package proof

import (
	"encoding/hex"
	"fmt"
	"math/big"
	"testing"
)

func genValset(numValidators int, nonSigners []int) []ValidatorData {
	valset := make([]ValidatorData, numValidators)
	for i := 0; i < numValidators; i++ {
		valset[i].Key = getPubkey(big.NewInt(int64(i + 10)))
		valset[i].VotingPower = *big.NewInt(100)
		valset[i].IsNonSigner = false
	}

	for _, nonSigner := range nonSigners {
		valset[nonSigner].IsNonSigner = true
	}

	return valset
}

func TestProof(t *testing.T) {
	// generate valset
	valset := genValset(100, []int{0, 1, 2})

	proof, err := Prove(valset)
	if err != nil {
		t.Fatal(err)
	}

	fmt.Println("Proof:", hex.EncodeToString(proof))
}

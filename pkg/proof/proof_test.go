package proof

import (
	"encoding/hex"
	"errors"
	"fmt"
	"math/big"
	"testing"
	"time"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/crypto"

	"github.com/consensys/gnark-crypto/ecc/bn254"
)

func genValset(numValidators int, nonSigners []int) []ValidatorData {
	valset := make([]ValidatorData, numValidators)
	for i := 0; i < numValidators; i++ {
		pk := big.NewInt(int64(i + 10))
		valset[i].PrivateKey = pk
		valset[i].Key = getPubkeyG1(pk)
		valset[i].KeyG2 = getPubkeyG2(pk)
		valset[i].VotingPower = big.NewInt(100)
		valset[i].IsNonSigner = false
	}

	for _, nonSigner := range nonSigners {
		valset[nonSigner].IsNonSigner = true
	}

	return valset
}

//nolint:unused // will be used later
func mockValset() []ValidatorData {
	pks := []string{
		"87191036493798670866484781455694320176667203290824056510541300741498740913410",
		"26972876870930381973856869753776124637336739336929668162870464864826929175089",
		"11008377096554045051122023680185802911050337017631086444859313200352654461863",
	}

	valset := make([]ValidatorData, len(pks))
	for i := 0; i < len(pks); i++ {
		pk, ok := new(big.Int).SetString(pks[i], 10)
		if !ok {
			panic(errors.New("failed to convert pk to big.Int"))
		}
		valset[i].PrivateKey = pk
		valset[i].Key = getPubkeyG1(pk)
		valset[i].KeyG2 = getPubkeyG2(pk)
		valset[i].VotingPower = big.NewInt(10000000000000)
		valset[i].IsNonSigner = false
	}

	return valset
}

func calculateInputHash(validatorSetHash []byte, signersVotingPower *big.Int, messageG1 *bn254.G1Affine) common.Hash {
	var packed []byte

	packed = append(packed, validatorSetHash[:32]...)

	signersVPBytes := make([]byte, 32)
	signersVotingPower.FillBytes(signersVPBytes)
	packed = append(packed, signersVPBytes...)

	packed = append(packed, messageG1.X.Marshal()...)
	packed = append(packed, messageG1.Y.Marshal()...)

	hashBytes := crypto.Keccak256(packed)

	return common.BytesToHash(hashBytes)
}

func TestProof(t *testing.T) {
	startTime := time.Now()
	prover := NewZkProver()
	fmt.Printf("prover initialation took %v\n", time.Since(startTime))

	// generate valset
	valset := genValset(10, []int{})
	// valset := mockValset()

	validatorData := NormalizeValset(valset)

	messageG1Hex := "04c3256b0d7e3f3766d9d3f08fad062e025db392f7b8d8d86322602365b82eba2370c94328160af53802c073a5ddafe012a4073eca842339acc5caae83e1b922"
	messageG1 := &bn254.G1Affine{}
	if err := messageG1.Unmarshal(common.Hex2Bytes(messageG1Hex)); err != nil {
		t.Fatal(err)
	}

	aggSignature, aggKeyG2, _ := getAggSignature(*messageG1, &validatorData)

	proveInput := ProveInput{
		ValidatorData:   validatorData,
		MessageG1:       *messageG1,
		Signature:       *aggSignature,
		SignersAggKeyG2: *aggKeyG2,
	}

	startTime = time.Now()
	proofData, err := prover.Prove(proveInput)
	if err != nil {
		t.Fatal(err)
	}
	fmt.Printf("proving took %v\n", time.Since(startTime))

	fmt.Println("Proof:", hex.EncodeToString(proofData.Proof))
	fmt.Println("Commitments:", hex.EncodeToString(proofData.Commitments))
	fmt.Println("CommitmentPok:", hex.EncodeToString(proofData.CommitmentPok))
	fmt.Println("SignersAggVotingPower:", proofData.SignersAggVotingPower.String())

	inputHash := calculateInputHash(HashValset(valset), proofData.SignersAggVotingPower, messageG1)
	startTime = time.Now()
	res, err := prover.Verify(len(validatorData), inputHash, proofData.Marshal())
	if err != nil {
		t.Fatal(err)
	}
	fmt.Printf("verification took %v\n", time.Since(startTime))

	if !res {
		t.Fatal("failed to verify")
	}
}

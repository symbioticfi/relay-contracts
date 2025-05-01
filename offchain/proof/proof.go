package proof

import (
	"encoding/hex"
	"fmt"
	"math/big"
	"offchain-middleware/bls"
	"offchain-middleware/valset/types"
	"os"

	"github.com/consensys/gnark-crypto/ecc"
	"github.com/consensys/gnark-crypto/ecc/bn254"
	"github.com/consensys/gnark/backend/groth16"
	"github.com/consensys/gnark/frontend"
	"github.com/consensys/gnark/frontend/cs/r1cs"
	"github.com/consensys/gnark/std/algebra/emulated/sw_bn254"
	"github.com/consensys/gnark/std/algebra/emulated/sw_emulated"
	"github.com/consensys/gnark/std/hash/mimc"
	"github.com/consensys/gnark/std/math/emulated"

	mimc_native "github.com/consensys/gnark-crypto/ecc/bn254/fr/mimc"
)

type ValidatorDataCircuit struct {
	Key         sw_emulated.AffinePoint[emulated.BN254Fp]
	VotingPower frontend.Variable
	IsNonSigner frontend.Variable
}

type ValidatorData struct {
	Key         bn254.G1Affine
	VotingPower big.Int
	IsNonSigner bool
}

// Circuit defines a pre-image knowledge proof
type Circuit struct {
	Hash                     frontend.Variable                         `gnark:",public"`
	NonSignersAggKey         sw_emulated.AffinePoint[emulated.BN254Fp] `gnark:",public"`
	NonSignersAggVotingPower frontend.Variable                         `gnark:",public"`
	ValidatorData            []ValidatorDataCircuit
	ZeroPoint                sw_emulated.AffinePoint[emulated.BN254Fp]
}

// Define declares the circuit's constraints
func (circuit *Circuit) Define(api frontend.API) error {
	curve, _ := sw_emulated.New[emulated.BN254Fp, emulated.BN254Fr](api, sw_emulated.GetBN254Params())
	field, _ := emulated.NewField[emulated.BN254Fp](api)

	// check if zero point is zero
	api.AssertIsEqual(field.IsZero(&circuit.ZeroPoint.X), 1)
	api.AssertIsEqual(field.IsZero(&circuit.ZeroPoint.Y), 1)
	// WTF have to take zero point from circuit ...
	aggKey := &circuit.ZeroPoint
	aggVotingPower := frontend.Variable(0)

	mimcOuter, _ := mimc.NewMiMC(api)
	mimcInner, _ := mimc.NewMiMC(api)

	for i := 0; i < len(circuit.ValidatorData); i++ {
		mimcInner.Reset()
		xVar := field.ToBits(&circuit.ValidatorData[i].Key.X)
		yVar := field.ToBits(&circuit.ValidatorData[i].Key.Y)
		mimcInner.Write(api.FromBinary(xVar...))
		mimcInner.Write(api.FromBinary(yVar...))
		mimcInner.Write(circuit.ValidatorData[i].VotingPower)
		mimcOuter.Write(mimcInner.Sum())

		// get power if non-signer otherwise 0
		pow := api.Select(circuit.ValidatorData[i].IsNonSigner, circuit.ValidatorData[i].VotingPower, frontend.Variable(0))
		aggVotingPower = api.Add(aggVotingPower, pow)

		// get key if non-signer otherwise zero point
		point := curve.Select(circuit.ValidatorData[i].IsNonSigner, &circuit.ValidatorData[i].Key, &circuit.ZeroPoint)
		aggKey = curve.AddUnified(aggKey, point)
	}

	curve.AssertIsEqual(aggKey, &circuit.NonSignersAggKey)
	api.AssertIsEqual(aggVotingPower, circuit.NonSignersAggVotingPower)
	api.AssertIsEqual(circuit.Hash, mimcOuter.Sum())

	return nil
}

// helper functions
func getPubkey(pk *big.Int) bn254.G1Affine {
	_, _, g1Aff, _ := bn254.Generators()
	var p bn254.G1Affine
	p.ScalarMultiplication(&g1Aff, pk)
	return p
}

func HashValset(valset *[]ValidatorData) []byte {
	outerHash := mimc_native.NewMiMC()
	for i := 0; i < len(*valset); i++ {
		innerHash := mimc_native.NewMiMC()
		xBytes := (*valset)[i].Key.X.Bytes()
		yBytes := (*valset)[i].Key.Y.Bytes()

		innerHash.Write(xBytes[:])
		innerHash.Write(yBytes[:])
		innerHash.Write((*valset)[i].VotingPower.Bytes())

		outerHash.Write(innerHash.Sum(nil))
	}
	return outerHash.Sum(nil)
}

func getNonSignersData(valset *[]ValidatorData) (aggKey *bn254.G1Affine, aggVotingPower *big.Int) {
	aggVotingPower = big.NewInt(0)
	aggKey = new(bn254.G1Affine)
	aggKey.SetInfinity()
	for i := 0; i < len(*valset); i++ {
		if (*valset)[i].IsNonSigner {
			aggKey = aggKey.Add(aggKey, &(*valset)[i].Key)
			aggVotingPower = aggVotingPower.Add(aggVotingPower, &(*valset)[i].VotingPower)
		}
	}
	return aggKey, aggVotingPower
}

func setCircuitData(circuit *Circuit, valset *[]ValidatorData) {
	for i := 0; i < len(*valset); i++ {
		circuit.ValidatorData[i].Key = sw_bn254.NewG1Affine((*valset)[i].Key)
		circuit.ValidatorData[i].VotingPower = (*valset)[i].VotingPower
		circuit.ValidatorData[i].IsNonSigner = *big.NewInt(0)

		if (*valset)[i].IsNonSigner {
			circuit.ValidatorData[i].IsNonSigner = *big.NewInt(1)
		}
	}
	aggKey, aggVotingPower := getNonSignersData(valset)
	circuit.NonSignersAggKey = sw_bn254.NewG1Affine(*aggKey)
	circuit.NonSignersAggVotingPower = *aggVotingPower
	circuit.Hash = HashValset(valset)
	zeroPoint := new(bn254.G1Affine)
	zeroPoint.SetInfinity()
	circuit.ZeroPoint = sw_bn254.NewG1Affine(*zeroPoint)
}

func ToValidatorsData(validators []*types.Validator, requiredKeyTag uint8) []ValidatorData {
	valset := make([]ValidatorData, 0)
	for i := 0; i < len(validators); i++ {
		if !validators[i].IsActive {
			continue
		}
		for _, key := range validators[i].Keys {
			if key.Tag == requiredKeyTag {
				valset = append(valset, ValidatorData{Key: *bls.DeserializeG1(key.Payload).G1Affine, VotingPower: *validators[i].VotingPower})
			}
		}
	}
	return valset
}

func Prove(valset []ValidatorData) ([]byte, error) {
	// compiles our circuit into a R1CS
	circuit := Circuit{
		ValidatorData: make([]ValidatorDataCircuit, len(valset)),
	}
	ccs, err := frontend.Compile(ecc.BN254.ScalarField(), r1cs.NewBuilder, &circuit)
	if err != nil {
		return nil, err
	}

	pk, vk, err := groth16.Setup(ccs)
	if err != nil {
		return nil, err
	}

	// set circuit valset to circuit data
	setCircuitData(&circuit, &valset)

	// witness definition
	assignment := circuit
	witness, _ := frontend.NewWitness(&assignment, ecc.BN254.ScalarField())
	publicWitness, _ := witness.Public()

	// groth16: Prove & Verify
	proof, err := groth16.Prove(ccs, pk, witness)
	if err != nil {
		return nil, err
	}

	fmt.Println("Proof:", proof)
	proof.WriteTo(os.Stdout)
	proof.WriteRawTo(os.Stdout)

	_proof, ok := proof.(interface{ MarshalSolidity() []byte })
	if !ok {
		panic("proof does not implement MarshalSolidity()")
	}

	proofBytes := _proof.MarshalSolidity()
	fmt.Println("Proof:", hex.EncodeToString(proofBytes))
	// verify proof
	err = groth16.Verify(proof, vk, publicWitness)
	if err != nil {
		return nil, err
	}

	return proofBytes, nil
}

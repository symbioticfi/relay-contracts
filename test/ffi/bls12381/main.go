package main

import (
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"fmt"
	"math/big"
	"os"
	"strings"

	"github.com/ethereum/go-ethereum/crypto/bls12381"
)

const dstG1 = "BLS_SIG_BLS12381G1_XMD:SHA-256_SSWU_RO_NUL_"

var fieldModulus = mustBigFromHex(
	"1a0111ea397fe69a4b1ba7b6434bacd764774b84f38512bf6730d2a0f6b0f6241eabfffeb153ffffb9feffffffffaaab",
)

func main() {
	if len(os.Args) < 3 {
		usage()
	}

	command := os.Args[1]
	switch command {
	case "hash-to-g1":
		message, err := decodeHexArg(os.Args[2])
		exitOnError(err)
		point, err := hashToG1(message)
		exitOnError(err)
		writeOutput(bls12381.NewG1().EncodePoint(point))
	case "g1-mul":
		scalar, err := parseScalar(os.Args[2])
		exitOnError(err)
		writeOutput(g1Mul(scalar))
	case "g2-mul":
		scalar, err := parseScalar(os.Args[2])
		exitOnError(err)
		writeOutput(g2Mul(scalar))
	case "sign":
		if len(os.Args) < 4 {
			usage()
		}
		message, err := decodeHexArg(os.Args[2])
		exitOnError(err)
		scalar, err := parseScalar(os.Args[3])
		exitOnError(err)
		out, err := sign(message, scalar)
		exitOnError(err)
		writeOutput(out)
	default:
		usage()
	}
}

func usage() {
	fmt.Fprintln(os.Stderr, "usage: main.go <hash-to-g1|g1-mul|g2-mul|sign> <hex> [hex]")
	os.Exit(2)
}

func exitOnError(err error) {
	if err == nil {
		return
	}
	fmt.Fprintln(os.Stderr, err.Error())
	os.Exit(1)
}

func writeOutput(out []byte) {
	encoded := "0x" + hex.EncodeToString(out)
	if _, err := os.Stdout.WriteString(encoded); err != nil {
		fmt.Fprintln(os.Stderr, err.Error())
		os.Exit(1)
	}
}

func parseScalar(arg string) (*big.Int, error) {
	if strings.HasPrefix(arg, "0x") || strings.HasPrefix(arg, "0X") {
		b, err := decodeHexArg(arg)
		if err != nil {
			return nil, err
		}
		return new(big.Int).SetBytes(b), nil
	}
	if hasHexLetters(arg) {
		b, err := decodeHexArg(arg)
		if err != nil {
			return nil, err
		}
		return new(big.Int).SetBytes(b), nil
	}
	value, ok := new(big.Int).SetString(arg, 10)
	if !ok {
		return nil, errors.New("invalid scalar")
	}
	return value, nil
}

func decodeHexArg(arg string) ([]byte, error) {
	if strings.HasPrefix(arg, "0x") || strings.HasPrefix(arg, "0X") {
		trimmed := arg[2:]
		if len(trimmed)%2 == 1 {
			trimmed = "0" + trimmed
		}
		if trimmed == "" {
			return []byte{}, nil
		}
		return hex.DecodeString(trimmed)
	}

	trimmed := arg
	if isHexString(trimmed) {
		if len(trimmed)%2 == 1 {
			trimmed = "0" + trimmed
		}
		if trimmed == "" {
			return []byte{}, nil
		}
		decoded, err := hex.DecodeString(trimmed)
		if err == nil {
			return decoded, nil
		}
	}
	return []byte(arg), nil
}

func g1Mul(scalar *big.Int) []byte {
	g1 := bls12381.NewG1()
	out := g1.New()
	g1.MulScalar(out, g1.One(), scalar)
	return g1.EncodePoint(out)
}

func g2Mul(scalar *big.Int) []byte {
	g2 := bls12381.NewG2()
	out := g2.New()
	g2.MulScalar(out, g2.One(), scalar)
	return g2.EncodePoint(out)
}

func sign(message []byte, scalar *big.Int) ([]byte, error) {
	g1 := bls12381.NewG1()
	g2 := bls12381.NewG2()

	keyG1 := g1.New()
	g1.MulScalar(keyG1, g1.One(), scalar)

	keyG2 := g2.New()
	g2.MulScalar(keyG2, g2.One(), scalar)

	messageG1, err := hashToG1(message)
	if err != nil {
		return nil, err
	}

	signature := g1.New()
	g1.MulScalar(signature, messageG1, scalar)

	out := make([]byte, 0, 512)
	out = append(out, g1.EncodePoint(keyG1)...)
	out = append(out, g2.EncodePoint(keyG2)...)
	out = append(out, g1.EncodePoint(signature)...)
	return out, nil
}

func hashToG1(message []byte) (*bls12381.PointG1, error) {
	uniformBytes, err := expandMsgXMD(message, []byte(dstG1), 128)
	if err != nil {
		return nil, err
	}
	g1 := bls12381.NewG1()

	p0, err := mapUniformToG1(g1, uniformBytes[:64])
	if err != nil {
		return nil, err
	}

	p1, err := mapUniformToG1(g1, uniformBytes[64:])
	if err != nil {
		return nil, err
	}

	sum := g1.New()
	g1.Add(sum, p0, p1)
	g1.Affine(sum)
	return sum, nil
}

func mapUniformToG1(g1 *bls12381.G1, uniform []byte) (*bls12381.PointG1, error) {
	fieldBytes, err := reduceToField(uniform)
	if err != nil {
		return nil, err
	}
	return g1.MapToCurve(fieldBytes)
}

func expandMsgXMD(message []byte, dst []byte, outLen int) ([]byte, error) {
	if len(dst) > 255 {
		return nil, errors.New("dst too long")
	}

	dstLen := byte(len(dst))
	b0Input := make([]byte, 0, 64+len(message)+3+len(dst)+1)
	b0Input = append(b0Input, make([]byte, 64)...)
	b0Input = append(b0Input, message...)
	b0Input = append(b0Input, 0x00, byte(outLen), 0x00)
	b0Input = append(b0Input, dst...)
	b0Input = append(b0Input, dstLen)
	b0 := sha256.Sum256(b0Input)

	b1Input := make([]byte, 0, 32+1+len(dst)+1)
	b1Input = append(b1Input, b0[:]...)
	b1Input = append(b1Input, 0x01)
	b1Input = append(b1Input, dst...)
	b1Input = append(b1Input, dstLen)
	bi := sha256.Sum256(b1Input)

	out := make([]byte, outLen)
	ell := (outLen + 31) / 32

	for i := 1; i < ell; i++ {
		copy(out[(i-1)*32:], bi[:])

		mixed := make([]byte, 32)
		for j := 0; j < 32; j++ {
			mixed[j] = b0[j] ^ bi[j]
		}

		nextInput := make([]byte, 0, 32+1+len(dst)+1)
		nextInput = append(nextInput, mixed...)
		nextInput = append(nextInput, byte(i+1))
		nextInput = append(nextInput, dst...)
		nextInput = append(nextInput, dstLen)
		bi = sha256.Sum256(nextInput)
	}

	copy(out[(ell-1)*32:], bi[:])
	return out, nil
}

func reduceToField(in []byte) ([]byte, error) {
	if len(in) != 64 {
		return nil, errors.New("uniform bytes must be 64 bytes")
	}
	value := new(big.Int).SetBytes(in)
	value.Mod(value, fieldModulus)
	return value.FillBytes(make([]byte, 48)), nil
}

func mustBigFromHex(hexValue string) *big.Int {
	value, ok := new(big.Int).SetString(hexValue, 16)
	if !ok {
		panic("invalid modulus hex")
	}
	return value
}

func hasHexLetters(value string) bool {
	for _, r := range value {
		if (r >= 'a' && r <= 'f') || (r >= 'A' && r <= 'F') {
			return true
		}
	}
	return false
}

func isHexString(value string) bool {
	if value == "" {
		return false
	}
	for _, r := range value {
		if (r >= '0' && r <= '9') || (r >= 'a' && r <= 'f') || (r >= 'A' && r <= 'F') {
			continue
		}
		return false
	}
	return true
}

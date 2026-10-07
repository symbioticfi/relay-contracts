package main

import (
	"encoding/hex"
	"errors"
	"fmt"
	"math/big"
	"os"
	"strings"

	bls12381 "github.com/consensys/gnark-crypto/ecc/bls12-381"
	"github.com/consensys/gnark-crypto/ecc/bls12-381/fp"
)

const dstG1 = "BLS_SIG_BLS12381G1_XMD:SHA-256_SSWU_RO_NUL_"

func main() {
	if len(os.Args) < 3 {
		usage()
	}

	command := os.Args[1]
	switch command {
	case "hash-to-g1":
		message, err := decodeHexArg(os.Args[2])
		exitOnError(err)
		point, err := bls12381.HashToG1(message, []byte(dstG1))
		exitOnError(err)
		writeOutput(encodeG1(&point))
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
	var point bls12381.G1Affine
	point.ScalarMultiplicationBase(scalar)
	return encodeG1(&point)
}

func g2Mul(scalar *big.Int) []byte {
	var point bls12381.G2Affine
	point.ScalarMultiplicationBase(scalar)
	return encodeG2(&point)
}

func sign(message []byte, scalar *big.Int) ([]byte, error) {
	var keyG1 bls12381.G1Affine
	keyG1.ScalarMultiplicationBase(scalar)
	var keyG2 bls12381.G2Affine
	keyG2.ScalarMultiplicationBase(scalar)

	messageG1, err := bls12381.HashToG1(message, []byte(dstG1))
	if err != nil {
		return nil, err
	}
	var signature bls12381.G1Affine
	signature.ScalarMultiplication(&messageG1, scalar)

	out := make([]byte, 0, 512)
	out = append(out, encodeG1(&keyG1)...)
	out = append(out, encodeG2(&keyG2)...)
	out = append(out, encodeG1(&signature)...)
	return out, nil
}

// EIP-2537 encodes each base-field element as a zero-padded 64-byte value.
func encodeField(out []byte, element *fp.Element) {
	value := element.Bytes()
	copy(out[16:64], value[:])
}

func encodeG1(point *bls12381.G1Affine) []byte {
	out := make([]byte, 128)
	encodeField(out[:64], &point.X)
	encodeField(out[64:], &point.Y)
	return out
}

func encodeG2(point *bls12381.G2Affine) []byte {
	out := make([]byte, 256)
	encodeField(out[:64], &point.X.A0)
	encodeField(out[64:128], &point.X.A1)
	encodeField(out[128:192], &point.Y.A0)
	encodeField(out[192:], &point.Y.A1)
	return out
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

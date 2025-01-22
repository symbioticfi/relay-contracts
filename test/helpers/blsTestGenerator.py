from py_ecc.optimized_bn128 import *
from eth_hash.auto import keccak
from typing import Tuple
import json
import os
from eth_account import Account
import eth_abi

# used for helped aggregation
def get_public_key_G1(secret_key: int) -> Tuple[FQ, FQ, FQ]:
    return multiply(G1, secret_key)


def get_public_key(secret_key: int) -> Tuple[FQ2, FQ2, FQ2]:
    return multiply(G2, secret_key)


def sign(message: Tuple[FQ, FQ, FQ], secret_key: int):
    return multiply(message, secret_key)


def aggregate_signatures(signatures: list[Tuple[FQ, FQ, FQ]]) -> Tuple[FQ, FQ, FQ]:
    res = signatures[0]
    for signature in signatures[1:]:
        res = add(res, signature)
    return res


def aggregate_public_keys(pubkeys: list[Tuple[FQ2, FQ2, FQ2]]) -> Tuple[FQ2, FQ2, FQ2]:
    res = pubkeys[0]
    for pubkey in pubkeys[1:]:
        res = add(res, pubkey)
    return res


# used for helped aggregation
def aggregate_public_keys_G1(pubkeys: list[Tuple[FQ, FQ, FQ]]) -> Tuple[FQ, FQ, FQ]:
    res = pubkeys[0]
    for pubkey in pubkeys[1:]:
        res = add(res, pubkey)
    return res


def hash_to_point(data: bytes):
    x = int.from_bytes(data, byteorder='big') % field_modulus
    
    while True:
        beta, y = find_y_from_x(x)
        
        # Check if y^2 == beta
        if pow(y, 2, field_modulus) == beta:
            return FQ(x), FQ(y), FQ(1)
            
        x = (x + 1) % field_modulus


def find_y_from_x(x: int) -> Tuple[int, int]:
    """
    Given x coordinate, find y coordinate on BN254 curve
    Returns (beta, y) where:
        beta = x^3 + 3 (mod p)  
        y = sqrt(beta) if it exists
    """
    # Calculate beta = x^3 + 3 mod p
    beta = (pow(x, 3, field_modulus) + 3) % field_modulus
    
    # Calculate y = beta^((p+1)/4) mod p
    # Using same exponent as in BN254.sol: 0xc19139cb84c680a6e14116da060561765e05aa45a1c72a34f082305b61f3f52
    y = pow(beta, 0xc19139cb84c680a6e14116da060561765e05aa45a1c72a34f082305b61f3f52, field_modulus)

    return beta, y


def sqrt(x_square: int) -> Tuple[int, bool]:
    # Calculate y = x^((p+1)/4) mod p
    # This is equivalent to finding square root modulo p
    # where p ≡ 3 (mod 4)
    exp = (field_modulus + 1) // 4
    y = pow(x_square, exp, field_modulus)
    
    # Verify y is actually a square root
    if pow(y, 2, field_modulus) == x_square:
        return y, True
    return 0, False


def parse_solc_G1(solc_G1: Tuple[int, int]):
    x, y = solc_G1
    return FQ(x), FQ(y), FQ(1)


def format_G1(g1_element: Tuple[FQ, FQ, FQ]) -> Tuple[FQ, FQ]:
    x, y = normalize(g1_element)
    return (str(x), str(y))


def format_G2(g2_element: Tuple[FQ2, FQ2, FQ2]) -> Tuple[FQ2, FQ2]:
    x, y = normalize(g2_element)
    x2, x1 = x.coeffs
    y2, y1 = y.coeffs
    return x1, x2, y1, y2


def verify(message: bytes, signature: Tuple[FQ, FQ, FQ], public_key: Tuple[FQ2, FQ2, FQ2]) -> bool:
    # Map message to curve point
    h = hash_to_point(message)
    
    # Check e(signature, G2) = e(h, public_key)
    # Note: signature and h are in G1, while G2 and public_key are in G2
    pairing1 = pairing(G2, signature)
    pairing2 = pairing(public_key, h)
    
    return pairing1 == pairing2


def generate_operator_address() -> str:
    # Generate random private key
    private_key = os.urandom(32)
    acc = Account.create(private_key)
    # Pad address to 32 bytes
    return acc.address


secret_key = 69

public_key = get_public_key(secret_key)
public_key_g1 = get_public_key_G1(secret_key)

formatted_pubkey = format_G2(public_key)
formatted_pubkey_g1 = format_G1(public_key_g1)

# Create message hash as done in the contract
operator = generate_operator_address()
message = eth_abi.encode(
    ['address', 'uint256', 'uint256', 'uint256[2]', 'uint256[2]'],
    [
        operator, int(formatted_pubkey_g1[0]), int(formatted_pubkey_g1[1]), 
        [int(formatted_pubkey[0]), int(formatted_pubkey[1])], 
        [int(formatted_pubkey[2]), int(formatted_pubkey[3])]
    ]
)

message_hash = keccak(message)
print("message_hash: ", message_hash.hex())
data = message_hash

message = hash_to_point(data)
# Generate signature
signature = sign(message, secret_key)
formatted_sig = format_G1(signature)

# Format values for test output

# Verify the signature
is_valid = verify(data, signature, public_key)
print(f"\nSignature valid: {is_valid}")

print("Test values:")
print(f"Public key: {formatted_pubkey}")
print(f"Message: {data.hex()}")
print(f"Signature: {formatted_sig}")

# Test vectors
test_vectors = {
    "operator": operator,
    "publicKeyG1": [int(x) for x in formatted_pubkey_g1],
    "publicKeyG2": [int(x) for x in formatted_pubkey],
    "message": data.hex(),
    "signature": [int(x) for x in formatted_sig],
}

with open('test/helpers/blsTestVectors.json', 'w') as f:
    json.dump(test_vectors, f, indent=4)
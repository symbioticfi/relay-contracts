const fs = require('fs');
const { ed25519 } = require('@noble/curves/ed25519');
const { bytesToHex, hexToBytes } = require('@noble/curves/abstract/utils');
const { keccak256 } = require('ethereum-cryptography/keccak');
const { ethers } = require('ethers');

// Generate random operator address
function generateOperatorAddress() {
    const wallet = ethers.Wallet.createRandom();
    return wallet.address;
}

// Generate Ed25519 keypair and signature
function generateTestData(operatorAddress) {
    // Generate keypair
    const privateKey = ed25519.utils.randomPrivateKey();
    const publicKey = ed25519.getPublicKey(privateKey);

    // Create message hash as done in the contract
    let message = keccak256(
        Buffer.concat([
            Buffer.from(operatorAddress.replace('0x', ''), 'hex'),
            publicKey,
        ])
    );

    // Sign the message
    const signature = "0x" + bytesToHex(ed25519.sign(message, privateKey));

    // Verify the signature
    const isValid = ed25519.verify(
        hexToBytes(signature.slice(2)), // Remove 0x prefix
        message,
        publicKey
    );

    if (!isValid) {
        throw new Error('Generated signature failed verification');
    }

    // Return ABI encoded data
    const abiCoder = new ethers.AbiCoder();
    const key = abiCoder.encode(['bytes32'], ['0x' + bytesToHex(publicKey)]);

    return {
        operatorAddress,
        key,
        signature: signature
    };
}

// Generate invalid test data with mismatched key and signature
function generateInvalidTestData(operatorAddress) {
    // Generate two different keypairs
    const privateKey1 = ed25519.utils.randomPrivateKey();
    const publicKey1 = ed25519.getPublicKey(privateKey1);
    const privateKey2 = ed25519.utils.randomPrivateKey();
    const publicKey2 = ed25519.getPublicKey(privateKey2);

    // Create message hash with publicKey1
    let message = keccak256(
        Buffer.concat([
            Buffer.from(operatorAddress.replace('0x', ''), 'hex'),
            publicKey1,
        ])
    );

    // Sign with privateKey2 (mismatch)
    const signature = "0x" + bytesToHex(ed25519.sign(message, privateKey2));

    // ABI encode publicKey1
    const abiCoder = new ethers.AbiCoder();
    const key = abiCoder.encode(['bytes32'], ['0x' + bytesToHex(publicKey1)]);

    return {
        operatorAddress,
        key,
        signature: signature
    };
}

// Generate both valid and invalid test data
const operatorAddress = generateOperatorAddress();
const validTestData = generateTestData(operatorAddress);
const invalidTestData = generateInvalidTestData(operatorAddress);

// Write data to file
fs.writeFileSync('test/helpers/ed25519TestData.json',
    JSON.stringify({
        operator: validTestData.operatorAddress,
        key: validTestData.key,
        signature: validTestData.signature,
        invalidKey: invalidTestData.key,
        invalidSignature: invalidTestData.signature
    }, null, 2)
);
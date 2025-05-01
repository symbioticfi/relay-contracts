package signer

import (
	"encoding/hex"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"offchain-middleware/network"
	"offchain-middleware/signing"
	"offchain-middleware/valset"
)

type SignerClient struct {
	signing         *signing.Signing
	valsetGenerator *valset.ValsetGenerator
	p2p             *network.P2PService
}

func NewSignerClient(signing *signing.Signing, vg *valset.ValsetGenerator, p2p *network.P2PService) *SignerClient {
	return &SignerClient{
		signing:         signing,
		valsetGenerator: vg,
		p2p:             p2p,
	}
}

// Start starts the signer client
func (s *SignerClient) Start(addr string) error {
	http.HandleFunc("/sign", s.handleSignRequest)
	log.Printf("Starting signer HTTP server on %s", addr)

	if err := s.p2p.Start(s.handleStream); err != nil {
		return fmt.Errorf("failed to start P2P service: %w", err)
	}

	return http.ListenAndServe(addr, nil)
}

// Stop gracefully shuts down the signer client
func (s *SignerClient) Stop() {
	log.Println("Shutting down signer client...")
	// Perform any necessary cleanup operations here
	// This is a placeholder for future implementation
}

// handleSignRequest handles HTTP requests to sign messages
func (s *SignerClient) handleSignRequest(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Read the message from the request body
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "Failed to read request body", http.StatusBadRequest)
		return
	}
	defer r.Body.Close()

	// Sign the message
	signature, pubKey, msgHash, err := s.signing.SignMessage(body)
	if err != nil {
		http.Error(w, fmt.Sprintf("Failed to sign message: %v", err), http.StatusInternalServerError)
		return
	}

	// Broadcast the signature to the network
	if err := s.BroadcastSignature(hex.EncodeToString(msgHash), signature, pubKey); err != nil {
		log.Printf("Warning: Failed to broadcast signature: %v", err)
	}

	// Return the signature and public key as hex strings
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, `{"signature":"%s","public_key":"%s","message_hash":"%s"}`, hex.EncodeToString(signature), hex.EncodeToString(pubKey), hex.EncodeToString(msgHash))
}

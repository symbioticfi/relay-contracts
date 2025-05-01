package signer

import (
	"encoding/json"
	"fmt"
	"log"
	"offchain-middleware/network"
	"time"

	net "github.com/libp2p/go-libp2p/core/network"
)

// Message types
const (
	TypeSignatureRequest = "signature"
)

// SignatureMessage contains a peer's signature for a message
type SignatureMessage struct {
	MessageHash string `json:"message_hash"`
	Signature   []byte `json:"signature"`
	PublicKey   []byte `json:"public_key"`
}

// handleStream processes incoming streams from peers
func (s *SignerClient) handleStream(stream net.Stream) {
	log.Printf("Received stream from %s", stream.Conn().RemotePeer().String())
}

// BroadcastSignature broadcasts a signature request to all peers
func (s *SignerClient) BroadcastSignature(msgHash string, signature []byte, pubKey []byte) error {
	// Create signature request
	req := SignatureMessage{
		MessageHash: msgHash,
		Signature:   signature,
		PublicKey:   pubKey,
	}

	data, err := json.Marshal(req)
	if err != nil {
		return fmt.Errorf("failed to marshal signature request: %w", err)
	}

	msg := network.Message{
		Type:      TypeSignatureRequest,
		Sender:    s.p2p.HostID().String(),
		Timestamp: time.Now().Unix(),
		Data:      data,
	}

	if err := s.p2p.Broadcast(msg); err != nil {
		return fmt.Errorf("failed to broadcast signature request: %w", err)
	}

	log.Println("Broadcasted signature request to all peers")

	return nil
}

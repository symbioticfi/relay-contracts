package aggregator

import (
	"encoding/json"
	"log"
	"offchain-middleware/cmd/signer"
	"offchain-middleware/network"

	net "github.com/libp2p/go-libp2p/core/network"
)

// handleStream processes incoming streams from peers
func (a *AggregatorClient) handleStream(stream net.Stream) {
	// Create a buffer for reading from the stream
	buf := make([]byte, 65536)
	n, err := stream.Read(buf)
	if err != nil {
		log.Printf("Error reading from stream: %s", err)
		stream.Reset()
		return
	}

	// Parse the message
	var msg network.Message
	if err := json.Unmarshal(buf[:n], &msg); err != nil {
		log.Printf("Error unmarshaling message: %s", err)
		stream.Reset()
		return
	}

	// Process the message based on its type
	switch msg.Type {
	case signer.TypeSignatureRequest:
		a.handleSignature(msg)
	default:
		log.Printf("Unknown message type: %s", msg.Type)
	}

	stream.Close()
}

// handleSignatureRequest processes a signature request
func (a *AggregatorClient) handleSignature(msg network.Message) {
	var req signer.SignatureMessage
	if err := json.Unmarshal(msg.Data, &req); err != nil {
		log.Printf("Error unmarshaling signature request: %s", err)
		return
	}

	log.Printf("Received signature request for message: %s", req.MessageHash)

	a.storage.AddSignature(req.MessageHash, req.Signature, req.PublicKey)
}

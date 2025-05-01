package network

import (
	"encoding/json"
)

// Message is the basic unit of communication between peers
type Message struct {
	Type      string          `json:"type"`
	Sender    string          `json:"sender"`
	Timestamp int64           `json:"timestamp"`
	Data      json.RawMessage `json:"data"`
}

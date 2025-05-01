package storage

import (
	"sync"
)

// actually RAM storage
type Storage struct {
	mutex sync.RWMutex
	// messageHash -> signatures
	signatures map[string]map[string]bool
}

func NewStorage() *Storage {
	return &Storage{
		signatures: make(map[string]map[string]bool),
	}
}

func (s *Storage) AddSignature(messageHash string, pubKey []byte, sig []byte) {
	s.mutex.Lock()
	defer s.mutex.Unlock()

	s.signatures[messageHash][string(pubKey)+string(sig)] = true
}

func (s *Storage) GetSignatures(messageHash string) ([][]byte, [][]byte) {
	s.mutex.RLock()
	defer s.mutex.RUnlock()

	var pubKeys, sigs [][]byte

	for sigKey := range s.signatures[messageHash] {
		pubKeyLen := len(sigKey) / 2
		pubKey := []byte(sigKey[:pubKeyLen])
		sig := []byte(sigKey[pubKeyLen:])
		pubKeys = append(pubKeys, pubKey)
		sigs = append(sigs, sig)
	}

	return pubKeys, sigs
}

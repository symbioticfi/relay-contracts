package network

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"sync"
	"time"

	"github.com/libp2p/go-libp2p"
	"github.com/libp2p/go-libp2p/core/host"
	"github.com/libp2p/go-libp2p/core/network"
	"github.com/libp2p/go-libp2p/core/peer"
	"github.com/libp2p/go-libp2p/core/protocol"
	"github.com/libp2p/go-libp2p/p2p/discovery/mdns"
	"github.com/multiformats/go-multiaddr"
)

// Configuration
const (
	protocolID            = "/p2p/messaging/1.0.0"
	mdnsServiceTag        = "p2p-messaging"
	mdnsDiscoveryInterval = time.Second * 10
)

// P2PService handles peer-to-peer communication and signature aggregation
type P2PService struct {
	ctx        context.Context
	host       host.Host
	peersMutex sync.RWMutex
	peers      map[peer.ID]struct{}
}

// NewP2PService creates a new P2P service with the given configuration
func NewP2PService(ctx context.Context, listenAddrs []multiaddr.Multiaddr, peers []string) (*P2PService, error) {
	// Create libp2p host
	h, err := libp2p.New(
		libp2p.ListenAddrs(listenAddrs...),
	)

	if err != nil {
		return nil, fmt.Errorf("failed to create libp2p host: %w", err)
	}

	service := &P2PService{
		ctx:   ctx,
		host:  h,
		peers: make(map[peer.ID]struct{}),
	}

	// Print node info
	addrs := h.Addrs()
	for _, addr := range addrs {
		log.Printf("Listening on: %s/p2p/%s", addr, h.ID().ShortString())
	}

	if err := service.connectToPeers(peers); err != nil {
		return nil, fmt.Errorf("failed to connect to peers: %w", err)
	}

	return service, nil
}

// Start begins the service operations
func (s *P2PService) Start(handler func(network.Stream)) error {
	// Set up protocol handler
	s.host.SetStreamHandler(protocol.ID(protocolID), handler)

	// Start mDNS discovery in a goroutine
	go func() {
		discovery := mdns.NewMdnsService(s.host, mdnsServiceTag, s)
		if err := discovery.Start(); err != nil {
			log.Printf("failed to start mDNS discovery service: %v", err)
		}
	}()

	return nil
}

// HandlePeerFound is called when a peer is discovered via mDNS
func (s *P2PService) HandlePeerFound(pi peer.AddrInfo) {
	if pi.ID == s.host.ID() {
		return // Skip self
	}

	log.Printf("Discovered peer: %s", pi.ID.ShortString())

	s.peersMutex.Lock()
	if _, found := s.peers[pi.ID]; !found {
		s.peers[pi.ID] = struct{}{}
	}
	s.peersMutex.Unlock()

	ctx, cancel := context.WithTimeout(s.ctx, time.Second*10)
	defer cancel()

	if err := s.host.Connect(ctx, pi); err != nil {
		log.Printf("Failed to connect to peer %s: %s", pi.ID.ShortString(), err)
		return
	}

	log.Printf("Connected to peer: %s", pi.ID.ShortString())
}

// Broadcast sends a message to all connected peers
func (s *P2PService) Broadcast(msg Message) error {
	s.peersMutex.RLock()
	defer s.peersMutex.RUnlock()

	for peerID := range s.peers {
		if err := s.sendToPeer(peerID.String(), msg); err != nil {
			log.Printf("Failed to send message to peer %s: %s", peerID.String(), err)
		}
	}

	return nil
}

// sendToPeer sends a message to a specific peer
func (s *P2PService) sendToPeer(peerIDStr string, msg Message) error {
	peerID, err := peer.Decode(peerIDStr)
	if err != nil {
		return fmt.Errorf("invalid peer ID: %w", err)
	}

	// Open a stream to the peer
	stream, err := s.host.NewStream(s.ctx, peerID, protocol.ID(protocolID))
	if err != nil {
		return fmt.Errorf("failed to open stream: %w", err)
	}
	defer stream.Close()

	// Marshal and send the message
	data, err := json.Marshal(msg)
	if err != nil {
		return fmt.Errorf("failed to marshal message: %w", err)
	}

	_, err = stream.Write(data)
	if err != nil {
		return fmt.Errorf("failed to write to stream: %w", err)
	}

	return nil
}

// Stop gracefully stops the service
func (s *P2PService) Stop() error {
	if err := s.host.Close(); err != nil {
		return fmt.Errorf("failed to close host: %w", err)
	}
	return nil
}

func (s *P2PService) connectToPeers(peers []string) error {
	for _, addrStr := range peers {
		maddr, err := multiaddr.NewMultiaddr(addrStr)
		if err != nil {
			return fmt.Errorf("invalid multiaddr: %w", err)
		}

		info, err := peer.AddrInfoFromP2pAddr(maddr)
		if err != nil {
			return fmt.Errorf("failed to get peer info: %w", err)
		}
		ctx, cancel := context.WithTimeout(s.ctx, time.Second*10)
		defer cancel()

		if err := s.host.Connect(ctx, *info); err != nil {
			return fmt.Errorf("failed to connect to peer %s: %w", info.ID.ShortString(), err)
		}
	}

	return nil
}

func (s *P2PService) HostID() peer.ID {
	return s.host.ID()
}

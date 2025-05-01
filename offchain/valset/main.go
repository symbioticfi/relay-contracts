// cmd/gen-valset-header/main.go
package main

import (
	"context"
	"encoding/json"
	"flag"
	"log"
	"os"
	"time"

	"offchain-middleware/eth"          // your concrete eth client impl
	"offchain-middleware/valset"       // the package that contains ValsetGenerator
)

func main() {
	//----------------------------------------------------------------------
	// 1. CLI flags – keep only what you really need
	//----------------------------------------------------------------------
	rpcURL   := flag.String("rpc",   "http://localhost:8545", "Ethereum RPC URL")
	network  := flag.Uint64("nid",   1,                       "Chain ID / network ID")
	flag.Parse()

	//----------------------------------------------------------------------
	// 2. Wire concrete dependencies
	//----------------------------------------------------------------------
	ctx, cancel := context.WithTimeout(context.Background(), 15*time.Second)
	defer cancel()

	ethClient, err := eth.Dial(*rpcURL, *network) // <- your own constructor
	if err != nil {
		log.Fatalf("dial eth client: %v", err)
	}

	deriver, err := valset.NewValsetDeriver(ethClient) // <- your own constructor
	if err != nil {
		log.Fatalf("create deriver: %v", err)
	}

	gen, _ := valset.NewValsetGenerator(deriver, ethClient)

	//----------------------------------------------------------------------
	// 3. Generate the header and dump it as JSON
	//----------------------------------------------------------------------
	header, err := gen.GenerateValidatorSetHeader(ctx)
	if err != nil {
		log.Fatalf("generate header: %v", err)
	}

	enc := json.NewEncoder(os.Stdout)
	enc.SetIndent("", "  ")
	_ = enc.Encode(header)
}

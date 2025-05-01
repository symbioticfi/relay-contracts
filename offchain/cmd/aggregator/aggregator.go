package aggregator

import (
	"offchain-middleware/aggregation"
	"offchain-middleware/storage"
)

type AggregatorClient struct {
	aggregation *aggregation.Aggregation
	storage     *storage.Storage
}

func NewAggregatorClient(aggregation *aggregation.Aggregation, storage *storage.Storage) *AggregatorClient {
	return &AggregatorClient{
		aggregation: aggregation,
		storage:     storage,
	}
}

func (a *AggregatorClient) Start() {
	// ctx, cancel := context.WithCancel(context.Background())
	// defer cancel()

	// // Start aggregation service
	// go func() {
	// 	for {
	// 		select {
	// 		case <-ctx.Done():
	// 			return
	// 		default:
	// 			if err := a.aggregation.AggregateSignatures(ctx); err != nil {
	// 				log.Printf("Error during aggregation: %v", err)
	// 			}
	// 			// Sleep to avoid constant aggregation attempts
	// 			// In a production environment, this would be triggered by events
	// 			// or run on a more sophisticated schedule
	// 		}
	// 	}
	// }()

	// // Wait for termination signal
	// sigCh := make(chan os.Signal, 1)
	// signal.Notify(sigCh, syscall.SIGINT, syscall.SIGTERM)
	// <-sigCh

	// log.Println("Shutting down aggregator service...")
}

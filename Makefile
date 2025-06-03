
build-docker:
	docker build -t symbiotic-tests .

up:
	docker run -d --rm \
		-p 8545:8545 \
		-p 8546:8546 \
		-v $(shell pwd)/.env:/app/.env \
		--name symbiotic-tests \
		symbiotic-tests yarn deploy:snapshot

down:
	docker stop symbiotic-tests

build-abi:
	docker run --rm \
		-v $(shell pwd)/out:/app/out \
		symbiotic-tests forge build --extra-output abi

eth-call-getCurrentPhase:
	cast call 0x63d855589514F1277527f4fD8D464836F8Ca73Ba "getCurrentPhase()" --rpc-url http://127.0.0.1:8545

abigen:
	go run github.com/ethereum/go-ethereum/cmd/abigen@latest \
		--abi Storage.abi \
		--pkg main \
		--type Storage \
		--out Storage.go

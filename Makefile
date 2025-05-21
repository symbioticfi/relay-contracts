
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
	cast call 0x04C89607413713Ec9775E14b954286519d836FEf "getCurrentPhase()" --rpc-url http://127.0.0.1:8545

abigen:
	go run github.com/ethereum/go-ethereum/cmd/abigen@latest \
		--abi Storage.abi \
		--pkg main \
		--type Storage \
		--out Storage.go

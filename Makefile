
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


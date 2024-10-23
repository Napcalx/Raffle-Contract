-include .env

.PHONY: all test deploy

build :; forge build

test :; forge test

install :; forge install Cyfrin/foundry-devops@0.2.2 --no-commit && forge install smartcontractkit/chainlink@42c74fcd30969bca26a9aadc07463d1c2f473b8c --no-commit && forge install foundry-rs/forge-std@v1.7.0 --no-commit && forge install transmissions11/solmate@v6 --no-commit

deploy-sepolia:; @forge script script/Raffle.s.sol --rpc-url $(SEPOLIA_RPC_URL) --account superKey --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvvv
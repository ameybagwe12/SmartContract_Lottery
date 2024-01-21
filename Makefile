-include .env

.PHONY: all test deploy

help: 
	@echo "Usage:"
	@echo "make deploy [ARGS=...]"

build:; forge build

test:; forge test

deploy:
	forge script script/DeployRaffle.s.sol:DeployRaffle $(NETWORK_ARGS)
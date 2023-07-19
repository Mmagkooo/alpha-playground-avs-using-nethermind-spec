############################# HELP MESSAGE #############################
# Make sure the help command stays first, so that it's printed by default when `make` is called without arguments
.PHONY: help
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

SHELL := /bin/bash

deploy-counter: ## 
	forge create Counter --rpc-url localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 | tee deployment_output.txt

read-counter: ## 
	@echo $(shell awk '/Deployed to:/ {print $$NF}' deployment_output.txt | xargs -I {} cast call {} "number()" --rpc-url localhost:8545)

increment-counter: ## 
	@echo $(shell awk '/Deployed to:/ {print $$NF}' deployment_output.txt | xargs -I {} cast send {} "increment()" --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80)


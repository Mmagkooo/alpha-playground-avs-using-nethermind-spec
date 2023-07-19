############################# HELP MESSAGE #############################
# Make sure the help command stays first, so that it's printed by default when `make` is called without arguments
.PHONY: help
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

reinstall: ## uninstall running instance, push new tag, reinstall (pull from repo)
	eigenlayer uninstall alpha-playground-avs-using-nethermind-spec.git-default
	git tag --delete v0.0.1
	git tag v0.0.1
	git push --delete origin v0.0.1
	git push origin --tags
	eigenlayer install https://github.com/Layr-Labs/alpha-playground-avs-using-nethermind-spec.git -v v0.0.1

run-plugin: ## 
	eigenlayer plugin alpha-playground-avs-using-nethermind-spec.git-default
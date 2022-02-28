# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

nginx-up: ## Start nginx docker-compose environment
	docker-compose -f nginx-compose.yaml up

nginx-down: ## Stop nginx docker-compose environment
	docker-compose -f nginx-compose.yaml down


envoy-up: ## Start envoy docker-compose environment
	docker-compose -f envoy-compose.yaml up

envoy-down: ## Stop envoy docker-compose environment
	docker-compose -f envoy-compose.yaml down

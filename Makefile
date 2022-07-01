IMAGE ?= v1v1v/github-action-to-otlp
VERSION ?= v2

.PHONY: help
.DEFAULT_GOAL := help

help: ## Display this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build docker image
	@docker build --file Dockerfile.build --tag=$(IMAGE):$(VERSION) .

publish: build ## Publish docker image
	@docker push "$(IMAGE):$(VERSION)"

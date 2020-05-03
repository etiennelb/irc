.PHONY: help
.DEFAULT_GOAL := help

help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

print-%: ; @echo $*=$($*)

up: ## démarre la stack
	docker-compose up -d

weechat: ## attache weechat
	docker attach weechat

znc-init: ## initialise la conf ZNC si inexistante
	docker run -it -v ~/.config/znc:/znc-data znc --makeconf
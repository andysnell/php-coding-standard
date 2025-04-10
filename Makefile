SHELL := bash
.DEFAULT_GOAL := vendor

build:
	docker pull composer:latest
	mkdir --parents build

vendor: build
	docker run --rm --interactive --tty \
		--user $(shell id -u):$(shell id -g) \
		--volume $(shell pwd):/app \
		composer:latest install

bash: build
	docker run --rm --interactive --tty \
		--user $(shell id -u):$(shell id -g) \
		--volume $(shell pwd):/app \
		composer:latest bash

.PHONY: clean
clean:
	rm -rf ./build ./vendor




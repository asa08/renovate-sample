ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SCRIPTS = $(ROOT)/scripts

.PHONY: setup xcodegen lint gen

gen: xcodegen
	bundle exec pod install

setup:
	$(SCRIPTS)/setup.sh

mint:
	mint bootstrap

xcodegen:
	mint run xcodegen \
		--spec $(ROOT)/project.yml

lint:
	mint run swiftlint

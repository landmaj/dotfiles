.PHONY: bootstrap build update-brew update-flake update

bootstrap:
	nix run nix-darwin -- switch --flake .

build:
	darwin-rebuild switch --flake .

BREW = /usr/local/bin/brew
ifeq ($(shell uname -m),arm64)
	BREW = /opt/homebrew/bin/brew
endif

update-brew:
	$(BREW) update && $(BREW) upgrade && $(BREW) cleanup --prune=all

update-flake:
	nix flake update

update: update-flake build update-brew

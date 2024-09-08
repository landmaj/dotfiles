.PHONY: bootstrap build update-brew update-flake update

bootstrap:
	nix run nix-darwin -- switch --flake .

build:
	darwin-rebuild switch --flake .

update-brew:
	brew update && brew upgrade

update-flake:
	nix flake update

update: update-flake build update-brew

cleanup:
	nix-collect-garbage && brew cleanup --prune=all

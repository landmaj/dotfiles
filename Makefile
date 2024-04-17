bootstrap:
	nix run nix-darwin -- switch --flake .

update:
	darwin-rebuild switch --flake .
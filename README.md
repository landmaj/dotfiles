# Dotfiles

## Install Nix

[The Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

## Bootstrap

### Darwin/Linux

```sh
nix run nix-darwin -- switch --flake .
```

## Update

### Darwin/Linux

```sh
darwin-rebuild switch --flake .
```

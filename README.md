# Dotfiles

## Bootstrap

### macOS

#### Install Nix

[The Determinate Nix Installer](https://determinate.systems/oss/)

#### Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Clone this repo

```sh
mkdir ~/GitHub/ && cd ~/GitHub
https://github.com/landmaj/dotfiles.git
```

#### Run Nix

```sh
nix run nix-darwin -- switch --flake .
```

## Update

### macOS

```sh
darwin-rebuild switch --flake .
```

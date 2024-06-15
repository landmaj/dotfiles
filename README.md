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

#### Change hostname

In System Settings change hostname to one of the specified in
`flake.nix` file.

#### Run Nix

```sh
nix run nix-darwin -- switch --flake .
```

## Update

### macOS

```sh
darwin-rebuild switch --flake .
```

## After installation

### macOS

- Remove everything from Dock: `defaults write "com.apple.dock" "persistent-apps" -array
killall Dock`.
- Open `Afterglow.terminal` file and set it as default profile.
- Enable browser integration, ssh agent, minimize instead of exit and minimize
  to system tray in KeePassXC.
- Install Firefox extensions: KeePassXC-Browser, uBlock Origin, SponsorBlock.
- Disable password saving in Firefox.
- Open and configure Mos.
- Open and configure Monitor Control.
- Open and configure Proxy Audio Device.
- Install printer/scanner drivers.
- Setup backup script using Platypus.

#### System Settings

- Default browser
- Spotlight
- Store in iCloud
- Disable emoji key

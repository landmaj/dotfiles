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
- Terminal:
  - Install theme by opening `Afterglow.terminal` file and setting it as default profile.
  - Change font to JetBrainsMono Nerd Font Regular 12pt.
- KeePassXC:
  - browser integration
  - ssh agent
  - minimize instead of exit
  - minimize to system tray
- Firefox:
  - KeePassXC-Browser, uBlock Origin, SponsorBlock, Kill Sticky
  - disable password saving
  - disable picture-in-picture
- Open and configure Mos.
- Open and configure Monitor Control.
- Open and configure Proxy Audio Device.
- Install printer/scanner drivers.
- Setup backup script using Platypus.
- Install [Stillcolor](https://github.com/aiaf/Stillcolor)

#### System Settings

- Change default browser to Firefox.
- Select Spotlight search results.
- Enable storing Documents and Desktop in iCloud.
- Keyboard:
  - disable 🌐 key
  - turn backlight off after 10 seconds
- Mouse:
  - disable pointer acceleration
- Enable window tiling

#!/bin/zsh -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}"/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install \
  ansible \
  bat \
  coreutils \
  direnv \
  exa \
  kubectl \
  pipx \
  pre-commit \
  tldr \
  ;

brew install \
  --cask android-file-transfer \
  --cask autodesk-fusion360 \
  --cask docker \
  --cask firefox \
  --cask gog-galaxy \
  --cask goland \
  --cask insomnia \
  --cask jettison \
  --cask karabiner-elements \
  --cask keepassxc \
  --cask messenger \
  --cask obsidian \
  --cask prusaslicer \
  --cask pycharm \
  --cask raspberry-pi-imager \
  --cask slack \
  --cask spotify \
  --cask steam \
  --cask switchresx \
  --cask transmission \
  ;


# PROGRAMMING LANGUAGES
brew install \
  go@1.16 \
  python@3.9 \
  ;

brew install syncthing
brew services start syncthing

brew install autojump
echo "[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh" >>"${HOME}"/.zshrc
echo "" >> "${HOME}"/.zshrc

brew install pure
echo "autoload -U promptinit; promptinit" >>"${HOME}"/.zshrc
echo "prompt pure" >>"${HOME}"/.zshrc
echo "" >> "${HOME}"/.zshrc


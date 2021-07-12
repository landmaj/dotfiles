#!/bin/zsh -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}"/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# CLI
brew install \
  ansible \
  bat \
  coreutils \
  direnv \
  docker \
  exa \
  kubectl \
  pipx \
  pre-commit \
  tldr \
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


# PROGRAMMING
brew install \
  go@1.16 \
  python@3.8 \
  python@3.9 \
  ;

# GUI
brew install \
  --cask autodesk-fusion360 \
  --cask firefox \
  --cask gog-galaxy \
  --cask goland \
  --cask insomnia \
  --cask karabiner-elements \
  --cask keepassxc \
  --cask messenger \
  --cask prusaslicer \
  --cask pycharm \
  --cask slack \
  --cask spotify \
  --cask steam \
  --cask switchresx \
  --cask transmission \
  ;

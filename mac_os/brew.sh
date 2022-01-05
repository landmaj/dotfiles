#!/bin/zsh -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}"/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install \
  autojump \
  bat \
  coreutils \
  direnv \
  git-crypt \
  gitup \ 
  pipx \
  pre-commit \
  pure \
  tldr \
  wget
  zsh-completions \
  ;

brew install \
  --cask autodesk-fusion360 \
  --cask datagrip \
  --cask elmedia-player \
  --cask firefox \
  --cask goland \
  --cask insomnia \
  --cask jettison \
  --cask karabiner-elements \
  --cask keepassxc \
  --cask messenger \
  --cask monitorcontrol \
  --cask obsidian \
  --cask prusaslicer \
  --cask pycharm \
  --cask qnapi \
  --cask raspberry-pi-imager \
  --cask spotify \
  --cask switchresx \
  --cask transmission \
  --cask utm \
  ;


# PROGRAMMING LANGUAGES
brew install \
  go \
  python@3.9 \
  ;

brew install syncthing
brew services start syncthing


#!/bin/zsh -e

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}"/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"

brew install \
  autojump \
  bat \
  coreutils \
  direnv \
  exercism \
  git-crypt \
  gitup \
  graphviz \
  pipx \
  poetry \
  pre-commit \
  pure \
  tldr \
  vdirsyncer \
  wget \
  zsh-completions \
  ;

poetry config virtualenvs.in-project true

brew install syncthing && brew services start syncthing

brew install \
  elixir \
  go \
  python@3 \
  ;

brew install --cask \
  homebrew/cask-drivers/steelseries-exactmouse-tool \
  ;

brew install \
  font-jetbrains-mono \
  ;

brew install --cask \
  autodesk-fusion360 \
  elmedia-player \
  firefox \
  insomnia \
  jettison \
  karabiner-elements \
  keepassxc \
  messenger \
  monitorcontrol \
  obsidian \
  postgres-unofficial \
  prusaslicer \
  qnapi \
  raspberry-pi-imager \
  rectangle-pro \
  spotify \
  switchresx \
  temurin \
  transmission \
  utm \
  visual-studio-code \
  ;
#!/bin/zsh -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}"/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install \
  autojump \
  bat \
  buildkit \
  coreutils \
  direnv \
  exercism \
  git-crypt \
  gitbackup \
  gitup \
  graphviz \
  pre-commit \
  pure \
  restic \
  tldr \
  vdirsyncer \
  wget \
  zsh-completions \
  ;

brew install syncthing && brew services start syncthing

brew install \
  elixir \
  go \
  python@3 \
  ;

brew install homebrew/cask-fonts/font-jetbrains-mono

brew install --cask \
  elmedia-player \
  firefox \
  insomnia \
  karabiner-elements \
  keepassxc \
  linearmouse \
  messenger \
  monitorcontrol \
  mos \
  obsidian \
  orbstack \
  postgres-unofficial \
  prusaslicer \
  qnapi \
  rectangle-pro \
  spotify \
  transmission \
  visual-studio-code \
  ;

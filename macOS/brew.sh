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

brew install docker docker-buildx
mkdir -p "${HOME}"/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-buildx/bin/docker-buildx "${HOME}"/.docker/cli-plugins/docker-buildx

brew install poetry
poetry config virtualenvs.in-project true

brew install syncthing && brew services start syncthing

brew install \
  elixir \
  go \
  python@3 \
  ruby \
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
  postgres-unofficial \
  prusaslicer \
  qnapi \
  rectangle-pro \
  spotify \
  temurin \
  transmission \
  utm \
  visual-studio-code \
  ;

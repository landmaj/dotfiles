#!/bin/zsh -e

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}"/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"

brew install \
  autojump \
  bat \
  buildkit \
  coreutils \
  direnv \
  docker \
  exercism \
  git-crypt \
  gitup \
  graphviz \
  grpcui \
  poetry \
  pre-commit \
  protobuf \
  protoc-gen-go \
  protoc-gen-go-grpc \
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

brew install \
  font-jetbrains-mono \
  ;

brew install --cask \
  elmedia-player \
  firefox \
  insomnia \
  jettison \
  karabiner-elements \
  keepassxc \
  messenger \
  monitorcontrol \
  mos \
  obsidian \
  postgres-unofficial \
  prusaslicer \
  qnapi \
  rancher \
  rectangle-pro \
  spotify \
  switchresx \
  temurin \
  transmission \
  utm \
  visual-studio-code \
  unnaturalscrollwheels \
  ;

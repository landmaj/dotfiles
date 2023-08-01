#!/bin/zsh -e

cwd=$(pwd)

defaults write -g ApplePressAndHoldEnabled -bool false

cp -r "${cwd}"/bin "${HOME}"/

cp "${cwd}"/miscellaneous/.zshrc "${HOME}"/

mkdir -p "${HOME}"/.config/karabiner
cp "${cwd}"/miscellaneous/karabiner.json "${HOME}"/.config/karabiner.json

cp "${cwd}"/miscellaneous/.gitconfig "${HOME}"/
cp "${cwd}"/miscellaneous/.gitignore "${HOME}"/
cp "${cwd}"/miscellaneous/.vimrc "${HOME}"/
cp "${cwd}"/miscellaneous/.ideavimrc "${HOME}"/


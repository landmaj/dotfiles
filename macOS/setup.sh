#!/bin/zsh -e

cwd=$(pwd)

defaults write -g ApplePressAndHoldEnabled -bool false

cp -r "${cwd}"/bin "${HOME}"/

cp "${cwd}"/miscellaneous/.zshrc "${HOME}"/

mkdir -p "${HOME}"/.config/karabiner
cp "${cwd}"/miscellaneous/karabiner.json "${HOME}"/.config/karabiner.json

cp "${cwd}"/miscellaneous/.gitignore "${HOME}"/
git config --global core.excludesfile ~/.gitignore
git config --global pull.ff only

cp "${cwd}"/miscellaneous/.vimrc "${HOME}"/
cp "${cwd}"/miscellaneous/.ideavimrc "${HOME}"/

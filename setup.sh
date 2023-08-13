#!/bin/zsh -e

cwd=$(pwd)

defaults write -g ApplePressAndHoldEnabled -bool false

cp -r "${cwd}"/bin "${HOME}"/

mkdir -p "${HOME}"/.config/karabiner
cp "${cwd}"/miscellaneous/karabiner.json "${HOME}"/.config/karabiner.json

cp "${cwd}"/miscellaneous/.zshrc "${HOME}"/
cp "${cwd}"/miscellaneous/.gitconfig "${HOME}"/
cp "${cwd}"/miscellaneous/.gitignore "${HOME}"/

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}"/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle

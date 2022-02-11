#!/bin/zsh -e

cwd=$(pwd)

cp -r "${cwd}"/bin "${HOME}"/

cp "${cwd}"/miscellaneous/.zshrc "${HOME}"/

cp "${cwd}"/miscellaneous/.gitignore "${HOME}"/
git config --global core.excludesfile ~/.gitignore
git config --global pull.ff only

cp "${cwd}"/miscellaneous/.vimrc "${HOME}"/
cp "${cwd}"/miscellaneous/.ideavimrc "${HOME}"/

#!/bin/zsh -e

cwd=$(pwd)

cp "${cwd}"/miscellaneous/.vimrc "${HOME}"/
cp "${cwd}"/miscellaneous/.ideavimrc "${HOME}"/

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c VundleUpdate -c quitall

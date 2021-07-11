#!/bin/zsh -e

cwd=$(pwd)

cp -r "${cwd}"/bin "${HOME}"/
echo "alias venv=\"source ~/bin/venv\"" >> "${HOME}"/.zshrc
echo "alias ee=\"exa -lagH\"" >> "${HOME}"/.zshrc
echo "" >> "${HOME}"/.zshrc

echo "eval \"$(direnv hook zsh)\"" >> "${HOME}/.zshrc
echo "" >> "${HOME}"/.zshrc

cp "${cwd}"/miscellaneous/.gitignore "${HOME}"/
git config --global core.excludesfile ~/.gitignore


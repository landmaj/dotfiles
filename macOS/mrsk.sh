#!/bin/zsh -e

gem install --bindir ~/bin/ mrsk
echo 'alias mrsk="~/bin/mrsk"' >> "${HOME}"/.zshrc

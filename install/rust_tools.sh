#!/bin/bash -e

# Alacritty (terminal emulator)
wget -O /tmp/alacritty.deb https://github.com/jwilm/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-ubuntu_18_04_amd64.deb && sudo dpkg -i /tmp/alacritty.deb

# bat (cat replacement)
wget -O /tmp/bat.deb https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && sudo dpkg -i /tmp/bat.deb

# fd (find replacement)
wget -O /tmp/fd.deb https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb && sudo dpkg -i /tmp/fd.deb

# exa (ls replacement)
wget -O /tmp/exa.zip https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip && unzip /tmp/exa.zip && sudo mv exa-linux-x86_64 /usr/local/bin/exa
echo "alias ee=\"exa -lagH\"" >> "${HOME}"/.bashrc

#!/usr/bin/env bash

cwd=$(pwd)

# SUDO WITHOUT PASSWORD
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${USER}

# BASIC i3
sudo apt install -y i3-wm i3blocks rofi compton

# CONFIG FILES
cp -r ./.config ${HOME}/

# SCRIPTS
cp -r ./bin ${HOME}/

# i3blocks
cd /tmp
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb
sudo dpkg -i playerctl*.deb
cd ${cwd}
cp -r ./.local ${HOME}/

# FONTS
cp -r .fonts ${HOME}/

# BACKLIGHT
sudo cp ./xorg.conf /etc/X11/xorg.conf

# GIT CONFIG
git config --global url."git@github.com:".insteadOf "https://github.com/"

# ALIASES
echo "" >> ${HOME}/.bashrc
echo "alias vifm=\"source ~/bin/vf" >> $(HOME)/.bashrc
echo "alias venv=\"source ~/bin/venv\"" >> ${HOME}/.bashrc
echo "alias ee=\"exa -lagH\"" >> ${HOME}/.bashrc

# AUTOJUMP
echo ". /usr/share/autojump/autojump.sh" >> ${HOME}/.bashrc

# KEEPASSXC PPA
sudo add-apt-repository ppa:phoerious/keepassxc

# BASIC APPLICATIONS
sudo apt install -y \
    xbacklight \
    xss-lock \
    feh \
    ntp \
    policykit-desktop-privileges \
    policykit-1-gnome \
    arandr \
    gparted \
    fonts-font-awesome \
    tlp \
    syncthing \
    libreoffice \
    keepassxc \
    redshift \
    gimp \
    transmission \
    vlc \
    pgcli \
    vifm \
    fuse-zip \
    archivemount \
    sshfs \
    chromium-browser \
    curl \
    build-essential \
    python3-dev \
    cmake \
    clang \
    xclip \
    pinta \
    exuberant-ctags \
    fonts-powerline \
    htop \
    ncdu \
    blueman \
    pavucontrol \
    autojump

# PIPX
curl https://raw.githubusercontent.com/pipxproject/pipx-bootstrap/master/pipxbootstrap/main.py | python3

${HOME}/.local/bin/pipx install flake8
${HOME}/.local/bin/pipx install ansible
${HOME}/.local/bin/pipx install gitup
${HOME}/.local/bin/pipx install pre-commit
${HOME}/.local/bin/pipx install tldr

# VIM
cp ./.vimrc ${HOME}/
cp ./.ideavimrc ${HOME}/
sudo apt install -y vim-gtk
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c VundleUpdate -c quitall
python3 i~/.vim/bundle/YouCompleteMe/install.py --clang-completer
# fix for powerline
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# ALACRITTY
cd /tmp
wget https://github.com/jwilm/alacritty/releases/download/v0.3.2/Alacritty-v0.3.2-ubuntu_18_04_amd64.deb
sudo dpkg -i Alacritty-*.deb
cd ${cwd}

# BAT
cd /tmp
wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb
sudo dpkg -i bat_*.deb
cd ${cwd}

# EXA
cd /tmp
wget -O exa.zip https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa

# FIX BROKEN BLUETOOTH (bluez 5.48 is bugged)
sudo add-apt-repository ppa:bluetooth/bluez
sudo apt update
sudo apt upgrade -y

# SNAPS
sudo snap install pycharm-professional --classic
sudo snap install vscode --classic
sudo snap install insomnia
sudo snap install spotify
sudo snap install discord

# DOCKER
sudo addgroup --system docker
sudo adduser ${USER} docker
sudo snap install docker --classic

# PYTHON
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.5 python3.5-dev python3.7-dev

# ELM
sudo apt install -y npm
sudo npm install -g elm elm-format elm-test
ln -s /lib/terminfo ~/.terminfo # fix Ctrl + L in REPL

# GO
sudo snap install go --classic
echo "export PATH=\"\${HOME}/go/bin:\$PATH\"" >> ${HOME}/.bashrc
sudo snap install golang --classic
go get -u golang.org/x/lint/golint
go get -u github.com/motemen/gore/cmd/gore


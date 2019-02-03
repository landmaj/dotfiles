#!/usr/bin/env bash

cwd=$(pwd)

# SUDO WITHOUT PASSWORD
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${USER}

# BASIC i3
sudo apt install -y i3-wm i3blocks rofi compton
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks

# CONFIG FILES
cp -r ./.config ${HOME}/

# SCRIPTS
cp -r ./bin ${HOME}/

# i3blocks
cd /tmp
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb
sudo dpkg -i playerctl*.deb
cd ${cwd}
cp -r ./local ${HOME}/

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
    fonts-font-fontawesome \
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
    pavucontrol

# SUBLIME
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

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
wget https://github.com/jwilm/alacritty/releases/download/v0.2.7/Alacritty-v0.2.7_amd64.deb
sudo dpkg -i Alacritty-*.deb
cd ${cwd}

# BAT
cd /tmp
wget https://github.com/sharkdp/bat/releases/download/v0.9.0/bat_0.9.0_amd64.deb
sudo dpkg -i bat_*.deb
cd ${cwd}

# FIX BROKEN BLUETOOTH (bluez 5.48 is bugged)
sudo add-apt-repository ppa:bluetooth/bluez
sudo apt update
sudo apt upgrade -y

# SNAPS
sudo snap install pycharm-professional --classic
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


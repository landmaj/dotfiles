#!/usr/bin/env bash

# SUDO WITHOUT PASSWORD
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${USER}

# UNWANTED PACKAGES
sudo apt remove -y \
    plank \
    atril \
    onboard \
    onboard-common \
    orca \
    xzoom
sudo rm -rf /usr/share/applications/screensavers
sudo snap remove ubuntu-mate-welcome
sudo snap remove software-boutique

# BASIC i3
sudo apt install -y i3-wm rofi

# GSETTINGS
gsettings set org.mate.mate-menu hot-key ''
gsettings set com.solus-project.brisk-menu hot-key ''
gsettings set org.mate.power-manager kbd-backlight-battery-reduce false
gsettings set org.mate.power-manager idle-dim-battery false
gsettings set org.mate.background show-desktop-icons false
gsettings set org.mate.power-manager backlight-battery-reduce false
gsettings set org.mate.session required-components-list "['windowmanager', 'panel']"
gsettings set org.mate.session.required-components windowmanager 'i3'

# AUTOSTART
cp -r ./autostart ${HOME}/.config/

# CONFIG FILES
cp -r ./.config ${HOME}/

# SCRIPTS
cp -r ./bin ${HOME}/

# FONTS
cp -r .fonts ${HOME}/

# ALIASES
echo "" >> ${HOME}/.bashrc
echo "alias vifm=\"source ~/bin/vf"
echo "alias venv=\"source ~/bin/venv\"" >> ${HOME}/.bashrc


# BASIC APPLICATIONS
sudo apt install -y \
    ntp \
    dconf-editor \
    arandr \
    gparted \
    tlp \
    syncthing \
    libreoffice \
    keepassxc \
    redshift \
    redshift-gtk \
    gimp \
    transmission \
    vlc \
    pgcli \
    vifm \
    calibre \
    fuse-zip \
    archivemount \
    sshfs \
    chromium-browser \
    curl

# SUBLIME
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-merge sublime-text

# PIPSI
sudo apt install -y python3-venv
cd /tmp
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python3 - --src=git+https://github.com/mitsuhiko/pipsi.git\#egg=pipsi
echo 'export PATH="${HOME}/.local/bin:$PATH"' >> ${HOME}/.bashrc

${HOME}/.local/bin/pipsi install flake8
${HOME}/.local/bin/pipsi install ansible
${HOME}/.local/bin/pipsi install pi3-switch
${HOME}/.local/bin/pipsi install gitup

# THEFUCK
sudo apt install -y thefuck
echo "eval \$(thefuck --alias)" >> ${HOME}/.bashrc

# VIM
sudo apt install -y vim-gtk
git clone --depth=1 https://github.com/amix/vimrc.git ${HOME}/.vim_runtime
bash  ${HOME}/.vim_runtime/install_awesome_vimrc.sh
echo 'augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END' >> ${HOME}/.vimrc

# DOCKER
sudo addgroup --system docker
sudo adduser ${USER} docker

# FIX BROKEN BLUETOOTH (bluez 5.48 is bugged)
sudo add-apt-repository ppa:bluetooth/bluez
sudo apt update
sudo apt upgrade -y

# GIT CONFIG
git config --global credential.helper cache

# SNAPS
sudo snap install insomnia
sudo snap install docker --classic
sudo snap install pycharm-professional --classic
sudo snap install goland --classic
sudo snap install spotify

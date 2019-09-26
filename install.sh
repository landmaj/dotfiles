#!/bin/bash -e

cwd=$(pwd)

# sudo without password
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"${USER}"

# required for later commands
sudo apt install -y curl wget

# config files, etc
cp -r "${cwd}"/.local "${HOME}"/
cp -r "${cwd}"/.config "${HOME}"/
cp -r "${cwd}"/bin "${HOME}"/
cp -r "${cwd}"/.fonts "${HOME}"/

# external repositories
sudo add-apt-repository ppa:phoerious/keepassxc
sudo add-apt-repository ppa:bluetooth/bluez  # fix for broken bluetooth in Ubuntu 18.04
sudo add-apt-repository ppa:deadsnakes/ppa
# syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt update
sudo apt install -y \
  arandr \
  archivemount \
  autojump \
  blueman \
  build-essential \
  compton \
  dunst \
  feh \
  fonts-font-awesome \
  fonts-powerline \
  fuse-zip \
  gimp \
  gparted \
  htop \
  i3-wm \
  i3blocks \
  i3lock \
  keepassxc \
  libreoffice \
  ncdu \
  ntp \
  pavucontrol \
  pgcli \
  pinta \
  policykit-1-gnome \
  policykit-desktop-privileges \
  redshift \
  rofi \
  sshfs \
  syncthing \
  tlp \
  transmission \
  vifm \
  vim-gtk \
  vlc \
  xbacklight \
  xclip \
  xss-lock

sudo apt install -y \
  python3.6-dev \
  python3.6-venv \
  python3.6-pip \
  python3.7-dev \
  python3.7-venv

# pipx
python3 -m pip install --user pipx
python3 -m pipx ensurepath
"${HOME}"/.local/bin/pipx install flake8
"${HOME}"/.local/bin/pipx install ansible
"${HOME}"/.local/bin/pipx install gitup
"${HOME}"/.local/bin/pipx install pre-commit
"${HOME}"/.local/bin/pipx install tldr

# miscellaneous
echo ". /usr/share/autojump/autojump.sh" >> "${HOME}"/.bashrc  # required by autojump
cp "${cwd}"/.Xresources "${HOME}"/  # fix cursor and font size
# currently playing song on status bar
wget -O /tmp/playerctl.deb https://github.com/altdesktop/playerctl/releases/download/v2.0.2/playerctl-2.0.2_amd64.deb && sudo dpkg -i /tmp/playerctl.deb
wget -O /tmp/alacritty.deb https://github.com/jwilm/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-ubuntu_18_04_amd64.deb && sudo dpkg -i /tmp/alacritty.deb
wget -O /tmp/bat.deb https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && sudo dpkg -i /tmp/bat.deb
wget -O /tmp/exa.zip https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip && unzip /tmp/exa.zip && sudo mv exa-linux-x86_64 /usr/local/bin/exa

# bash aliases
echo "" >> "${HOME}"/.bashrc
echo "alias vifm=\"source ~/bin/vf" >> "${HOME}"/.bashrc
echo "alias venv=\"source ~/bin/venv\"" >> "${HOME}"/.bashrc
echo "alias ee=\"exa -lagH\"" >> "${HOME}"/.bashrc

# vim
cp ./.vimrc ${HOME}/
cp ./.ideavimrc ${HOME}/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c VundleUpdate -c quitall
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p  # fix for powerline

# snaps
sudo snap install insomnia
sudo snap install spotify
sudo snap install code --classic
sudo snap install pycharm-professional --classic
sudo snap install go --classic
sudo snap install goland --classic
sudo snap install slack --classic

# docker
sudo addgroup --system docker
sudo adduser "${USER}" docker
sudo snap install docker --classic

#!/bin/bash -e

cwd=$(pwd)

# sudo without password
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"${USER}"

# config files, etc
cp -r "${cwd}"/.local "${HOME}"/
cp -r "${cwd}"/.config "${HOME}"/
cp -r "${cwd}"/bin "${HOME}"/
cp -r "${cwd}"/.fonts "${HOME}"/
cp "${cwd}"/miscellaneous/.Xresources "${HOME}"/  # fix cursor and font size
cp "${cwd}"/miscellaneous/10-bluetooth.conf /etc/tlp.d/

# git configuration
cp "${cwd}"/miscellaneous/.gitignore "${HOME}"/
git config --global core.excludesfile ~/.gitignore
git config --global --add url."git@github.com:".insteadOf "https://github.com/"

# bash aliases
echo "alias vifm=\"source ~/bin/vf\"" >> "${HOME}"/.bashrc
echo "alias venv=\"source ~/bin/venv\"" >> "${HOME}"/.bashrc

# required for my i3wm config
wget -O /tmp/light.deb https://github.com/haikarainen/light/releases/download/v1.2/light_1.2_amd64.deb && sudo dpkg -i /tmp/light.deb  # backlight
wget -O /tmp/playerctl.deb https://github.com/altdesktop/playerctl/releases/download/v2.0.2/playerctl-2.0.2_amd64.deb && sudo dpkg -i /tmp/playerctl.deb  # i3blocks

sudo apt install -y \
  alacritty \
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
  gnome-calculator \
  gnome-system-monitor \
  gparted \
  htop \
  i3-wm \
  i3blocks \
  i3lock \
  imagemagick \
  keepassxc \
  libpq-dev \
  libreoffice \
  lutris \
  ncdu \
  ntp \
  pavucontrol \
  pgcli \
  pinta \
  policykit-1-gnome \
  policykit-desktop-privileges \
  python3-dev \
  python3-pip \
  python3-venv \
  redshift \
  restic \
  rofi \
  spotify-client \
  sshfs \
  tlp \
  transmission \
  vifm \
  vlc \
  xclip \
  xfce4-power-manager \
  xss-lock

# JetBrains
curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
sudo apt update

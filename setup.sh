#!/bin/bash -e

cwd=$(pwd)

# config files, etc
cp -r "${cwd}"/.local "${HOME}"/
cp -r "${cwd}"/.config "${HOME}"/
cp -r "${cwd}"/bin "${HOME}"/
cp -r "${cwd}"/.fonts "${HOME}"/
cp "${cwd}"/miscellaneous/.Xresources "${HOME}"/  # fix cursor and font size

# git configuration
cp "${cwd}"/miscellaneous/.gitignore "${HOME}"/
git config --global core.excludesfile ~/.gitignore
git config --global --add url."git@github.com:".insteadOf "https://github.com/"

# bash aliases
echo "alias vifm=\"source ~/bin/vf\"" >> "${HOME}"/.bashrc
echo "alias venv=\"source ~/bin/venv\"" >> "${HOME}"/.bashrc

# external repositories
sudo add-apt-repository -y ppa:bluetooth/bluez  # fix for broken bluetooth in Ubuntu 18.04
sudo add-apt-repository -y ppa:paulo-miguel-dias/pkppa  # fix for HDMI on Matebook D14

# snap versions take forever to launch
sudo snap remove --purge gnome-calculator
sudo snap remove --purge gnome-system-monitor

# required for my i3wm config
wget -O /tmp/light.deb https://github.com/haikarainen/light/releases/download/v1.2/light_1.2_amd64.deb && sudo dpkg -i /tmp/light.deb  # backlight
wget -O /tmp/playerctl.deb https://github.com/altdesktop/playerctl/releases/download/v2.0.2/playerctl-2.0.2_amd64.deb && sudo dpkg -i /tmp/playerctl.deb  # i3blocks

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
  gnome-calculator \
  gnome-system-monitor \
  gparted \
  htop \
  i3-wm \
  i3blocks \
  i3lock \
  keepassxc \
  libpq-dev \
  libreoffice \
  ncdu \
  ntp \
  pavucontrol \
  pgcli \
  pinta \
  policykit-1-gnome \
  policykit-desktop-privileges \
  python3-dev \
  python3-venv \
  python3-pip \
  redshift \
  restic \
  rofi \
  sshfs \
  tlp \
  transmission \
  vifm \
  vlc \
  xclip \
  xss-lock

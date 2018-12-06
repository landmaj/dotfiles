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
    xzoom \
    xterm

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

# ANNOYING POPUPS
sudo systemctl disable apport.service

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
echo "alias vifm=\"source ~/bin/vf" >> $(HOME)/.bashrc
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
    curl \
    build-essential \
    python3-dev \
    cmake \
    clang \
    xclip \
    pinta \
    exuberant-ctags \
    fonts-powerline \
    htop

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

# ALACRITTY
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup override set stable
rustup update stable
mkdir ~/github
cd ~/github
git clone https://github.com/jwilm/alacritty
cd alacritty
sudo apt -y install libfreetype6-dev libfontconfig1-dev
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
sudo desktop-file-install alacritty.desktop
sudo update-desktop-database
echo "source $(pwd)/alacritty-completions.bash" >> ~/.bashrc

# EXA (requires Rust installed in previous step)
cd ~/github
git clone https://github.com/ogham/exa.git
cd exa
make install PREFIX=${HOME}
echo "alias ls=\"${HOME}/bin/exa\"" >> ${HOME}/.bashrc

# GOLANG
cd /tmp
wget -q https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x installer_linux
./installer_linux
echo "export PATH=${PATH}:/${HOME}/.go/bin" >> ${HOME}/.bashrc

# VIM
cp ./.vimrc ${HOME}/
cp ./.ideavimrc ${HOME}/
sudo apt install -y vim-gtk
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c VundleUpdate -c quitall
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --go-completer
# fix for powerline
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# DOCKER
sudo addgroup --system docker
sudo adduser ${USER} docker

# FIX BROKEN BLUETOOTH (bluez 5.48 is bugged)
sudo add-apt-repository ppa:bluetooth/bluez
sudo apt update
sudo apt upgrade -y

# KEYBOARD BACKLIGHT
sudo cp -f ./org.freedesktop.UPower.conf /etc/dbus-1/system.d/

# SNAPS
sudo snap install insomnia
sudo snap install docker --classic
sudo snap install pycharm-professional --classic
sudo snap install goland --classic
sudo snap install spotify

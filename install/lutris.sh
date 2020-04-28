# vim
cwd=$(pwd)

sudo add-apt-repository ppa:kisak/kisak-mesa
sudo dpkg --add-architecture i386
sudo apt install libgl1-mesa-glx:i386 libgl1-mesa-dri:i386
sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386
sudo apt install lutris

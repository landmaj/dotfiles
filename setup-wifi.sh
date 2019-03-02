cd /tmp
git clone https://github.com/abperiasamy/rtl8812AU_8821AU_linux.git
cd rtl8812AU_8821AU_linux
sudo make -f Makefile.dkms install
sudo modprobe rtl8812au

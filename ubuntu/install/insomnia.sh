#!/bin/bash -e

# Add the channel to your APT sources:
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Update and install:
sudo apt update && sudo apt install -y insomnia

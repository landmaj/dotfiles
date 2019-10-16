#!/bin/bash -e

# Add the release PGP keys:
curl -s https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -

# Add the channel to your APT sources:
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee /etc/apt/sources.list.d/insomnia.list

# Update and install:
sudo apt update && sudo apt install -y insomnia

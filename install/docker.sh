#!/bin/bash -e

# Add the release PGP keys:
curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the channel to your APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update and install:
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

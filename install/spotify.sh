#!/bin/bash -e

# Add the release PGP keys:
curl -s https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Update and install:
sudo apt update && sudo apt install -y spotify-client

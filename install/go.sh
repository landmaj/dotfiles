#!/bin/bash -e

sudo apt-get install -y golang-go

sudo apt install goland

# go version manager (gvm)
sudo apt install bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)


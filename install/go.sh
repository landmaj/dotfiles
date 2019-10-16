#!/bin/bash -e

sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get install -y golang-go

go get -u golang.org/x/tools/cmd/gopls

sudo snap install goland --classic

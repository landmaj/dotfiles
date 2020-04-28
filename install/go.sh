#!/bin/bash -e

sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get install -y golang-go

sudo snap install goland --classic

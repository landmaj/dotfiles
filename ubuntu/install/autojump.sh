#!/bin/bash -e

sudo apt install -y autojump
echo ". /usr/share/autojump/autojump.sh" >> "${HOME}"/.bashrc  # required by autojump

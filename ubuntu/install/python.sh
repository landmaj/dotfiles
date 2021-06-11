#!/bin/bash -e

sudo add-apt-repository -y ppa:deadsnakes/ppa

sudo apt install -y \
  python3.7-dev \
  python3.7-venv

sudo apt install -y \
  python3.8-dev \
  python3.8-venv

sudo apt install -y pycharm-professional

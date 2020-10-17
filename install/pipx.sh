#!/bin/bash -e

python3 -m pip install --user pipx
python3 -m pipx ensurepath

"${HOME}"/.local/bin/pipx install pre-commit
"${HOME}"/.local/bin/pipx install tldr
"${HOME}"/.local/bin/pipx install python-language-server

"${HOME}"/.local/bin/pipx install ansible
"${HOME}"/.local/bin/pipx install docker-compose


"${HOME}"/.local/bin/pipx install gitup
echo "alias up=\"gitup --prune ~/github/\"" >> "${HOME}"/.bashrc


[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

autoload -U promptinit; promptinit
prompt pure

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -u
fi

eval "$(direnv hook zsh)"

unsetopt NOMATCH

export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

export PATH=$HOME/go/bin:$PATH
export PATH=/opt/homebrew/opt/ruby/bin:$PATH

export HOMEBREW_BUNDLE_FILE=~/Documents/GitHub/dotfiles/Brewfile

alias venv="source ~/bin/venv"
alias ll="ls -lahF --color=always"

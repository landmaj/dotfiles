[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

autoload -U promptinit; promptinit
prompt pure

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -u
fi

eval "$(direnv hook zsh)"

unsetopt NOMATCH

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

export LDFLAGS="-L$(brew --prefix)/opt/openssl@1.1/lib"
export CPPFLAGS="-I$(brew --prefix)/opt/openssl@1.1/include"

export PATH=$HOME/go/bin:$PATH
export PATH=$(brew --prefix)/opt/ruby/bin:$PATH

export HOMEBREW_BUNDLE_FILE=~/Documents/GitHub/dotfiles/Brewfile

alias venv="source ~/bin/venv"
alias ll="ls -lahF --color=always"


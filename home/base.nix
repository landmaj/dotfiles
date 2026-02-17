{ pkgs, ... }:

{
  home = {
    # Check release notes for breaking changes when bumping this:
    # https://nix-community.github.io/home-manager/release-notes.xhtml
    stateVersion = "25.11";

    sessionPath = [
      "$HOME/.local/bin"
    ];

    packages = with pkgs; [
      atool
      bat
      cloc
      cloudflared
      dive
      git
      git-repo-updater
      graphviz
      httpie
      imagemagick
      iperf
      jq
      mitmproxy
      pv
      tio
      tldr
      vim
      wget
      # programming
      elixir
      go
      python3
      # ai
      claude-code
      claude-monitor
    ];

    file = {
      ".gitconfig".source = ../config/git/.gitconfig;
      ".config/git/.gitignore".source = ../config/git/.gitignore;

      ".vimrc".source = ../config/vim/.vimrc;
      ".ideavimrc".source = ../config/vim/.ideavimrc;

      ".config/karabiner/karabiner.json".source = ../config/karabiner/karabiner.json;
      ".config/ghostty/config".source = ../config/ghostty/config;
    };
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh.enable = true;

      sessionVariables = {
        LESS = "FRX";
      };

      shellAliases = {
        add = "git add";
        branch = "git branch";
        checkout = "git checkout";
        commit = "git commit";
        log = "git log --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'";
        pull = "git pull";
        push = "git push";
        status = "git status";
        amen = "git commit --amend --no-edit";

        j = "z";
        pip = "uv pip";
        ldd = "otool -L";
        tunnel = "cloudflared tunnel --url";

        mkshell = "nix flake init --template ~/GitHub/dotfiles#blank";
        mkgo = "nix flake init --template ~/GitHub/dotfiles#go";
        mkpython = "nix flake init --template ~/GitHub/dotfiles#python";
        mkelixir = "nix flake init --template ~/GitHub/dotfiles#elixir";
      };

      initContent = ''
        chpwd() eza --group-directories-first --icons=auto

        if [[ $(uname -m) == 'arm64' ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi

        [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
      '';
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        git_status.style = "bold yellow";
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      config = {
        warn_timeout = 0;
        hide_env_diff = true;
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
      ];
    };
  };
}

{ pkgs, ... }:

{
  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      atool
      bat
      d2
      git
      git-repo-updater
      graphviz
      httpie
      jq
      tldr
      vim
      wget
    ];

    file = {
      ".gitignore".source = ../config/git/.gitignore;
      ".vimrc".source = ../config/vim/.vimrc;
      ".ideavimrc".source = ../config/vim/.ideavimrc;
      ".config/karabiner/karabiner.json".source = ../config/karabiner/karabiner.json;
      "Library/Application Support/Rectangle Pro/RectangleProConfig.json".source = ../config/rectangle/RectangleProConfig.json;
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
        log = "git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
        pull = "git pull";
        push = "git push";
        status = "git status";

        j = "z";
        tree = "eza -T";
        pip = "uv pip";

        mkshell = "nix flake init --template ~/GitHub/dotfiles#blank";
        mkgo = "nix flake init --template ~/GitHub/dotfiles#go";
        mkpython = "nix flake init --template ~/GitHub/dotfiles#python";
      };

      initExtra = ''
        chpwd() eza --group-directories-first --icons=auto

        if [[ $(uname -m) == 'arm64' ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
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
      icons = true;
      extraOptions = [
        "--group-directories-first"
      ];
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };

  };
}

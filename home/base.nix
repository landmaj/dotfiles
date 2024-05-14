{ pkgs, ... }:

{
  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      bat
      d2
      git
      git-repo-updater
      httpie
      jq
      tldr
      vim
      websocat
      wget
    ];

    file = {
      ".gitignore".source = ../config/git/.gitignore;
      ".vimrc".source = ../config/vim/.vimrc;
      ".ideavimrc".source = ../config/vim/.ideavimrc;
      ".config/karabiner/karabiner.json".source = ../config/karabiner/karabiner.json;
    };

  };

  programs = {

    zsh = {
      enable = true;
      enableCompletion = true;
      oh-my-zsh.enable = true;

      shellAliases = {
        gs = "git status";
        ga = "git add *";
        gm = "git commit -m";
        log = "git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
        pull = "git pull";
        push = "git push";
        grc = "git rm -r --cached";

        j = "z";

        mkshell = "nix flake init --template ~/GitHub/dotfiles#blank";
        mkgo = "nix flake init --template ~/GitHub/dotfiles#go";
        mkpython = "nix flake init --template ~/GitHub/dotfiles#python";
      };
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

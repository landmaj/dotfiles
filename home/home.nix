{ pkgs, ... }:

{

  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      bat
      d2
      elixir
      git
      git-crypt
      git-repo-updater
      go
      httpie
      nil
      nodejs-slim
      python3
      restic
      tldr
      vdirsyncer
      vim
      wget
    ];

    file = {
      ".gitignore".source = ../config/git/.gitignore;
      ".gitconfig".source = ../config/git/.gitconfig;

      ".vimrc".source = ../config/vim/.vimrc;
      ".ideavimrc".source = ../config/vim/.ideavimrc;

      ".ssh/wielunski.net.pub".source = ../config/ssh/wielunski.net.pub;

      ".config/karabiner/karabiner.json".source = ../config/karabiner/karabiner.json;
    };

  };

  programs = {

    zsh = {
      enable = true;
      enableCompletion = true;
      oh-my-zsh.enable = true;

      shellAliases = {
        ll = "ls -lahF --color=always";
        gg = "git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";

        mkshell = "nix flake init --template ~/GitHub/dotfiles#blank";
        shell = "nix develop";
      };
    };

    starship = {
      enable = true;

      settings = {
        command_timeout = 100;
        format = "[$all](dimmed white)";

        character = {
          success_symbol = "[❯](dimmed green)";
          error_symbol = "[❯](dimmed red)";
        };

        git_status = {
          style = "bold yellow";
          format = "([$all_status$ahead_behind]($style) )";
        };

        jobs.disabled = true;
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    autojump = {
      enable = true;
    };

  };
}

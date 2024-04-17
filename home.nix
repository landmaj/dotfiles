{ config, pkgs, lib, ... }:

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
      python3
      restic
      tldr
      vdirsyncer
      vim
      wget
    ];

    file = {
      ".gitignore".source = ./config/git/.gitignore;
      ".gitconfig".source = ./config/git/.gitconfig;

      ".vimrc".source = ./config/vim/.vimrc;
      ".ideavimrc".source = ./config/vim/.ideavimrc;

      ".config/karabiner/karabiner.json".source = ./config/karabiner/karabiner.json;
    };

  };

  programs = {

    zsh = {
      enable = true;
      enableCompletion = true;
      oh-my-zsh.enable = true;

      shellAliases = {
        ll = "ls -lahF --color=always";
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

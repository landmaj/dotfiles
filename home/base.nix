{ pkgs, ... }:

{
  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      bat
      d2
      git
      git-repo-updater
      go
      httpie
      nil
      nodejs-slim
      restic
      tldr
      vdirsyncer
      vim
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
        gp = "git push";
        gg = "git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";

        j = "z";

        mkshell = "nix flake init --template ~/GitHub/dotfiles#blank";
        mkelixir = "nix flake init --template ~/GitHub/dotfiles#elixir";
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

  };
}

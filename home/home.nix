{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  home = {
    packages = with pkgs; [
      exercism
      nodejs-slim
      restic
      vdirsyncer
      yt-dlp
    ];

    file = {
      ".gitconfig".source = ../config/home/.gitconfig;
      ".ssh/key.pub".source = ../config/home/key.pub;
    };

  };

  programs = {
    zsh.shellAliases = {
      mkelixir = "nix flake init --template ~/GitHub/dotfiles#elixir";
    };
  };
}

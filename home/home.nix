{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  home = {
    file = {
      ".gitconfig".source = ../config/home/.gitconfig;
      ".ssh/key.pub".source = ../config/home/key.pub;
    };
  };
}

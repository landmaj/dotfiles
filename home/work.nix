{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  home = {
    file = {
      ".gitconfig".source = ../config/work/.gitconfig;
      ".ssh/key.pub".source = ../config/work/key.pub;
    };
  };
}

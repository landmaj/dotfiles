{ ... }:

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

  programs = {
    zsh.shellAliases = {
      http = "http --verify=no";
    };
  };
}

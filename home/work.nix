{ ... }:

{
  imports = [
    ./base.nix
  ];

  home = {
    file = {
      ".ssh/key.pub".source = ../config/ssh/work.pub;
    };
  };

  programs = {
    zsh.shellAliases = {
      http = "http --verify=no";
    };
  };
}

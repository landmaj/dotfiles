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
}

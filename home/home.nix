{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  home = {
    packages = with pkgs; [
      f3
      restic
      vdirsyncer
      yt-dlp
    ];

    file = {
      ".gitconfig".source = ../config/home/.gitconfig;
      ".ssh/key.pub".source = ../config/home/key.pub;
      "Library/Services/Display [native].workflow".source = ../config/Automator/display_native.workflow;
      "Library/Services/Display [scaled].workflow".source = ../config/Automator/display_scaled.workflow;
    };
  };
}

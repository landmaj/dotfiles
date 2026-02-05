{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  home = {
    packages = with pkgs; [
      restic
      vdirsyncer
      yt-dlp
    ];

    file = {
      ".gitconfig".source = ../config/home/.gitconfig;
      ".ssh/key.pub".source = ../config/home/key.pub;
      ".config/vdirsyncer/config".source = ../config/vdirsyncer/config;
      "Library/Services/Display [native].workflow".source = ../config/Automator/display_native.workflow;
      "Library/Services/Display [scaled].workflow".source = ../config/Automator/display_scaled.workflow;
      ".local/bin/restic-backup".source = ../bin/restic-backup;
      ".local/bin/restic-mount".source = ../bin/restic-mount;
    };
  };
}

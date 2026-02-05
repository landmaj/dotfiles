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
      ".ssh/key.pub".source = ../config/ssh/home.pub;
      ".config/vdirsyncer/config".source = ../config/vdirsyncer/config;

      "Library/Services/Display [native].workflow".source = ../config/Automator/display_native.workflow;
      "Library/Services/Display [scaled].workflow".source = ../config/Automator/display_scaled.workflow;

      ".local/bin/restic-backup".source = ../bin/restic-backup;
      ".local/bin/restic-mount".source = ../bin/restic-mount;
    };
  };
}

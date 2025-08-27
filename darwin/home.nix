{
  imports = [
    ./base.nix
  ];

  # TODO: change to 5 after reinstallation
  system.stateVersion = 4;
  system.primaryUser = "landmaj";

  homebrew = {
    taps = [
      "macos-fuse-t/homebrew-cask"
      "rfidresearchgroup/proxmark3"
    ];

    brews = [
      {
        name = "proxmark3";
        args = [ "with-generic" ];
      }
    ];

    casks = [
      "beekeeper-studio"
      "cryptomator"
      "elmedia-player"
      "fuse-t"
      "livebook"
      "obsidian"
      "platypus"
      "postgres-unofficial"
      "prusaslicer"
      "raspberry-pi-imager"
      "spotify"
      "steam"
      "transmission"
    ];
  };
}

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
      "displayplacer"
      "lsusb-laniksj"
      {
        name = "proxmark3";
        args = [ "with-generic" ];
      }
    ];

    casks = [
      "balenaetcher"
      "cryptomator"
      "elmedia-player"
      "fuse-t"
      "livebook"
      "nvidia-geforce-now"
      "obsidian"
      "platypus"
      "postgres-unofficial"
      "prusaslicer"
      "spotify"
      "steam"
      "transmission"
    ];
  };
}

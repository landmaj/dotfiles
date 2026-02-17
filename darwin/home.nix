{
  imports = [
    ./base.nix
  ];

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
      "obsidian"
      "postgres-unofficial"
      "prusaslicer"
      "spotify"
      "transmission"
    ];

    masApps = {
      "Numbers" = 409203825;
      "Pages" = 409201541;
    };
  };
}

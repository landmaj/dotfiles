{
  imports = [
    ./base.nix
  ];

  # TODO: change to 5 after reinstallation
  system.stateVersion = 4;

  homebrew = {
    taps = [
      "macos-fuse-t/homebrew-cask"
    ];

    casks = [
      "beekeeper-studio"
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

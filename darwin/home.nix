{
  imports = [
    ./base.nix
  ];

  # TODO: change to 5 after reinstallation
  system.stateVersion = 4;

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };

    taps = [
      "macos-fuse-t/homebrew-cask"
    ];

    brews = [
      "swiftdraw"
    ];

    casks = [
      "beekeeper-studio"
      "cyberduck"
      "elmedia-player"
      "firefox"
      "fuse-t"
      "handbrake"
      "hex-fiend"
      "inkscape"
      "karabiner-elements"
      "keepassxc"
      "livebook"
      "macsymbolicator"
      "monitorcontrol"
      "mos"
      "obsidian"
      "onyx"
      "orbstack"
      "pearcleaner"
      "platypus"
      "postgres-unofficial"
      "proxy-audio-device"
      "prusaslicer"
      "raspberry-pi-imager"
      "sf-symbols"
      "spotify"
      "steam"
      "sublime-merge"
      "transmission"
      "visual-studio-code"
      "yaak"
    ];

    masApps = {
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Xcode" = 497799835;
    };
  };
}

{
  imports = [
    ./base.nix
  ];

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
      # https://github.com/NixOS/nixpkgs/issues/297655
      "xcbeautify"
    ];

    casks = [
      "beekeeper-studio"
      "cyberduck"
      "elmedia-player"
      "firefox"
      "fuse-t"
      "google-chrome"
      "handbrake"
      "karabiner-elements"
      "keepassxc"
      "livebook"
      "monitorcontrol"
      "mos"
      "obsidian"
      "onyx"
      "orbstack"
      "platypus"
      "postgres-unofficial"
      "proxy-audio-device"
      "prusaslicer"
      "sf-symbols"
      "spotify"
      "sublime-merge"
      "transmission"
      "visual-studio-code"
      "yaak"
    ];

    masApps = {
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
    };
  };
}

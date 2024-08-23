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

    casks = [
      "beekeeper-studio"
      "bruno"
      "cyberduck"
      "discord"
      "elmedia-player"
      "firefox"
      "fuse-t"
      "handbrake"
      "heynote"
      "karabiner-elements"
      "keepassxc"
      "livebook"
      "messenger"
      "monitorcontrol"
      "mos"
      "obsidian"
      "onyx"
      "orbstack"
      "platypus"
      "postgres-unofficial"
      "proxy-audio-device"
      "prusaslicer"
      "rectangle-pro"
      "spotify"
      "steam"
      "sublime-merge"
      "transmission"
      "visual-studio-code"
    ];

    masApps = {
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
    };
  };
}

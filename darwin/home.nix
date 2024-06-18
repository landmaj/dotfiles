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

    casks = [
      "beekeeper-studio"
      "bruno"
      "cyberduck"
      "discord"
      "elmedia-player"
      "firefox"
      "handbrake"
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
      "proxy-audio-device"
      "prusaslicer"
      "sf-symbols"
      "slack"
      "spotify"
      "steam"
      "sublime-merge"
      "swiftformat-for-xcode"
      "transmission"
      "visual-studio-code"
    ];

    masApps = {
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Xcode" = 497799835;
    };
  };
}

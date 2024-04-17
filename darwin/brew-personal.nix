{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    casks = [
      "beekeeper-studio"
      "bruno"
      "copilot-for-xcode"
      "cryptomator"
      "cyberduck"
      "elmedia-player"
      "firefox"
      "karabiner-elements"
      "keepassxc"
      "livebook"
      "messenger"
      "monitorcontrol"
      "mos"
      "nvidia-geforce-now"
      "obsidian"
      "onyx"
      "orbstack"
      "platypus"
      "postgres-unofficial"
      "proxy-audio-device"
      "prusaslicer"
      "rectangle-pro"
      "sf-symbols"
      "slack"
      "sonos"
      "spotify"
      "sublime-merge"
      "swiftformat-for-xcode"
      "switchresx"
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

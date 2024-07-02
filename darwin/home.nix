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

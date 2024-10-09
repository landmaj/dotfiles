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

    brews = [
      # https://github.com/NixOS/nixpkgs/issues/297655
      "xcbeautify"
    ];

    casks = [
      "bruno"
      "cyberduck"
      "datagrip"
      "firefox"
      "heynote"
      "karabiner-elements"
      "keepassxc"
      "microsoft-teams"
      "monitorcontrol"
      "mos"
      "openvpn-connect"
      "orbstack"
      "proxy-audio-device"
      "redisinsight"
      "sublime-merge"
      "visual-studio-code"
    ];

    masApps = {
      "Xcode" = 497799835;
    };
  };
}

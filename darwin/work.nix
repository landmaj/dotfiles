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
      "swiftdraw"
    ];

    casks = [
      "cyberduck"
      "datagrip"
      "deskpad"
      "elmedia-player"
      "firefox"
      "karabiner-elements"
      "keepassxc"
      "macsymbolicator"
      "microsoft-teams"
      "monitorcontrol"
      "mos"
      "onyx"
      "openvpn-connect"
      "orbstack"
      "proxy-audio-device"
      "redisinsight"
      "sf-symbols"
      "spotify"
      "sublime-merge"
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

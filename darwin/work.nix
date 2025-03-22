{
  imports = [
    ./base.nix
  ];

  system.stateVersion = 5;

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
      "elmedia-player"
      "firefox"
      "hex-fiend"
      "karabiner-elements"
      "keepassxc"
      "microsoft-teams"
      "monitorcontrol"
      "mos"
      "openvpn-connect"
      "orbstack"
      "proxy-audio-device"
      "redisinsight"
      "spotify"
      "sublime-merge"
      "visual-studio-code"
      "yaak"
      # xcode
      "github-copilot-for-xcode"
      "macsymbolicator"
      "sf-symbols"
      # cleanup
      "devcleaner"
      "knockknock"
      "onyx"
      "pearcleaner"
    ];

    masApps = {
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Xcode" = 497799835;
    };
  };
}

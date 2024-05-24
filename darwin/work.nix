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
      "bruno"
      "cyberduck"
      "datagrip"
      "firefox"
      "karabiner-elements"
      "keepassxc"
      "microsoft-teams"
      "monitorcontrol"
      "mos"
      "openvpn-connect"
      "orbstack"
      "proxy-audio-device"
      "rectangle-pro"
      "sf-symbols"
      "sublime-merge"
      "swiftformat-for-xcode"
      "visual-studio-code"
    ];

    masApps = {
      "Xcode" = 497799835;
    };
  };
}

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
      "heynote"
      "karabiner-elements"
      "keepassxc"
      "microsoft-teams"
      "monitorcontrol"
      "mos"
      "openvpn-connect"
      "orbstack"
      "proxy-audio-device"
      "rectangle-pro"
      "redisinsight"
      "sublime-merge"
      "visual-studio-code"
    ];
  };
}

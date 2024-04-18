{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
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
      "onyx"
      "openvpn-connect"
      "orbstack"
      "proxy-audio-device"
      "rectangle-pro"
      "sublime-merge"
      "switchresx"
      "visual-studio-code"
    ];
  };
}

{
  imports = [
    ./base.nix
  ];

  system.stateVersion = 5;

  homebrew = {
    casks = [
      "datagrip"
      "microsoft-teams"
      "openvpn-connect"
      "redisinsight"
      "zed"
    ];
  };
}

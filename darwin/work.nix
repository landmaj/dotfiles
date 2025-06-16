{
  imports = [
    ./base.nix
  ];

  system.stateVersion = 5;
  system.primaryUser = "mwielunski";

  homebrew = {
    casks = [
      "datagrip"
      "microsoft-teams"
      "openvpn-connect"
      "redisinsight"
    ];
  };
}

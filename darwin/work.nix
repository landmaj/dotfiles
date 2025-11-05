{
  imports = [
    ./base.nix
  ];

  system.stateVersion = 5;
  system.primaryUser = "mwielunski";

  homebrew = {
    casks = [
      "microsoft-teams"
      "openvpn-connect"
      "redis-insight"
    ];
  };
}

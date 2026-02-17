{
  imports = [
    ./base.nix
  ];

  homebrew = {
    casks = [
      "microsoft-teams"
      "openvpn-connect"
      "redis-insight"
    ];
  };
}

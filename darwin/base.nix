{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "claude-code"
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  environment.darwinConfig = "$HOME/GitHub/dotfiles";

  nix = {
    package = pkgs.nixVersions.stable;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    optimise = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
    };
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  fonts.packages = with pkgs; [
    recursive
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;

  security = {
    pam.services.sudo_local.touchIdAuth = true;
    sudo.extraConfig = "%admin ALL = (ALL) NOPASSWD: ALL";
  };

  system.defaults = {
    dock = {
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;

      autohide = true;
      orientation = "left";
      show-recents = false;
      tilesize = 48;
      magnification = true;
      largesize = 80;
      persistent-apps = [
        "/Applications/Firefox.app"
        "/System/Applications/Mail.app"
      ];
    };

    finder = {
      AppleShowAllExtensions = true;
      CreateDesktop = false;
      FXEnableExtensionChangeWarning = false;
      ShowPathbar = true;
      # When performing a search, search the current folder by default
      FXDefaultSearchScope = "SCcf";
    };

    NSGlobalDomain = {
      AppleKeyboardUIMode = 3;
      ApplePressAndHoldEnabled = true;
      "com.apple.keyboard.fnState" = true;
      "com.apple.swipescrolldirection" = false;
    };
  };

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };

    casks = [
      "cyberduck"
      "datagrip"
      "firefox"
      "ghostty"
      "gimp"
      "hex-fiend"
      "karabiner-elements"
      "keepassxc"
      "monitorcontrol"
      "mos"
      "orbstack"
      "proxy-audio-device"
      "stillcolor"
      "sublime-merge"
      "visual-studio-code"
      "yaak"
      # cleanup
      "knockknock"
      "onyx"
      "pearcleaner"
      # waiting for Steam Machine
      "nvidia-geforce-now"
      "steam"
    ];

    masApps = {
      "Numbers" = 409203825;
      "Pages" = 409201541;
    };
  };
}

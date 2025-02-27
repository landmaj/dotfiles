{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  environment.darwinConfig = "$HOME/GitHub/dotfiles";

  nix = {
    package = pkgs.nixVersions.stable;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
    optimise = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
    };
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  system.stateVersion = 5;

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
    dock.wvous-tl-corner = 1;
    dock.wvous-tr-corner = 1;
    dock.wvous-bl-corner = 1;
    dock.wvous-br-corner = 1;

    dock = {
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
}

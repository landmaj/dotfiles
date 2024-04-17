{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      home-manager
    ];

  environment.darwinConfig = "$HOME/GitHub/dotfiles";

  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };

  system.stateVersion = 4;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      jetbrains-mono
    ];
  };

  programs.zsh.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

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

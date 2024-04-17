{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      home-manager
    ];

  environment.darwinConfig = "$HOME/GitHub/dotfiles";

  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
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
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
      largesize = 50;
      persistent-apps = [
        "/Applications/Firefox.app"
        "/System/Applications/Mail.app"
      ];
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };

    NSGlobalDomain = {
      AppleKeyboardUIMode = 3;
      ApplePressAndHoldEnabled = true;
      "com.apple.keyboard.fnState" = true;
      "com.apple.mouse.scaling" = -1.0;
    };
  };
}

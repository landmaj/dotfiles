{
  description = "Landmaj's Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , darwin
    , home-manager
    , nixpkgs
    , ...
    } @ inputs:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "x86_64-darwin"
          "aarch64-linux"
          "aarch64-darwin"
        ]
          (system: function nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nil
            nixpkgs-fmt
          ];
        };
      });

      darwinConfigurations =
        let
          mkDarwin = { hostname, user, darwinModule, homeModule, stateVersion }:
            darwin.lib.darwinSystem {
              system = "aarch64-darwin";
              modules = [
                darwinModule
                home-manager.darwinModules.home-manager
                {
                  system.stateVersion = stateVersion;
                  system.primaryUser = user;
                  home-manager.users.${user} = import homeModule;
                  users.users.${user}.home = "/Users/${user}";
                }
              ];
              specialArgs = { inherit inputs; };
            };
        in
        {
          "Shandris" = mkDarwin {
            hostname = "Shandris";
            user = "landmaj";
            stateVersion = 4; # TODO: change to 5 after reinstallation
            darwinModule = ./darwin/home.nix;
            homeModule = ./home/home.nix;
          };

          "Oculeth" = mkDarwin {
            hostname = "Oculeth";
            user = "mwielunski";
            stateVersion = 5;
            darwinModule = ./darwin/work.nix;
            homeModule = ./home/work.nix;
          };
        };

      templates = {
        blank = {
          path = ./templates/blank;
        };
        elixir = {
          path = ./templates/elixir;
        };
        go = {
          path = ./templates/go;
        };
        python = {
          path = ./templates/python;
        };
      };
    };
}

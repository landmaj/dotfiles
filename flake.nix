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

      darwinConfigurations = {
        "Shandris" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin/base.nix
            ./darwin/home.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                users.landmaj = import ./home/home.nix;
              };
              users.users.landmaj.home = "/Users/landmaj";
            }
          ];
          specialArgs = { inherit inputs; };
        };

        "Valtrois" = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [
            ./darwin/base.nix
            ./darwin/work.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                users.mwielunski = import ./home/work.nix;
              };
              users.users.mwielunski.home = "/Users/mwielunski";
            }
          ];
          specialArgs = { inherit inputs; };
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

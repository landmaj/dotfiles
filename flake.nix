{
  description = "Landmaj's Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      nixpkgs = inputs.nixpkgs;

      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "x86_64-darwin"
          "aarch64-linux"
          "aarch64-darwin"
        ]
          (system: function nixpkgs.legacyPackages.${system});

      mkDarwin = { hostname, user, darwinModule, homeModule, stateVersion }:
        inputs.darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            darwinModule
            inputs.home-manager.darwinModules.home-manager
            {
              networking.hostName = hostname;
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
      formatter = forAllSystems (pkgs: pkgs.nixpkgs-fmt);

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nil
            nixpkgs-fmt
          ];
        };
      });

      darwinConfigurations = builtins.mapAttrs (hostname: args: mkDarwin (args // { inherit hostname; })) {
        "Shandris" = {
          user = "landmaj";
          stateVersion = 4; # TODO: change to 6 after reinstallation
          darwinModule = ./darwin/home.nix;
          homeModule = ./home/home.nix;
        };

        "Oculeth" = {
          user = "mwielunski";
          stateVersion = 6;
          darwinModule = ./darwin/work.nix;
          homeModule = ./home/work.nix;
        };
      };

      templates = {
        blank = {
          path = ./templates/blank;
          description = "Blank development shell";
        };
        elixir = {
          path = ./templates/elixir;
          description = "Elixir development shell";
        };
        go = {
          path = ./templates/go;
          description = "Go development shell";
        };
        python = {
          path = ./templates/python;
          description = "Python development shell";
        };
      };
    };
}

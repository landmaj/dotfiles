{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
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
            elixir
          ];
          shellHook = ''
          if [ "$(uname)" == "Darwin" ]; then
            # `clang` must point to `/usr/bin/clang` on macOS for 
            # `mix deps.compile file_system` to work 
            mkdir -p .bin
            ln -sf /usr/bin/clang .bin/clang
            export PATH=$PWD/.bin:$PATH
          fi
          '';
        };
      });
    };
}

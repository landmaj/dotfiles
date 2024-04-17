{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = with pkgs; mkShell {
          packages = with pkgs; 
          let
            # CHANGE PYTHON VERSION
            devpython = python3.withPackages
              (packages: with packages; [ 
                # PYTHON PACKAGES
                virtualenv
                pip
                setuptools
                wheel
              ]);
          in [
            # SYSTEM PACKAGES
            devpython 
          ];

          shellHook = ''
            # Setup the virtual environment if it doesn't already exist.
            VENV=.venv
            if test ! -d $VENV; then
              virtualenv $VENV
            fi
          '';
        };
      }
    );
}

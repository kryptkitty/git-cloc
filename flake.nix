# to use this file as a template, search for EDIT and modify the associated variable as needed

{
  # EDIT: package/flake description to be shared
  description = "get CLOC from a git repo";

  # EDIT: set desired nixpkgs release to track
  inputs.nixpkgs.url = "nixpkgs/nixos-22.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = ({ self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system;
	  config.allowUnfree = false;  # EDIT: allow unfree packages?
	};

        # EDIT: bring in all the packages we're exposing
        packages = {
          git-cloc = pkgs.callPackage ./git-cloc.nix { inherit pkgs; };
        };

        # EDIT: set the default package when running the flake as `nix run repo#`
        defaultPackage = packages.git-cloc;
      in { inherit packages defaultPackage; }
    ))
      // { templates.default = {
	  path = ./template;
	  description = "make your own executable git-cloc (or other shell script) flake";
	  welcomeText = ''
	    Your new flake is ready to be initialized.

            There is a simple init script which will do this for you.  It will
	    change the files in the same way as substituteAllInPlace after
	    asking for the values.  You are encouraged to use the script after
	    evaluating it with eyeballs.

                bash ./init-template.sh
	    
	    When this script is complete, it will remove itself, leaving you
	    with a new flake, ready to go.
	  '';
      };}
    );
}

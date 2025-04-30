{
	pkgs ? import <nixpkgs> { config = {}; overlays = []; }
}:
with pkgs;
let
	# pkgs = import <nixpkgs> { config = {}; overlays = []; };
	packages = {
		doomseeker = libsForQt5.callPackage ./pkgs/doomseeker { };
	};
in
	packages

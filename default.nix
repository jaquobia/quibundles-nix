{
	# pkgs ? import <nixpkgs> { config = {}; overlays = []; },
	pkgs,
	...
}:
with pkgs;
let
	packages = {
		doomseeker = libsForQt5.callPackage ./pkgs/doomseeker { };
	};
in
	packages

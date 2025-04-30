{
	pkgs ? import (
		fetchTarball {
			url = "https://github.com/NixOS/nixpkgs/archive/8b27c1239e5c421a2bbc2c65d52e4a6fbf2ff296.tar.gz";
			sha256 = "sha256:06jzngg5jm1f81sc4xfskvvgjy5bblz51xpl788mnps1wrkykfhp";
		}
	) {},
	...
}:
with pkgs;
let
	packages = {
		doomseeker = libsForQt5.callPackage ./pkgs/doomseeker { };
	};
in
	packages

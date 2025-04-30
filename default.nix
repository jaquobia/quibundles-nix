let
	pkgs = import <nixpkgs> { config = {}; overlays = []; };
in
{
	doomseeker = pkgs.libsForQt5.callPackage ./doomseeker/doomseeker.nix { };
}

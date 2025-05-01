{
	pkgs ? import <nixpkgs> { },
	...
}:
{
	doomseeker = pkgs.libsForQt5.callPackage ./pkgs/doomseeker { };
	zandronum = pkgs.callPackage ./pkgs/zandronum { };
}

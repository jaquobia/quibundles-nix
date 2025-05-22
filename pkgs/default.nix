{ pkgs }:
{
	doomseeker = pkgs.libsForQt5.callPackage ./pkgs/doomseeker { };
	zandronum = pkgs.callPackage ./pkgs/zandronum { };
	sm64coopdx = pkgs.callPackage ./pkgs/sm64coopdx { };
}

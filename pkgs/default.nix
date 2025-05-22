{ pkgs }:
{
	doomseeker = pkgs.libsForQt5.callPackage ./doomseeker { };
	zandronum = pkgs.callPackage ./zandronum { };
	sm64coopdx = pkgs.callPackage ./sm64coopdx { };
}

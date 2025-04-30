#{ pkgs ? import <nixpkgs> }
#
#let
#	# qtEnv = with pkgs.qt6; env "qt-custom-${qtbase.version}" {
#	# 	[
#	# 		qtdeclarative
#	# 	];
#	# };
#in
#{
#	pkgs.mkShell {
#		buildInputs = [
#			# qtEnv
#			pkgs.qt5.full
#			pkgs.qtcreator
#		];
#	}
#	# doomseeker = libsForQt5.callPackage ./doomseeker.nix {};
#}

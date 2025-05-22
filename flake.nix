{
	description = "My Nix pkgs repository";

	inputs = {
		nixpkgs = {
			url = "github:NixOS/nixpkgs/nixos-unstable";
		};
	};

	outputs = { self, nixpkgs, ... }:
		let
			forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
		in 
		{
			lib = {
				pkgsFor = pkgs: pkgs.callPackage ./pkgs { };
				# {
				# 	doomseeker = pkgs.libsForQt5.callPackage ./pkgs/doomseeker { };
				# 	zandronum = pkgs.callPackage ./pkgs/zandronum { };
				# 	sm64coopdx = pkgs.callPackage ./pkgs/sm64coopdx { };
				# };
			};
			packages = forAllSystems(system: self.lib.pkgsFor nixpkgs.legacyPackages.${system});
		};
}

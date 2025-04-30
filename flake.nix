{
	description = "My Nix pkgs repository";

	inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

	outputs = { self, nixpkgs, ... }:
		let
			forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
			# system = "x86_64-linux";
			# pkgs = import nixpkgs { inherit system; };
		in 
		{
			packages = forAllSystems(
				system:
				let
					pkgs = nixpkgs.legacyPackages.${system};
					doomseeker-pkg = pkgs.libsForQt5.callPackage ./pkgs/doomseeker { };
				in
				{
					default = doomseeker-pkg;
					doomseeker = doomseeker-pkg;
				}
			);
		};
}

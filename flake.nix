{
	description = "My Nix pkgs repository";

	inputs = {
		nixpkgs = {
			url = "github:NixOS/nixpkgs/nixos-unstable";
		};
	};

	outputs = { self, nixpkgs, ... }:
		let
			lib = nixpkgs.lib;
			forAllSystems = lib.genAttrs nixpkgs.lib.systems.flakeExposed;
		in 
		{
			packages = forAllSystems(
				system:
				let
						pkgs = import nixpkgs {
								inherit system;
								config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
								"fmod"
								];
						
						};
						doomseeker-pkg = pkgs.libsForQt5.callPackage ./pkgs/doomseeker { };
						zandronum-pkg = pkgs.callPackage ./pkgs/zandronum { };
				in
				{
					default = doomseeker-pkg;
					doomseeker = doomseeker-pkg;
					zandronum = zandronum-pkg;
				}
			);
		};
}

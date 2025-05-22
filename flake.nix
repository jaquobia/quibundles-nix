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
			};
			packages = forAllSystems(system: self.lib.pkgsFor nixpkgs.legacyPackages.${system});
		};
}

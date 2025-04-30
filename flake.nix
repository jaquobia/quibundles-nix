{
	description = "My Nix pkgs repository";

	inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

	outputs = { self, nixpkgs }:
		let
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
		in 
		{
			packages.${system} = {
				doomseeker = pkgs.libsForQt5.callPackage ./pkgs/doomseeker { };
			};
		};
}

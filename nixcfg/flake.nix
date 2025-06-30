{

	description = "Grizzly-s flake nixos";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};	
	};

	outputs = { nixpkgs, home-manager ,... }: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ ./configuration.nix ];
		};
		
		homeConfigurations.grizzly = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages."x86_64-linux";
			modules = [ ./home-manager/home.nix ];
		};
	};
}

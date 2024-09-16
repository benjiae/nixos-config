{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim/nixos-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs:
		let
      system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
    	username = "benjae";
	hostname = "el-wiwi-nix";
	in {
		nixosConfigurations = {
      el-wiwi-nix = nixpkgs.lib.nixosSystem {
				modules = [
          ./configuration.nix
	];			
};
	homeConfigurations = {
			benjae = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit username; inherit hostname; inherit nixvim; };
				modules = [
					./home/main.nix
				];
			};
		};
};
  };
}

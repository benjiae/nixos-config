{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    catppuccin.url = "github:catppuccin/nix";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim/nixos-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
	};

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, nixvim, plasma-manager, catppuccin, ... }: {
			nixosConfigurations = {
      	el-wiwi-nix = nixpkgs.lib.nixosSystem {
					modules = [
            ./configuration.nix
            ./configurations
            catppuccin.nixosModules.catppuccin

						home-manager.nixosModules.home-manager {
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;
							home-manager.sharedModules = [
                nixvim.homeManagerModules.nixvim
                plasma-manager.homeManagerModules.plasma-manager
							];
              home-manager.users.benjae = {
                imports = [
                  ./home/main.nix
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
						}	
					];			
				};
			};
  	};
}

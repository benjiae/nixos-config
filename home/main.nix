{ config, pkgs, ...}:

{
	home.username = "benjae";
	home.homeDirectory = "/home/benjae";
	home.stateVersion = "24.05";
	
	imports = [
		./programs/config.nix
		./programs/noconfig.nix
	
		./configs/user-bins.nix
	];
}

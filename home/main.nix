{ config, pkgs, ...}:

{
	home.username = "benjae";
	home.homeDirectory = "/home/benjae";
	home.stateVersion = "24.05";
	
	imports = [
		./programs/simple-config.nix
		./programs/noconfig.nix	
		./programs/zsh.nix

		./configs/user-bins.nix
	];
}

{ config, pkgs, ...}:

{
	home.username = "benjae";
	home.homeDirectory = "/home/benjae";
	home.stateVersion = "24.05";
	
	imports = [
		./programs
		./programs/neovim

		./configs/user-bins.nix
	];
}

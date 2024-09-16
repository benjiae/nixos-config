{ config, pkgs, username, nixvim, ...}:

{
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "24.05";
	
	imports = [
		./programs
		./modules/neovim.nix
		nixvim.homeManagerModules.nixvim
		./configs/user-bins.nix
	];
}

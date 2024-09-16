{ config, pkgs, username, nixvim, ...}:
{
	imports = [
		./modules/neovim.nix
		nixvim.homeManagerModules.nixvim
	]
}

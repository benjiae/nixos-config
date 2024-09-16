{ config, pkgs, username, nixvim, ...}:
{
	imports = [
		./modules/nixvim.nix
		nixvim.homeManagerModules.nixvim
	]
}

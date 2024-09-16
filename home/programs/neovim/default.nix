{ config, pkgs, ...}:
{
	imports = [
		./init.nix
		./config.nix
	];
}

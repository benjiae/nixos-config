{ config, pkgs, ...}:

{
	imports = [
		./noconfig.nix
		./simple-config.nix
		./zsh.nix
	];
}
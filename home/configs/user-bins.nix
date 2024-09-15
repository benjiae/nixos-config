{ config, pkgs, ... }:

{
	# Nix scripts
	home.file."${config.home.homeDirectory}/.local/bin/commit-nix".source = ../../commit-nix
	home.file."${config.home.homeDirectory}/.local/bin/update".source = ../../update
}

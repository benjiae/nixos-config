{ config, pkgs, ... }:

{
	# Nix scripts
	home.file.".local/bin/commit-nix".source = ../../commit-nix;
	home.file.".local/bin/update".source = ../../update;
}

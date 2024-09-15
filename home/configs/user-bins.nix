{ config, pkgs, ... }:

{
	home = {
		# actually make it detect the files	
		sessionPath = [
			"/home/benjae/.local/bin"
		];
		## The files
		# Nix scripts
		file."/home/benjae/.local/bin/commit-nix".source = ../../commit-nix;
		file."/home/benjae/.local/bin/update".source = ../../update;
	};
}

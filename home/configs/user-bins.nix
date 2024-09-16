{
	home = {
		# actually make it detect the files	
		sessionPath = [ "$HOME/.local/bin"];
		## The files
		# Nix scripts
		file."$HOME/.local/bin/commit-nix".source = ../../commit-nix;
		file."$HOME/.local/bin/update".source = ../../update;
	};
}

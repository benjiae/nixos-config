{

	home = {
	  sessionPath = [ "/home/benjae/.local/bin"];
		## The files
		# Nix scripts
		file.".local/bin/commit-nix".source = ../../commit-nix;
		file.".local/bin/update".source = ../../update;
	};
}

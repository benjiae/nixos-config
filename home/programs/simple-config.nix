{ config, pkgs, ...}:

{
	programs.git = {
		enable = true;
		userName = "benjae";
		userEmail = "benjaminang2009@gmail.com";
	};

	programs.neovim = {
		enable = true;
	};
}

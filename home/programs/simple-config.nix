{ config, pkgs, ...}:

{
	programs.git = {
		enable = true;
		userName = "benjae";
		userEmail = "benjaminang2009@gmail.com";
	};

	programs.neovim = {
		enable = true;
		extraConfig = ''
				set number relativenumber
				set tabstop=2
				set shiftwidth=2
			''; 
	};
}

{ config, pkgs, ...}:

{
	programs.git = {
		enable = true;
		userName = "benjae";
		userEmail = "benjaminang2009@gmail.com";
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
		};

		history = {
			size = 10000;
			path = "${config.xdg.dataHome}/zsh/history";
		};
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

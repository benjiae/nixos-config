{ config, pkgs, ...}:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			ll = "ls -l";
		};

		history = {
			size = 10000;
			path = "${config.xdg.dataHome}/zsh/history";
		};
	
		zplug = {
			enable = true;
			plugins = [
				{ name = "nullxception/roundy"; tags = [ as:theme, from:github, use:roundy.zsh] }
			];
		};
	};
}

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

		plugins = [
			{
				name = "pure"
				src = pkgs.fetchFromGithub {
					owner = "sindresorhus";
					repo = "pure";
					rev = "v1.23.0"
					sha256 = "1jcb5cg1539iy89vm9d59g8lnp3dm0yv88mmlhkp9zwx3bihwr06";
				};
			}
		];

	};
}

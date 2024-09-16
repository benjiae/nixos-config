{ pkgs, ... }:
{
	home.packages = with pkgs; [
		zip
		xz
		unzip
		p7zip

		ripgrep
		bat
		eza
		fzf

		btop
  ];

  programs = {
    fzf.catppuccin.enable = true;
    btop.catppuccin.enable = true;   
  };
}

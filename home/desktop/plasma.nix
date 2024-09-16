{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      catppuccin.enable = true;
      #package = pkgs.lightly-qt;
      name = "kvantum";
    };
  };

  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "Catppuccin-Mocha-Sapphire";
      iconTheme = "breeze-dark";
    };
  };
}

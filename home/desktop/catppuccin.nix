{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "Sapphire";
      variant = "Mocha";
    })
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "sapphire" ];
    })
  ];
  catppuccin.enable = false;
  catppuccin.flavor = "mocha";
  catppuccin.accent = "sapphire";
  catppuccin.pointerCursor.enable = true;
  
  gtk.catppuccin.enable = true;
  gtk.catppuccin.icon.enable = true;
}

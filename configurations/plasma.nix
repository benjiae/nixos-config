{ pkgs, ...}:
{
  catppuccin.enable = false;
  catppuccin.flavor = "mocha";
  catppuccin.accent = "sapphire";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.catppuccin.enable = true;
  services.desktopManager.plasma6.enable = true;



  environment.plasma5.excludePackages = with pkgs.kdePackages; [
    oxygen
    konsole
    plasma-browser-integration
  ];
}

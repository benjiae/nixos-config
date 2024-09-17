{ pkgs, ... }:
{
  home.packages = [
  (pkgs.vivaldi.overrideAttrs (newAttrs: oldAttrs: {
    buildPhase = builtins.replaceStrings
      ["for f in libGLESv2.so libqt5_shim.so ; do"]
      ["for f in libGLESv2.so libqt5_shim.so libqt6_shim.so ; do"]
    oldAttrs.buildPhase;
  }))
  pkgs.vivaldi.override {
    qt5 = pkgs.qt6;
    commandLineArgs = [ "--ozone-platform=wayland" ];
    proprietaryCodecs = true;
    enableWidevine = true;
  }];
}

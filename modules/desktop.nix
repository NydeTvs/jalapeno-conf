{ config, pkgs, ... }:

{
  imports = 
    [
      ./sddm.nix
    ];

  services.xserver.xkb = {
    layout = "fr";
    variant = "oss";
    options = "caps:shiftlock";
  };

  console.useXkbConfig = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}

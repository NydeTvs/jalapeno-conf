{ config, pkgs, ... } : 

let
  theme = import ./theme.nix;
in
{
  services.mako = {
    enable = true;
    settings = {
      font = "${theme.fonts.main.name} ${toString theme.fonts.main.size}";
      background-color = theme.colors.background;
      text-color = theme.colors.foreground;     
      border-color = theme.colors.yellow;    
      border-size = 2;
      border-radius = 6;         
      default-timeout = 10000;
      
      width = 300;
      height = 100;
      margin = "10";
      padding = "5";
    };
  };
}

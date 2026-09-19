{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "default";

    backgrounds = {
      ldn-login = ../assets/wallpaper/nixlock.png;
    };

    
    profileIcons = {
      default-user = ../assets/profile-picture/nixpp.png;
    };
   
    settings = {
      General = {
        scale = 1.5;
      };

      LoginScreen = {
        background = "nixlock.png";
        blur = 20;
      };
     
      LockScreen = {
        background = "nixlock.png";
        blur = 0;
      };

      "LockScreen.Clock" = {
        "font-size" = 100;
      };

      "LockScreen.Message" = {
        display = false;
      };
    };
  };
}

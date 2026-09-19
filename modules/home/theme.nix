# List of apps with static settings (needs manual change) :
# - krita

{
  colors = {
    background = "#0D0F12";
    foreground = "#E0E7FF";
    cursor     = "#FFAD33";
    selection  = "#3A4D94";
    
    black   = "#15171C"; 
    red     = "#FF2E50"; 
    green   = "#A8FF50"; 
    yellow  = "#FFB320"; 
    blue    = "#4A8CFF"; 
    magenta = "#B05CFF"; 
    cyan    = "#00E0FF"; 
    white   = "#AAB6E0"; 

    brightBlack   = "#4A526E"; 
    brightRed     = "#FF5575"; 
    brightGreen   = "#C4FF8A"; 
    brightYellow  = "#FFCC66"; 
    brightBlue    = "#7AA5FF"; 
    brightMagenta = "#C685FF"; 
    brightCyan    = "#55F2FF"; 
    brightWhite   = "#FFFFFF";

    # Additional Colors
    darkGreen    = "#547F28";
    turquoise    = "#50E3C2";
    darkYellow   = "#ACA33A";
  };

  apps = {
    # To change Nix Logo : use a different.png at nixos-config/assets/fastfetch
    fastfetch = {
      borders = "90";
      system = "yellow";
      host = "green";
      wm = "blue";
    };
    mango = {
      focuscolor = "0x516c93ff";
    };
    swaylock = {
      inside = "1a1f2bCC";
      ring = "00aaffFF";
      ringClear = "00ffaaFF";
      ringVer = "ff8800FF";
      ringWrong = "e60000FF";
      keyHl = "ff00aaFF";
      bsHl = "e60000FF";
      text = "ffffffFF";
      transparent = "00000000";
    };
  };

  fonts = {
    main = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
      pkg = "jetbrains-mono";
    };
  };
  
  cursor = {
    name = "catppuccin-mocha-dark-cursors";
    pkg = "catppuccin-cursors.mochaDark";
    size = 20;
  };

  icons = {
    name = "Colloid-Dark";
    pkg = "colloid-icon-theme";
  };
}

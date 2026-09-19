{ config, pkgs, ... }:

let
  theme = import ./theme.nix;
in
{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 10;
      background_opacity = "0.8";
      confirm_os_window_close = 0;

      # --- THEME : NEON RAIN ---
      
      background = theme.colors.background; 
      foreground = theme.colors.foreground;
      cursor = theme.colors.cursor;
      selection_background = theme.colors.selection;

      color0 = theme.colors.black;
      color1 = theme.colors.red;
      color2 = theme.colors.green;
      color3 = theme.colors.yellow;
      color4 = theme.colors.blue;
      color5 = theme.colors.magenta;
      color6 = theme.colors.cyan;
      color7 = theme.colors.white;

      color8  = theme.colors.brightBlack;
      color9  = theme.colors.brightRed;
      color10 = theme.colors.brightGreen;
      color11 = theme.colors.brightYellow;
      color12 = theme.colors.brightBlue;
      color13 = theme.colors.brightMagenta;
      color14 = theme.colors.brightCyan;
      color15 = theme.colors.brightWhite; 
    };
    font = {
      name = theme.fonts.main.name;
      size = theme.fonts.main.size;
    };
  };
}

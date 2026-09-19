{ config, pkgs, ... }:

let
  theme = import ./theme.nix;
  inherit (config.lib.formats.rasi) mkLiteral;
  
  mangoFocusHex = "#" + builtins.substring 2 6 theme.apps.mango.focuscolor;
in
{
  programs.rofi = {
    enable = true;
    
    extraConfig = {
      modi = "drun";
      show-icons = true;
      icon-theme = "Colloid-dark";
      display-drun = "  Apps";
      drun-display-format = "{name}";
      disable-history = false;
      sidebar-mode = false;
    };

    theme = {
      "*" = {
        bg = mkLiteral "${theme.colors.background}F2";
        fg = mkLiteral theme.colors.foreground;
        accent = mkLiteral theme.colors.yellow;
        prompt = mkLiteral theme.colors.green;
        alt-bg = mkLiteral theme.colors.brightBlack;
        
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
        
        font = "${theme.fonts.main.name} ${toString theme.fonts.main.size}";
      };

      "window" = {
        width = mkLiteral "600px";
        border = mkLiteral "2px";
        border-color = mkLiteral mangoFocusHex;
        border-radius = mkLiteral "6px";
        padding = mkLiteral "20px";
        background-color = mkLiteral "@bg";
      };

      "prompt" = {
        text-color = mkLiteral "@bg";
        background-color = mkLiteral "@prompt";
        padding = mkLiteral "6px 12px";
        border-radius = mkLiteral "4px";
      };

      "entry" = {
        padding = mkLiteral "6px 12px";
        text-color = mkLiteral "@fg";
      };

      "inputbar" = {
        children = mkLiteral "[ prompt, entry ]";
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px 0px 15px 0px";
      };

      "listview" = {
        columns = 2;
        lines = 8;
        spacing = mkLiteral "8px";
        border = mkLiteral "0px";
      };

      "element" = {
        padding = mkLiteral "8px";
        border-radius = mkLiteral "4px";
      };

      "element selected" = {
        background-color = mkLiteral "@accent";
        text-color = mkLiteral "@bg";
      };

      "element-icon" = {
        size = mkLiteral "24px";
        margin = mkLiteral "0px 10px 0px 0px";
        background-color = mkLiteral "transparent";
      };
      
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };
    };
  };
}

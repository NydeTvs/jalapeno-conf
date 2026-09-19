{ config, pkgs, ... }:

# Contains DCONF global theme settings as DCONF and GTK are linked

let 
  theme = import ./theme.nix;
in
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;

    font = {
      name = theme.fonts.main.name;
      package = pkgs.${theme.fonts.main.pkg};
      size = theme.fonts.main.size;
    };

    iconTheme = {
      name = theme.icons.name;
      package = pkgs.${theme.icons.pkg};
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    
    gtk2.extraConfig = ''
      gtk-alternative-button-order = 1
    '';

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-cursor-blink = true;
      gtk-cursor-blink-time = 1000;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-menu-images = true;
      gtk-modules = "colorreload-gtk-module";
      gtk-primary-button-warps-slider = true;
      gtk-sound-theme-name = "ocean";
      gtk-toolbar-style = 3;
    };

    gtk3.extraCss = ''
      @define-color accent_color ${theme.colors.blue};
      @define-color accent_bg_color ${theme.colors.blue};
      @define-color window_bg_color alpha(${theme.colors.background}, 0.7);
      @define-color window_fg_color ${theme.colors.foreground};
      @define-color headerbar_bg_color alpha(${theme.colors.black},0.7);
      @define-color headerbar_fg_color ${theme.colors.foreground};
      @define-color popover_bg_color alpha(${theme.colors.background},0.95);
      @define-color popover_fg_color ${theme.colors.foreground};
      @define-color view_bg_color alpha(${theme.colors.background},0.7);
      @define-color view_fg_color ${theme.colors.foreground};
      @define-color card_bg_color alpha(${theme.colors.brightBlack},0.7);
      @define-color card_fg_color ${theme.colors.foreground};
      @define-color destructive_color ${theme.colors.red};
      @define-color success_color ${theme.colors.green};
      @define-color warning_color ${theme.colors.yellow};
      @define-color error_color ${theme.colors.red};
    '';

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-cursor-blink = true;
      gtk-cursor-blink-time = 1000;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-menu-images = true;
      gtk-modules = "colorreload-gtk-module";
      gtk-primary-button-warps-slider = true;
      gtk-sound-theme-name = "ocean";
      gtk-toolbar-style = 3;
    };

    gtk4.extraCss = ''
      @define-color accent_color ${theme.colors.blue};
      @define-color accent_bg_color ${theme.colors.blue};
      @define-color window_bg_color alpha(${theme.colors.background}, 0.7);
      @define-color window_fg_color ${theme.colors.foreground};
      @define-color headerbar_bg_color alpha(${theme.colors.black},0.7);
      @define-color headerbar_fg_color ${theme.colors.foreground};
      @define-color popover_bg_color alpha(${theme.colors.background},0.95);
      @define-color popover_fg_color ${theme.colors.foreground};
      @define-color view_bg_color alpha(${theme.colors.background},0.7);
      @define-color view_fg_color ${theme.colors.foreground};
      @define-color card_bg_color alpha(${theme.colors.brightBlack},0.7);
      @define-color card_fg_color ${theme.colors.foreground};
      @define-color destructive_color ${theme.colors.red};
      @define-color success_color ${theme.colors.green};
      @define-color warning_color ${theme.colors.yellow};
      @define-color error_color ${theme.colors.red};
    '';
  };
}

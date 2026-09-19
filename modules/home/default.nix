{ config, pkgs, inputs, ... }:

let
  theme = import ./theme.nix;
in
{
  home.username = "default-user";
  home.homeDirectory = "/home/default-user";
  home.stateVersion = "26.11";

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    XKB_DEFAULT_LAYOUT = "fr";
    XKB_DEFAULT_VARIANT = "oss";
    XKB_DEFAULT_OPTIONS = "caps:shiftlock";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
  };
  
  home.packages = with pkgs; [
    thunderbird
    nemo
    imv
    tree
    util-linux
    fastfetch
    starship
    libnotify
    pavucontrol
    krita
    onlyoffice-desktopeditors
    libinput
    wlr-randr

    gcc
    gnumake
    python3
    gdb 

    # required by nvim
    wl-clipboard
    ripgrep

    # screenshots
    grim
    satty

    kitty
    # waybar added with flakes
    swayosd
    networkmanagerapplet
    rofi
    
    swaybg
    gtklock
    mako

    nerd-fonts.jetbrains-mono
    catppuccin-cursors
    colloid-icon-theme
  ];
 
  home.pointerCursor = {
    enable = true;
    name = theme.cursor.name;
    package = pkgs.lib.getAttrFromPath (pkgs.lib.splitString "." theme.cursor.pkg) pkgs;
    size = theme.cursor.size;
    gtk.enable = true;
    x11.enable = true;
  };

  # All configs
  imports = [
    ./mango.nix
    ./kitty.nix
    ./gtk.nix
    ./bash.nix
    ./fastfetch.nix
    ./starship.nix
    ./rofi.nix
    ./mako.nix
    ./waybar.nix
    ./gtklock.nix
    ./nixvim.nix

    ./scripts.nix
  ];
}

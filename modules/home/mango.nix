{ config, pkgs, inputs, ... }:

let 
  theme = import ./theme.nix;
in
{
  imports = [ inputs.mango.hmModules.mango ];

  wayland.windowManager.mango = {
    enable = true;

    autostart_sh = ''
      swaybg -i ${../../assets/wallpaper/nixwp.png} -m fill &
      swayosd-server &
      waybar &
      # rotate-screen & uncomment this if you have a rotating screen
    '';

    settings = {
    
      # Cursor
      cursor_theme = theme.cursor.name;
      cursor_size = theme.cursor.size;

      # Window Rules
      border_radius = 6;
      borderpx = 2;
      focuscolor = theme.apps.mango.focuscolor;
      blur = 100;
      gappoh = 5; # Horizontal outer gap
      gappov = 5; # Vertical outer gap

      # Layer Rules
      blur_layer = 1;
      layerrule = [
        "noblur:1,layer_name:rofi"
        "noblur:1,layer_name:mako"
        "noblur:1,layer_name:swayosd"
        "noblur:1,layer_name:slurp"
      ];

      # Animations
      animations = 1;
      layer_animations = 1;
      layer_animation_type_open = "slide";
      layer_animation_type_close = "slide";
      
      animation_duration_open = 400;
      animation_duration_close = 200;

      animation_curve_open = "0.16, 1, 0.3, 1";
      animation_curve_close = "0.5, 0, 1, 1";
      animation_curve_move = "0.25, 1, 0.5, 1";

      # Uncomment this if you find the interface too little 
      # Feel free to increase/decrease the value
      # Warning: Please ensure that your screen device is called eDP-1
      # or then rename it 

      #monitorrule = [
      #  "name:eDP-1,scale:1.5"
      #];

      # Keyboard Settings
      xkb_rules_layout = "fr";
      xkb_rules_variant = "oss";
      xkb_rules_options = "caps:shiftlock";

      trackpad_natural_scrolling = 1;

      # Warning : Mango Binds all refer on qwerty keyboard phys position of keys (e.g a in config => q for my dell)
      bind = [
        # Global Keybinds
        "super,Return,spawn,kitty"
        "super+shift,e,quit"
        "super+shift,a,killclient"
        "super,d,spawn,rofi -show drun"
        "super+shift,b,reload_config"
        "super,l,spawn,gtklock"

        # Take a screenshot : please refer to scripts.nix
        "none,Print,spawn,screenshot-area"
        "super,Print,spawn,screenshot-full"

        # Navigation Keybinds
        "super,Left,focusdir,left"
        "super,Right,focusdir,right"
        "super,Up,focusdir,up"
        "super,Down,focusdir,down"

        "super+shift,Left,exchange_client,left"
        "super+shift,Right,exchange_client,right"
        "super+shift,Up,exchange_client,up"
        "super+shift,Down,exchange_client,down"

        "super+shift,t,setlayout,tile"
        "super+shift,c,setlayout,center_tile"
        "super+shift,f,setlayout,fair"
        "super+shift,s,setlayout,scroller"

        "super,Space,togglefloating"
        "ALT,Tab,toggleoverview"

        # Tag Keybinds
        "super,1,view,1"
        "super,2,view,2"
        "super,3,view,3"
        "super,4,view,4"
        "super,5,view,5"
        "super,6,view,6"
        "super,7,view,7"
        "super,8,view,8"
        "super,9,view,9"

        "super+shift,1,toggletag,1"
        "super+shift,2,toggletag,2"
        "super+shift,3,toggletag,3"
        "super+shift,4,toggletag,4"
        "super+shift,5,toggletag,5"
        "super+shift,6,toggletag,6"
        "super+shift,7,toggletag,7"
        "super+shift,8,toggletag,8"
        "super+shift,9,toggletag,9"

        # Sound Managing Keybinds
        "none,XF86AudioLowerVolume,spawn,swayosd-client --output-volume -5"
        "none,XF86AudioRaiseVolume,spawn,swayosd-client --output-volume +5"
        "none,XF86AudioMute,spawn,swayosd-client --output-volume mute-toggle"

        # Luminosity Managing Keybinds
        "none,XF86MonBrightnessDown,spawn,swayosd-client --brightness -5"
        "none,XF86MonBrightnessUp,spawn,swayosd-client --brightness +5"
      ];

      mousebind = [
        "super,btn_left,moveresize,curmove"
        "super,btn_right,moveresize,curresize"
      ];
    };
  };
}

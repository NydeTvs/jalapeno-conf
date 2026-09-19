{ config, pkgs, ... }:

let 
  theme = import ./theme.nix;
  mangoFocusHex = "#" + builtins.substring 2 6 theme.apps.mango.focuscolor;
in
{
  xdg.configFile."gtklock/config.ini".text = ''
    [main]
    time-format=%H:%M
  '';

  xdg.configFile."gtklock/style.css".text = ''
    window {
      background-image: url("${../../assets/wallpaper/nixsesslock.png}");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;

      color: ${theme.colors.foreground};
      font-family: "${theme.fonts.main.name}";
    }

    /* Unlock button removal */
    button {
      font-size: 0px;
      color: transparent;
      padding: 0;
      margin: 0;
      border: none;
      background: transparent;
    }

    #clock-label {
      font-size: 90px;
      font-weight: bold;
      letter-spacing: -2px;
      margin-bottom: 0px;
    }

    #date-label {
      color: ${theme.colors.foreground};
      font-size: 22px;
      margin-top: 0px;
      margin-bottom: 60px;
    }
   
    /* Entry label removal */
    #input-label {
      font-size: 0px;
      color: transparent;
      margin: 0;
      padding: 0;
    }

    entry {
      background-color: ${theme.colors.background};
      color: ${theme.colors.foreground};
      border: 2px solid ${mangoFocusHex};
      border-radius: 8px;
      padding: 10px;
      min-width: 250px;
      caret-color: ${theme.colors.foreground};
    }
  '';
}

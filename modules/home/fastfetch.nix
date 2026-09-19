{ config, pkgs, ... }:

let
  theme = import ./theme.nix;
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${../../assets/fastfetch/nixlogo.png}"; 
        type = "kitty"; 
        width = 30;
        height = 15;
      };

      display = {
        separator = " -> ";
        constants = [
          "───────────────────────────────────────────"
        ];
      };

      modules = [
        { type = "custom"; format = "┌{$1}┐"; outputColor = theme.apps.fastfetch.borders; }
        { type = "title"; key = "│ SYSTEM"; keyColor = theme.apps.fastfetch.system; }
        { type = "custom"; format = "└{$1}┘"; outputColor = theme.apps.fastfetch.borders; }
        
        { type = "os"; key = "│  OS"; keyColor = theme.apps.fastfetch.system; }
        { type = "kernel"; key = "│ ├"; keyColor = theme.apps.fastfetch.system; }
        { type = "bios"; key = "│ ├"; keyColor = theme.apps.fastfetch.system; format = "Bios {4} {3}";}
        { type = "packages"; key = "│ └󰏗"; keyColor = theme.apps.fastfetch.system; }

        { type = "custom"; format = "├{$1}┤"; outputColor = theme.apps.fastfetch.borders; }
        { type = "host"; key = "│ 󰌢 HOST"; keyColor = theme.apps.fastfetch.host; }
        { type = "cpu"; key = "│ ├"; keyColor = theme.apps.fastfetch.host; format = "{1}@{6}"; }
        { type = "gpu"; key = "│ ├󰘚"; keyColor = theme.apps.fastfetch.host; format = "{1} {2}"; }
        { type = "memory"; key = "│ ├"; keyColor = theme.apps.fastfetch.host; }
        { type = "disk"; key = "│ ├󰋊"; keyColor = theme.apps.fastfetch.host; format = "{20} : {1} / {2} ({3})"; }
        { type = "battery"; key = "│ └󰂄"; keyColor = theme.apps.fastfetch.host; format = "{5} ({4})"; }

        { type = "custom"; format = "├{$1}┤"; outputColor = theme.apps.fastfetch.borders; }
        { type = "wm"; key = "│  Window Manager"; keyColor = theme.apps.fastfetch.wm; }
        { type = "display"; key = "│ ├󰍹"; keyColor = theme.apps.fastfetch.wm; format = "{6}: {1}x{2} {3}Hz ({21} scaled)"; }
        { type = "font"; key = "│ ├"; keyColor = theme.apps.fastfetch.wm; format = "{1} {2}"; }
        { type = "terminal"; key = "│ ├󰆍"; keyColor = theme.apps.fastfetch.wm; }
        { type = "shell"; key = "│ ├"; keyColor = theme.apps.fastfetch.wm; }
        { type = "editor"; key = "│ └"; keyColor = theme.apps.fastfetch.wm; }

        { type = "custom"; format = "└{$1}┘"; outputColor = theme.apps.fastfetch.borders; }
      ];
    };
  };
}

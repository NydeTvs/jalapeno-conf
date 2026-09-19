{ pkgs, ... }:

let
  screenshotsDir = "$HOME/Pictures/Screenshots";

  # if you are using this script, please ensure that your screen device
  # is called eDP-1
  rotateScript = pkgs.writeShellScriptBin "rotate-screen" ''
    OUTPUT="eDP-1"
    monitor-sensor | while read -r line; do
        case "$line" in
            *normal*)
                wlr-randr --output "$OUTPUT" --transform normal
                ;;
            *bottom-up*)
                wlr-randr --output "$OUTPUT" --transform 180
                ;;
            *left-up*)
                wlr-randr --output "$OUTPUT" --transform 90
                ;;
            *right-up*)
                wlr-randr --output "$OUTPUT" --transform 270
                ;;
        esac
    done
  '';

  screenshotArea = pkgs.writeShellScriptBin "screenshot-area" ''
    grim - | satty --filename - --output-filename ${screenshotsDir}/$(date +"%Y-%m-%d_%H-%M-%S.png")
  '';

  screenshotFull = pkgs.writeShellScriptBin "screenshot-full" ''
    file="${screenshotsDir}/$(date +"%Y-%m-%d_%H-%M-%S.png")"
    grim - | tee "$file" | wl-copy
    notify-send "Screenshot" "Fullscreen captured and copied"
  '';
in
{
  home.packages = [ 
    rotateScript 
    screenshotArea 
    screenshotFull 
  ];
}

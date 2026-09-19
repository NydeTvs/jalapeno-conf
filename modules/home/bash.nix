{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      # Quick system rebuild (dirty git tree)
      nix-rbnow = "sudo nixos-rebuild switch --flake LOCATION_OF_YOUR_CONFIG_FOLDER#default-hostname";
    };
    initExtra = ''
      fastfetch

      # Properly rebuild nix system by pushing it to git
      nix-fullrb() {
        if [ -z "$1" ]; then
          echo "Error : Commit message is missing."
          echo "Usage : nix-fullrb \"your commit message\""
          return 1
        fi
      
        local original_dir=$(pwd)
 
        cd LOCATION_OF_YOUR_CONFIG_FOLDER && \
        git add -A && \
        git commit -m "$1"
        #git push : uncomment this if your config folder is attached to a distnant repo
        sudo nixos-rebuild switch --flake .#default-hostname
  
        cd "$original_dir"
      }
    '';
  };
}

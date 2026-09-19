{ config, pkgs,inputs, ... }:

{
  imports = [ 
    #./hardware-configuration.nix Uncomment this once you have generated YOUR PROPER one. Pleaser refer to documentation
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ../../modules/desktop.nix
    inputs.mango.nixosModules.mango
  ];
  
  networking.hostName = "default-hostname";
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  users.users.default-user = {
    isNormalUser = true;
    description = "default-user";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Uncomment if you have a fingerprint reader
  #services.fprintd.enable = true;
  #security.pam.services.login.fprintAuth = true;
  #security.pam.services.sudo.fprintAuth = true;
  
  security.polkit.enable = true;

  # Give priority to some buses such as sound for better quality
  security.rtkit.enable = true;

  # Session Lock authorization : if another is used, change it here too
  security.pam.services.gtklock = {};

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };
  
  # Enabling flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    pamixer
    brightnessctl
    firefox
  ];

  # Update Firmware Tool
  #services.fwupd.enable = true;

  programs.mango.enable = true;
  programs.dconf.enable = true;
  services.blueman.enable = true;
}

{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    configurationLimit = 10;

    extraEntries = ''
      menuentry "UEFI Firmware Settings" --class efi {
        fwsetup
      }
    '';
  };

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Allows Nix to control screen brightness
  # Some configs doesnt need it, if you cant control your luminosity you 
  # may remove this line
  boot.kernelParams = [ "acpi_backlight=native" ];

  # Uncomment this part if you have an ecrypted partition and want auto sign with tpm2
  #boot.initrd.luks.devices."cryptroot" = {
  #  preLVM = true;
  #  crypttabExtraOpts = [ "tpm2-device=auto" ];
  #};
}

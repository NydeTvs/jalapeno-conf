{ config, pkgs, ... }:

{
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Uncomment this to enable TPM chip for auto decrypting
  #security.tpm2.enable = true;

  # Uncomment this if you have a rotating screen
  #hardware.sensor.iio.enable = true;

  # Enable sound with pulseaudio.
  services.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };

  # Pipewire is defaultlty disabled as my PC crashes on my config
  # BUT Pipewire is nowadays a standart so try enabling it 
  # If you encounter any crash try looking at journalctl while pipewire is running
  # It may spam the logs with error and then cause a buffer overflow in the system (as experienced with mine)
  # Despite these problems it is recommended to enable it as long as it doesnt make your PC crashing.
  services.pipewire.enable = false;

  # Enable Bluetooth with security settings
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Experimental = true;
        DiscoverableTimeout = "0";
        PairableTimeout = "0";
        JustWorksRepairing = "never";
        Disable = "network";
      };
      Policy = {
        # Do not reconnect automaticly
        AutoEnable = "false";
      };
    };
  };
}

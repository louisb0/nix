{pkgs, ...}: {
  security.rtkit.enable = true;

  hardware = {
    bluetooth.enable = true;
    bluetooth.settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };

    graphics.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    tlp.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bluez
    pulseaudio
    pulsemixer
  ];
}

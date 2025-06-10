{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/users.nix
    ./modules/hardware.nix
    ./modules/programs.nix
    ./modules/nix.nix
  ];

  environment.systemPackages = with pkgs; [
    file
    which
    psmisc
    tree

    git
    vim
    tmux
    alejandra

    wget
    curl

    zip
    unzip
    wl-clipboard

    dig
    lm_sensors
    strace
    usbutils
    pciutils
    ncdu
    tcpdump
  ];

  system.stateVersion = "25.05";
}

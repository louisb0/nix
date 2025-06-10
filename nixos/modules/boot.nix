{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.luks.devices."luks-9639ec31-3e69-4340-bf67-ab4143dc7b33".device = "/dev/disk/by-uuid/9639ec31-3e69-4340-bf67-ab4143dc7b33";
  };
}

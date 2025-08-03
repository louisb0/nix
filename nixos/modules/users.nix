{pkgs, ...}: {
  users.users.louis = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "wireshark"];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}

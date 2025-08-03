{pkgs, ...}: {
  security.polkit.enable = true;

  programs = {
    steam.enable = true;
    gnupg.agent.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["louis"];
    };
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        brave
      '';
      mode = "0755";
    };
  };

  nix.settings.trusted-users = ["root" "louis"];
}

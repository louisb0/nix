{
  security.polkit.enable = true;

  programs = {
    steam.enable = true;
    gnupg.agent.enable = true;

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

{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./modules/theme.nix

    ./modules/graphical/desktop.nix
    ./modules/graphical/kanshi.nix
    ./modules/graphical/rofi.nix
    ./modules/graphical/wlsunset.nix

    ./modules/development/nixvim
    ./modules/development/kitty.nix
    ./modules/development/environment.nix
  ];

  home = {
    username = "louis";
    homeDirectory = "/home/louis";
    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      mpv
      brave
      anki
    ];

    stateVersion = "25.05";
  };
}

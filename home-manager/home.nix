{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./modules/theme.nix

    ./modules/applications.nix

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

    stateVersion = "25.05";
  };
}

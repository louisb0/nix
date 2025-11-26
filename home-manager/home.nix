{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

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
      brightnessctl
      mpv
      brave
      anki
      spotify
      (rstudioWrapper.override {
        packages = with rPackages; [
          tidyverse
          ggplot2
          dplyr
          tidyr
          purrr
          tibble
          lubridate
          knitr
          rmarkdown
          interactions
        ];
      })
    ];

    stateVersion = "25.05";
  };
}

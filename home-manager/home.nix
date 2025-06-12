{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./modules/theme.nix
    ./modules/recording.nix

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

      # TODO: Temporary.
      pandoc
      texlive.combined.scheme-medium
      (rstudioWrapper.override {
        packages = with rPackages; [
          rmarkdown
          urca
          knitr
          tidyverse
          fpp3
          kableExtra
          bookdown
        ];
      })
    ];

    stateVersion = "25.05";
  };
}

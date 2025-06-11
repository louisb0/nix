{pkgs, ...}: {
  programs.obs-studio.enable = true;

  home.packages = with pkgs; [
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
}

{pkgs, ...}: {
  programs.mpv.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

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

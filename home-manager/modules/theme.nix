{
  lib,
  pkgs,
  ...
}: {
  options.theme = {
    colors = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
    font = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };

  config = {
    home.packages = with pkgs; [
      nerd-fonts.fira-code
    ];

    theme = {
      colors = {
        base = "#191724";
        surface = "#1f1d2e";
        overlay = "#26233a";
        muted = "#6e6a86";
        subtle = "#908caa";
        text = "#e0def4";
        love = "#eb6f92";
        gold = "#f6c177";
        rose = "#ebbcba";
        pine = "#3e8fb0";
        foam = "#9ccfd8";
        iris = "#c4a7e7";
        highlightLow = "#21202e";
        highlightMed = "#403d52";
        highlightHigh = "#524f67";
      };

      font = {
        name = "FiraCode Nerd Font";
      };
    };
  };
}

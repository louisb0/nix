{
  pkgs,
  lib,
  ...
}: let
  common = ["codespell"];

  linters = {
    nix = ["statix" "deadnix"];
  };
in {
  plugins.lint = {
    enable = true;
    lintersByFt =
      lib.mapAttrs
      (specific: common ++ specific)
      linters;
  };

  extraPackages = with pkgs; [
    statix
    codespell
  ];
}

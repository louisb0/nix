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
      (_: specific: common ++ specific)
      linters;
  };

  extraPackages = with pkgs; [
    statix
    deadnix
    codespell
  ];
}

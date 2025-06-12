{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = ["alejandra"];
        python = ["black"];
        markdown = ["dprint"];

        _ = ["trim_whitespace"];
      };

      format_on_save = {
        timeoutMs = 500;
      };
    };
  };

  extraPackages = with pkgs; [alejandra black dprint];
}

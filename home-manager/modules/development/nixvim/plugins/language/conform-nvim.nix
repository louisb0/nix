{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = ["alejandra"];
        python = ["black"];
        markdown = ["prettier"];
        cpp = ["clang_format"];

        _ = ["trim_whitespace"];
      };

      format_on_save = {
        timeoutMs = 500;
      };
    };
  };

  extraPackages = with pkgs; [alejandra black prettier clang-tools];
}

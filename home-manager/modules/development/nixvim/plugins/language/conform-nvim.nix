{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = ["alejandra"];
        python = ["black"];
        cpp = ["clang_format"];
        _ = ["trim_whitespace"];
      };

      format_on_save = {
        timeoutMs = 500;
      };
    };
  };

  keymaps = [
    {
      key = "<leader>fi";
      action = ":!iwyu_tool.py -p build % 2>&1 | fix_includes.py && clang-format -i %<CR>";
    }
  ];

  extraPackages = with pkgs; [alejandra black clang-tools include-what-you-use];
}

{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        performance.max_view_entries = 12;

        sources = [
          {
            name = "nvim_lsp";
            max_item_count = 8;
          }
          {
            name = "buffer";
            max_item_count = 4;
          }
          {name = "path";}
        ];

        duplicates = {
          buffer = 0;
          path = 0;
          nvim_lsp = 0;
        };

        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
  };
}

{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd = {enable = true;};
      nil_ls = {enable = true;};
      pylsp = {enable = true;};
    };

    onAttach = ''
      local bufnr = vim.api.nvim_get_current_buf()

      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
      end

      map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
      map('gD', require('fzf-lua').lsp_declarations, '[G]oto [D]eclaration')
      map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')

      map('<leader>ds', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols')
      map('<leader>dd', require('fzf-lua').diagnostics_document, '[D]ocument [D]iagnostics')

      map('<leader>ws', require('fzf-lua').lsp_workspace_symbols, '[W]orkspace [S]ymbols')
      map('<leader>wd', require('fzf-lua').diagnostics_workspace, '[W]orkspace [D]iagnostics')
    '';

    keymaps = {
      silent = true;
      lspBuf = {
        "<leader>rn" = {
          action = "rename";
          desc = "[R]e[n]ame";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "[C]ode [A]ction";
        };
        "K" = {
          action = "hover";
          desc = "Hover Documentation";
        };
      };
      diagnostic = {
        "[d" = {
          action = "goto_prev";
          desc = "Go to previous [D]iagnostic message";
        };
        "]d" = {
          action = "goto_next";
          desc = "Go to next [D]iagnostic message";
        };
      };
    };
  };
}

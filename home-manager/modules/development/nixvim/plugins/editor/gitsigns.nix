{
  plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add = {text = "│";};
        change = {text = "│";};
        delete = {text = "󰍵";};
        topdelete = {text = "‾";};
        changedelete = {text = "~";};
        untracked = {text = "│";};
      };
    };
  };

  keymaps = [
    # Navigation
    {
      mode = "n";
      key = "]c";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            require('gitsigns').nav_hunk('next')
          end
        end
      '';
      options.desc = "Go to next [c]hange";
    }
    {
      mode = "n";
      key = "[c";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            require('gitsigns').nav_hunk('prev')
          end
        end
      '';
      options.desc = "Go to previous [c]hange";
    }

    # Visual mode
    {
      mode = "v";
      key = "<leader>hs";
      action.__raw = ''
        function()
          require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
        end
      '';
      options.desc = "Git [H]unk [s]tage";
    }
    {
      mode = "v";
      key = "<leader>hr";
      action.__raw = ''
        function()
          require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')}
        end
      '';
      options.desc = "Git [H]unk [r]eset";
    }

    # Normal mode
    {
      mode = "n";
      key = "<leader>hs";
      action = "<cmd>Gitsigns stage_hunk<cr>";
      options.desc = "Git [H]unk [s]tage";
    }
    {
      mode = "n";
      key = "<leader>hr";
      action = "<cmd>Gitsigns reset_hunk<cr>";
      options.desc = "Git [H]unk [r]eset";
    }
    {
      mode = "n";
      key = "<leader>hS";
      action = "<cmd>Gitsigns stage_buffer<cr>";
      options.desc = "Git [H]unk [S]tage buffer";
    }
    {
      mode = "n";
      key = "<leader>hR";
      action = "<cmd>Gitsigns reset_buffer<cr>";
      options.desc = "Git [H]unk [R]eset buffer";
    }
    {
      mode = "n";
      key = "<leader>hu";
      action = "<cmd>Gitsigns undo_stage_hunk<cr>";
      options.desc = "Git [H]unk [u]ndo stage";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<cmd>Gitsigns preview_hunk<cr>";
      options.desc = "Git [H]unk [p]review";
    }
    {
      mode = "n";
      key = "<leader>hb";
      action = "<cmd>Gitsigns blame_line<cr>";
      options.desc = "Git [H]unk [b]lame line";
    }
  ];
}

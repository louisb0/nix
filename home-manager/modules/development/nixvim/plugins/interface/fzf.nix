{pkgs, ...}: {
  plugins.fzf-lua = {
    enable = true;
    settings = {
      files.cmd = "rg --files --hidden -g '!{node_modules,.git}'";
      grep.cmd = "rg --column --line-number --no-heading --color=always --smart-case";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<cmd>FzfLua buffers<cr>";
      options.desc = "[ ] Search buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>FzfLua blines<cr>";
      options.desc = "[/] Search current buffer";
    }
    {
      mode = "n";
      key = "<leader>sf";
      action = "<cmd>FzfLua files<cr>";
      options.desc = "[S]earch [F]iles";
    }
    {
      mode = "n";
      key = "<leader>sg";
      action = "<cmd>FzfLua live_grep<cr>";
      options.desc = "[S]earch by [G]rep";
    }
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>FzfLua resume<cr>";
      options.desc = "[S]earch [R]esume";
    }
  ];

  extraPackages = with pkgs; [ripgrep];
}

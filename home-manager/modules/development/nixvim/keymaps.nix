{
  keymaps = [
    # Clear highlights
    {
      mode = "n";
      key = "<C-c>";
      action = "<cmd>nohlsearch<CR>";
    }

    # Centered scrolling
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-b>";
      action = "<C-b>zz";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-f>";
      action = "<C-f>zz";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options = {
        desc = "Move focus to the left window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options = {
        desc = "Move focus to the right window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options = {
        desc = "Move focus to the lower window";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options = {
        desc = "Move focus to the upper window";
      };
    }
  ];
}

{
  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ap" = "@parameter.outer";
        "ip" = "@parameter.inner";
      };
    };
    move = {
      enable = true;
      gotoNextStart = {
        "]f" = "@function.outer";
        "]c" = "@class.outer";
      };
      gotoPreviousStart = {
        "[f" = "@function.outer";
        "[c" = "@class.outer";
      };
    };
  };
}

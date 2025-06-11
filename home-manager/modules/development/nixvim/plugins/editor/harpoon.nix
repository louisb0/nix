{
  plugins.harpoon = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action = "<cmd>lua require('harpoon'):list():add()<cr>";
      options = {
        desc = "[A]dd file to harpoon";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-e>";
      action = "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>";
      options = {
        desc = "Toggle harpoon menu";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>1";
      action = "<cmd>lua require('harpoon'):list():select(1)<cr>";
      options = {
        desc = "Harpoon file [1]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>2";
      action = "<cmd>lua require('harpoon'):list():select(2)<cr>";
      options = {
        desc = "Harpoon file [2]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>3";
      action = "<cmd>lua require('harpoon'):list():select(3)<cr>";
      options = {
        desc = "Harpoon file [3]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>4";
      action = "<cmd>lua require('harpoon'):list():select(4)<cr>";
      options = {
        desc = "Harpoon file [4]";
        silent = true;
      };
    }
  ];
}

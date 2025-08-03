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
    {
      mode = "n";
      key = "<leader>5";
      action = "<cmd>lua require('harpoon'):list():select(5)<cr>";
      options = {
        desc = "Harpoon file [5]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>6";
      action = "<cmd>lua require('harpoon'):list():select(6)<cr>";
      options = {
        desc = "Harpoon file [6]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>7";
      action = "<cmd>lua require('harpoon'):list():select(7)<cr>";
      options = {
        desc = "Harpoon file [7]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>8";
      action = "<cmd>lua require('harpoon'):list():select(8)<cr>";
      options = {
        desc = "Harpoon file [8]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>9";
      action = "<cmd>lua require('harpoon'):list():select(9)<cr>";
      options = {
        desc = "Harpoon file [9]";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>0";
      action = "<cmd>lua require('harpoon'):list():select(10)<cr>";
      options = {
        desc = "Harpoon file [10]";
        silent = true;
      };
    }
  ];
}

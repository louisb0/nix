{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };

  opts = {
    # Line numbers and display
    number = true;
    relativenumber = true;
    cursorline = true;
    signcolumn = "yes";
    scrolloff = 10;

    # Interface and interaction
    mouse = "a";
    showmode = false;
    clipboard = "unnamedplus";
    undofile = true;

    # Indentation and formatting
    breakindent = true;
    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;

    # Search behavior
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    inccommand = "split";

    # Performance and timing
    updatetime = 250;
    timeoutlen = 300;

    # Window behavior
    splitright = true;
    splitbelow = true;

    # Whitespace visualization
    list = true;
    listchars = "tab:» ,trail:·,nbsp:␣";
  };

  diagnostic.settings.float = {
    style = "minimal";
    border = "rounded";
    source = "always";
    header = "";
    prefix = "";
  };
}

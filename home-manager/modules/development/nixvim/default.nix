{
  programs.nixvim = {
    enable = true;
    imports = [
      ./settings.nix
      ./keymaps.nix
      ./autocmds.nix
      ./colorscheme.nix

      ./plugins/language/treesitter.nix
      ./plugins/language/treesitter-textobjects.nix
      ./plugins/language/lsp.nix
      ./plugins/language/cmp.nix
      ./plugins/language/conform-nvim.nix
      ./plugins/language/lint.nix

      ./plugins/editor/oil.nix
      ./plugins/editor/comment.nix
      ./plugins/editor/nvim-autopairs.nix
      ./plugins/editor/gitsigns.nix
      ./plugins/editor/harpoon.nix

      ./plugins/interface/fzf.nix
      ./plugins/interface/mini.nix
      ./plugins/interface/whichkey.nix
    ];
  };
}

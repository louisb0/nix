-- Nixvim's internal module table
-- Can be used to share code throughout init.lua
local _M = {}

-- Set up globals {{{
do
    local nixvim_globals = { have_nerd_font = true, mapleader = " ", maplocalleader = " " }

    for k, v in pairs(nixvim_globals) do
        vim.g[k] = v
    end
end
-- }}}

-- Set up options {{{
do
    local nixvim_options = {
        breakindent = true,
        clipboard = "unnamedplus",
        cursorline = true,
        expandtab = true,
        fillchars = "eob: ",
        hlsearch = true,
        ignorecase = true,
        inccommand = "split",
        list = true,
        listchars = "tab:» ,trail:·,nbsp:␣",
        mouse = "a",
        number = true,
        relativenumber = true,
        scrolloff = 10,
        shiftwidth = 4,
        showmode = false,
        signcolumn = "yes",
        smartcase = true,
        splitbelow = true,
        splitright = true,
        tabstop = 4,
        termguicolors = true,
        timeoutlen = 300,
        undofile = true,
        updatetime = 250,
    }

    for k, v in pairs(nixvim_options) do
        vim.opt[k] = v
    end
end
-- }}}

require("rose-pine").setup({ darkvariant = "moon", variant = "moon" })

vim.diagnostic.config({ float = { border = "rounded", header = "", prefix = "", source = "always", style = "minimal" } })

vim.cmd([[colorscheme rose-pine
]])

require("mini.ai").setup({})

require("mini.icons").setup({})

require("mini.statusline").setup({ use_icons = true })

require("mini.surround").setup({})

-- nvim-lspconfig {{{
do
    -- inlay hint

    local __lspServers = { { name = "pylsp" }, { name = "nil_ls" }, { name = "lua_ls" }, { name = "clangd" } }

    local __lspCapabilities = function()
        capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        return capabilities
    end

    local __setup = { capabilities = __lspCapabilities() }

    for i, server in ipairs(__lspServers) do
        local options = server.extraOptions

        if options == nil then
            options = __setup
        else
            options = vim.tbl_extend("keep", options, __setup)
        end

        require("lspconfig")[server.name].setup(options)
    end
end
-- }}}

local cmp = require("cmp")
cmp.setup({
    duplicates = { buffer = 0, nvim_lsp = 0, path = 0 },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    },
    performance = { max_view_entries = 12 },
    sources = { { max_item_count = 8, name = "nvim_lsp" }, { max_item_count = 4, name = "buffer" }, { name = "path" } },
})

require("which-key").setup({
    spec = {
        { "<leader>c", group = "[C]ode" },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
    },
})

vim.opt.runtimepath:prepend(vim.fs.joinpath(vim.fn.stdpath("data"), "site"))
require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
    parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
})

require("oil").setup({})

require("nvim-autopairs").setup({})

local __lint = require("lint")
__lint.linters_by_ft = { nix = { "codespell", "statix", "deadnix" } }

require("harpoon"):setup({})

require("gitsigns").setup({
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        changedelete = { text = "~" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        untracked = { text = "│" },
    },
})

require("fzf-lua").setup({
    files = { cmd = "rg --files --hidden -g '!{node_modules,.git}'" },
    grep = { cmd = "rg --column --line-number --no-heading --color=always --smart-case" },
})

require("conform").setup({
    format_on_save = { timeoutMs = 500 },
    formatters_by_ft = {
        _ = { "trim_whitespace" },
        cpp = { "clang_format" },
        nix = { "alejandra" },
        python = { "black" },
    },
})

require("Comment").setup({})

-- Set up keybinds {{{
do
    local __nixvim_binds = {
        {
            action = "<cmd>FzfLua buffers<cr>",
            key = "<leader><leader>",
            mode = "n",
            options = { desc = "[ ] Search buffers" },
        },
        {
            action = "<cmd>FzfLua blines<cr>",
            key = "<leader>/",
            mode = "n",
            options = { desc = "[/] Search current buffer" },
        },
        { action = "<cmd>FzfLua files<cr>", key = "<leader>sf", mode = "n", options = { desc = "[S]earch [F]iles" } },
        {
            action = "<cmd>FzfLua live_grep<cr>",
            key = "<leader>sg",
            mode = "n",
            options = { desc = "[S]earch by [G]rep" },
        },
        { action = "<cmd>FzfLua resume<cr>", key = "<leader>sr", mode = "n", options = { desc = "[S]earch [R]esume" } },
        {
            action = "<cmd>lua require('harpoon'):list():add()<cr>",
            key = "<leader>a",
            mode = "n",
            options = { desc = "[A]dd file to harpoon", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
            key = "<C-e>",
            mode = "n",
            options = { desc = "Toggle harpoon menu", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(1)<cr>",
            key = "<leader>1",
            mode = "n",
            options = { desc = "Harpoon file [1]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(2)<cr>",
            key = "<leader>2",
            mode = "n",
            options = { desc = "Harpoon file [2]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(3)<cr>",
            key = "<leader>3",
            mode = "n",
            options = { desc = "Harpoon file [3]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(4)<cr>",
            key = "<leader>4",
            mode = "n",
            options = { desc = "Harpoon file [4]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(5)<cr>",
            key = "<leader>5",
            mode = "n",
            options = { desc = "Harpoon file [5]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(6)<cr>",
            key = "<leader>6",
            mode = "n",
            options = { desc = "Harpoon file [6]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(7)<cr>",
            key = "<leader>7",
            mode = "n",
            options = { desc = "Harpoon file [7]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(8)<cr>",
            key = "<leader>8",
            mode = "n",
            options = { desc = "Harpoon file [8]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(9)<cr>",
            key = "<leader>9",
            mode = "n",
            options = { desc = "Harpoon file [9]", silent = true },
        },
        {
            action = "<cmd>lua require('harpoon'):list():select(10)<cr>",
            key = "<leader>0",
            mode = "n",
            options = { desc = "Harpoon file [10]", silent = true },
        },
        {
            action = function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    require("gitsigns").nav_hunk("next")
                end
            end,
            key = "]c",
            mode = "n",
            options = { desc = "Go to next [c]hange" },
        },
        {
            action = function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    require("gitsigns").nav_hunk("prev")
                end
            end,
            key = "[c",
            mode = "n",
            options = { desc = "Go to previous [c]hange" },
        },
        {
            action = function()
                require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            key = "<leader>hs",
            mode = "v",
            options = { desc = "Git [H]unk [s]tage" },
        },
        {
            action = function()
                require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            key = "<leader>hr",
            mode = "v",
            options = { desc = "Git [H]unk [r]eset" },
        },
        {
            action = "<cmd>Gitsigns stage_hunk<cr>",
            key = "<leader>hs",
            mode = "n",
            options = { desc = "Git [H]unk [s]tage" },
        },
        {
            action = "<cmd>Gitsigns reset_hunk<cr>",
            key = "<leader>hr",
            mode = "n",
            options = { desc = "Git [H]unk [r]eset" },
        },
        {
            action = "<cmd>Gitsigns stage_buffer<cr>",
            key = "<leader>hS",
            mode = "n",
            options = { desc = "Git [H]unk [S]tage buffer" },
        },
        {
            action = "<cmd>Gitsigns reset_buffer<cr>",
            key = "<leader>hR",
            mode = "n",
            options = { desc = "Git [H]unk [R]eset buffer" },
        },
        {
            action = "<cmd>Gitsigns undo_stage_hunk<cr>",
            key = "<leader>hu",
            mode = "n",
            options = { desc = "Git [H]unk [u]ndo stage" },
        },
        {
            action = "<cmd>Gitsigns preview_hunk<cr>",
            key = "<leader>hp",
            mode = "n",
            options = { desc = "Git [H]unk [p]review" },
        },
        {
            action = "<cmd>Gitsigns blame_line<cr>",
            key = "<leader>hb",
            mode = "n",
            options = { desc = "Git [H]unk [b]lame line" },
        },
        { action = ":Oil<CR>", key = "-", mode = "n", options = { desc = "Open parent directory", silent = true } },
        { action = "<cmd>nohlsearch<CR>", key = "<C-c>", mode = "n" },
        { action = "<C-u>zz", key = "<C-u>", mode = "n", options = { noremap = true, silent = true } },
        { action = "<C-d>zz", key = "<C-d>", mode = "n", options = { noremap = true, silent = true } },
        { action = "<C-b>zz", key = "<C-b>", mode = "n", options = { noremap = true, silent = true } },
        { action = "<C-f>zz", key = "<C-f>", mode = "n", options = { noremap = true, silent = true } },
        { action = "<C-w><C-h>", key = "<C-h>", mode = "n", options = { desc = "Move focus to the left window" } },
        { action = "<C-w><C-l>", key = "<C-l>", mode = "n", options = { desc = "Move focus to the right window" } },
        { action = "<C-w><C-j>", key = "<C-j>", mode = "n", options = { desc = "Move focus to the lower window" } },
        { action = "<C-w><C-k>", key = "<C-k>", mode = "n", options = { desc = "Move focus to the upper window" } },
    }
    for i, map in ipairs(__nixvim_binds) do
        vim.keymap.set(map.mode, map.key, map.action, map.options)
    end
end
-- }}}

local statusline = require("mini.statusline")
statusline.section_location = function()
    return "%2l:%-2v"
end

-- Set up autogroups {{
do
    local __nixvim_autogroups = {
        ["kickstart-highlight-yank"] = { clear = true },
        nixvim_binds_LspAttach = { clear = true },
        nixvim_lsp_on_attach = { clear = false },
    }

    for group_name, options in pairs(__nixvim_autogroups) do
        vim.api.nvim_create_augroup(group_name, options)
    end
end
-- }}
-- Set up autocommands {{
do
    local __nixvim_autocommands = {
        {
            callback = function()
                require("lint").try_lint()
            end,
            event = "BufWritePost",
        },
        {
            callback = function(event)
                do
                    -- client and bufnr are supplied to the builtin `on_attach` callback,
                    -- so make them available in scope for our global `onAttach` impl
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local bufnr = event.buf
                    local bufnr = vim.api.nvim_get_current_buf()

                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
                    end

                    map("gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")
                    map("gD", require("fzf-lua").lsp_declarations, "[G]oto [D]eclaration")
                    map("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")

                    map("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")
                    map("<leader>dd", require("fzf-lua").diagnostics_document, "[D]ocument [D]iagnostics")

                    map("<leader>ws", require("fzf-lua").lsp_workspace_symbols, "[W]orkspace [S]ymbols")
                    map("<leader>wd", require("fzf-lua").diagnostics_workspace, "[W]orkspace [D]iagnostics")
                end
            end,
            desc = "Run LSP onAttach",
            event = "LspAttach",
            group = "nixvim_lsp_on_attach",
        },
        {
            callback = function(args)
                do
                    local __nixvim_binds = {
                        {
                            action = vim.diagnostic.goto_prev,
                            key = "[d",
                            mode = "n",
                            options = { desc = "Go to previous [D]iagnostic message", silent = true },
                        },
                        {
                            action = vim.diagnostic.goto_next,
                            key = "]d",
                            mode = "n",
                            options = { desc = "Go to next [D]iagnostic message", silent = true },
                        },
                        {
                            action = vim.lsp.buf.code_action,
                            key = "<leader>ca",
                            mode = "n",
                            options = { desc = "[C]ode [A]ction", silent = true },
                        },
                        {
                            action = vim.lsp.buf.rename,
                            key = "<leader>rn",
                            mode = "n",
                            options = { desc = "[R]e[n]ame", silent = true },
                        },
                        {
                            action = vim.lsp.buf.hover,
                            key = "K",
                            mode = "n",
                            options = { desc = "Hover Documentation", silent = true },
                        },
                    }

                    for i, map in ipairs(__nixvim_binds) do
                        local options = vim.tbl_extend("keep", map.options or {}, { buffer = args.buf })
                        vim.keymap.set(map.mode, map.key, map.action, options)
                    end
                end
            end,
            desc = "Load keymaps for LspAttach",
            event = "LspAttach",
            group = "nixvim_binds_LspAttach",
        },
        {
            callback = function()
                vim.highlight.on_yank()
            end,
            desc = "Highlight when yanking (copying) text",
            event = "TextYankPost",
            group = "kickstart-highlight-yank",
        },
    }

    for _, autocmd in ipairs(__nixvim_autocommands) do
        vim.api.nvim_create_autocmd(autocmd.event, {
            group = autocmd.group,
            pattern = autocmd.pattern,
            buffer = autocmd.buffer,
            desc = autocmd.desc,
            callback = autocmd.callback,
            command = autocmd.command,
            once = autocmd.once,
            nested = autocmd.nested,
        })
    end
end
-- }}

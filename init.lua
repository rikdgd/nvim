require("keymaps")

-- INSTALL THE "lazy.nvim" PACKAGE MANAGER:
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--single-branch",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)



-- PLUGIN SETUP USING "Lazy":
require("lazy").setup({
    {
        "Shatur/neovim-ayu",
        name     = "ayu",
        lazy     = false,
        priority = 1000,
        config   = function()
        require("ayu").setup({
            mirage   = true,
            terminal = true,       -- let terminal colors inherit
            overrides = {},
        })
        vim.cmd("colorscheme ayu")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",  -- optional, for file icons
        },
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },  -- load only when you call these
        config = function()
            -- basic setup with defaults:
            require("nvim-tree").setup({
            hijack_cursor = true,
            hijack_netrw   = true,
            update_focused_file = {
                enable      = true,
                update_cwd  = true,
            },
            renderer = {
                icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false,
                },
                },
            },
            view = {
                width = 40,
                side  = "left",
            },
            })
            
        end,
    },

    "nvim-treesitter/nvim-treesitter",
    {
        "windwp/nvim-autopairs",
        lazy = false,
        config = function()
            require("nvim-autopairs").setup({
            check_ts = true,
            disable_filetype = { "TelescopePrompt", "vim" },
            fast_wrap = {},           -- enable <M-e> wrapping
            })
        end,
    },
    "neovim/nvim-lspconfig",
    {
        "numToStr/Comment.nvim",
        opts = {},
        event = "BufReadPre",
    },
    
}, {
    defaults = {
        version = "*",
    },
    install = {
        missing = true,     -- auto install missing plugins
    }
})



-- VIM EDITOR SETTINGS:
local opt = vim.opt

opt.number = true

-- searching related
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

-- tab & indentation settings
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

vim.cmd([[syntax on]])
vim.cmd([[filetype plugin indent on]])

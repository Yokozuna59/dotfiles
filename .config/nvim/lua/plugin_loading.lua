local vim = vim
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

-- check that packer.nvim is installed and, if not, install it
local function ensure_packer()
    local install_path = fn.stdpath("data")
        .. "/site/pack/packer/start/packer.nvim"
    if fn.isdirectory(install_path) ~= 0 then
        fn.system({
            "git",
            "clone",
            "--branch=main",
            "--depth=1",
            "--filter=blob:none",
            "--quiet",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })

        cmd("packadd packer.nvim")
        return true
    end
    return false
end

local is_bootstrap = ensure_packer()

-- automatically source and re-compile packer whenever this file is saved
local packer_group = api.nvim_create_augroup("Packer", { clear = true })
api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | silent! LspStop "
        .. "| silent! LspStart | PackerCompile",
    group = packer_group,
    pattern = fn.expand(os.getenv("MYVIMRC")),
})

local packer = require("packer")
packer.startup(function(use)
    -- packer manager
    use("wbthomason/packer.nvim")

    -- configurations for nvim LSP
    use("williamboman/nvim-lsp-installer")
    use("neovim/nvim-lspconfig")

    -- dart & flutter configurations
    use("dart-lang/dart-vim-plugin")
    use("natebosch/vim-lsc")
    use("natebosch/vim-lsc-dart")
    use("thosakwe/vim-flutter")

    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
        config = function()
            require("plugin.lauline")
        end,
    })

    use({
        "ckipp01/stylua-nvim",
        run = "cargo install stylua",
    })
    use("airblade/vim-rooter")
    use("nvim-tree/nvim-tree.lua")
    use("lukas-reineke/lsp-format.nvim")
    use({
        "junegunn/fzf",
        run = "./install --bin",
    })
    use({
        "ibhagwan/fzf-lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
    })
    use("bfredl/nvim-ipy")
    use("wakatime/vim-wakatime")
    use("gpanders/editorconfig.nvim")
    use("nvim-telescope/telescope.nvim")

    -- an async linter plugin for nvim to the built-in LSP support
    use({
        "mfussenegger/nvim-lint",
        ft = {
            "c",
            "cpp",
            "python",
            "tex",
            "lua",
            "javascript",
            "typescript",
            "html",
            "css",
        },
        config = function()
            require("plugin.lint")
        end,
    })

    -- pretty diagnostics, references, telescope results, quickfix and location list to help you solve errors
    use({
        "folke/trouble.nvim",
        event = "CmdUndefined TroubleToggle",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugin.trouble_diagnostics")
        end,
    })

    if is_bootstrap then
        packer.sync()
    end
end)

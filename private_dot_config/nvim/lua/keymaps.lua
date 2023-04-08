local vim = vim
local g = vim.g
-- local keymap = vim.keymap

local function map(mode, keys, action, opts)
    vim.keymap.set(
        mode,
        keys,
        action,
        opts or { silent = true, noremap = true }
    )
end

g.mapleader = " "
g.maplocalleader = " "

-- copy to system clipbaord
-- map("n", "<leader>y", '"+y')
-- map("v", "<leader>y", '"+y')
-- map("n", "<leader>Y", '"+Y')

-- map("n", "<S-F2>", "")
-- map("v", "<S-F2>", "")
-- map("i", "<S-F2>", "")

map({ "n", "v", "i" }, "<C-p>", ":Files<CR>")

-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<c-P>",
-- 	"<cmd>lua require('fzf-lua').files()<CR>",
-- 	{ noremap = true, silent = true }
-- )

local vim = vim
local cmd = vim.cmd

local HOME = os.getenv("HOME")
cmd("source " .. HOME .. "/.config/nvim/not-init.vim")

-- load base configs
require("base")

-- load packer
require("packer")

-- load theme
require("theme")

-- load keymaps
require("keymaps")

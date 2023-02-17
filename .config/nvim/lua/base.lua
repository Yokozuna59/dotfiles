local vim = vim
local opt = vim.opt

-- set encoding
opt.encoding = "utf-8"

-- line numbering
opt.number = true

-- enable mouse click
opt.mouse = "a"

-- highlight on search
opt.hlsearch = true

-- case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- hide the vim mode, since it is shown in the lualine
opt.showmode = false

-- set an 80 column border
opt.cc = 80

-- using system clipboard
opt.clipbaord = "unnamedplus"

-- tabs and spaces handling
opt.expandtab = true -- converts tabs to white space
opt.tabstop = 4 -- number of columns occupied by a tab
opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> does the right thing
opt.shiftwidth = 4 -- width for autoindents

-- backup and undo
opt.swapfile = false -- disable create swapfile
opt.backup = false
opt.undofile = true -- save undo history

-- set a shell
opt.shell = "/usr/bin/bash"

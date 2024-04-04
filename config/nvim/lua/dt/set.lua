local g = vim.g
local o = vim.o
local opt = vim.opt

-- Map <Leader> to space key
g.mapleader = " "
g.maplocalleader = " "

o.termguicolors = true

-- Decrease update time
o.timeoutlen = 250
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 6
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true

-- unlimited undo
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 0 -- if zero, tabstop value is used
o.softtabstop = -1 -- if negative, shiftwidth value is used
o.list = true

-- Share neovim and OS clipboard
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer spliting
o.splitright = true
o.splitbelow = true

-- Use mouse in all modes
opt.mouse = "a"


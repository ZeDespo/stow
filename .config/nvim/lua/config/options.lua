-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.colorcolumn = "88"
opt.autoindent = true
opt.wrap = true
opt.scrolloff = 15
opt.shell = "/bin/zsh"
opt.winbar = "%=%m %f"

vim.g.python3_host_prog = "$VIRTUAL_ENV/bin/python"

-- Clipboard yank
opt.clipboard = "unnamedplus"

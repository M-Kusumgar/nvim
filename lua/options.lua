vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.diagnostic.config({
  virtual_text = true,
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<Leader>ww", "<C-w>w")
vim.keymap.set("n", "<Leader>hh", "<C-w>h")
vim.keymap.set("n", "<Leader>jj", "<C-w>j")
vim.keymap.set("n", "<Leader>kk", "<C-w>k")
vim.keymap.set("n", "<Leader>ll", "<C-w>l")
vim.keymap.set("n", "<Leader>vs", "<C-w>v")
vim.keymap.set("n", "<Leader>sp", "<C-w>s")
vim.keymap.set("n", "<Leader>tt", ":term<CR>")
vim.g.material_style = "deep ocean"

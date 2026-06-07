-- options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.diagnostic.config({ virtual_text = false })
vim.g.material_style = "deep ocean"

vim.opt.scrolloff = 5

vim.o.showtabline = 2
vim.opt.showmode = false
vim.opt.laststatus = 0

vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize,buffers'



-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<Leader>tt", ":term<CR>i")



-- copy and paste
vim.opt.clipboard:append({'unnamedplus'})
vim.keymap.set("v", "y", "ygv<Esc>")
vim.keymap.set("v", "p", "gp")
vim.keymap.set("n", "p", "gp")



-- window management
local hjkl_directions = { "h", "j", "k", "l" }
local arrow_directions = { "<Left>", "<Down>", "<Up>", "<Right>" }
local window_split_cmds = { "<C-w>v<C-w>h", "<C-w>s", "<C-w>s<C-w>k", "<C-w>v" }

for _, directions in ipairs({ arrow_directions, hjkl_directions }) do
  for i, direction in ipairs(directions) do
    vim.keymap.set("n",
                   string.format("<Leader>%s", direction),
                   string.format("<C-w>%s", hjkl_directions[i]))
    vim.keymap.set("n",
                   string.format("<Leader>t%s", direction),
                   string.format("%s:term<CR>i", window_split_cmds[i]))
    vim.keymap.set("n",
                   string.format("<Leader>n%s", direction),
                   window_split_cmds[i])
    vim.keymap.set("n",
                   string.format("<Leader>f%s", direction),
                   string.format("<C-w>%s", string.upper(hjkl_directions[i])))
  end
end



-- tab/buffer cycling
vim.keymap.set("n", "<C-Tab>", ":b#<CR>")
vim.keymap.set("n", "<Leader><Tab>", ":Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>tj", ":Tabby jump_to_tab<CR>")
vim.keymap.set("n", "<Leader>tp", ":tabprevious<CR>")
vim.keymap.set("n", "<Leader>tn", ":tabnext<CR>")
vim.keymap.set("n", "<Leader>tc", ":tabnew<CR>")
vim.keymap.set("n", "<Leader>tx", ":tabclose<CR>")



-- sessions load
vim.keymap.set("n", "<Leader>sl", ":SessionsLoad<CR>")



-- errors
vim.keymap.set("n", "<Leader>eh", ":lua vim.diagnostic.config({ underline = false, signs = false })<CR>")
vim.keymap.set("n", "<Leader>wn", ":lua vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.WARN })<CR>")
vim.keymap.set("n", "<Leader>wp", ":lua vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.WARN })<CR>")
vim.keymap.set("n", "<Leader>es", ":lua vim.diagnostic.config({ underline = true, signs = true })<CR>")
vim.keymap.set("n", "<Leader>ce", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<Leader>en", ":lua vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })<CR>")
vim.keymap.set("n", "<Leader>ep", ":lua vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })<CR>")
vim.keymap.set("n", "<Leader>wn", ":lua vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.WARN })<CR>")
vim.keymap.set("n", "<Leader>wp", ":lua vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.WARN })<CR>")
vim.keymap.set("n", "<Leader>in", ":lua vim.diagnostic.jump({ count = 1, float = true, severity = { max = vim.diagnostic.severity.INFO } })<CR>")
vim.keymap.set("n", "<Leader>ip", ":lua vim.diagnostic.jump({ count = -1, float = true, severity = { max = vim.diagnostic.severity.INFO } })<CR>")



-- code motion
vim.keymap.set("n", "<A-Up>", "dd<Up><Up>p==")
vim.keymap.set("n", "<A-k>", "dd<Up><Up>p==")
vim.keymap.set("n", "<A-Down>", "ddp==")
vim.keymap.set("n", "<A-j>", "ddp==")
vim.keymap.set("v", "<A-Up>", "d<Up><Up>p'[v']='[V']")
vim.keymap.set("v", "<A-k>", "d<Up><Up>p'[v']='[V']")
vim.keymap.set("v", "<A-Down>", "dp'[v']='[V']")
vim.keymap.set("v", "<A-j>", "dp'[v']='[V']")



-- telescope utility
vim.keymap.set("n", "<Leader>fr", ":Telescope resume<CR>")



-- colorscheme
vim.keymap.set("n", "<Leader>cd", ":colorscheme material<CR>")
vim.keymap.set("n", "<Leader>cl", ":colorscheme catppuccin<CR>")



vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/mkusumga/.nvm/versions/node/v22.17.0/lib/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

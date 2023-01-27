vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-space>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- The issue with these bindings is that a lonely <ESC> takes a second to process. The solution?
-- Don't press the Escape key :)
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("i", "<A-j>", "<ESC><C-w>j")
vim.keymap.set("i", "<A-k>", "<ESC><C-w>k")
vim.keymap.set("i", "<A-h>", "<ESC><C-w>h")
vim.keymap.set("i", "<A-l>", "<ESC><C-w>l")

vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-W>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-W>k")
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-W>h")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-W>l")
vim.keymap.set("t", "<C-W>v", "<C-\\><C-N><C-W>v")
vim.keymap.set("t", "<C-space>", "<C-\\><C-N>")

vim.keymap.set("n", "<A-n>", ":cn<CR>")
vim.keymap.set("n", "<A-p>", ":cp<CR>")

-- Fix dirty output when doing e.g., shift-enter in terminal mode.
vim.keymap.set("t", "<S-Backspace>", "<Backspace>")
vim.keymap.set("t", "<C-Backspace>", "<Backspace>")
vim.keymap.set("t", "<S-Enter>", "<Enter>")
vim.keymap.set("t", "<C-Enter>", "<Enter>")

vim.keymap.set("n", "<BS>", "X")

-- go to beginning/end of line with B/E
vim.keymap.set("n", "E", "$")
vim.keymap.set("n", "B", "^")

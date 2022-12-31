vim.opt.guicursor = ""

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = '+1'
vim.opt.textwidth = 100

vim.g.mapleader = " "

vim.cmd [[
    " make neovim terminals behave: go into insert mode by default, remove the line
    " number column, and close immediately when the corresponding process exits
    autocmd BufWinEnter term://* startinsert
    autocmd WinEnter term://* startinsert
    autocmd TermOpen * set nonumber
    autocmd TermOpen * startinsert
    au TermClose * call feedkeys("\<CR>")

    if filereadable("Cargo.toml")
        " F1 for build, F2 for test (in Rust)
        compiler cargo
        nnoremap <F1> :make build<CR>
        nnoremap <F2> :make test<CR>
        nnoremap <F3> :make fmt<CR>
        nnoremap <F4> :make cranky<CR>
    endif
]]

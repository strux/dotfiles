vim.g.mapleader = ","
vim.keymap.set("n", "<leader>d", ":NvimTreeToggle<cr>")

vim.keymap.set('i', '<C-n>', 'pumvisible() ? "<Down>" : "<C-n>"', {noremap = true, silent = true, expr = true})
vim.keymap.set('i', '<C-p>', 'pumvisible() ? "<Up>" : "<C-p>"', {noremap = true, silent = true, expr = true})

-- Popup navigation
-- inoremap <expr> <c-j> pumvisible()?"\<Down>":"\<c-j>"

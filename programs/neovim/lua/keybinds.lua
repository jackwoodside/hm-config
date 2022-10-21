local function map(m, k, v)
        vim.keymap.set(m, k, v, { silent = true })
end

-- Change leader to ,
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Clear search highlighting
map('n', '<esc>', '<CMD>nohlsearch<CR>')

-- Correct spelling
map('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

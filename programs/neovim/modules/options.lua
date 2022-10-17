local set = vim.opt
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

set.nocompatible = true
set.encoding = 'utf-8'
set.t_Co = 256
set.signcolumn = 'yes'
set.number = 'relativenumber'
set.hidden = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.hlsearch = true
set.autoindent = true
set.expandtab = true
set.softtabstop = 4
set.cmdheight = 1
set.shortmess = 'Fc'
set.showmatch = true
set.matchtime = 2
set.linebreak = true
set.scrolloff = 6
set.sidescrolloff = 6
set.wildmenu = true
set.gdefault = true
set.filetype = 'indent plugin on'
set.backspace = 'indent,eol,start'
set.syntax = 'on'
set.clipboard = 'unnamedplus'
set.splitbelow = true
set.splitright = true

-- Clear search highlighting
map('n', '<esc>', ':nohlsearch<CR>')

-- No autocomment on newline
vim.api.nvim_create_autocommand('NoAutoComment', {
        command = 'autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
})
-- Remove trailing whitespace and newlines
vim.api.nvim_create_autocommand('TrailingWhitespace', {
        command = 'autocmd BufWritePre * silent %s/\s\+$//e | norm! ``'
})
vim.api.nvim_create_autocommand('TrailingNewline', {
        command = 'autocmd BufWritePre * silent %s/\n\+\%$//e | norm! ``'
})

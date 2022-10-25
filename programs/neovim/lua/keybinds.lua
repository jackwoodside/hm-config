local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Change leader to ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Clear search highlighting
map("n", "<esc>", "<CMD>nohlsearch<CR>")

-- Split paragraphs into sentences
map("n", "<C-s>", "<CMD>:s/\\. /.\\r<CR><CMD>nohlsearch<CR>")

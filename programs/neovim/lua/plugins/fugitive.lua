local function map(k, v)
	vim.keymap.set("n", k, v, { silent = true })
end

map("<leader>ga", ":G add %:r.*<CR>")
map("<leader>gc", ":G commit<CR>")
map("<leader>go", ":G pull<CR>")
map("<leader>gp", ":G push<CR>")

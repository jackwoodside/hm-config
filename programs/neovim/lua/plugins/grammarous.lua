local function map(k, v)
	vim.keymap.set("n", k, v, { silent = true })
end

map("<leader>rc", ":GrammarousCheck<CR>")
map("<leader>rr", ":GrammarousReset<CR>")
map("<leader>rf", "<Plug>(grammarous-fixit)")
map("<leader>rd", "<Plug>(grammarous-remove-error)")
map("<leader>rn", "<Plug>(grammarous-move-to-next-error)")
map("<leader>rp", "<Plug>(grammarous-move-to-previous-error)")

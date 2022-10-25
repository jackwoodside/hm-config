local ac = vim.api.nvim_create_autocmd

-- Highlight on yank
ac("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
	end,
})

-- Clear extra latex files
ac("VimLeave", { pattern = { "*.tex" }, command = [[ !tex-clear % ]] })

-- Start git commits in insert mode
ac("FileType", { pattern = { "gitcommit", "gitrebase" }, command = [[ startinsert | 1 ]] })

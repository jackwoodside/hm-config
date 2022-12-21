vim.cmd([[highlight IndentBlanklineIndent1 guifg=#ffffff gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#f38ba8 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#fab387 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#f9e2af gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#a6e3a1 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#89b4fa gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#f5c2e7 gui=nocombine]])

require("indent_blankline").setup({
	show_first_indent_level = false,
	show_current_context = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
	},
})

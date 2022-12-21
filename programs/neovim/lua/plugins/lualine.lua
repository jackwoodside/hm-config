-- FIX: should only run texcount when the buffer is written
local function wordcount()
	if vim.fn.expand("%:e") == "tex" then
		local output = io.popen("texcount %:t | awk 'FNR==3 {print $NF}'")
		---@diagnostic disable-next-line: need-check-nil
		local words = output:read("*a")
		---@diagnostic disable-next-line: need-check-nil
		output:close()
		return words
	else
		return ""
	end
end
require("lualine").setup({
	options = {
		theme = "catppuccin",
		component_separators = "",
		section_separators = "",
		icons_enabled = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(m)
					return m:sub(1, 3)
				end,
				color = { gui = "bold" },
			},
		},
		lualine_b = {
			{ "diff", colored = false },
			{ "branch" },
		},
		lualine_c = {
			{ "filename", file_status = true },
			{ "diagnostics" },
		},
		lualine_x = { wordcount },
		lualine_y = { "progress" },
		lualine_z = {
			{ "location", color = { gui = "bold" } },
		},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				buffers_color = { active = "lualine_b_normal" },
				max_length = vim.o.columns,
				symbols = {
					modified = " [+]",
					alternate_file = "",
				},
			},
		},
	},
	extensions = { "quickfix", "nvim-tree" },
})

local nls = require("null-ls")
local U = require("plugins.lsp.utils")

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

-- Configuring null-ls
nls.setup({
	sources = {
		-- Formatting
		fmt.trim_whitespace.with({
			filetypes = { "text", "zsh", "toml", "make", "conf", "tmux" },
		}),
		fmt.prettierd,
		fmt.eslint_d,
		fmt.rustfmt,
		fmt.stylua,
		fmt.gofmt,
		fmt.zigfmt,
		fmt.shfmt.with({
			extra_args = { "-i", 4, "-ci", "-sr" },
		}),
		-- Diagnostics
		dgn.eslint_d,
		dgn.shellcheck,
		dgn.luacheck.with({
			extra_args = { "--globals", "vim", "--std", "luajit" },
		}),
		-- Code actions
		cda.eslint_d,
		cda.shellcheck,
	},
	on_attach = function(client, bufnr)
		U.fmt_on_save(client, bufnr)
		U.mappings(bufnr)
	end,
})

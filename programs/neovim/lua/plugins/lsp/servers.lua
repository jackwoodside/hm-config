local lsp = require("lspconfig")
local U = require("plugins.lsp.utils")

---Common perf related flags for all the LSP servers
local flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}

---Common capabilities including lsp snippets and autocompletion
local capabilities = U.capabilities()

---Common `on_attach` function for LSP servers
local function on_attach(client, buf)
	U.disable_formatting(client)
	U.mappings(buf)
end

-- Disable LSP logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

-- Configuring native diagnostics
vim.diagnostic.config({
	virtual_text = {
		source = "always",
	},
	float = {
		source = "always",
	},
})

-- Configured servers
-- LaTeX
local words = {}
local path = "/home/jack/.config/nvim/lua/plugins/lsp/words.txt"
for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end

lsp.ltex.setup({
	flags = flags,
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "markdown", "plaintex", "tex" },
	settings = {
		ltex = {
			language = "en-AU",
			dictionary = {
				["en-AU"] = words,
			},
		},
	},
})
lsp.texlab.setup({
	flags = flags,
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		texlab = {
			chktex = {
				onOpenAndSave = true,
			},
			diagnostics = {
				ignoredPatterns = { "Underfull", "Overfull", "Wrong length of dash" },
			},
		},
	},
})

-- Lua
lsp.sumneko_lua.setup({
	flags = flags,
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			completion = {
				enable = true,
				showWord = "Disable",
			},
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = { os.getenv("VIMRUNTIME") },
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Unconfigured servers
local servers = {
	"clangd", -- c++
	"fortls", -- fortran
	"julials", -- julia
	"jedi_language_server", -- python
}

for _, server in ipairs(servers) do
	lsp[server].setup({
		flags = flags,
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

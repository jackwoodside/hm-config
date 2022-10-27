-- Neovim settings, bindings and autocmds
require("settings")
require("keybinds")
require("autocmds")
-- Plugin settings and bindings
require("plugins")

--Pretty print lua table
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end

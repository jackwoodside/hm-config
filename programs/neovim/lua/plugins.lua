return require("packer").startup({
	function(use)
		-- Package manager
		use("wbthomason/packer.nvim")

		-- Dependencies
		use("nvim-lua/plenary.nvim")
		use("MunifTanjim/nui.nvim")
		use("dstein64/vim-startuptime")

		-- UI
		use({
			"echasnovski/mini.starter",
			config = function()
				require("plugins.starter")
			end,
		})

		use({
			"rcarriga/nvim-notify",
			after = "catppuccin",
			config = function()
				require("plugins.notify")
			end,
		})

		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup()
			end,
		})

		use({
			"catppuccin/nvim",
			as = "catppuccin",
			config = function()
				require("plugins.catppuccin")
				vim.api.nvim_command("colorscheme catppuccin")
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			event = "BufEnter",
			config = function()
				require("plugins.lualine")
			end,
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("plugins.indentline")
			end,
		})

		use({
			"norcalli/nvim-colorizer.lua",
			event = "CursorHold",
			config = function()
				require("colorizer").setup()
			end,
		})

		use({
			"lewis6991/gitsigns.nvim",
			after = "catppuccin",
			event = "BufRead",
			config = function()
				require("plugins.gitsigns")
			end,
		})

		use({
			"tpope/vim-fugitive",
			config = function()
				require("plugins.fugitive")
			end,
		})

		use({
			"numToStr/FTerm.nvim",
			event = "CursorHold",
			config = function()
				require("plugins.fterm")
			end,
		})

		use({
			"folke/noice.nvim",
			after = { "nui.nvim", "catppuccin" },
			event = "VimEnter",
			config = function()
				require("noice").setup()
			end,
		})

		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup()
			end,
		})

		-- Syntax highlighting
		use({
			{
				"nvim-treesitter/nvim-treesitter",
				after = "catppuccin",
				event = "CursorHold",
				run = ":TSUpdate",
				config = function()
					require("plugins.treesitter")
				end,
			},
			{ "nvim-treesitter/playground", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
			{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
		})

		-- Navigation
		use({
			"kyazdani42/nvim-tree.lua",
			after = "catppuccin",
			event = "CursorHold",
			config = function()
				require("plugins.nvim-tree")
			end,
		})

		use({
			{
				"nvim-telescope/telescope.nvim",
				after = "catppuccin",
				event = "CursorHold",
				config = function()
					require("plugins.telescope")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				after = "telescope.nvim",
				run = "make",
				config = function()
					---@diagnostic disable-next-line: different-requires
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"nvim-telescope/telescope-symbols.nvim",
				after = "telescope.nvim",
			},
		})

		use({
			"numToStr/Navigator.nvim",
			event = "CursorHold",
			config = function()
				require("plugins.navigator")
			end,
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			event = "BufRead",
			config = function()
				require("plugins.lsp.servers")
			end,
			requires = {
				{ "hrsh7th/cmp-nvim-lsp" },
			},
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("plugins.lsp.null-ls")
			end,
		})

		use({
			{
				"hrsh7th/nvim-cmp",
				event = "InsertEnter",
				config = function()
					require("plugins.lsp.nvim-cmp")
				end,
				requires = {
					{
						"L3MON4D3/LuaSnip",
						event = "InsertEnter",
						config = function()
							---@diagnostic disable-next-line: different-requires
							require("plugins.lsp.luasnip")
						end,
					},
				},
			},
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		})

		use({
			"windwp/nvim-autopairs",
			event = "InsertCharPre",
			after = "nvim-cmp",
			config = function()
				require("plugins.pairs")
			end,
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

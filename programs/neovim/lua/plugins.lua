-- Automatically compile plugins whenever this file is updated
vim.api.nvim_create_autocmd('BufWritePost', {
        group = vim.api.nvim_crate_augroup('PACKER', { clear = true}),
        pattern = 'plugins.lua'
        command = 'source <afile> | PackerCompile'
})

return require('packer').startup({
        function(use)
                -- Package manager
                use('wbthomason/packer.nvim')

                -- Dependencies
                use('nvim-lua/plenary.nvim')

                -- UI
                use({
                        'kyazdani42/nvim-web-devicons',
                        config = function()
                                require('nvim.web-devicons').setup()
                        end,
                })

                use({
                        'catppuccin/nvim',
                        as = 'catppuccin',
                        config = function()
                                vim.g.catppuccin_flavour = 'mocha'
                                require('catppuccin').setup()
                                vim.api.nvim_command 'colorscheme catppuccin'
                        end,
                })

                use({
                {
                        'nvim-lualine/lualine.nvim',
                        event = 'BufEnter',
                        config = function()
                                require('plugins.lualine')
                        end,
                },
                {
                        'j-hui/fidget.nvim',
                        after = 'lualine.nvim',
                        config = function()
                                require('fidget').setup()
                        end,
                },
                })

                use({
                        'luka-reineke/indent-blankline.nvim',
                        event = 'BufRead',
                        config = function()
                                require('plugins.indentline')
                        end,
                })

                use({
                        'norcalli/nvim-colorizer.lua',
                        event = 'CursorHold',
                        config = function()
                                require('colorizer').setup()
                        end,
                })

                use({
                        'lewis6991/gitsigns.nvim',
                        event = 'BufRead',
                        config = function()
                                require('plugins.gitsigns')
                        end,
                })

                -- Syntax highlighting
                use({
                {
                        'nvim-treesitter/nvim-treesitter',
                        event = 'CursorHold',
                        run = ':TSUpdate',
                        config = function()
                                require('plugins.treesitter')
                        end,
                },
                { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
                { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
                { 'nvim-treesitter/nvim-treesitter/refactor', after = 'nvim-treesitter' },
                { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
                { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'},
                })

                -- Navigation
                use({
                        'kyazdani42/nvim-tree.lua',
                        event = 'CursorHold',
                        config = function()
                                require('plugins.nvim-tree')
                        end,
                })

                use({
                {
                        'nvim-telescope/telescope.nvim',
                        event = 'CursorHold',
                        config = function()
                                require('plugins.telescope')
                        end,
                },
                {
                        'nvim-telescope/telescope-fzf-native.nvim',
                        after = 'telescope.nvim',
                        run = 'make',
                        config = function()
                                require('telescope').load_extension('fzf')
                        end,
                },
                {
                        'nvim-telescope/telescope-symbols.nvim',
                        after = 'telescope.nvim',
                },
                })

                use({
                        'numToStr/Navigator.nvim',
                        event = 'CursorHold',
                        config = function()
                                require('plugins.navigator')
                        end,
                })


        end,
        config = {
                display = {
                        open_fn = function()
                                return require('packer.util').float({ border = 'single' })
                        end,
                },
        },
})

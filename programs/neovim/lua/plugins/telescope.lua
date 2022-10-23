local actions = require('telescope.actions')
local finders = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        prompt_prefix = ' ❯ ',
        initial_mode = 'insert',
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top',
        },
        mappings = {
            i = {
                ['<ESC>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
                ['<C-s>'] = actions.send_selected_to_qflist,
                ['<C-q>'] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case',
        },
    },
})

local Telescope = setmetatable({}, {
    __index = function(_, k)
        if vim.bo.filetype == 'NvimTree' then
            vim.cmd.wincmd('l')
        end
        return finders[k]
    end,
})

-- Leader-f = fuzzy finder
vim.keymap.set('n', '<leader>f', function()
    local ok = vim.loop.fs_stat(vim.loop.cwd() .. '/.git')
    if ok then
        Telescope.git_files()
    else
        Telescope.find_files()
    end
end)

-- Leader-H = help pages
vim.keymap.set('n', '<leader>H', Telescope.help_tags)

-- Leader-b = fuzzy find buffers
vim.keymap.set('n', '<leader>b', Telescope.buffers)

-- Leader-/ = live grep
vim.keymap.set('n', '<leader>/', Telescope.live_grep)

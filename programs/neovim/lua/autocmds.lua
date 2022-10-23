local ac = vim.api.nvim_create_autocmd

-- Highlight on yank
ac(
    'TextYankPost',
    {callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 500})
    end}
)

-- Spelling checker for .tex files
ac(
    'FileType',
    { pattern = { 'tex' }, command = [[ setlocal spell ]]}
)

-- Clear extra latex files
ac(
    'VimLeave',
    { pattern = { 'tex' }, command = [[ !tex-clear % ]]}
)

-- Start git commits in insert mode
ac(
    'FileType',
    { pattern = { 'gitcommit', 'gitrebase' }, command = [[startinsert | 1]]}
)

-- Run telescope on empty buffers
--ac(
--    'FileType',
--    {
--        pattern = { '[No Name]' },
--        command = function()
--            local ok = vim.loop.fs_stat(vim.loop.cwd() .. '/.git')
--            if ok then
--                require("telescope.builtin").git_files()
--            else
--                require("telescope.builtin").find_files()
--        end
--    }
--)

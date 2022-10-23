local ac = vim.api.nvim_create_autocmd

-- Spelling checker for .tex files
ac(
    "FileType",
    { pattern = { "tex" }, command = [[ setlocal spell ]]}
)

-- Clear extra latex files
ac(
    "FileType",
    { pattern = { "tex" }, command = [[ !tex-clear % ]]}
)

-- Start git commits in insert mode
ac(
    "FileType",
    { pattern = { "gitcommit", "gitrebase" }, command = [[startinsert | 1]]}
)

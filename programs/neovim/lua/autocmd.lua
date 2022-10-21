local a = vim.api

-- Remove trailing whitespace and newlines
a.nvim_exec([[ autocmd BufWritePre * silent %s/\s\+$//e | norm! `` ]], false)
a.nvim_exec([[ autocmd BufWritePre * silent %s/\n\+\%$//e | norm! `` ]], false)

-- Spelling checker for .tex files
a.nvim_exec([[ autocmd FileType tex setlocal spell ]], false)

-- Clear extra latex files
a.nvim_exec([[ autocmd VimLeave *.tex !tex-clear % ]], false)

local g = vim.g

g.tex_flavor = "latex"
g.vimtex_view_method = "sioyek"
g.vimtex_view_forward_search_on_start = 0
g.vimtex_quickfix_mode = 0
g.tex_conceal = "abdmg"
g.vimtex_fold_enabled = 1
g.vimtex_fold_manual = 1
g.vimtex_fold_types = [[ { 'preamble' : {'enable' : 1}, 'envs' : { 'blacklist' : ['figure', 'table', 'align*']}} ]]

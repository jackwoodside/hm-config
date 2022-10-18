""" CoC
set updatetime=300

" Cycle completion options
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nnoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PageDown>"
nnoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PageUp>"

" Accept completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh
endif

" Highlight symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Scroll coc floating window
nnoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PageDown>"
nnoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PageUp>"
inoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PageDown>"
vnoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PageUp>"

""" Fugitive
nnoremap <silent> <Leader>ga :G add %:r\.*<CR>
nnoremap <silent> <Leader>gc :silent G commit<CR>
nnoremap <silent> <Leader>go :G pull<CR>
nnoremap <silent> <Leader>gp :G push<CR>
nnoremap <silent> <Leader>gs :G status<CR>

""" Vimtex / UltiSnips
let g:tex_flavor='latex'
let g:vimtex_view_method='sioyek'
let g:vimtex_view_forward_search_on_start=0
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1
let g:vimtex_fold_types = {
\ 'preamble' : {'enable' : 1},
\ 'envs' : {
\    'blacklist' : ['figure', 'table', 'align*'],
\ },
\}
let g:vimtex_toc_config = {
\ 'name' : 'Table of Contents',
\ 'show_help' : '0',
\}
let g:vimtex_toc_show_preamble=0
set conceallevel=2
let g:tex_conceal='abdmg'
let g:UltiSnipsExpandTrigger='�'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" Clear extra files
autocmd VimLeave *.tex !tex-clear %

""" Language checking
" Spell checker
autocmd FileType tex setlocal spell
set spelllang=en_au
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" Grammar checker
nnoremap <silent> <Leader>rc :GrammarousCheck<CR>
nnoremap <silent> <Leader>rd :GrammarousReset<CR>
nnoremap <silent> <Leader>rf <Plug>(grammarous-fixit)
nnoremap <silent> <Leader>rr <Plug>(grammarous-remove-error)
nnoremap <silent> <Leader>rn <Plug>(grammarous-move-to-next-error)
nnoremap <silent> <Leader>rp <Plug>(grammarous-move-to-previous-error)

"" Statusline
" Always show
set laststatus=2
" Remove vim's and shorten lightline's mode indicator
set noshowmode
" General settings
let g:lightline = {
      \ 'colorscheme': 'selenized_black',
      \ 'active': {
      \   'left':  [ [ 'mode' ],
      \              [ 'gitinfo' ],
      \              [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'positioninfo' ],
      \              [ 'vimtexcount' ] ]
      \ },
      \ 'inactive': {
      \   'left':  [ [ 'filename' ] ],
      \   'right': [ [ 'positioninfo' ] ]
      \ },
      \ 'component_function': {
      \ 'gitinfo': 'LightlineGit',
      \ 'filename': 'LightlineFilename',
      \ 'vimtexcount': 'LightlineTexWordcount',
      \ 'positioninfo': 'LightlinePosition'
      \ },
      \ 'mode_map': {
      \ 'n' : 'NOR',
      \ 'i' : 'INS',
      \ 'R' : 'REP',
      \ 'v' : 'VIS',
      \ 'V' : 'VLN',
      \ "\<C-v>" : 'VBL',
      \ 'c' : 'COM',
      \ },
      \ }
function! LightlineGit()
        let [a,m,r] = GitGutterGetHunkSummary()
        return '+' . a . ' ~' . m . ' -' . r . ' '
endfunction
function! LightlineFilename()
        let filename = expand('%:t') != '' ? expand('%:t') : '[No Name]'
        let modified = &modified ? ' [+]' : ''
        return filename . modified
endfunction
function! LightlineTexWordcount()
        let words = 0 "vimtex#misc#wordcount()
        return words . ' words'
endfunction
function! LightlinePosition()
        return (100 * line('.') / line('$')) . '%  ' . line('.') . '/' . line('$')
endfunction

""" Sneak
let g:sneak#s_next = 1 " tap s/S to move through results
let g:sneak#use_ic_scs = 1 " match vim's case sensitivity

""" Theming
" Colourscheme
set termguicolors
set background=dark
colorscheme selenized_bw

" Vimtex Conceal
highlight Conceal guibg=None guifg=LightRed

" Always show signcolumns
highlight clear SignColumn

""" Neovim settings
set nocompatible
set encoding=utf-8
set t_Co=256
set signcolumn=yes

" Line numbers
set number relativenumber

" Keep hidden buffers loaded
set hidden

" Case-insensitive search, unless contains caps
set ignorecase
set smartcase

" Show partial matches
set incsearch

" Highlight search matches
set hlsearch

" Clear search highlighting
nnoremap <silent> <esc> :nohlsearch<CR>

" Indentation
set autoindent
set expandtab
set softtabstop=4

" Height below status bar
set cmdheight=1

" Don't give |ins-completion-menu| messages
set shortmess=F
set shortmess+=c

" Highlight matching brackets
set showmatch
set matchtime=2

" Don't break words to wrap
set linebreak

" Keep cursor off the edge
set scrolloff=6
set sidescrolloff=6

" Popup menu for commands
set wildmenu

" Switch behaviour of g on s
set gdefault

" Enable filetype features
filetype indent plugin on

" Backspace over whitespace
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Clipboard
set clipboard=unnamedplus

" Sensible split directions
set splitbelow splitright

" No auto-comment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically remove trailing whitespace and newlines.
autocmd BufWritePre * silent %s/\s\+$//e | norm! ``
autocmd BufWritePre * silent %s/\n\+\%$//e | norm! ``

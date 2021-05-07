{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      coc-nvim
      coc-python
      coc-vimtex
      vim-commentary
      vim-fugitive
      fzf-vim
      vim-gitgutter
      lightline-vim
      vim-nix
      vim-repeat
      vim-sneak
      ultisnips
      vimtex
    ];
    extraConfig = ''
      " CoC settings
      " Cycle completion options
      inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

      function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
      " Open completion menu
      inoremap <silent><expr> <c-space> coc#refresh()
      " Accept completion option
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
      " Highlight symbol under cursor on CursorHold
      autocmd CursorHold * silent call CocActionAsync('highlight')
      " Run python file in terminal
      nnoremap <silent> <F5> :CocCommand python.execInTerminal<CR>

      " Write file with root permission
      nnoremap <silent> <F12> :w !sudo tee %

      " Fugitive settings
      nnoremap <silent> <Leader>ga :G add %:r\.*<CR>
      nnoremap <silent> <Leader>gc :silent G commit<CR>
      nnoremap <silent> <Leader>gp :G push<CR>
      nnoremap <silent> <Leader>gs :G status<CR>

      " Sneak settings
      let g:sneak#s_next = 1

      " Vimtex / UltiSnips settings
      let g:tex_flavor='latex'
      let g:vimtex_view_method='zathura'
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
      " Spell checker/corrector
      autocmd FileType tex setlocal spell
      set spelllang=en_gb
      inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

      " Statusline settings
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
              let branch = FugitiveHead()
              let [a,m,r] = GitGutterGetHunkSummary()
              return '+' . a . ' ~' . m . ' -' . r . '  ' . branch
      endfunction
      function! LightlineFilename()
              let filename = expand('%:t') !=# ''\'' ? expand('%:t') : '[No Name]'
              let modified = &modified ? ' [+]' : ''\''
              return filename . modified
      endfunction
      function! LightlineTexWordcount()
              let words = 8 "vimtex#misc#wordcount()
              return words . 'W'
      endfunction
      function! LightlinePosition()
              return (100 * line('.') / line('$')) . '%  ' . line('.') . '/' . line('$')
      endfunction

      " Theming
      " Colourscheme
      set termguicolors
      set background=dark
      colorscheme selenized_bw
      " CoC menu
      autocmd ColorScheme * highlight Pmenu guifg=none
      autocmd ColorScheme * highlight PmenuSel guibg='#70b433' guifg=Black
      " Vimtex Conceal
      highlight Conceal guibg=None guifg=LightRed

      " Always show signcolumns
      set signcolumn=yes
      highlight clear SignColumn

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

      " CursorHold timing
      set updatetime=300

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

      " No auto-comment on newline
      autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

      " Sensible split directions
      set splitbelow splitright

      " I forgot to edit with sudo
      cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

      " Automatically remove trailing whitespace and newlines.
      autocmd BufWritePre * silent %s/\s\+$//e | norm! ``
      autocmd BufWritePre * silent %s/\n\+\%$//e | norm! ``

      " Automatically remove double spaces caused by UltiSnips
      autocmd BufWritePre * silent %s/  \$/ \$/e | norm! ``

      " Automatically remove spaces at the start of align blocks that happen sometimes
      autocmd BufWritePre * silent %s/^ \\/\\/e | norm! ``

      " Misc
      set nocompatible
      set encoding=utf-8
      set t_Co=256
    '';
  };

  xdg.configFile = {
    "nvim/UltiSnips/tex.snippets".source = ./tex.snippets;
    "nvim/colors/selenized_bw.vim".source = ./selenized_bw.vim;
  };
}

{ config, pkgs, ... }:
# TODO
# laptop polybar backlight
# polybar restart in i3, i3, fix mpv
# spicetify, .local/bin, .local/share, bwmenu
# Different home-manager profiles for laptop and desktop (
#    alacritty font size, networkmanager_dmenu
#  )
# Remove temporary programs
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  # Enable font management.
  fonts.fontconfig.enable = true;

  # User packages.
  home.packages = with pkgs; [
    # Fonts
    roboto-mono
    font-awesome
    (nerdfonts.override {
      fonts = [ "RobotoMono" ];
    })

    # Misc.
    arandr # Temporary
    bitwarden-cli
    discord
    exa
    fd
    gimp
    libnotify
    maim
    mathematica # Laptop
    networkmanager_dmenu # Laptop
    pavucontrol # Temporary
    playerctl
    python3Minimal
    ranger
    ripgrep
    spotify
    steam
    sxiv
    # teams
    unzip
    xclip
    zoom-us
  ];

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 8.0; # 10d/8l
        normal.family = "RobotoMono Nerd Font";
      };
      colors = {
        primary = {
          background = "#181818";
          foreground = "#b9b9b9";
        };
        normal = {
          black = "#252525";
          red = "#ed4a46";
          green = "#70b433";
          yellow = "#dbb32d";
          blue = "#368aeb";
          magenta = "#eb6eb7";
          cyan = "#3fc5b7";
          white = "#777777";
        };
        bright = {
          black = "#3b3b3b";
          red = "#ff5e56";
          green = "#83c746";
          yellow = "#efc541";
          blue = "#4f9cfe";
          magenta = "#ff81ca";
          cyan =  "#56d8c9";
          white = "#dedede";
        };
      };
    };
  };

  # Direnv
  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
    enableZshIntegration = true;
  };

  # Dunst
  services.dunst = {
    enable = true;
    settings = {
      global = {
        geometry = "350x5-10+10";
        transparency = 20;
        notification_height = 0;
        separator_height = 2;
        padding = 0;
        horizontal_padding = 8;
        frame_width = 2;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        font = "RobotoMono 16";
        line_height = 0;
        markup = "full";
        format = "%s\n%b";
        alignment = "left";
        word_wrap = "yes";
        ignore_newline = "no";
        stack_duplicates = true;
        show_indicators = "no";
      };
      shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+grave";
        context = "ctrl+shift+period";
      };
      urgency_normal = {
        background = "#181818";
        foreground = "#dedede";
        timeout = 5;
      };
      urgency_low = {
        background = "#181818";
        foreground = "#dedede";
        timeout = 5;
      };
      urgency_critical = {
        background = "#181818";
        foreground = "#dedede";
        frame_color = "#ed4a46";
        timeout = 0;
      };
    };
  };

  # Firefox
  programs.firefox = {
    enable = true;
  };

  # Feh
  programs.feh.enable = true;

  # Fzf
  programs.fzf.enable = true;

  # Git
  programs.git = {
    enable = true;
    userEmail = "20267593+0003c9fe@users.noreply.github.com";
    userName = "0003c9fe";
  };

  # GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Dark";
    };
    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };
  };

  # Htop
  programs.htop = {
    enable = true;
    treeView = true;
    vimMode = true;
  };

  # Mpv
  programs.mpv = {
    enable = true;
    config = {
      fs = "yes";
      osc = "no";
      profile = "gpu-hq";
      hwdec = "auto";
      # no-sub-visibility = true;
    };
  };

  # Neovim
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
      " TODO unpushed changes indicator
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
      autocmd ColorScheme * highlight Pmenu guibg=DarkGrey guifg=Black
      autocmd ColorScheme * highlight PmenuSel guibg='#70b433' guifg=Black
      " Vimtex Conceal
      highlight Conceal guibg=None guifg=LightRed

      " Jump between todo comments
      " TODO fix these to jump back properly, and not display messages and highlighting for failed jumps
      nmap <silent> ]t :set nowrapscan<CR> /TODO<CR> :nohlsearch<CR> :set wrapscan<CR>
      nmap <silent> [t :set nowrapscan<CR> ?TODO<CR> :nohlsearch<CR> :set wrapscan<CR>

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

      " Misc
      set nocompatible
      set encoding=utf-8
      set t_Co=256
    '';
  };
  xdg.configFile."nvim/UltiSnips/tex.snippets".source = ./tex.snippets;
  xdg.configFile."nvim/colors/selenized_bw.vim".source = ./selenized_bw.vim;

  # Network Manager
  xdg.configFile."networkmanager_dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi
  '';

  # Picom
  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 4;
    fadeSteps = [ "0.03" "0.03" ];
    vSync = true;
  };

  # Polybar
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      pulseSupport = true;
    };
    script = "polybar main &";
    config = {
      "colors" = {
        background = "#181818";
        background-alt = "#252525";
        foreground = "#dedede";
        foreground-alt = "#777777";
        primary = "#ed4a46";
        secondary = "#ed4a46";
        alert = "#ed4a46";
      };
      "settings" = {
        screenchange-reload = true;
      };
      "global/wm" = {
        margin-top = 0;
        margin-bottom = 0;
      };
      "bar/main" = {
        height = 25;
        fixed-center = "true";
        bottom = "true";
        background = "\${colors.background}";
        foreground = "\${colors.foreground}";
        line-size = 2;
        padding-right = 2;
        module-margin-left = 1;
        module-margin-right = 1;
        font-0 = "RobotoMono:style=regular:pixelsize=12;1";
        font-1 = "Font Awesome 5 Brands Regular:style=regular:pixelsize=12;1";
        font-2 = "Font Awesome 5 Free Regular:style=regular:pixelsize=12;1";
        font-3 = "Font Awesome 5 Free Solid :style=regular:pixelsize=12;1";
        modules-left = "i3";
        #modules-center = "spotify";
        modules-right = "pulseaudio xbacklight wlan eth battery date";
      };
      "module/i3" = {
        type = "internal/i3";
        strip-wsnumbers = "true";
        enable-click = "false";
        enable-scroll = "false";
        label-focused = "%index% %name%";
        label-focused-background = "\${colors.background}";
        label-focused-underline= "\${colors.background}";
        label-focused-padding = 2;
        label-unfocused = "%index% %name%";
        label-unfocused-foreground = "\${colors.foreground-alt}";
        label-unfocused-padding = 2;
        label-visible = "%index% %name%";
        label-visible-background = "\${self.label-focused-background}";
        label-visible-underline = "\${self.label-focused-underline}";
        label-visible-padding = "\${self.label-focused-padding}";
        label-urgent = "%index% %name%";
        label-urgent-background = "\${colors.alert}";
        label-urgent-padding = 2;
      };
      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        label-volume = " %percentage%%";
        label-muted = " %percentage%%";
        label-muted-foreground = "\${colors.foreground-alt}";
      };
      "module/xbacklight" = {
        type = "internal/xbacklight";
        label = "label =  %percentage%%";
      };
      "module/wlan" = {
        type = "internal/network";
        interface = "wlo1";
        interval = 3;
        label-connected = "";
        label-disconnected = "";
        label-disconnected-foreground = "\${colors.alert}";
        format-disconnected-underline = "\${colors.background}";
      };
      "module/eth" = {
        type = "internal/network";
        interface = "enp0s25";
        interval = 3;
        label-connected = "";
        label-disconnected = "";
        label-disconnected-foreground = "\${colors.alert}";
        format-disconnected-underline = "\${colors.background}";
      };
      "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "AC";
        full-at = 98;
        poll-interval = 60;
        time-format = "%H:%M";
        format-charging = "<label-charging>";
        label-charging = " %percentage%% (%time%)";
        format-discharging = "<ramp-capacity> <label-discharging>";
        label-discharging = "%percentage%% (%time%)";
        format-full = "<ramp-capacity> <label-full>";
        label-full = "%percentage%% (0:00)";
        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-0-underline = "\${colors.alert}";
      };
      "module/date" = {
        type = "internal/date";
        interval = 5;
        date = "%d-%m";
        time = "%H:%M";
        label = "%date% %time%";
      };
    };
  };

  # Ranger
  xdg.configFile."ranger/commands.py".source = ./ranger/commands.py;
  xdg.configFile."ranger/rc.conf".source = ./ranger/rc.conf;
  xdg.configFile."ranger/rifle.conf".source = ./ranger/rifle.conf;
  xdg.configFile."ranger/scope.sh".source = ./ranger/scope.sh;

  # Rofi
  programs.rofi = {
    enable = true;
    borderWidth = 2;
    font = "RobotoMono 14";
    lines = 10;
    padding = 10;
    scrollbar = false;
    separator = "solid";
    width = 600;
    theme = "~/.local/share/rofi.rasi";
    extraConfig = ''
      rofi.drun-match-fields: name
      rofi.drun-display-format: {name}
      rofi.disable-history: true
      rofi.scroll-method: 1
      rofi.display-drun: run
    '';
  };
  xdg.dataFile."rofi.rasi".source = ./rofi.rasi;

  # Unclutter
  services.unclutter = {
    enable = true;
    extraOptions = [ "ignore-scrolling" ];
    threshold = 5;
    timeout = 3;
  };

  # X
  xdg.enable = true;
  xsession = {
    enable = true;
    pointerCursor = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
    };
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
        menu = "rofi -show drun";

        colors = {
          focused = {
            background = "#dedede";
            border = "#dedede";
            childBorder = "#dedede";
            indicator = "#dedede";
            text = "#dedede";
          };
          focusedInactive = {
            background = "#777777";
            border = "#777777";
            childBorder = "#777777";
            indicator = "#777777";
            text = "#777777";
          };
          placeholder = {
            background = "#777777";
            border = "#777777";
            childBorder = "#777777";
            indicator = "#777777";
            text = "#777777";
          };
          unfocused = {
            background = "#777777";
            border = "#777777";
            childBorder = "#777777";
            indicator = "#777777";
            text = "#777777";
          };
          urgent = {
            background = "#777777";
            border = "#777777";
            childBorder = "#777777";
            indicator = "#777777";
            text = "#777777";
          };
        };

        floating = {
          border = 2;
          criteria = [ { instance = "taskmanager"; } { instance = "dropdown"; } ];
        };

        fonts = [ "RobotoMono 10" ];

        gaps = {
          inner = 10;
          outer = 0;
        };

        bars = [];
      };
      # Fix
      extraConfig = ''
        # media controls
        bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +1% #increase sound volume
        bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -1% #decrease sound volume
        bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle # mute sound
        bindsym XF86AudioPlay exec playerctl play-pause
        bindsym XF86AudioStop exec playerctl stop
        bindsym XF86AudioNext exec playerctl next
        bindsym XF86AudioPrev exec playerctl previous
        # screenshot controls
        bindsym Shift+Print exec maim -u -s ~/Pictures/$(date +%F-%s).png
        bindsym --release Print exec maim -u -s | xclip -selection clipboard -t image/png
        bindsym $mod+Print exec maim -u ~/Pictures/$(date +%F-%s).png
        exec systemctl restart --user polybar.service
      '';
    };
  };

  # Zathura
  programs.zathura = {
    enable = true;
    options = {
      adjust-open = "best-fit";
      selection-clipboard = "clipboard";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 1;
      default-bg = "#1b1918";
      guioptions = "";
      recolor-darkcolor = "#a8a19f";
      recolor-lightcolor = "#1b1918";
    };
  };

  # Zsh
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";
    initExtra = ''
      prompt off
      PS1='%B%F{red}%m%f%F{cyan} %1~ $%f%b '
    '';
    envExtra = ''
      export GNUPGHOME=$XDG_DATA_HOME/gnupg
      export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
      export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
      export LESSHISTFILE=-
      export EDITOR=nvim
      export PATH=$PATH:/home/jack/.local/bin
    '';
    history.path = ".cache/zsh/history";
    shellAliases = {
      ls = "exa --icons -T -L=1";
      ls2 = "exa --icons -T -L=2";
      ls3 = "exa --icons -T -L=3";
      grep = "rg";
      find = "fd";
      c = "clear";
      cdc = "cd && clear";
      pd = "mpv --really-quiet $PWD & disown && exit";
      gs = "git status -uno";
      gsa = "git status";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}

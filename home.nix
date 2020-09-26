
{ config, pkgs, ... }:
# todo: polybar, i3 fix mpv, fix rofi, nerdfonts
# ranger, spicetify, .local/bin, .local/share, bwmenu
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
    #(nerdfonts.override {
    #  fonts = [ "FiraCode" "DroidSansMono" ];
    #})

    # Misc.
    bitwarden-cli
    discord
    exa
    fd
    gimp
    libnotify
    maim
    playerctl
    ranger
    ripgrep
    spotify
    steam
    sxiv
    xclip
  ];

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 10.0;
        normal.family = "RobotoMono";
      };      
      colors = {
        primary = {
          background = "#1b1918";
          foreground = "#a8a19f";
        };
        normal = {
          black = "#1b1918";
          red = "#f22c40";
          green = "#5ab738";
          yellow = "#d5911a";
          blue = "#407ee7";
          magenta = "#6666ea";
          cyan = "#00ad9c";
          white = "#a8a19f";
        };
        bright = {
          black = "#1b1918";
          red = "#f22c40";
          green = "#5ab738";
          yellow = "#d5911a";
          blue = "#407ee7";
          magenta = "#6666ea";
          cyan = "#00ad9c";
          white = "#a8a19f";
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
        background = "#1b1918";
        foreground = "#f1efee";
        timeout = 5;
      };
      urgency_low = {
        background = "#1b1918";
        foreground = "#f1efee";
        timeout = 5;
      };
      urgency_critical = {
        background = "#1b1918";
        foreground = "#f1efee";
        frame_color = "#f22c40";
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
    userEmail = "jack.a.woodside@gmail.com";
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
      fzf-vim
      ultisnips
      vim-fugitive
      vim-gitgutter
      vim-repeat
      vimtex
      vim-nix
    ];
    extraConfig = ''
      set nocompatible
      
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
      
      " Documentation
      nnoremap <silent> K :call <SID>show_documentation()<CR>
      
      function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
        else
          call CocAction('doHover')
        endif
      endfunction
      
      " Highlight symbol under cursor on CursorHold
      autocmd CursorHold * silent call CocActionAsync('highlight')
      
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
      autocmd VimLeave *.tex !tex-clear %
      autocmd FileType tex setlocal spell
      set spelllang=en_gb
      inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
      nnoremap <Leader>lw :VimtexCountWords<CR>

      " Fugitive settings
      nnoremap <silent> <Leader>ga :G add %<CR>
      nnoremap <silent> <Leader>gc :G commit<CR>
      nnoremap <silent> <Leader>gp :G push<CR>
      
      " Colours
      " Gitgutter
      highlight GitGutterAdd ctermfg=green
      highlight GitGutterChange ctermfg=yellow
      highlight GitGutterDelete ctermfg=red
      " CoC menu
      highlight Pmenu ctermbg=darkgrey ctermfg=white
      highlight PmenuSel ctermbg=green ctermfg=white
      " Vimtex Conceal
      highlight Conceal ctermbg=none ctermfg=red
      " Brackets
      highlight MatchParen cterm=bold ctermbg=none ctermfg=red
      
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
      set cmdheight=2
      
      " CursorHold timing
      set updatetime=300
      
      " Don't give |ins-completion-menu| messages
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
      
      " Enable filetype features
      filetype indent plugin on
      
      " Backspace over whitespace
      set backspace=indent,eol,start
      
      " Enable syntax highlighting
      syntax on
      
      " Clipboard 
      set clipboard=unnamedplus
      
      set shortmess=F
      
      set encoding=utf-8
      
      set t_Co=256
      
      set laststatus=2
    '';
  };

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
      alsaSupport = true;
    };
    script = "polybar main &";
    config = {
      "colors" = {
        background = "#1b1918";
        background-alt = "#766e6b";
        foreground = "#f1efee";
        foreground-alt = "#a8a19f";
        primary = "#f22c40";
        secondary = "#f22c40";
        alert = "#f22c40";
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
        label-muted = "  %percentage%%";
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
    # todo: drun-match-fields, drun-display-format, disable history, eh, scroll method, display-drun, theming
  };

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
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
        menu = "rofi -show drun";

        colors = {
          focused = {
            background = "#f1efee";
            border = "#f1efee";
            childBorder = "#f1efee";
            indicator = "#f1efee";
            text = "#f1efee";
          };
          focusedInactive = {
            background = "#a8a19f";
            border = "#a8a19f";
            childBorder = "#a8a19f";
            indicator = "#a8a19f";
            text = "#a8a19f";
          };
          placeholder = {
            background = "#a8a19f";
            border = "#a8a19f";
            childBorder = "#a8a19f";
            indicator = "#a8a19f";
            text = "#a8a19f";
          };
          unfocused = {
            background = "#a8a19f";
            border = "#a8a19f";
            childBorder = "#a8a19f";
            indicator = "#a8a19f";
            text = "#a8a19f";
          };
          urgent = {
            background = "#a8a19f";
            border = "#a8a19f";
            childBorder = "#a8a19f";
            indicator = "#a8a19f";
            text = "#a8a19f";
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

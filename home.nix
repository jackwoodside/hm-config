{ config, pkgs, lib, ... }:
# TODO
# vim stuff
# laptop polybar backlight
# fix mpv
# spicetify, .local/bin, bwmenu

{
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  imports = [
    ./profile.nix # Machine-specific profile
    ./programs # Programs
  ];

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
  xdg.configFile = {
    "ranger/commands.py".source = ./programs/ranger/commands.py;
    "ranger/rc.conf".source = ./programs/ranger/rc.conf;
    "ranger/rifle.conf".source = ./programs/ranger/rifle.conf;
    "ranger/scope.sh".source = ./programs/ranger/scope.sh;
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
    theme = "~/.local/share/rofi.rasi";
    extraConfig = ''
      rofi.drun-match-fields: name
      rofi.drun-display-format: {name}
      rofi.disable-history: true
      rofi.scroll-method: 1
      rofi.display-drun: run
    '';
  };
  xdg.dataFile."rofi.rasi".source = ./programs/rofi/rofi.rasi;

  # Unclutter
  services.unclutter = {
    enable = true;
    extraOptions = [ "ignore-scrolling" ];
    threshold = 5;
    timeout = 3;
  };

  # X
  xdg.enable = true;
  xdg.dataFile."wallpaper.png".source = ./images/wallpaper.png;

  xsession = {
    enable = true;
    pointerCursor = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
    };
    initExtra = ''
      feh --no-fehbg --bg-tile '/home/jack/.local/share/wallpaper.png'
    '';
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

        keybindings =
          let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in lib.mkOptionDefault {
            # toggle split direction
            "${modifier}+t" = "split toggle";
            # toggle screen that current workspace is on
            "${modifier}+x" = "move workspace to output right";
            # audio profile
            "${modifier}+a" = "exec --no-startup-id pactl set-card-profile 0 'output:analog-stereo'";
            "${modifier}+Shift+a" = "exec --no-startup-id pactl set-card-profile 0 'output:hdmi-stereo'";
            # backlight
            "XF86MonBrightnessUp" = "exec xbacklight -inc 5";
            "XF86MonBrightnessDown" = "exec xbacklight -dec 5";
            # display manager
            "${modifier}+p" = "exec display-menu";
            # dropdown terminal
            "${modifier}+Delete" = "[instance=\"dropdown\"] scratchpad show; [instance=\"dropdown\"] move position center";
            "${modifier}+Shift+Delete" = "exec --no-startup-id alacritty --class dropdown";
            # emoji menu
            "${modifier}+u" = "exec unicode-menu";
            # media controls
            "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +1%";
            "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -1%";
            "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
            "XF86AudioPlay" = "exec playerctl play-pause";
            "XF86AudioStop" = "exec playerctl stop";
            "XF86AudioNext" = "exec playerctl next ";
            "XF86AudioPrev" = "exec playerctl previous";
            # mounting
            "${modifier}+m" = "exec --no-startup-id mount-menu";
            "${modifier}+Shift+m" = "exec --no-startup-id umount-menu";
            # network manager
            "${modifier}+n" = "exec networkmanager_dmenu";
            # password manager
            "${modifier}+z" = "exec bwmenu";
            # picture-in-picture
            "${modifier}+v" = "[title=\"(?i)picture-in-picture\"] scratchpad show";
            # ranger
            "${modifier}+w" = "exec alacritty -e ranger";
            # system menu
            "${modifier}+BackSpace" = "exec system-menu";
            # screenshots
            "Shift+Print" = "exec maim -u -s ~/Pictures/$(date +%F-%s).png";
            "Print" = "exec maim -u -s | xclip -selection clipboard -t image/png";
            "${modifier}+Print" = "exec maim -u ~/Pictures/$(date +%F-%s).png";
            # task manager
            "Control+Mod1+Delete" = "exec --no-startup-id alacritty --class taskmanager -e htop";
            # workspaces
            "${modifier}+1" = "workspace $workspace1";
            "${modifier}+2" = "workspace $workspace2";
            "${modifier}+3" = "workspace $workspace3";
            "${modifier}+4" = "workspace $workspace4";
            "${modifier}+5" = "workspace $workspace5";
            "${modifier}+6" = "workspace $workspace6";
            "${modifier}+7" = "workspace $workspace7";
            "${modifier}+8" = "workspace $workspace8";
            "${modifier}+9" = "workspace $workspace9";
            "${modifier}+0" = "workspace $workspace10";

            "${modifier}+Shift+1" = "move container to workspace $workspace1";
            "${modifier}+Shift+2" = "move container to workspace $workspace2";
            "${modifier}+Shift+3" = "move container to workspace $workspace3";
            "${modifier}+Shift+4" = "move container to workspace $workspace4";
            "${modifier}+Shift+5" = "move container to workspace $workspace5";
            "${modifier}+Shift+6" = "move container to workspace $workspace6";
            "${modifier}+Shift+7" = "move container to workspace $workspace7";
            "${modifier}+Shift+8" = "move container to workspace $workspace8";
            "${modifier}+Shift+9" = "move container to workspace $workspace9";
            "${modifier}+Shift+0" = "move container to workspace $workspace10";
          };

        startup = [
          { command = "systemctl --user restart polybar"; always = true; notification = false; }
        ];
      };

      extraConfig = ''
        # dropdown terminal
        for_window [instance="dropdown"] floating enable
        for_window [instance="dropdown"] move scratchpad
        for_window [instance="dropdown"] resize set 1200 700
        exec --no-startup-id alacritty --class dropdown

        # picture-in-picture
        for_window [title="(?i)picture-in-picture"] sticky enable
        for_window [title="(?i)picture-in-picture"] move scratchpad, scratchpad show

        # task manager
        for_window [instance="taskmanager"] floating enable
        for_window [instance="taskmanager"] resize set 1200 700
        for_window [instance="taskmanager"] move position center

        # workspace settings
        set $workspace1 "1:"
        set $workspace2 "2:"
        set $workspace3 "3:"
        set $workspace4 "4:"
        set $workspace5 "5:"
        set $workspace6 "6:"
        set $workspace7 "7:"
        set $workspace8 "8:"
        set $workspace9 "9:"
        set $workspace10 "10:"

        assign [class="(?i)firefox"] $workspace1
        assign [class="discord"] $workspace2
        assign [class="(?i)steam"] $workspace5
        assign [class="itch"] $workspace5
        assign [class="(?i)zathura"] $workspace3
        assign [class="(?i)mathematica"] $workspace3
        for_window [class="Spotify"] move to workspace $workspace10
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
      default-bg = "#181818";
      guioptions = "";
      recolor-darkcolor = "#b9b9b9";
      recolor-lightcolor = "#181818";
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
      mathematica = "USE_WOLFRAM_LD_LIBRARY_PATH=1 Mathematica & disown && exit";
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

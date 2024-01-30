{ ... }:

{
  xsession.windowManager.spectrwm = {
    enable = false;
    bindings = {
      audio_lower = "XF86AudioLowerVolume";
      audio_mute = "XF86AudioMute";
      audio_next = "XF86AudioNext";
      audio_play = "XF86AudioPlay";
      audio_prev = "XF86AudioPrev";
      audio_raise = "XF86AudioRaiseVolume";
      audio_stop = "XF86AudioStop";
      brightness_down = "XF86MonBrightnessDown";
      brightness_up = "XF86MonBrightnessUp";
      #change_screen = "Mod+x";
      emoji = "Mod+u";
      files = "Mod+w";
      latex = "Mod+l";
      menu = "Mod+d";
      mount = "Mod+m";
      network = "Mod+n";
      power = "Mod+BackSpace";
      screenshot = "Home";
      task_manager = "Control+Mod1+Delete";
      terminal = "Mod+Return";
      unmount = "Mod+Shift+m";
    };

    programs = {
      audio_lower = "pactl set-sink-volume @DEFAULT_SINK@ -2%";
      audio_raise = "pactl set-sink-volume @DEFAULT_SINK@ +2%";
      audio_mute = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      audio_next = "playerctl next";
      audio_prev = "playerctl previous";
      audio_play = "playerctl play-pause";
      audio_stop = "playerctl stop";
      brightness_down = "brightnessctl s -5%";
      brightness_up = "brightnessctl s +5%";
      #change_screen = "Mod+x";
      emoji = "~/.local/bin/rofi-emoji";
      files = "alacritty -e lf";
      latex = "~/.local/bin/rofi-latex";
      menu = "rofi -show drun";
      mount = "~/.local/bin/rofi-mount";
      unmount = "~/.local/bin/rofi-umount";
      network = "networkmanager_dmenu";
      power = "~/.local/bin/rofi-power";
      screenshot = "~/.local/bin/rofi-screenshot";
      task_manager = "alacritty --class task_manager -e htop";
      terminal = "alacritty";
    };

    quirks = { };

    settings = {
      modkey = "Mod4";

      # Statusbar
      bar_at_bottom = 1;
      bar_border_width = 0;
      bar_color = "rgb:1e/1e/2e";
      bar_font = "JetBrainsMono Nerd Font:style=regular:pixelsize=12";
      bar_font_color = "rgb:cd/d6/f4";
      bar_format = "+I+D";
      bar_justify = "left";

      # Windows
      border_width = 2;
      color_focus = "rgb:cd/d6/f4";
      color_unfocus = "rgb:58/5b/70";
      region_padding = 10;
      tile_gap = 10;

      # Workspaces
      workspace_limit = 10;
      name = "ws[1]:";
      #        name = "ws[2]:";
      #        name = "ws[3]:";
      #        name = "ws[4]:";
      #        name = "ws[5]:";
      #        name = "ws[6]:";
      #        name = "ws[7]:";
      #        name = "ws[8]:";
      #        name = "ws[9]:";
      #        name = "ws[10]:";
    };

    unbindings = [
      "MOD+Shift+Delete"
    ];
  };
}

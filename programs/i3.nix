{ config, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "rofi -show drun";

      colors = {
        focused = {
          background = "#cdd6f4";
          border = "#cdd6f4";
          childBorder = "#cdd6f4";
          indicator = "#cdd6f4";
          text = "#cdd6f4";
        };
        focusedInactive = {
          background = "#585b70";
          border = "#585b70";
          childBorder = "#585b70";
          indicator = "#585b70";
          text = "#585b70";
        };
        placeholder = {
          background = "#585b70";
          border = "#585b70";
          childBorder = "#585b70";
          indicator = "#585b70";
          text = "#585b70";
        };
        unfocused = {
          background = "#585b70";
          border = "#585b70";
          childBorder = "#585b70";
          indicator = "#585b70";
          text = "#585b70";
        };
        urgent = {
          background = "#585b70";
          border = "#585b70";
          childBorder = "#585b70";
          indicator = "#585b70";
          text = "#585b70";
        };
      };

      floating = {
        border = 2;
        criteria = [{ instance = "taskmanager"; } { instance = "dropdown"; }];
      };

      fonts = {
        names = [ "RobotoMono" ];
        size = 10.0;
      };

      gaps = {
        inner = 10;
        outer = 0;
      };

      bars = [ ];

      keybindings =
        let modifier = config.xsession.windowManager.i3.config.modifier;
        in lib.mkOptionDefault {
          # toggle split direction
          "${modifier}+t" = "split toggle";
          # toggle screen that current workspace is on
          "${modifier}+x" =
            "move workspace to output right; move workspace to output up";
          # audio profile
          "${modifier}+a" =
            "exec --no-startup-id pactl set-card-profile 0 'output:analog-stereo'";
          "${modifier}+Shift+a" =
            "exec --no-startup-id pactl set-card-profile 0 'output:hdmi-stereo'";
          # backlight
          "XF86MonBrightnessUp" = "exec brightnessctl s +5%";
          "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
          # display manager
          "${modifier}+p" = "exec ~/.local/bin/display-menu";
          # dropdown terminal
          "${modifier}+Delete" = ''
            [instance="dropdown"] scratchpad show; [instance="dropdown"] move position center'';
          "${modifier}+Shift+Delete" =
            "exec --no-startup-id alacritty --class dropdown";
          # emoji menu
          "${modifier}+u" = "exec ~/.local/bin/rofi-emoji";
          # latex to image
          "${modifier}+l" = "exec ~/.local/bin/rofi-latex";
          # media controls
          "XF86AudioRaiseVolume" =
            "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +2%";
          "XF86AudioLowerVolume" =
            "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -2%";
          "XF86AudioMute" =
            "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioStop" = "exec playerctl stop";
          "XF86AudioNext" = "exec playerctl next ";
          "XF86AudioPrev" = "exec playerctl previous";
          # mounting
          "${modifier}+m" = "exec --no-startup-id ~/.local/bin/rofi-mount";
          "${modifier}+Shift+m" =
            "exec --no-startup-id ~/.local/bin/rofi-umount";
          # network manager
          "${modifier}+n" = "exec networkmanager_dmenu";
          # picture-in-picture
          "${modifier}+v" =
            ''[title="(?i)picture-in-picture"] scratchpad show'';
          # file manager
          "${modifier}+w" = "exec alacritty -e lf";
          # power menu
          "${modifier}+BackSpace" = "exec ~/.local/bin/rofi-power";
          # screenshots
          "Home" = "exec --no-startup-id ~/.local/bin/rofi-screenshot";
          "${modifier}+Home" = "exec maim -u ~/Pictures/$(date +%F-%s).png";
          # task manager
          "Control+Mod1+Delete" =
            "exec --no-startup-id alacritty --class taskmanager -e htop";
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

          "${modifier}+Shift+1" = "move container to workspace $workspace1";
          "${modifier}+Shift+2" = "move container to workspace $workspace2";
          "${modifier}+Shift+3" = "move container to workspace $workspace3";
          "${modifier}+Shift+4" = "move container to workspace $workspace4";
          "${modifier}+Shift+5" = "move container to workspace $workspace5";
          "${modifier}+Shift+6" = "move container to workspace $workspace6";
          "${modifier}+Shift+7" = "move container to workspace $workspace7";
          "${modifier}+Shift+8" = "move container to workspace $workspace8";
          "${modifier}+Shift+9" = "move container to workspace $workspace9";
        };

      startup = [
        {
          command = "systemctl --user restart polybar";
          always = true;
          notification = false;
        }
        {
          command =
            "xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --output DP-1 --mode 1920x1080 --pos 1920x0";
          always = true;
          notification = false;
        }
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

      # vpn
                  for_window [instance="gpclient"] move position center

      # workspace settings
                  set $workspace1 "1:"
                  set $workspace2 "2:"
                  set $workspace3 "3:"
                  set $workspace4 "4:"
                  set $workspace5 "5:"
                  set $workspace6 "6:"
                  set $workspace7 "7:"
                  set $workspace8 "8:"
                  set $workspace9 "9:"

                  assign [class="(?i)firefox"] $workspace1
                  assign [class="discord"] $workspace2
                  assign [class="(?i)sioyek"] $workspace3
                  assign [class="(?i)mathematica"] $workspace5
                  assign [class="(?i)virt-viewer"] $workspace5
                  assign [class="(?i)steam"] $workspace8
                  assign [class="itch"] $workspace8
                  for_window [class="Spotify"] move to workspace $workspace9
    '';
  };
}

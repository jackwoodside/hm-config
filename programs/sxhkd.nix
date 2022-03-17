{ ... }:
# TODO
# move workspace to other display
# toggle picture in picture
# change workspaces?
# move windows?
{
  services.sxhkd = {
    enable = false;
    keybindings = {
      # Audio
      "XF86AudioRaiseVolume" = "pactl set-sink-volume @DEFAULT_SINK@ +2%";
      "XF86AudioLowerVolume" = "pactl set-sink-volume @DEFAULT_SINK@ -2%";
      "XF86AudioMute" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "XF86AudioPlay" = "playerctl play-pause";
      "XF86AudioStop" = "playerctl stop";
      "XF86AudioNext" = "playerctl next ";
      "XF86AudioPrev" = "playerctl previous";
      # Backlight
      "XF86MonBrightnessUp" = "brightnessctl s +5%";
      "XF86MonBrightnessDown" = "brightnessctl s 5%-";
      # Emoji Menu
      "super + u" = "exec ~/.local/bin/rofi-emoji";
      # Mount/Unmount Menu
      "super + m" = "~/.local/bin/rofi-mount";
      "super + shift + m" = "~/.local/bin/rofi-umount";
      # Network Manager
      "super + n" = "networkmanager_dmenu";
      # Power Menu
      "super + backspace" = "~/.local/bin/rofi-power";
      # Ranger
      "super + w" = "alacritty -e ranger";
      # Screenshots
      "home" = "~/.local/bin/rofi-screenshot";
      # Task Manager
      "control + alt + delete" = "alacritty --class taskmanager -e htop";
    };
  };
}

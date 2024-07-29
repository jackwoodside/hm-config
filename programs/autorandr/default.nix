{ ... }:

{
  programs.autorandr = {
    enable = true;
    hooks = {
      postswitch = {
        "change-background" = "feh --no-fehbg --bg-tile '/home/jack/.local/share/wallpaper.png'";
        "reload-bar" = "sleep 0.5 && systemctl --user restart polybar.service";
      };
    };

    profiles = {
      "standalone" = {
        fingerprint = {
          eDP-1 = builtins.readFile ./edid-laptop;
        };

        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            mode = "1920x1080";
          };
        };
      };

      "work" = {
        fingerprint = {
          eDP-1 = builtins.readFile ./edid-laptop;
          HDMI-1 = builtins.readFile ./edid-work;
        };

        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            mode = "1920x1080";
            position = "0x1080";
          };

          HDMI-1 = {
            enable = true;
            primary = false;
            mode = "1920x1080";
            position = "0x0";
          };
        };
      };
    };
  };
}

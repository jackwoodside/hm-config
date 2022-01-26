{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    script = "
      polybar primary &
      polybar secondary &
    ";
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
      "bar/primary" = {
        monitor = "HDMI-A-0";
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
        modules-right = "pulseaudio wlan eth battery date";
      };
      "bar/secondary" = {
        monitor = "DisplayPort-2";
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
        modules-right = "pulseaudio date";
      };
      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = true;
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
        interface = "eno1";
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
}

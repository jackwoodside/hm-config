{ ... }:

{
  xdg.dataFile = {
    "emoji".source = ./emoji;
    "screenlayouts/desktop".source = ./screenlayouts/desktop;
    "rofi-power.rasi".source = ./rofi-power.rasi;
  };

  home.file = {
    ".local/bin/extract".source = ./extract;
    ".local/bin/tex-clear".source = ./tex-clear;
    ".local/bin/rofi-emoji".source = ./rofi-emoji;
    ".local/bin/rofi-mount".source = ./rofi-mount;
    ".local/bin/rofi-umount".source = ./rofi-umount;
    ".local/bin/rofi-power".source = ./rofi-power;
  };
}

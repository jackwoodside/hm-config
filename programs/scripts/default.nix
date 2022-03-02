{ ... }:

{
  xdg.dataFile = {
    "emoji".source = ./emoji;
    "screenlayouts/desktop".source = ./screenlayouts/desktop;
  };

  home.file = {
    ".local/bin/extract".source = ./extract;
    ".local/bin/rofi-mount".source = ./rofi-mount;
    ".local/bin/tex-clear".source = ./tex-clear;
    ".local/bin/rofi-umount".source = ./rofi-umount;
    ".local/bin/rofi-emoji".source = ./rofi-emoji;
  };
}

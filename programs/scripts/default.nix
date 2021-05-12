{ ... }:

{
  xdg.dataFile = {
    "emoji".source = ./emoji;
    "screenlayouts/tv".source = ./screenlayouts/tv;
    "screenlayouts/laptop".source = ./screenlayouts/laptop;
  };

  home.file = {
    ".local/bin/display-menu".source = ./display-menu;
    ".local/bin/extract".source = ./extract;
    ".local/bin/lock".source = ./lock;
    ".local/bin/mount-menu".source = ./mount-menu;
    ".local/bin/system-menu".source = ./system-menu;
    ".local/bin/tex-clear".source = ./tex-clear;
    ".local/bin/umount-menu".source = ./umount-menu;
    ".local/bin/unicode-menu".source = ./unicode-menu;
  };
}

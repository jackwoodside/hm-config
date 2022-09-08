{ ... }:

{
  xdg.dataFile = {
    "emoji".source = ./emoji;
    "formula.tex".source = ./formula.tex;
    "lock.png".source = ../../images/lock.png;
    "rofi-buttons.rasi".source = ./rofi-buttons.rasi;
  };

  home.file = {
    ".local/bin/extract".source = ./extract;
    ".local/bin/lock".source = ./lock;
    ".local/bin/tex-clear".source = ./tex-clear;
    ".local/bin/rofi-emoji".source = ./rofi-emoji;
    ".local/bin/rofi-latex".source = ./rofi-latex;
    ".local/bin/rofi-mount".source = ./rofi-mount;
    ".local/bin/rofi-umount".source = ./rofi-umount;
    ".local/bin/rofi-power".source = ./rofi-power;
    ".local/bin/rofi-screenshot".source = ./rofi-screenshot;
  };
}

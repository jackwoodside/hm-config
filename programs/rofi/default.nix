{ ... }:

{
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
  xdg.dataFile."rofi.rasi".source = ./rofi.rasi;
}

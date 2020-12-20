{ ... }:

{
  programs.rofi = {
    enable = true;
    font = "RobotoMono 20";
    lines = 5;
    width = 600;
    theme = "~/.local/share/rofi.rasi";
    extraConfig = ''
      rofi.drun-match-fields: name
      rofi.drun-display-format: {name}
      rofi.disable-history: true
      rofi.scroll-method: 1
      rofi.display-drun:
    '';
  };
  xdg.dataFile."rofi.rasi".source = ./rofi.rasi;
}

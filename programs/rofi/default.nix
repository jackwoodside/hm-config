{ ... }:

{
  programs.rofi = {
    enable = true;
    font = "RobotoMono 20";
    theme = "~/.local/share/rofi.rasi";
    extraConfig = {
      drun-match-fields = "name";
      drun-display-format = "{name}";
      disable-history = true;
      scroll-method = 1;
      display-drun = "";
    };
  };
  xdg.dataFile."rofi.rasi".source = ./rofi.rasi;
}

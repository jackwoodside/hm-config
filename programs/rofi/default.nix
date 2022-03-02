{ ... }:

{
  programs.rofi = {
    enable = true;
    cycle = true;
    font = "RobotoMono 20";
    extraConfig = {
      show-icons = false;
      disable-history = true;
      display-drun = "Programs";
      drun-match-fields = "name";
      drun-display-format = "{name}";
    };
  };
  #xdg.dataFile."rofi.rasi".source = ./rofi.rasi;
}

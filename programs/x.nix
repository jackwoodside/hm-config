{ pkgs, ... }:

{
  xdg.enable = true;
  xdg.dataFile."wallpaper.png".source = ../images/wallpaper.png;

  xsession = {
    enable = true;
    pointerCursor = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
    };
    initExtra = ''
      feh --no-fehbg --bg-tile '/home/jack/.local/share/wallpaper.png'
    '';
  };
}

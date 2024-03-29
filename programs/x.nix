{ pkgs, ... }:

{
  xdg.enable = true;
  xdg.dataFile."wallpaper.png".source = ../images/wallpaper.png;

  xsession = {
    enable = true;
    initExtra = ''
      feh --no-fehbg --bg-tile '/home/jack/.local/share/wallpaper.png'
    '';
  };
  home.pointerCursor = {
    x11.enable = true;
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };
}

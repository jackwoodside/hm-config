{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "RobotoMono Nerd Font";
        size = 10.0;
      };
      colors = {
        primary = {
          background = "#181818";
          foreground = "#b9b9b9";
        };
        normal = {
          black = "#252525";
          red = "#ed4a46";
          green = "#70b433";
          yellow = "#dbb32d";
          blue = "#368aeb";
          magenta = "#eb6eb7";
          cyan = "#3fc5b7";
          white = "#777777";
        };
        bright = {
          black = "#3b3b3b";
          red = "#ff5e56";
          green = "#83c746";
          yellow = "#efc541";
          blue = "#4f9cfe";
          magenta = "#ff81ca";
          cyan =  "#56d8c9";
          white = "#dedede";
        };
      };
    };
  };
}

{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Dark";
    };
    iconTheme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Dark";
    };
  };
}

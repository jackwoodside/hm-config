{ pkgs, ... }:

{
  # Alacritty font size.
  programs.alacritty.settings.font.size = 8.0;
  home.packages = with pkgs; [
    acpilight
    arandr
    mathematica
    networkmanager_dmenu
    teams
    zoom-us
  ];
}

{ pkgs, ... }:

{
  # Laptop-specific programs.
  home.packages = with pkgs; [
    acpilight
    arandr
    mathematica
    networkmanager_dmenu
    teams
    zoom-us
  ];

  # Alacritty
  programs.alacritty.settings.font = {
    normal.family = "RobotoMono Nerd Font";
    size = 8.0;
  };

  # Network Manager
  xdg.configFile."networkmanager_dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi
  '';
}

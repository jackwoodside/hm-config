{ pkgs, ... }:

{
  # Laptop-specific programs.
  home.packages = with pkgs; [
    arandr
    brightnessctl
    mathematica
    networkmanager_dmenu
    teams
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

{ pkgs, ... }:

{
  # Laptop-specific programs
  home.packages = with pkgs; [
    brightnessctl
    networkmanager_dmenu
    teams
    zoom
  ];

  # Alacritty
  programs.alacritty.settings.font = {
    normal.family = "RobotoMono Nerd Font";
    size = 8.0;
  };

  # Network Manager
  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi
  '';
}

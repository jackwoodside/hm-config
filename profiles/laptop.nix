{ pkgs, ... }:

{
  # Laptop-specific programs
  home.packages = with pkgs; [
    brightnessctl
    zoom-us
  ];

  # Alacritty
  programs.alacritty.settings.font = {
    normal.family = "RobotoMono Nerd Font";
    size = 8.0;
  };
}

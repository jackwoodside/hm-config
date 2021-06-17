{ pkgs, ... }:

{
  # Desktop-specific programs
  home.packages = with pkgs; [
    makemkv
  ];
  # Alacritty
  programs.alacritty.settings.font = {
    normal.family = "RobotoMono Nerd Font";
    size = 10.0;
  };
}

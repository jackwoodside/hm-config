{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # User info
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  imports = [
    ./programs # Programs
  ];

  # Home Manager release
  home.stateVersion = "20.09";
}

##### TODO
### catppuccin
# spicetify
# gtk cursors
# grub
### neovim
# catppuccin colours for noice
# lualine vim wordcount function
# empty startupscreen with telescope

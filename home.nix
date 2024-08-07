{ ... }:

{
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
  manual.manpages.enable = false;

  # User info
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  imports = [
    ./programs # Programs
  ];

  # Home Manager release
  home.stateVersion = "20.09";
}

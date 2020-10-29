{ config, pkgs, lib, ... }:
# TODO
# vim stuff
# laptop polybar backlight
# fix mpv
# spicetify, .local/bin, bwmenu

{
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  imports = [
    ./programs # Programs
    ./profile.nix # Machine-specific profile
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}

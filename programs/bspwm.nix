{ config, pkgs, lib, ... }:
# TODO
# polybar workspaces
# work on multiple monitors
# make floating things sticky

{
  xsession.windowManager.bspwm = {
    enable = false;
    extraConfig = ''''; # additional shell commands run at end of config
    monitors = {
      eDP-1 = [ "" "" "" "" "" "" "" "" "" "" ];
    };
    #rules = {
    #  "firefox" = {};
    #  "discord" = {};
    #  "zathura" = {};
    #  "steam" = {};
    #  "spotify" = {};
    #};
    settings = {
    #  border_width = ;
    #  gapless_monocle = ;
    #  gap = ;
    };
  };
}

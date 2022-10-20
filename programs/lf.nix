{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
    keybindings = {
      D = "trash";
      gg = null;
      gh = "cd ~";
    };
    previewer.source = pkgs.writeShellScript "pv.sh" ''
      #!/bin/sh
      case "$1" in
        *.tar*) tar tf "$1";;
        *.zip) unzip -l "$1";;
        *.pdf) pdftotext "$1";;
        *) highlight -O ansi "$1" || cat "$1";;
      esac
    '';
    settings = {
      icons = true;
      preview = true;
      smartcase = true;
      wrapscroll = false;
    };
  };
}

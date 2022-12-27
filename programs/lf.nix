{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
    settings = {
      dircounts = true;
      dirfirst = true;
      drawbox = true;
      icons = true;
    };
  };
}

{ ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      fs = "yes";
      osc = "no";
      profile = "gpu-hq";
      hwdec = "auto";
      # no-sub-visibility = true;
    };
  };
}

{ ... }:

{
  services.picom = {
    enable = true;
    backend = "xrender";
    fade = true;
    fadeDelta = 4;
    fadeSteps = [ 3.0e-2 3.0e-2 ];
    vSync = true;
  };
}

{ ... }:

{
    services.picom = {
        enable = true;
        backend = "glx";
        fade = true;
        fadeDelta = 4;
        fadeSteps = [ 0.03 0.03 ];
        vSync = true;
    };
}

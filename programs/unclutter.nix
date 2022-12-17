{ ... }:

{
    services.unclutter = {
        enable = true;
        extraOptions = [ "ignore-scrolling" ];
        threshold = 5;
        timeout = 3;
    };
}

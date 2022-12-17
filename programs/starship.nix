{ lib, ... }:

{
    programs.starship = {
        enable = true;
        settings = {
            scan_timeout = 10;
        };
    };
}

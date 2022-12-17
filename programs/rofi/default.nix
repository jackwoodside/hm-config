{ ... }:

{
    programs.rofi = {
        enable = true;
        cycle = true;
        font = "RobotoMono 20";
        theme = ./rofi.rasi;
        extraConfig = {
            show-icons = false;
            disable-history = true;
            drun-match-fields = "name";
            drun-display-format = "{name}";
            display-drun = "Programs";
        };
    };
}

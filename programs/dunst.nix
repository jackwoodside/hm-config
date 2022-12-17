{ ... }:

{
    services.dunst = {
        enable = true;
        settings = {
            global = {
                frame_color = "#cdd6f4";
                background = "#1e1e2e";
                foreground = "#cdd6f4";
                separator_color = "frame";
                offset = "10x10";
                transparency = "20";
                frame_width = "2";
                font = "RobotoMono 16";
                idle_threshold = 120;
                line_height = 0;
                word_wrap = "yes";
                show_indicators = "false";

                mouse_left_click = "none";
                mouse_right_click = "none";
            };
            urgency_normal = {
                timeout = 5;
            };
            urgency_low = {
                timeout = 5;
            };
            urgency_critical = {
                frame_color = "#f38ba8";
                timeout = 0;
            };
        };
    };
}

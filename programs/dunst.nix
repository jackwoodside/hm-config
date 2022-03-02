{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        offset = "10x10";
        transparency = "20";
        frame_width = "2";
        separator_color = "frame";
        font = "RobotoMono 16";
        idle_threshold = 120;
        line_height = 0;
        word_wrap = "yes";
        show_indicators = "false";

        mouse_left_click = "none";
        mouse_right_click = "none";
      };
      urgency_normal = {
        background = "#181818";
        foreground = "#dedede";
        frame_color = "#dedede";
        timeout = 5;
      };
      urgency_low = {
        background = "#181818";
        foreground = "#dedede";
        frame_color = "#dedede";
        timeout = 5;
      };
      urgency_critical = {
        background = "#181818";
        foreground = "#dedede";
        frame_color = "#ed4a46";
        timeout = 0;
      };
    };
  };
}

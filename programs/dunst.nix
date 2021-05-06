{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        geometry = "350x5-10+10";
        transparency = 20;
        notification_height = 0;
        separator_height = 2;
        padding = 0;
        horizontal_padding = 8;
        frame_width = 2;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        font = "RobotoMono 16";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        word_wrap = "yes";
        ignore_newline = "no";
        stack_duplicates = true;
        show_indicators = "no";
      };
      shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+grave";
        context = "ctrl+shift+period";
      };
      urgency_normal = {
        background = "#181818";
        foreground = "#dedede";
        timeout = 5;
      };
      urgency_low = {
        background = "#181818";
        foreground = "#dedede";
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

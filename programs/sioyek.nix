{ config, ... }:

{
  programs.sioyek = {
    enable = true;
    bindings = {
      "move_up" = "k";
      "move_down" = "j";
      "fit_to_page_width" = "f";
      "fit_to_page_height" = "F";
      "next_page" = "<pagedown>";
      "previous_page" = "<pageup>";
      "close_window" = "q";
      "toggle_synctex" = "l";
    };
    config = {
      "background_color" = "#1e1e2e";
      "touchpad_sensitivity" = "0.4";
      "page_separator_width" = "4";
      "page_separator_color" = "#1e1e2e";
      "search_url_g" = "https://www.google.com/search?q=";
      "should_launch_new_window" = "1";
      "should_use_multiple_monitors" = "0";
      "overview_size" = "0.85 0.85";
      "inverse_search_command" = "nvr --remote +%2 %1";
    };
  };
}

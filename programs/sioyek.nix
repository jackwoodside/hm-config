{ config, ... }:

{
  programs.sioyek = {
    enable = true;
    bindings = {
      "move_up" = "k";
      "move_down" = "j";
      "move_left" = "h";
      "move_right" = "l";
      "fit_to_page_width" = "f";
      "quit" = "q";
    };
    config = {
      "background_color" = "0.09 0.09 0.09";
      "touchpad_sensitivity" = "0.4";
      "page_separator_width" = "1";
      "page_separator_color" = "0.09 0.09 0.09";

      "search_url_g" = "https://www.google.com/search?q=";
      "should_launch_new_instance" = "1";
    };
  };
}

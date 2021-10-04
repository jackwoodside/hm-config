{ ... }:

{
  programs.htop = {
    enable = true;
    settings = {
      enable_mouse = false;
    #  fields = [
    #    "PERCENT_CPU" "PERCENT_MEM" "STATE" "COMM"
    #  ];
    #  left_meters = [
    #    "LeftCPUs" "Memory"
    #  ];
    #  right_meters = [
    #    "RightCPUs" "Uptime"
    #  ];
      show_program_path = false;
      sort_key = "PERCENT_MEM";
      tree_view = true;
    };
  };
}

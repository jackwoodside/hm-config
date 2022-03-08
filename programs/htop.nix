{ config, ... }:

{
  programs.htop = {
    enable = true;
    settings = {
      cpu_count_from_one = 1;
      enable_mouse = false;
      fields = with config.lib.htop.fields; [
        PERCENT_CPU
        PERCENT_MEM
        STATE
        COMM
      ];
      left_meters = with config.lib.htop; [
        "LeftCPUs"
        "Memory"
      ];
      right_meters = with config.lib.htop; [
        "RightCPUs"
        "Uptime"
      ];
      show_program_path = false;
      sort_key = "PERCENT_MEM";
      tree_view = true;
    };
  };
}

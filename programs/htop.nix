{ ... }:

{
  programs.htop = {
    enable = true;
    enableMouse = false;
    fields = [
      "PERCENT_CPU" "PERCENT_MEM" "STATE" "COMM"
    ];
    meters = {
      left = [
        "LeftCPUs" "Memory"
      ];
      right = [
        "RightCPUs" "Uptime"
      ];
    };
    showProgramPath = false;
    sortKey = "PERCENT_MEM";
    treeView = true;
  };
}

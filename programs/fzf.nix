{ ... }:

{
  programs.fzf = {
    enable = true;
    colors = {
      "bg" = "#1e1e2e";
      "bg+" = "#313244";
      "fg" = "#cdd6f4";
      "fg+" = "#cdd6f4";
      "hl" = "#f38ba8";
      "hl+" = "#f38ba8";
      "header" = "#f38ba8";
      "pointer" = "#f5e0dc";
      "marker" = "#f5e0dc";
      "spinner" = "#f5e0dc";
      "prompt" = "#cba6f7";
      "info" = "#cba6f7";
    };
    changeDirWidgetCommand = "fd --type d";
    changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = [ "--preview 'head {}'" ];
    historyWidgetOptions = [ "--sort" "--exact" ];
  };
}

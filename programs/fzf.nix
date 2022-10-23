{ ... }:

{
  programs.fzf = {
    enable = true;
    changeDirWidgetCommand = "fd --type d";
    changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'"];
    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = [ "--preview 'head {}'" ];
    historyWidgetOptions = [ "--sort" "--exact" ];
  };
}

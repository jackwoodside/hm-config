{ ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      adjust-open = "best-fit";
      selection-clipboard = "clipboard";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 1;
      default-bg = "#181818";
      guioptions = "";
      recolor-darkcolor = "#b9b9b9";
      recolor-lightcolor = "#181818";
    };
  };
}

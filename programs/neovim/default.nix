{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };

  home.packages = with pkgs; [ cargo gcc gnumake ];
  xdg.configFile."nvim".source = builtins.fetchGit {
      url = "git@github.com:jackwoodside/nvim-config.git";
      shallow = true;
      ref = "main";
      rev = "c8706669d985dcc5e39bd84c16b95abf3cebbf61";
  };
}

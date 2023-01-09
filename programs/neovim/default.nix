{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
  };

  home.packages = with pkgs; [ gcc ];
  xdg.configFile."nvim".source = builtins.fetchGit {
      url = "git@github.com:jackwoodside/nvim-config.git";
      ref = "main";
      shallow = true;
  };
}

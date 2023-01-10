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
      rev = "2ceae3ad406b98d2bbde186c17d16b7f189925a7";
  };
}

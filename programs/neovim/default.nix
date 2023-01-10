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
      rev = "58cbb61acc3be673a4162e10bf9eccc55d10b679";
  };
}

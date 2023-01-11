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
      rev = "18834986e53337ce946e8a30a01579d83ba9dc04";
  };
}

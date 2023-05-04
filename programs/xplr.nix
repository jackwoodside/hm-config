{ ... }:

{
  xdg.configFile."xplr".source = builtins.fetchGit {
    url = "git@github.com:jackwoodside/xplr-config.git";
    shallow = true;
    ref = "main";
    rev = "";
  };
}

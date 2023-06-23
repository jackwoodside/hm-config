{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [
      clang-tools
      ltex-ls
      nil
      nixpkgs-fmt
      shellcheck
      shfmt
      stylua
      sumneko-lua-language-server
      texlab
    ];
  };

  home.packages = with pkgs; [ cargo gcc gnumake neovim-remote ];
  xdg.configFile."nvim".source = builtins.fetchGit {
    url = "git@github.com:jackwoodside/nvim-config.git";
    shallow = true;
    ref = "main";
    rev = "f2540a1fdd63a34a4af6b9acb0238b0ca162362a";
  };
}

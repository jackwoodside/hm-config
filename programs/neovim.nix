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
    rev = "2ebc534eb13d2aecabb563a7b5550527d1681477";
  };
}

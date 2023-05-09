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
    rev = "3de6a2f018fb3ffb410208090a5df48f69667f4d";
  };
}

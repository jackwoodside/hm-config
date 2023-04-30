{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        withNodeJs = true;
        withPython3 = true;
        extraPackages = with pkgs; [
            black
            clang-tools
            fortran-language-server
            fprettify
            ltex-ls
            nil
            python310Packages.jedi-language-server
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
        rev = "4a65d2f87e93d1f0b84397e6bbff4ab0b716533c";
    };
}

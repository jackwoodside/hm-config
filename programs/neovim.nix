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
        rev = "961e820b1b374aa77c36c78c12bab1c846ff8b1d";
    };
}

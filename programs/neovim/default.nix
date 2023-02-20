{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;
# Required for LSPs, mason doesn't always work on nix
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

    home.packages = with pkgs; [ cargo gcc gnumake ];
    xdg.configFile."nvim".source = builtins.fetchGit {
        url = "git@github.com:jackwoodside/nvim-config.git";
        shallow = true;
        ref = "main";
        rev = "f68386cd31cf59238e27b2ed0bff97be9f0a16af";
    };
}

{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;
# Required for LSPs, mason doesn't always work on nix
        extraPackages = with pkgs; [
            clang-tools
            fortran-language-server
            fprettify
            ltex-ls
            nil
            python310Packages.jedi-language-server
            python310Packages.autopep8
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
        rev = "3d0449f135a5ee1d50614b24911e8e772f6f7b44";
    };
}

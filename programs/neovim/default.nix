{ pkgs, ... }:

{
    home.packages = with pkgs; [
        clang-tools
        gcc
        gnumake
        ltex-ls
        luajitPackages.luacheck
        shellcheck
        stylua
        sumneko-lua-language-server
    ];
    programs.neovim = {
        enable = true;
        vimAlias = true;
        withNodeJs = true;
        plugins = with pkgs.vimPlugins; [ packer-nvim ];
    };

    xdg.configFile = {
        "nvim/init.lua".source = ./init.lua;
        "nvim/lua/autocmds.lua".source = ./lua/autocmds.lua;
        "nvim/lua/keybinds.lua".source = ./lua/keybinds.lua;
        "nvim/lua/plugins.lua".source = ./lua/plugins.lua;
        "nvim/lua/settings.lua".source = ./lua/settings.lua;

        "nvim/lua/config/fterm.lua".source = ./lua/config/fterm.lua;
        "nvim/lua/config/fugitive.lua".source = ./lua/config/fugitive.lua;
        "nvim/lua/config/gitsigns.lua".source = ./lua/config/gitsigns.lua;
        "nvim/lua/config/grammarous.lua".source = ./lua/config/grammarous.lua;
        "nvim/lua/config/indentline.lua".source = ./lua/config/indentline.lua;
        "nvim/lua/config/lualine.lua".source = ./lua/config/lualine.lua;
        "nvim/lua/config/navigator.lua".source = ./lua/config/navigator.lua;
        "nvim/lua/config/notify.lua".source = ./lua/config/notify.lua;
        "nvim/lua/config/nvim-tree.lua".source = ./lua/config/nvim-tree.lua;
        "nvim/lua/config/pairs.lua".source = ./lua/config/pairs.lua;
        "nvim/lua/config/telescope.lua".source = ./lua/config/telescope.lua;
        "nvim/lua/config/treesitter.lua".source = ./lua/config/treesitter.lua;
        "nvim/lua/config/vimtex.lua".source = ./lua/config/vimtex.lua;

        "nvim/lua/config/lsp/luasnip.lua".source = ./lua/config/lsp/luasnip.lua;
        "nvim/lua/config/lsp/null-ls.lua".source = ./lua/config/lsp/null-ls.lua;
        "nvim/lua/config/lsp/nvim-cmp.lua".source = ./lua/config/lsp/nvim-cmp.lua;
        "nvim/lua/config/lsp/servers.lua".source = ./lua/config/lsp/servers.lua;
        "nvim/lua/config/lsp/utils.lua".source = ./lua/config/lsp/utils.lua;
    };
}

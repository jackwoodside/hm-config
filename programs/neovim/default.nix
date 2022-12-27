{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
  };

  home.packages = with pkgs; [
    checkmake
    clang-tools
    cpplint
    gcc
    gnumake
    ltex-ls
    luajitPackages.luacheck
    nixfmt
    rnix-lsp
    rust-analyzer
    rustfmt
    shellcheck
    shfmt
    stylua
    sumneko-lua-language-server
    texlab
  ];
  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua/autocmds.lua".source = ./lua/autocmds.lua;
    "nvim/lua/keybinds.lua".source = ./lua/keybinds.lua;
    "nvim/lua/plugins.lua".source = ./lua/plugins.lua;
    "nvim/lua/settings.lua".source = ./lua/settings.lua;

    "nvim/lua/plugins/catppuccin.lua".source = ./lua/plugins/catppuccin.lua;
    "nvim/lua/plugins/gitsigns.lua".source = ./lua/plugins/gitsigns.lua;
    "nvim/lua/plugins/indentline.lua".source = ./lua/plugins/indentline.lua;
    "nvim/lua/plugins/lualine.lua".source = ./lua/plugins/lualine.lua;
    "nvim/lua/plugins/notify.lua".source = ./lua/plugins/notify.lua;
    "nvim/lua/plugins/nvim-tree.lua".source = ./lua/plugins/nvim-tree.lua;
    "nvim/lua/plugins/starter.lua".source = ./lua/plugins/starter.lua;
    "nvim/lua/plugins/telescope.lua".source = ./lua/plugins/telescope.lua;
    "nvim/lua/plugins/toggleterm.lua".source = ./lua/plugins/toggleterm.lua;
    "nvim/lua/plugins/treesitter.lua".source = ./lua/plugins/treesitter.lua;

    "nvim/lua/plugins/lsp/luasnip.lua".source = ./lua/plugins/lsp/luasnip.lua;
    "nvim/lua/plugins/lsp/null-ls.lua".source = ./lua/plugins/lsp/null-ls.lua;
    "nvim/lua/plugins/lsp/nvim-cmp.lua".source = ./lua/plugins/lsp/nvim-cmp.lua;
    "nvim/lua/plugins/lsp/servers.lua".source = ./lua/plugins/lsp/servers.lua;
    "nvim/lua/plugins/lsp/utils.lua".source = ./lua/plugins/lsp/utils.lua;
    "nvim/lua/plugins/lsp/words.txt".source = ./lua/plugins/lsp/words.txt;

    "clangd/config.yaml".text = ''
                  CompileFlags:
      Add: [-ferror-limit=0, -std=c++17]
    '';
  };
}

{ pkgs, ... }:

{
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

    "nvim/lua/plugins/fugitive.lua".source = ./lua/plugins/fugitive.lua;
    "nvim/lua/plugins/gitsigns.lua".source = ./lua/plugins/gitsigns.lua;
    "nvim/lua/plugins/grammarous.lua".source = ./lua/plugins/grammarous.lua;
    "nvim/lua/plugins/indentline.lua".source = ./lua/plugins/indentline.lua;
    "nvim/lua/plugins/lualine.lua".source = ./lua/plugins/lualine.lua;
    "nvim/lua/plugins/navigator.lua".source = ./lua/plugins/navigator.lua;
    "nvim/lua/plugins/nvim-tree.lua".source = ./lua/plugins/nvim-tree.lua;
    "nvim/lua/plugins/telescope.lua".source = ./lua/plugins/telescope.lua;
    "nvim/lua/plugins/treesitter.lua".source = ./lua/plugins/treesitter.lua;
    "nvim/lua/plugins/vimtex.lua".source = ./lua/plugins/vimtex.lua;
  };
}

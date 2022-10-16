{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    coc.enable = true;
    coc.settings = {
      "suggest.noselect" = true;
    };
    plugins = with pkgs.vimPlugins; [
      # statusline
      lightline-vim
      # git
      vim-fugitive
      vim-gitgutter
      # coc
      coc-clangd
      coc-pairs
      coc-vimtex
      # latex
      ultisnips
      vim-grammarous
      vimtex
      # misc
      vim-sneak
      vim-nix
    ];
  };

  xdg.configFile = {
    "nvim/colors/selenized_bw.vim".source = ./selenized_bw.vim;
    "nvim/init-home-manager.vim".source = ./init.vim;
    "nvim/UltiSnips/tex.snippets".source = ./tex.snippets;
  };
}

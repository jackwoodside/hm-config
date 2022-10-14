{ ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";
    initExtra = ''
      prompt off
      PS1='%B%F{red}%m%f%F{cyan} %1~ $%f%b '
    '';
    envExtra = ''
      export GNUPGHOME=$XDG_DATA_HOME/gnupg
      export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
      export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
      export LESSHISTFILE=-
      export EDITOR=nvim
      export MANPAGER='nvim +Man!'
      export PATH=$PATH:/home/jack/.local/bin
    '';
    history.path = ".cache/zsh/history";
    shellAliases = {
      ls = "exa --icons -T -L=1";
      ls2 = "exa --icons -T -L=2";
      ls3 = "exa --icons -T -L=3";
      grep = "rg";
      find = "fd";
      c = "clear";
      cdc = "cd && clear";
      pd = "mpv --really-quiet $PWD & disown && exit";
      gs = "git status -uno";
      gsa = "git status";
      server = "ssh -Y jaw103@nucl03";
      servervnc = "ssh -Y -L 5901:127.0.0.1:5962 jaw103@nucl03";
      vnc = "vncviewer :1";
    };
  };
}

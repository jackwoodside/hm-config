{ ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
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
    shellAliases = {
      ls = "exa --icons -T -L=1";
      ls2 = "exa --icons -T -L=2";
      ls3 = "exa --icons -T -L=3";
      grep = "rg";
      find = "fd";
      c = "clear";
      cdc = "cd && clear";
      pd = "mpv --really-quiet $PWD & disown && exit";
      gc = "git commit";
      gd = "git diff";
      go = "git pull";
      gp = "git push";
      gs = "git status";
      server = "ssh -Y -L 5901:127.0.0.1:5962 jaw103@nucl03";
      mountserver = "sshfs -o reconnect,ServerAliveInterval=20,idmap=user jaw103@nucl03:/scratch3/labr ~/Documents/server";
    };
  };
}

{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      zoxide init fish | source
    '';
    shellInit = ''
      set -U fish_greeting
      set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
      set -gx IPYTHONDIR $XDG_CONFIG_HOME/ipython
      set -gx JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
      set -gx LESSHISTFILE -
      set -gx EDITOR nvim
      set -gx MANPAGER 'nvim +Man!'
      set -gx PATH $PATH:/home/jack/.local/bin
      set -gx FZF_DEFAULT_OPTS " \
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    '';
    shellAliases = {
      ls = "eza --icons -T -L=1";
      ls2 = "eza --icons -T -L=2";
      ls3 = "eza --icons -T -L=3";
      grep = "rg";
      find = "fd";
      c = "clear";
      cat = "bat";
      pd = "mpv --really-quiet $PWD & disown && exit";
      ga = "git add";
      gc = "git commit";
      gd = "git diff";
      go = "git pull";
      gp = "git push";
      gs = "git status";
      gr = "git restore";
      vim = "nvim --listen /tmp/nvimsocket";
      server = "ssh -Y jaw103@nucl03";
      server-tunnel = "ssh -Y -L 5901:127.0.0.1:5962 jaw103@nucl03";
      mountserver =
        "sshfs -o reconnect,ServerAliveInterval=20,idmap=user jaw103@nucl03:/scratch3/labr ~/Documents/server/labr && sshfs -o reconnect,ServerAliveInterval=20,idmap=user jaw103@nucl03:/home/jaw103 ~/Documents/server/jaw103";
    };
  };
}

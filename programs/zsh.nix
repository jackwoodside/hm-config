{ ... }:

{
    programs.zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        autocd = true;
        dotDir = ".config/zsh";
        initExtra = ''
            eval "$(zoxide init zsh)"
            eval "$(starship init zsh)"
            '';
        envExtra = ''
            export GNUPGHOME=$XDG_DATA_HOME/gnupg
            export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
            export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
            export LESSHISTFILE=-
            export EDITOR=nvim
            export MANPAGER='nvim +Man!'
            export PATH=$PATH:/home/jack/.local/bin
            export FZF_DEFAULT_OPTS=" \
            --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
            --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
            --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
            '';
        shellAliases = {
            cd = "z";
            ls = "exa --icons -T -L=1";
            ls2 = "exa --icons -T -L=2";
            ls3 = "exa --icons -T -L=3";
            grep = "rg";
            find = "fd";
            c = "clear";
            pd = "mpv --really-quiet $PWD & disown && exit";
            ga = "git add";
            gc = "git commit";
            gd = "git diff";
            go = "git pull";
            gp = "git push";
            gs = "git status";
            server = "ssh -Y -L 5901:127.0.0.1:5962 jaw103@nucl03";
            mountserver = "sshfs -o reconnect,ServerAliveInterval=20,idmap=user jaw103@nucl03:/scratch3/labr ~/Documents/server/labr && sshfs -o reconnect,ServerAliveInterval=20,idmap=user jaw103@nucl03:/home/jaw103 ~/Documents/server/jaw103";
        };
    };
}

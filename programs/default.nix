{ config, pkgs, ... }:

{
# Home Manager programs.
    imports = [
        ./alacritty.nix
        ./direnv.nix
        ./dunst.nix
        ./fzf.nix
        ./git.nix
        ./gtk.nix
        ./htop.nix
        ./i3.nix
        ./lf.nix
        ./mpv.nix
        ./neovim
        ./networkmanager-dmenu.nix
        ./picom.nix
        ./polybar.nix
        ./rofi
        ./scripts
        ./sioyek.nix
        ./starship.nix
        ./udiskie.nix
        ./unclutter.nix
        ./x.nix
        ./zsh.nix
    ];

# Enable font management.
    fonts.fontconfig.enable = true;

# Misc programs.
    home.packages = with pkgs; [
        roboto-mono
        font-awesome
        (nerdfonts.override {
            fonts = [ "RobotoMono" ];
        })
        arandr
        bitwarden-cli
        brightnessctl
        discord
        exa
        fd
        feh
        ffmpeg
        ffmpegthumbnailer
        firefox
        gimp
        imagemagick
        inkscape
        jabref
        julia-bin
        kdenlive
        libnotify
        maim
        networkmanager_dmenu
        obs-studio
        playerctl
        poppler_utils
        pulseaudio
        pulsemixer
        pympress
        qbittorrent
        remmina
        ripgrep
        root
        spotify
        sshfs
        steam
        sxiv
        texlive.combined.scheme-full
        tree
        ueberzug
        unzip
        xclip
        xdotool
        youtube-dl
        zoxide
    ];
}

{ config, pkgs, ... }:

{
  # Home Manager programs.
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./dunst.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./i3.nix
    ./mpv.nix
    ./neovim
    ./networkmanager-dmenu.nix
    ./picom.nix
    ./polybar.nix
    ./ranger
    ./rofi
    ./scripts
    ./sioyek.nix
    ./sxhkd.nix
    ./unclutter.nix
    ./x.nix
    ./zsh.nix
  ];

  # Enable font management.
  fonts.fontconfig.enable = true;

  # Misc programs.
  home.packages = with pkgs; [
    # Fonts
    roboto-mono
    font-awesome
    (nerdfonts.override {
      fonts = [ "RobotoMono" ];
    })
    # Programs
    arandr
    bitwarden-cli
    brightnessctl
    #clang
    #clang-tools
    discord
    exa
    fd
    feh
    fzf
    ffmpeg
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
    playerctl
    pulseaudio
    pulsemixer
    python3Minimal
    qbittorrent
    ranger
    remmina
    ripgrep
    spotify
    sshfs
    steam
    sxiv
    texlive.combined.scheme-full
    ueberzug
    unzip
    xclip
    xdotool
    youtube-dl
  ];
}

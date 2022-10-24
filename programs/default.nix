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
    clang-tools
    discord
    exa
    fd
    feh
    ffmpeg
    ffmpegthumbnailer
    firefox
    gcc
    gimp
    gnumake
    imagemagick
    inkscape
    jabref
    julia-bin
    kdenlive
    libnotify
    maim
    networkmanager_dmenu
    playerctl
    poppler_utils
    pulseaudio
    pulsemixer
    qbittorrent
    remmina
    ripgrep
    spicetify-cli
    spotify
    sshfs
    steam
    sxiv
    texlive.combined.scheme-full
    trash-cli
    ueberzug
    unzip
    xclip
    xdotool
    youtube-dl
  ];
}

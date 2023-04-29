{ config, pkgs, ... }:

{
  # Home Manager programs.
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./dunst.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./i3.nix
    ./lf
    ./mpv.nix
    ./neovim.nix
    ./networkmanager-dmenu.nix
    ./picom.nix
    ./polybar.nix
    ./rofi
    ./scripts
    ./sioyek.nix
    ./spectrwm.nix
    ./starship.nix
    ./udiskie.nix
    ./unclutter.nix
    ./x.nix
  ];

  # Enable font management.
  fonts.fontconfig.enable = true;

  # Misc programs.
  home.packages = with pkgs; [
    roboto-mono
    font-awesome
    (nerdfonts.override { fonts = [ "RobotoMono" ]; })

    arandr
    bat
    bitwarden-cli
    brightnessctl
    discord
    exa
    fd
    feh
    ffmpeg-full
    ffmpegthumbnailer
    firefox
    gimp
    imagemagick
    inkscape
    jabref
    julia-bin
    kdenlive
    lazygit
    libnotify
    maim
    mathematica
    mediainfo
    networkmanager_dmenu
    obs-studio
    p7zip
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
    sqlite
    sshfs
    steam
    sxiv
    texlive.combined.scheme-full
    tree
    ueberzug
    unrar
    unzip
    xclip
    xdotool
    youtube-dl
    zoxide
  ];

  # Default applications
  xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [
            "sioyek.desktop"
            "firefox.desktop"
        ];
        "image/png" = [
            "sxiv.desktop"
            "gimp.desktop"
        ];
    };
  };
}

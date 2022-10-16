{ config, pkgs, ... }:

{
  # Home Manager programs.
  imports = [
    ./alacritty.nix
    ./bspwm.nix
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
  programs = {
    exa.enable = true;
    feh.enable = true;
    fzf.enable = true;
    obs-studio.enable = true;
  };

  # Desktop files.
  xdg.dataFile = {
    "applications/uni.desktop".source = ./uni.desktop;
  };

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
    clang
    discord
    fd
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
    ripgrep
    spotify
    sshfs
    steam
    sxiv
    texlive.combined.scheme-full
    tigervnc
    ueberzug
    unzip
    virt-manager
    virt-viewer
    xclip
    xdotool
    youtube-dl
  ];
}

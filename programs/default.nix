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
    ./unclutter.nix
    ./x.nix
    ./zathura.nix
    ./zsh.nix
  ];
  programs = {
    exa.enable = true;
    firefox.enable = true;
    feh.enable = true;
    fzf.enable = true;
    obs-studio.enable = true;
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
    citra
    desmume
    discord
    fd
    ffmpeg
    gimp
    imagemagick
    inkscape
    julia-stable-bin
    libnotify
    maim
    networkmanager_dmenu
    playerctl
    puddletag
    pulsemixer
    python3Minimal
    qbittorrent
    ranger
    ripgrep
    spotify
    steam
    sxiv
    ueberzug
    unzip
    xclip
    xdotool
    youtube-dl
  ];
}

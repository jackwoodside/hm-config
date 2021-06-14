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
    firefox.enable = true;
    feh.enable = true;
    fzf.enable = true;
    obs-studio.enable = true;
  };

  # Mathematica desktop file
  xdg.dataFile."applications/mathematica.desktop".source = ./mathematica.desktop;

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
    bitwarden-cli
    discord
    exa
    fd
    gimp
    imagemagick
    inkscape
    libnotify
    maim
    mathematica
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

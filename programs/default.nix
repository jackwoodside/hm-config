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
    exa.enable = true;
    firefox.enable = true;
    feh.enable = true;
    fzf.enable = true;
    obs-studio.enable = true;
  };

  # Desktop files
  xdg.dataFile = {
    "applications/mathematica.desktop".source = ./mathematica.desktop;
    "applications/matlab.desktop".source = ./matlab.desktop;
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
    discord
    fd
    gimp
    imagemagick
    libnotify
    maim
    mathematica
    ms-teams
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
    virt-manager
    virt-viewer
    xclip
    xdotool
    youtube-dl
  ];
}

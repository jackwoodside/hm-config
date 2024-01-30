{ pkgs, ... }:

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
    font-awesome
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    arandr
    bat
    bitwarden-cli
    brightnessctl
    discord
    eza
    fd
    feh
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
    networkmanager_dmenu
    p7zip
    playerctl
    poppler_utils
    pulseaudio
    pulsemixer
    pympress
    ripgrep
    spotify
    steam
    sxiv
    texlive.combined.scheme-full
    tree
    unrar
    unzip
    xclip
    xdotool
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

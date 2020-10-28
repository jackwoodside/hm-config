{ config, pkgs, ... }:

{
  # Home Manager programs.
  imports = [
    ./alacritty.nix
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
    bitwarden-cli
    discord
    exa
    fd
    gimp
    libnotify
    maim
    playerctl
    pulsemixer
    python3Minimal
    ranger
    ripgrep
    spotify
    steam
    sxiv
    ueberzug
    unzip
    xclip
  ];
}

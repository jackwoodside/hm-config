{ config, lib, pkgs, ... };

{
  # Enable font management.
  fonts.fontconfig.enable = true;

  # Misc packages.
  home.packages = with pkgs; [
    # Fonts
    roboto-mono
    font-awesome
    (nerdfonts.override {
      fonts = [ "RobotoMono" ];
    })

    # Programs
    acpilight # Laptop
    arandr # Laptop, temporary
    bitwarden-cli
    discord
    exa
    fd
    gimp
    libnotify
    maim
    mathematica # Laptop
    networkmanager_dmenu # Laptop
    pavucontrol # Laptop, temporary
    playerctl
    python3Minimal
    ranger
    ripgrep
    spotify
    steam
    sxiv
    teams # Laptop
    ueberzug
    unzip
    xclip
    zoom-us # Laptop
  ];
};

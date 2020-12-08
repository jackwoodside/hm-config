{ config, pkgs, ... }:
# TODO
# automount /dev/sdc1 to .local/share/gamedrive
# fix bootloader to add windows entry

# profiles for:
## Networking hostName
## Networking wireless
## Hardware extraPackages
## X11 videoDrivers
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    timeout = 1;
    efi.canTouchEfiVariables = true
  };

  # Networking
  networking.hostName = "europa";

  # Time zone
  time.timeZone = "Australia/Sydney";

  # Packages
  environment = {
    systemPackages = with pkgs; [
      wget vim
    ];
    pathsToLink = [ "/share/zsh" ];
  };
  programs.zsh.enable = true;
  services.dbus.packages = with pkgs; [ gnome3.dconf ]; # Required for GTK themes

  # Fonts installed in system profile
  fonts.fonts = with pkgs; [ roboto-mono ];

  # Allow packages with unfree licenses to be installed
  nixpkgs.config.allowUnfree = true;

  # Audio
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # Hardware
  hardware.opengl = {
    extraPackages = [ amdvlk ];
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };

  # X11
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    layout = "us";

    # Touchpad
    libinput = {
      enable = true;
      naturalScrolling = false;
      tapping = false;
      accelProfile = "flat";
    };

    displayManager = {
      lightdm.greeters.mini = {
        enable = true;
        user = "jack";
        extraConfig = ''
          [greeter]
          show-password-label = true
          password-label-text = Password:
          show-input-cursor = false
          password-alignment = left
          [greeter-theme]
          font = "RobotoMono"
          font-size = 1em
          font-weight = bold
          font-style = normal
          text-color = "#f1efee"
          error-color = "#f22c40"
          background-image = ""
          background-color = "#1b1918"
          window-color = "#1b1918"
          border-color = "#1b1918"
          border-width = 0px
          layout-space = 15
          password-color = "#f1efee"
          password-background-color = "#1b1918"
          password-border-color = "#1b1918"
          password-border-width = 0px
        '';
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };

  # Users
  users.users.jack = {
    isNormalUser = true;
    home = "/home/jack";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Don't garbage collect nix-shell
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  # Automatic upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    channel = https://nixos.org/channels/nixos-unstable;
  };

  system.stateVersion = "20.03";
}

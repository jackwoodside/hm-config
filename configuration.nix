
{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot = {
    enable = true;
    # useOSProber = true;
    # device = "/dev/sda";
    # efiSupport = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Fonts installed in system profile. Needed for the greeter.
  fonts.fonts = with pkgs; [ roboto-mono ];

  # Allow packages with unfree licenses to be installed.
  nixpkgs.config.allowUnfree = true;

  # Audio
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # 3 Audio
  hardware.opengl = {
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

  # Automatic upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    channel = https://nixos.org/channels/nixos-unstable;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}


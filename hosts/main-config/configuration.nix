{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nvidia.nix
    ../../modules/i3.nix
    ../../modules/update-zen.nix
    ../../modules/nvim.nix
    ../../modules/discord.nix
    ../../modules/tmux.nix
  ];

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "nixos";
networking.networkmanager.enable = true;

nix.settings.trusted-users = [ "kristian" ];

nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

services.displayManager = {
  defaultSession = "none+i3";
};


# Set your time zone.
time.timeZone = "Australia/Perth";

i18n.defaultLocale = "en_AU.UTF-8";
i18n.extraLocaleSettings = {
  LC_ADDRESS = "en_AU.UTF-8";
  LC_IDENTIFICATION = "en_AU.UTF-8";
  LC_MEASUREMENT = "en_AU.UTF-8";
  LC_MONETARY = "en_AU.UTF-8";
  LC_NAME = "en_AU.UTF-8";
  LC_NUMERIC = "en_AU.UTF-8";
  LC_PAPER = "en_AU.UTF-8";
  LC_TELEPHONE = "en_AU.UTF-8";
  LC_TIME = "en_AU.UTF-8";
};

services.printing.enable = true;

hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

users.users.kristian = {
  isNormalUser = true;
  description = "Kristian Stolen";
  extraGroups = ["networkmanager" "wheel" ];
  packages = with pkgs; [
    # kdePackages.kate
  ];
};

programs.firefox.enable = true;


# List packages installed in system profile. To search, run:
# \$ nix search wget
environment.systemPackages = with pkgs; [
  # core packages
  wget vim git gh alacritty stow
  # helpful terminal packages
  fzf  neofetch 
  # editors
  # packages for jekyll blog
  ruby gcc gnumake jekyll
  # packages for go
  go
  # apps
  ungoogled-chromium
];

fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;
  
  nixpkgs.config.allowUnfree = true;

}

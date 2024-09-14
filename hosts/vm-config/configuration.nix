{ config, pkgs, lib, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> 
    ../../modules/i3.nix
    ../../modules/update-zen.nix
    ../../modules/nvim.nix
    ../../modules/discord.nix
  ];

  # Let demo build as a trusted user.
nix.settings.trusted-users = [ "demo" ];

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
  # random packages
  pipes
];

fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

  hardware.pulseaudio.enable = lib.mkForce false;

}

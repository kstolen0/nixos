{ config, pkgs, lib, ... }:

{
  imports = [
  <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> 
    ../../modules/i3.nix
    ../../modules/update-zen.nix
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

nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  "discord"
];

# List packages installed in system profile. To search, run:
# \$ nix search wget
environment.systemPackages = with pkgs; [
  # core packages
  wget vim git gh alacritty stow
  # helpful terminal packages
  fzf  neofetch 
  # editors
  neovim ripgrep unzip nodejs_22
  # packages for jekyll blog
  ruby gcc gnumake jekyll
  # packages for go
  go
  # apps
  discord ungoogled-chromium
  # random packages
  pipes
];

fonts.packages = with pkgs; [
    nerdfonts # consider only importing the fonts I use
  ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}

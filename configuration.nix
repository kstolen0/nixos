{ config, pkgs, lib, ... }:

{
  imports = [
    <nixos-wsl/modules>
  ./i3.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

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
  # "discord"
];

# List packages installed in system profile. To search, run:
# \$ nix search wget
environment.systemPackages = with pkgs; [
  # core packages
  wget vim git gh alacritty stow
  # helpful terminal packages
  fzf  neofetch 
  # editors
  neovim
  # packages for jekyll blog
  ruby gcc gnumake jekyll
  # packages for go
  go
  # apps
  ungoogled-chromium
  # random packages
  pipes
];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}

{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
  ];


  environment.systemPackages = with pkgs; [
    discord
  ];

}


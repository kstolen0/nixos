{ config, lib, pkgs, ... }: {
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "workman-p";
  services.xserver.xkb.options = "caps:backspace";

  boot.kernelModules = [ "uinput" ];

  hardware.uinput.enable = true;

  services.udev.extraRules = ''
    KERNAL=="uinput", MODE="0600", GROUP="uinput", OPTIONS+="static_node=uinput" 
  '';

  users.groups.uinput = { };
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [ "input" "uinput" ];
  };

  environment.systemPackages = with pkgs; [ kanata ];
}

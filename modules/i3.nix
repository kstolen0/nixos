{ config, pkgs, lib, ... }:

{

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      plasma5.enable = lib.mkForce false;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        polybar
        rofi
        killall
      ];
    };
  };

}

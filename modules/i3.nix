{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      plasma5.enable = true;
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
  services.displayManager = {
    sddm.enable = true;
  };
}

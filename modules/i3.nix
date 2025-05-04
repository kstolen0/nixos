{ config, pkgs, lib, ... }:

{

  services.desktopManager.plasma6.enable = true;
  services.xserver = {
    enable = true;
    desktopManager = { xterm.enable = false; };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        polybar
        rofi
        killall
        nitrogen
        flameshot
        dunst
      ];
    };

    # xkb.layout = "us";
    # xkbVariant = "workman-p";
    # xkbOptions = "caps:backspace";
  };
  services.displayManager = { sddm.wayland.enable = true; };
}

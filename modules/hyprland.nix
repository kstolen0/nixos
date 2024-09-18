
{ pkgs, ... }: {

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty  
    wofi
    dolphin
    ly
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

}

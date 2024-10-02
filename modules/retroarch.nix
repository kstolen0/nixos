{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [
        beetle-gba
      ];
    })
  ];

}


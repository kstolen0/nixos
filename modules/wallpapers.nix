{ ... }: {
  systemd.services."wallpapers" = {
    script = ''
      #!/run/current-system/sw/bin/bash

      export DISPLAY=":0.0"

      /run/current-system/sw/bin/nitrogen --set-auto  --random /home/kristian/Pictures/desktop-2025/ --head=0
      /run/current-system/sw/bin/nitrogen --set-auto  --random /home/kristian/Pictures/desktop-2025/ --head=1
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "kristian";
    };
  };

  systemd.timers."wallpapers" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "10m";
      OnUnitActiveSec = "10m";
      Unit = "wallpapers.service";
    };
  };

}

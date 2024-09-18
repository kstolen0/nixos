{ config, pkgs, lib, ... }:

{

  systemd.timers."zen" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1h";
      OnUnitActiveSec = "1h";
      Unit = "zen.service";
    };
  };

  environment.systemPackages = with pkgs; [
    jq
  ];

  systemd.services."zen" = {
    script = ''
      zenquote=$(/run/current-system/sw/bin/curl https://zenquotes.io/api/random)
      quote=$(/run/current-system/sw/bin/jq '.[0].q' <<< $zenquote)
      author=$(/run/current-system/sw/bin/jq '.[0].a' <<< $zenquote)

      cat << EOF > ~/bin/zen/zen-quote.sh
      #!/run/current-system/sw/bin/bash

      tput bold setaf 4
      echo -e "\n"
      echo \"$quote\";
      tput setaf 3
      echo -e "\n\t- $author\n\n"
      tput sgr0

      EOF
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "kristian";
    };
  };
}


## How to use?

I don't know, still figuring this out.

May split the vm config into a separate branch as it doesn't seem to contain a hardware .nix file...

To update flake packages, run `nix flake update`

To rebuild nixos and use the latest configuration, run `sudo nixos-rebuild switch --flake .`

If using the vm config, add `--impure`. The package [configuration.nix](./configuration.nix) is importing isn't pure... 
I think I may need to be more specific with the tag and or commit hash.



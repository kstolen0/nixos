{
  description = "test flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @inputs:
    let
      lib = nixpkgs.lib;
    in
    {

      nixosConfigurations = {
        nixos = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/main-config/configuration.nix
          ];
        };

        vm = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/vm-config/configuration.nix
          ];
        };
      };
    };
}

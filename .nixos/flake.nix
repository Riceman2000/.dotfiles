{
  description = "A very basic flake";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
    let 
      lib = nixpkgs.lib;
    in {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    nixosConfigurations = {
      ricepc = lib.nixosSystem {
	system = "x86_64-linux";
	modules = [ ./configuration.nix ];
      };
    };
  };
}


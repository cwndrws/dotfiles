{
  description = "cwndrws dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      systems = [
				"x86_64-linux" # 64-bit Intel/AMD Linux
				"aarch64-linux" # 64-bit ARM Linux
				"x86_64-darwin" # 64-bit Intel macOS
				"aarch64-darwin" # 64-bit ARM macOS
			];

      pkgsFor = system: import nixpkgs {
        inherit system;
      };
      homeManagerFor = system: import home-manager {
        inherit pkgs;
      };
    in
    {
      homeConfigurations = {
        username = import ./user.nix;
        home = {
          for system in systems:
            homeManagerFor system.lib.homeManagerConfiguration {
              inherit (pkgsFor system) pkgs;
              configuration = import ./home.nix;
            };
        };
      };
    };
}

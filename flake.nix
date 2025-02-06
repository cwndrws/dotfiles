{
  description = "cwndrws dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }:
    {
			homeConfigurations = {
				username = import ./user.nix;
				home = import ./home.nix;
			};
    };
}

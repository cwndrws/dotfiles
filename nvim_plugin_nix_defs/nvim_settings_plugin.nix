{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "ab0b13a8266f6cb76b468025d36df3cedf5a39eb";
    sha256 = "04njdq2v1rb9fv79f4vg0702hr3pr1j57p10bhvldznx934cb7vl";
  };
}

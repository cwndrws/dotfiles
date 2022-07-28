{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "b2c48bc3f36b00bbb01cddd55346dfa21ddda898";
    sha256 = "1p5djr1qy766w1xqkvaxm1p3d78ax3q6l4wfiz2llb3bylgi4v22";
  };
}

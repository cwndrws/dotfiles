{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "cc4907a510633a76ca7e51ea3b08ff4241de3484";
    sha256 = "0wa44l8i6myry4fd1chgv03wv3zl5iaz4j33s6m7dd9wy1jpd9wx";
  };
}

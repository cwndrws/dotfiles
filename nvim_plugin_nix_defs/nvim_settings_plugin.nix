{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "b96eb05ae56c7dc83c1a649e54d0b4aeaf7b5b64";
    sha256 = "1d6zhjbcn9rb2d9vd31ij3f22ngwcbh1fk6dnfx6wfi73ymqq48m";
  };
}

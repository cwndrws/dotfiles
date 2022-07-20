{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "2a6feb7e1810710f683d3fe6d5082dbab9bf1f9e";
    sha256 = "0vva9vx67p2ambx0zw0g29k7imydmyvlyzyhg7lpvj4ikdx71cnv";
  };
}

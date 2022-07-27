{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "63c6d8e74339f9a9850bb592d4b61df41f80f075";
    sha256 = "16n69n8ifv4slp3q10b6waaw2cn6cing15zbkkkcccgqylwi10qr";
  };
}

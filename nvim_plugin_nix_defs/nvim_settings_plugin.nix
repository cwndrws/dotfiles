{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "cf64a7eae61d6e238f0cbe1997e4036a424adea2";
    sha256 = "05bhrjhqdm4x3z6vsir66kv289yabz9g6f4mwv2v1l2lvypw081l";
  };
}

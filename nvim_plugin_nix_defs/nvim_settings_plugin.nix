{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "6884596181b803754598e60d5c648200f725a319";
    sha256 = "0pla6kidyz280bqlypwckn7xk80y99g51d2bvm93v79sdm8k4lc0";
  };
}

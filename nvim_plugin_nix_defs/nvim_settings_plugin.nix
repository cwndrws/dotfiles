{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "15998b72db0ee87d59d08c7122a008f0e1da8b22";
    sha256 = "1w25m03326z83zs02maza3qpn9r1k1z2bssgbhp0hjqwk1b8g7c5";
  };
}

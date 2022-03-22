{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "227dd6450cad86e997baedf3e49d67c4254c2fe8";
    sha256 = "1ww8rlaalnlxjcbdpz47j4sxyf17264h16fw910ay1xm24cjw1b1";
  };
}

{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "8cc7d8dcce22c366b6c7a8258329c4d9c7361d81";
    sha256 = "1cp74bx57izkcxx418ssvvr83pkxml2c5zbxp1id5xdnvnh3y2n0";
  };
}

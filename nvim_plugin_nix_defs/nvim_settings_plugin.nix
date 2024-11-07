{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "c35f5bef7ac5ba45a8734a37f3762f787a7a4943";
    sha256 = "0qxdf6kr00kkgd2whgs6m90k7jmwxck48gxgikl2184kg9mx91qq";
  };
}

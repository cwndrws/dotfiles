{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "2e168e9930c024acf16e20b548e751bdc4539f93";
    sha256 = "1jh7x5g7g4v56vha400fcvfhznj0vdcil22m1zcyql1jjf0fbsxr";
  };
}

{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "484b81d9136b9e38473bf061dd3ae4b08595db8a";
    sha256 = "1yb1rlk0s4pgm7yh49wrxbb8gsa6b02z9bkrdqq383drlspgpyc0";
  };
}

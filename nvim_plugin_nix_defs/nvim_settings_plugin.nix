{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "43f21925a10df441733f72fb8a676383bd4c5e67";
    sha256 = "1yiszz33l2qi6dhrs8gzl1j5a2vq79raazkw5cpxdsz1nzr0fx1h";
  };
}

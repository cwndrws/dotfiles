{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "baad3d1b85251a91d5f297e9f270e98cb2a9daec";
    sha256 = "1xax8l0asf4pj6aybhailfrl95jby6n1aaaqyapkdldkhgvsz8da";
  };
}

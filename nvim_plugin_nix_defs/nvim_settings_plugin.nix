{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "aac46eac2f7fcee8db6281bb7f505037fbc34a15";
    sha256 = "11xjd0rh2d5gl6rwglcbxhlvv1qbmm55978hviqzgjxglpw2ni80";
  };
}

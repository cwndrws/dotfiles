{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "deeca6f474f7be01a791274e5855f7dd27042fb6";
    sha256 = "11xjd0rh2d5gl6rwglcbxhlvv1qbmm55978hviqzgjxglpw2ni80";
  };
}

{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "6fc983201fc046aeec9637fb316d0a0671d8b285";
    sha256 = "0f7n9b4m05q7zkr6nmm5bn2hr5gdkf2vdfp01i0whp3xj5ni8z27";
  };
}

{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "neovim_settings";
  src = pkgs.fetchFromGitHub {
    owner = "cwndrws";
    repo = "neovim_settings";
    rev = "fc0d6f83ffbd261a8c926e2f5c47d3b068a796d5";
    sha256 = "0k64j51jcwskh7sv1siq7mpvvn14blcbdb7gw42m3mjv1m5acni9";
  };
}
